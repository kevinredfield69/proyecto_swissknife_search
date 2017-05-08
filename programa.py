# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request
import json
import requests
import os

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
    keygif = os.environ["keygif"]
    #with open ("keygif.txt","r") as gifkey:
    #    keygif = gifkey.read()
    payload = {"q":q,"fmt":"json","limit":limit,"api_key":keygif}
    r = requests.get('http://api.giphy.com/v1/gifs/search?',params=payload)
    print r.url
    gifs = r.text
    print r.text
    busquedagif = json.loads(gifs)
    if r.status_code == 200:
        for gif in busquedagif["data"]:
            lista_gifs.append(gif["images"]["fixed_height"]["url"])
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
    lista_id = []
    with open ("keyvideo.txt","r") as videokey:
        keyvideo = videokey.read()
    payload2 = {"part":"snippet","ForMine":"true","maxResults":maxResults,"order":order,"q":q,"type":"video","key":keyvideo}
    r2 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload2)
    videos = r2.text
    busquedavideo = json.loads(videos)
    print r2.text
    print r2.url
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
    text = request.forms.get("text")
    sort = request.forms.get("sort")
    per_page = request.forms.get("per_page")
    lista_imagenes = []
    #with open ("keypicture.txt","r") as picturekey:
    #    keypicture = picturekey.read()
    keypicture = os.environ["keypicture"]
    payload3 = {"method":"flickr.photos.search","api_key":keypicture,"text":text,"sort":sort,"per_page":per_page,"format":"json","extra":"url_o,url_s"}
    r3 = requests.get('https://api.flickr.com/services/rest/?',params=payload3)
    print r3.text
    imagenes = r3.text
    busquedaimagen = json.loads(imagenes[14:-1])
    if r3.status_code == 200:
        for imagen in busquedaimagen["photos"]["photo"]:
            lista_imagenes.append(imagen["title"])
        return template ("pictureresults.tpl",text=text,per_page=per_page,sort=sort,lista_imagenes=lista_imagenes)
    else:
        return template ("error.tpl")

############################################################################################################################################

@route("/song",method="get")
def song():
    return template ("song.tpl")

@route("/songresults",method="post")
def songresults():
    lista_canciones = []
    return template ("songresults.tpl")

############################################################################################################################################

@route('/css/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='css')

@error(404)
def error404(error):
    return template ("error.tpl")

run(host='0.0.0.0', port=9000, debug=True)