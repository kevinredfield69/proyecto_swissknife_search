# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request
import json
import requests
import os

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

@route("/gif",method="get")
def gif():
    return template ("gif.tpl")

@route("/gifresults",method="post")
def gifresults():
    q = request.forms.get('q')
    limit = request.forms.get('limit')
    lista_gifs = []
    titulos_gifs = []
    keygif = os.environ["keygif"]
    payload = {"q":q,"fmt":"json","limit":limit,"api_key":keygif}
    r = requests.get('http://api.giphy.com/v1/gifs/search?',params=payload)
    gifs = r.text
    busquedagif = json.loads(gifs)
    if r.status_code == 200:
        for gif in busquedagif["data"]:
            lista_gifs.append(gif["images"]["fixed_height"]["url"])
        for gif2 in busquedagif["data"]:
            titulos_gifs.append(gif2["slug"])
        return template ("gifresults.tpl",q=q,limit=limit,lista_gifs=lista_gifs,titulos_gifs=titulos_gifs)
    else:
        return template ("error.tpl")

@route("/video",method="get")
def video():
    return template ("video.tpl")

@route("/videoresults",method="post")
def videoresults():
    maxResults = request.forms.get('maxResults')
    order = request.forms.get('order')
    q = request.forms.get('q')
    lista_ids = []
    titulos_videos = []
    with open ("keyvideo.txt","r") as videokey:
        keyvideo = videokey.read()
    payload2 = {"part":"snippet","ForMine":"true","maxResults":maxResults,"order":order,"q":q,"type":"video","key":keyvideo}
    r2 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload2)
    videos = r2.text
    busquedavideo = json.loads(videos)
    if r2.status_code == 200:
        for video in busquedavideo["items"]:
            lista_ids.append(video["id"]["videoId"])
        for video2 in busquedavideo["items"]:
            titulos_videos.append(video2["snippet"]["title"])
        return template ("videoresults.tpl",maxResults=maxResults,q=q,order=order,lista_ids=lista_ids,titulos_videos=titulos_videos)
    else:
        return template ("error.tpl")

@route("/picture",method="get")
def picture():
    return template ("picture.tpl")

@route("/pictureresults",method="post")
def pictureresults():
    text = request.forms.get("text")
    per_page = request.forms.get("per_page")
    keypicture = os.environ["keypicture"]
    payload3 = {"method":"flickr.photos.search","api_key":keypicture,"text":text,"per_page":per_page,"extras":"url_o,url_s","format":"json"}
    r3 = requests.get('https://api.flickr.com/services/rest',params=payload3)
    lista_imagenes = []
    titulos_imagenes = []
    if r3.status_code == 200:
        imagenes = r3.text
        busquedaimagen = json.loads(imagenes[14:-1])
        for imagen in busquedaimagen["photos"]["photo"]:
            if imagen.has_key("url_o"):
                lista_imagenes.append([imagen['url_s'],imagen["url_o"]])
        for titulo in busquedaimagen["photos"]["photo"]:
            titulos_imagenes.append(titulo["title"])
        return template ("pictureresults.tpl",text=text,per_page=per_page,lista_imagenes=lista_imagenes,titulos_imagenes=titulos_imagenes)
    else:
        return template ("error.tpl")

@route("/song",method="get")
def song():
    return template ("song.tpl")

@route("/songresults",method="post")
def songresults():
    track = request.forms.get("track")
    limit = request.forms.get("limit")
    artist = request.forms.get("artist")
    keysong = os.environ["keysong"]
    payload4 = {"method":"track.search","api_key":keysong,"format":"json","track":track,"limit":limit,"artist":artist}
    r4 = requests.get('http://ws.audioscrobbler.com/2.0/',params=payload4)
    lista_canciones = []
    titulos_canciones = []
    if r4.status_code == 200:
        canciones = r4.text
        busquedacancion = json.loads(canciones)
    return template ("songresults.tpl")

@route('/css/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='css')

@error(404)
def error404(error):
    return template ("error.tpl")

run(host='0.0.0.0', port=9000, debug=True)