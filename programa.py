# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request
import json
import requests

############################################################################################################################################

@route("/swissknife",method="get")
def inicio():
    return template ("index.tpl")

@route("/author",method="get")
def author():
    return template ("author.tpl")

@route("/contact",method="get")
def contact():
    return template ("contact.tpl")

@route("/panel",method="get")
def panel():
    return template ("panel.tpl")

############################################################################################################################################

@route("/gif",method="get")
def gif():
    return template ("gif.tpl")

@route("/gifresults",method="post")
def gifresults():
    q = request.forms.get('q')
    limit = request.forms.get('limit')
    lista_gifs = []
    with open ("keygif.txt","r") as gifkey:
        keygif = gifkey.read()
    payload = {"q":q,"fmt":"json","limit":limit,"api_key":keygif}
    r = requests.get('http://api.giphy.com/v1/gifs/search?',params=payload)
    print r.url
    gifs = r.text
    print r.text
    busquedagif = json.loads(gifs)
    if r.status_code == 200:
        for gif in busquedagif[""][""]:
            lista_gifs.append(gif[""])
        return template ("gifresults.tpl",q=q,limit=limit,lista_gifs=lista_gifs)
    else:
        return template ("error.tpl")

############################################################################################################################################

@route("/video",method="get")
def video():
    return template ("video.tpl")

@route("/videoresults",method="post")
def videoresults():
    maxResults = request.forms.get('maxResults')
    order = request.forms.get('order')
    q = request.forms.get('q')
    lista_videos = []
    with open ("keyvideo.txt","r") as videokey:
        keyvideo = videokey.read()
    payload2 = {"part":"snippet","ForMine":"true","maxResults":maxResults,"order":order,"q":q,"type":"video","key":keyvideo}
    r2 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload2)
    videos = r2.text
    busquedavideo = json.loads(videos)
    if r2.status_code == 200:
        for video in busquedavideo["items"]:
            lista_videos.append(video["snippet"]["title"])
        return template ("videoresults.tpl",maxResults=maxResults,q=q,order=order,lista_videos=lista_videos)
    else:
        return template ("error.tpl")

############################################################################################################################################

@route("/picture",method="get")
def picture():
    return template ("picture.tpl")

@route("/pictureresults",method="post")
def pictureresults():
    return template ("pictureresults.tpl")

@route("/song",method="get")
def song():
    return template ("song.tpl")

############################################################################################################################################

@route('/css/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='css')

@error(404)
def error404(error):
    return template ("error.tpl")

run(host='0.0.0.0', port=8001, debug=True)

