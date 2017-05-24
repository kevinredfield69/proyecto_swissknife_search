# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request
from sys import argv
import json
import requests
import os

@route('/',method="get")
def index():
    return template("index.tpl")

@route('/searchquick',method="post")
def searchquick():
    search = request.forms.get('search')
    coleccion_gifs = []
    coleccion_videos = []
    coleccion_imagenes = []
    coleccion_sonidos = []
    coleccion_eventos = []
    coleccion_peliculas = []
    keygif2 = os.environ["keygif"]
    keyvideo2 = os.environ["keyvideo"]
    keypicture2 = os.environ["keypicture"]
    keysong2 = os.environ["keysong"]
    keyevent2 = os.environ["keyevent"]
    keyfilm2 = os.environ["keyfilm"]
    payload7 = {"q":search,"limit":"10","fmt":"json","api_key":keygif2}
    payload8 = {"part":"snippet","ForMine":"true","maxResults":"10","q":search,"type":"video","key":keyvideo2}
    payload9 = {"method":"flickr.photos.search","text":search,"extras":"url_o,url_s","per_page":"10","format":"json","api_key":keypicture2}
    payload10 = {"method":"track.search","format":"json","track":search,"limit":"limit","api_key":keysong2}
    payload11 = {"keywords":search,"page_size":"10","app_key":keyevent2}
    payload12 = {"api_key":keyfilm2,"query":search,"language":"es-ES"}
    r7 = requests.get('http://api.giphy.com/v1/gifs/search?',params=payload7)
    r8 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload8)
    r9 = requests.get('https://api.flickr.com/services/rest',params=payload9)
    r10 = requests.get('http://ws.audioscrobbler.com/2.0/',params=payload10)
    r11 = requests.get('http://api.eventful.com/json/events/search?',params=payload11)
    r12 = requests.get('https://api.themoviedb.org/3/search/movie',params=payload12)
    gifs2 = r7.text
    videos2 = r8.text
    imagenes2 = r9.text
    sonidos2 = r10.text
    eventos2 = r11.text
    peliculas2 = r12.text
    busquedagif2 = json.loads(gifs2)
    busquedavideo2 = json.loads(videos2)
    busquedaimagen2 = json.loads(imagenes2)
    busquedasonido2 = json.loads(sonidos2)
    busquedaevento2 = json.loads(eventos2)
    busquedapelicula2 = json.loads(peliculas2)
    if r7.status_code == 200 and r8.status_code == 200 and r9.status_code == 200 and r10.status_code == 200 and r11.status_code == 200 and r12.status_code == 200:
        for gif4 in busquedagif2["data"]:
            coleccion_gifs.append(gif4["images"]["fixed_height"]["url"])
            coleccion_gifs.append(gif4["slug"])
        for video5 in busquedavideo2["items"]:
            coleccion_videos.append(video5["snippet"]["title"])
            coleccion_videos.append(video5["id"]["videoId"])
        for imagen2 in busquedaimagen2["photos"]["photo"]:
            if imagen2.has_key("url_o"):
                coleccion_imagenes.append(imagen2["title"])
                coleccion_imagenes.append([imagen2['url_s'],imagen2["url_o"]])
        for sonido2 in busquedasonido2["results"]["trackmatches"]["track"]:
            coleccion_sonidos.append(sonido2["artist"])
            coleccion_sonidos.append(sonido2["name"])
            coleccion_sonidos.append(sonido2["image"][3]["#text"])
        for evento2 in busquedaevento2["events"]["event"]:
            coleccion_eventos.append(evento2["title"])
            coleccion_eventos.append(evento2["start_time"])
            coleccion_eventos.append(evento2["venue_address"])
            coleccion_eventos.append(evento2["venue_name"])
        for pelicula2 in busquedapelicula2["results"]:
            coleccion_peliculas.append(pelicula2["title"])
            coleccion_peliculas.append(pelicula2["overview"])
            coleccion_peliculas.append(pelicula2["release_date"])
            coleccion_peliculas.append(pelicula2["vote_average"])
        return template("searchquick.tpl",search=search,coleccion_gifs=coleccion_gifs,coleccion_videos=coleccion_videos,coleccion_imagenes=coleccion_imagenes,coleccion_sonidos=coleccion_sonidos,coleccion_eventos=coleccion_eventos,coleccion_peliculas=coleccion_peliculas)
    else:
        return template("error.tpl")

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
    limit = request.forms.get('limit')
    lista_gifs = []
    titulos_gifs = []
    publicaciones_gifs = []
    keygif = os.environ["keygif"]
    payload = {"q":q,"limit":limit,"fmt":"json","api_key":keygif}
    r = requests.get('http://api.giphy.com/v1/gifs/search?',params=payload)
    gifs = r.text
    busquedagif = json.loads(gifs)
    if r.status_code == 200:
        for gif in busquedagif["data"]:
            lista_gifs.append(gif["images"]["fixed_height"]["url"])
        for gif2 in busquedagif["data"]:
            titulos_gifs.append(gif2["slug"])
        for gif3 in busquedagif["data"]:
            publicaciones_gifs.append(gif3["import_datetime"])
        return template("gifresults.tpl",q=q,lista_gifs=lista_gifs,titulos_gifs=titulos_gifs,publicaciones_gifs=publicaciones_gifs)
    else:
        return template("error.tpl")

@route('/video',method="get")
def video():
    return template("video.tpl")

@route('/videoresults',method="post")
def videoresults():
    maxResults = request.forms.get('maxResults')
    q = request.forms.get('q')
    order = request.forms.get('order')
    lista_ids = []
    titulos_videos = []
    descripciones_videos = []
    canales_videos = []
    keyvideo = os.environ["keyvideo"]
    payload2 = {"part":"snippet","ForMine":"true","maxResults":maxResults,"q":q,"order":order,"type":"video","key":keyvideo}
    r2 = requests.get('https://www.googleapis.com/youtube/v3/search?',params=payload2)
    videos = r2.text
    busquedavideo = json.loads(videos)
    if r2.status_code == 200:
        for video in busquedavideo["items"]:
            lista_ids.append(video["id"]["videoId"])
        for video2 in busquedavideo["items"]:
            titulos_videos.append(video2["snippet"]["title"])
        for video3 in busquedavideo["items"]:
            descripciones_videos.append(video3["snippet"]["description"])
        for video4 in busquedavideo["items"]:
            canales_videos.append(video4["snippet"]["channelTitle"])
        return template("videoresults.tpl",q=q,lista_ids=lista_ids,titulos_videos=titulos_videos,descripciones_videos=descripciones_videos,canales_videos=canales_videos)
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
    oyentes_canciones = []
    if r4.status_code == 200:
        canciones = r4.text
        busquedacancion = json.loads(canciones)
        for cancion in busquedacancion["results"]["trackmatches"]["track"]:
            lista_canciones.append(cancion["artist"])
        for cancion2 in busquedacancion["results"]["trackmatches"]["track"]:
            titulos_canciones.append(cancion2["name"])
        for cancion3 in busquedacancion["results"]["trackmatches"]["track"]:
            imagenes_canciones.append(cancion3["image"][3]["#text"])
        for cancion4 in busquedacancion["results"]["trackmatches"]["track"]:
            oyentes_canciones.append(cancion4["listeners"])
        return template("songresults.tpl",track=track,lista_canciones=lista_canciones,titulos_canciones=titulos_canciones,imagenes_canciones=imagenes_canciones,oyentes_canciones=oyentes_canciones)
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
    comenzar_eventos = []
    direcciones_eventos = []
    ubicaciones_eventos = []
    keyevent = os.environ["keyevent"]
    payload5 = {"location":ciudad,"keywords":termino,"t":rango,"sort_order":tipo,"sort_direction":orden,"app_key":keyevent}
    r5 = requests.get('http://api.eventful.com/json/events/search?',params=payload5)
    if r5.status_code == 200:
        eventos = r5.text
        busquedaevento = json.loads(eventos)
        for evento in busquedaevento["events"]["event"]:
            lista_eventos.append(evento["title"])
        for inicio_evento in busquedaevento["events"]["event"]:
            comenzar_eventos.append(inicio_evento["start_time"])
        for direccion in busquedaevento["events"]["event"]:
            direcciones_eventos.append(direccion["venue_address"])
        for ubicacion in busquedaevento["events"]["event"]:
            ubicaciones_eventos.append(ubicacion["venue_name"])
        return template('eventresults.tpl',lista_eventos=lista_eventos,comenzar_eventos=comenzar_eventos,direcciones_eventos=direcciones_eventos,ubicaciones_eventos=ubicaciones_eventos,ciudad=ciudad,termino=termino)
    else:
        return template("error.tpl")

@route('/film',method="get")
def film():
    return template("film.tpl")

@route('/filmresults',method="post")
def filmresults():
    query = request.forms.get('query')
    lista_peliculas = []
    descripciones_peliculas = []
    fechas_peliculas = []
    calificaciones_peliculas = []
    keyfilm = os.environ["keyfilm"]
    payload6 = {"api_key":keyfilm,"query":query,"language":"es-ES"}
    r6 = requests.get('https://api.themoviedb.org/3/search/movie',params=payload6)
    if r6.status_code == 200:
        peliculas = r6.text
        busquedapelicula = json.loads(peliculas)
        for pelicula in busquedapelicula["results"]:
            lista_peliculas.append(pelicula["title"])
        for descripcion in busquedapelicula["results"]:
            descripciones_peliculas.append(descripcion["overview"])
        for fecha in busquedapelicula["results"]:
            fechas_peliculas.append(fecha["release_date"])
        for calificacion in busquedapelicula["results"]:
            calificaciones_peliculas.append(calificacion["vote_average"])
        return template('filmresults.tpl',lista_peliculas=lista_peliculas,descripciones_peliculas=descripciones_peliculas,fechas_peliculas=fechas_peliculas,calificaciones_peliculas=calificaciones_peliculas,query=query)
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