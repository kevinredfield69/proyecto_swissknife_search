# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request
from sys import argv
import json
import requests
import os

@route('/',method="get")
def index():
    return template("index.tpl")

@route('/author',method="get")
def author():
    return template("author.tpl")

@route('/contact',method="get")
def contact():
    return template("contact.tpl")

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
    return template("contactresults.tpl",Nombre=Nombre,Primer_Apellido=Primer_Apellido,Segundo_Apellido=Segundo_Apellido,Correo_Electronico=Correo_Electronico,Sexo=Sexo,Dia=Dia,Mes=Mes,Anyo=Anyo,Gustar=Gustar,Calificacion=Calificacion,Sugerencias=Sugerencias)

@route('/panel',method="get")
def panel():
    return template("panel.tpl")

@route('/gif',method="get")
def gif():
    return template("gif.tpl")

@route('/gifresults',method="post")
def gifresults():
    q = request.forms.get('q')
    lista_gifs = []
    titulos_gifs = []
    keygif = os.environ["keygif"]
    payload = {"q":q,"fmt":"json","api_key":keygif}
    r = requests.get('http://api.giphy.com/v1/gifs/search?',params=payload)
    gifs = r.text
    busquedagif = json.loads(gifs)
    if r.status_code == 200:
        for gif in busquedagif["data"]:
            lista_gifs.append(gif["images"]["fixed_height"]["url"])
        for gif2 in busquedagif["data"]:
            titulos_gifs.append(gif2["slug"])
        return template("gifresults.tpl",q=q,lista_gifs=lista_gifs,titulos_gifs=titulos_gifs)
    else:
        return template("error.tpl")

@route('/video',method="get")
def video():
    return template("video.tpl")

@route('/videoresults',method="post")
def videoresults():
    maxResults = request.forms.get('maxResults')
    q = request.forms.get('q')
    lista_ids = []
    titulos_videos = []
    keyvideo = os.environ["keyvideo"]
    payload2 = {"part":"snippet","ForMine":"true","maxResults":maxResults,"q":q,"type":"video","key":keyvideo}
    r2 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload2)
    videos = r2.text
    busquedavideo = json.loads(videos)
    if r2.status_code == 200:
        for video in busquedavideo["items"]:
            lista_ids.append(video["id"]["videoId"])
        for video2 in busquedavideo["items"]:
            titulos_videos.append(video2["snippet"]["title"])
        return template("videoresults.tpl",q=q,lista_ids=lista_ids,titulos_videos=titulos_videos)
    else:
        return template("error.tpl")

@route('/picture',method="get")
def picture():
    return template("picture.tpl")

@route('/pictureresults',method="post")
def pictureresults():
    text = request.forms.get("text")
    keypicture = os.environ["keypicture"]
    payload3 = {"method":"flickr.photos.search","text":text,"extras":"url_o,url_s","format":"json","api_key":keypicture}
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
        return template("pictureresults.tpl",text=text,lista_imagenes=lista_imagenes,titulos_imagenes=titulos_imagenes)
    else:
        return template("error.tpl")

@route('/song',method="get")
def song():
    return template("song.tpl")

@route('/songresults',method="post")
def songresults():
    track = request.forms.get("track")
    keysong = os.environ["keysong"]
    payload4 = {"method":"track.search","format":"json","track":track,"api_key":keysong}
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
        return template("songresults.tpl",track=track,lista_canciones=lista_canciones,titulos_canciones=titulos_canciones,imagenes_canciones=imagenes_canciones)
    else:
        return template("error.tpl")

@route('/event',method="get")
def event():
    return template("event.tpl")

@route('/eventresults',method="post")
def eventresults():
    ciudad = request.forms.get('ciudad')
    termino = request.forms.get ('termino')
    rango = request.forms.get('rango')
    tipo = request.forms.get('tipo')
    orden = request.forms.get('orden')
    lista_eventos = []
    keyevent = os.environ["keyevent"]
    payload5 = {"location":ciudad,"keywords":termino,"t":rango,"sort_order":tipo,"sort_direction":orden,"app_key":keyevent}
    r5 = requests.get('http://api.eventful.com/json/events/search?',params=payload5)
    if r5.status_code == 200:
        eventos = r5.text
        busquedaevento = json.loads(eventos)
        for evento in busquedaevento["events"]["event"]:
            lista_eventos.append(evento["title"])
        return template('eventresults.tpl',lista_eventos=lista_eventos,ciudad=ciudad,termino=termino)
    else:
        return template("error.tpl")

@route('/film',method="get")
def film():
    return template("film.tpl")

@route('/filmresults',method="post")
def filmresults():
    s = request.forms.get('s')
    lista_peliculas = []
    keyfilm = os.environ["keyfilm"]
    payload6 = {"s":s,"r":"json","apikey":keyfilm}
    r6 = requests.get('http://www.omdbapi.com',params=payload6)
    if r6.status_code == 200:
        peliculas = r6.text
        busquedapelicula = json.loads(peliculas)
        for pelicula in busquedapelicula[""][""]:
            lista_peliculas.append(pelicula[""])
        return template('filmresults.tpl',lista_peliculas=lista_peliculas,s=s)
    else:
        return template('error')

@route('/css/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='css')

@error(404)
def error404(error):
    return template("html/error.tpl")

run(host='0.0.0.0', port=argv[1])
#run(host='0.0.0.0', port=9000, debug=True)