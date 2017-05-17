# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request
from sys import argv
import json
import requests
import os

@route('/',method="get")
def index():
    return template ("html/index.tpl")

@route('/author',method="get")
def author():
    return template ("html/author.tpl")

@route('/contact',method="get")
def contact():
    return template ("html/contact.tpl")

@route('/contactresults',method="post")
def contactresults():
    Nombre = request.forms.get('Nombre')
    Primer_Apellido = request.forms.get('Primer_Apellido')
    Segundo_Apellido = request.forms.get('Segundo_Apellido')
    Correo_Electronico = request.forms.get('Correo_Electronico')
    Sexo = request.forms.get('Sexo')
    Dia = request.forms.get('Dia')
    Mes = request.forms.get('Mes')
    Anyo = request.forms.get('Anyo')
    Gustar = request.forms.get('Gustar')
    Calificacion = request.forms.get('Calificacion')
    Sugerencias = request.forms.get('Sugerencias')
    return template ("html/contactresults.tpl",Nombre=Nombre,Primer_Apellido=Primer_Apellido,Segundo_Apellido=Segundo_Apellido,Correo_Electronico=Correo_Electronico,Sexo=Sexo,Dia=Dia,Mes=Mes,Anyo=Anyo,Gustar=Gustar,Calificacion=Calificacion,Sugerencias=Sugerencias)

@route('/panel',method="get")
def panel():
    return template ("html/panel.tpl")

@route('/gif',method="get")
def gif():
    return template ("html/gif.tpl")

@route('/gifresults',method="post")
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
        return template ("html/gifresults.tpl",q=q,lista_gifs=lista_gifs,titulos_gifs=titulos_gifs)
    else:
        return template ("html/error.tpl")

@route('/video',method="get")
def video():
    return template ("html/video.tpl")

@route('/videoresults',method="post")
def videoresults():
    maxResults = request.forms.get('maxResults')
    order = request.forms.get('order')
    q = request.forms.get('q')
    lista_ids = []
    titulos_videos = []
    keyvideo = os.environ["keyvideo"]
    payload2 = {"part":"snippet","ForMine":"true","maxResults":maxResults,"order":order,"q":q,"type":"video","key":keyvideo}
    r2 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload2)
    videos = r2.text
    busquedavideo = json.loads(videos)
    if r2.status_code == 200:
        for video in busquedavideo["items"]:
            lista_ids.append(video["id"]["videoId"])
        for video2 in busquedavideo["items"]:
            titulos_videos.append(video2["snippet"]["title"])
        return template ("html/videoresults.tpl",q=q,order=order,lista_ids=lista_ids,titulos_videos=titulos_videos)
    else:
        return template ("html/error.tpl")

@route('/picture',method="get")
def picture():
    return template ("html/picture.tpl")

@route('/pictureresults',method="post")
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
        return template ("html/pictureresults.tpl",text=text,lista_imagenes=lista_imagenes,titulos_imagenes=titulos_imagenes)
    else:
        return template ("html/error.tpl")

@route('/song',method="get")
def song():
    return template ("html/song.tpl")

@route('/songresults',method="post")
def songresults():
    track = request.forms.get("track")
    limit = request.forms.get("limit")
    keysong = os.environ["keysong"]
    payload4 = {"method":"track.search","api_key":keysong,"format":"json","track":track,"limit":limit}
    r4 = requests.get('http://ws.audioscrobbler.com/2.0/',params=payload4)
    lista_canciones = []
    titulos_canciones = []
    imagenes_canciones = []
    if r4.status_code == 200:
        canciones = r4.text
        busquedacancion = json.loads(canciones)
        for cancion in busquedacancion["results"]["trackmatches"]["track"]:
            lista_canciones.append(cancion["artist"])
        for cancion2 in busquedacancion["results"]["trackmatches"]["track"]:
            titulos_canciones.append(cancion2["name"])
        for cancion3 in busquedacancion["results"]["trackmatches"]["track"]:
            imagenes_canciones.append(cancion3["image"][3]["#text"])
    return template ("html/songresults.tpl",track=track,lista_canciones=lista_canciones,titulos_canciones=titulos_canciones,imagenes_canciones=imagenes_canciones)

@route('/css/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='css')

@error(404)
def error404(error):
    return template ("html/error.tpl")


run(host='0.0.0.0', port=argv[1])
#run(host='0.0.0.0', port=9000, debug=True)
