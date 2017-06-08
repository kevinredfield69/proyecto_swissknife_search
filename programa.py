# -*- coding: utf-8 -*-

from bottle import route,template,run,static_file,error,request,redirect,response,get
from requests_oauthlib import OAuth1
from urlparse import parse_qs
from sys import argv
import json
import requests
import os

REQUEST_TOKEN_URL = "https://api.twitter.com/oauth/request_token"
AUTHENTICATE_URL = "https://api.twitter.com/oauth/authenticate?oauth_token="
ACCESS_TOKEN_URL = "https://api.twitter.com/oauth/access_token"

CONSUMER_KEY = os.environ.get('consumer_key')
CONSUMER_SECRET = os.environ.get('consumer_secret')

TOKENS = {}

def get_request_token():
    oauth = OAuth1(CONSUMER_KEY,
                   client_secret=CONSUMER_SECRET,
    )
    r = requests.post(url=REQUEST_TOKEN_URL, auth=oauth)
    credentials = parse_qs(r.content)
    TOKENS["request_token"] = credentials.get('oauth_token')[0]
    TOKENS["request_token_secret"] = credentials.get('oauth_token_secret')[0]

def get_access_token(TOKENS):
    oauth = OAuth1(CONSUMER_KEY,
                   client_secret=CONSUMER_SECRET,
                   resource_owner_key=TOKENS["request_token"],
                   resource_owner_secret=TOKENS["request_token_secret"],
                   verifier=TOKENS["verifier"],)
    r = requests.post(url=ACCESS_TOKEN_URL, auth=oauth)
    credentials = parse_qs(r.content)
    print credentials
    TOKENS["access_token"] = credentials.get('oauth_token')[0]
    TOKENS["access_token_secret"] = credentials.get('oauth_token_secret')[0]

@route('/',method="get")
def index():
    cont=0
    get_request_token()
    authorize_url = AUTHENTICATE_URL + TOKENS["request_token"]
    response.set_cookie("request_token", TOKENS["request_token"],secret='some-secret-key')
    response.set_cookie("request_token_secret", TOKENS["request_token_secret"],secret='some-secret-key')
    if request.get_cookie("access_token", secret='some-secret-key'):
        cont=1
    else:
        cont=0
    return template("index.tpl",authorize_url=authorize_url,cont=cont)

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
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template("gifresults.tpl",q=q,lista_gifs=lista_gifs,titulos_gifs=titulos_gifs,publicaciones_gifs=publicaciones_gifs,cont=cont)
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
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template("videoresults.tpl",q=q,lista_ids=lista_ids,titulos_videos=titulos_videos,descripciones_videos=descripciones_videos,canales_videos=canales_videos,cont=cont)
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
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template("pictureresults.tpl",text=text,lista_imagenes=lista_imagenes,titulos_imagenes=titulos_imagenes,cont=cont)
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
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template("songresults.tpl",track=track,lista_canciones=lista_canciones,titulos_canciones=titulos_canciones,imagenes_canciones=imagenes_canciones,oyentes_canciones=oyentes_canciones,cont=cont)
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
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template('eventresults.tpl',lista_eventos=lista_eventos,comenzar_eventos=comenzar_eventos,direcciones_eventos=direcciones_eventos,ubicaciones_eventos=ubicaciones_eventos,ciudad=ciudad,termino=termino,cont=cont)
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
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template('filmresults.tpl',lista_peliculas=lista_peliculas,descripciones_peliculas=descripciones_peliculas,fechas_peliculas=fechas_peliculas,calificaciones_peliculas=calificaciones_peliculas,query=query,cont=cont)
    else:
        return template('error.tpl')

@route('/actor',method="get")
def actor():
    return template("actor.tpl")

@route('/actorresults',method="post")
def actorresults():
    query = request.forms.get('query')
    lista_actores = []
    keyactor = os.environ["keyactor"]
    payload7 = {"api_key":keyactor,"query":query,"language":"es-ES"}
    r7 = requests.get('https://api.themoviedb.org/3/search/person',params=payload7)
    print r7.url
    if r7.status_code == 200:
        actores = r7.text
        busquedaactor = json.loads(actores)
        for actor in busquedaactor["results"]:
            lista_actores.append(actor["name"])
        cont=0
        if request.get_cookie("access_token", secret='some-secret-key'):
            cont=1
        else:
            cont=0
        return template('actorresults.tpl',lista_actores=lista_actores,query=query,cont=cont)
    else:
        return template('error.tpl')

@get('/callback')
def get_verifier():
    print TOKENS
    TOKENS["verifier"] = request.query.oauth_verifier
    get_access_token(TOKENS)
    response.set_cookie("access_token", TOKENS["access_token"],secret='some-secret-key')
    response.set_cookie("access_token_secret", TOKENS["access_token_secret"],secret='some-secret-key')
    redirect('/')

@get('/twittear')
def twittear():
    if request.get_cookie("access_token", secret='some-secret-key'):
      TOKENS["access_token"]=request.get_cookie("access_token", secret='some-secret-key')
      TOKENS["access_token_secret"]=request.get_cookie("access_token_secret", secret='some-secret-key')
      print CONSUMER_KEY
      print CONSUMER_SECRET
      print TOKENS["access_token"]
      print TOKENS["access_token_secret"]
      oauth = OAuth1(CONSUMER_KEY,
                       client_secret=CONSUMER_SECRET,
                       resource_owner_key=TOKENS["access_token"],
                       resource_owner_secret=TOKENS["access_token_secret"])
      url = 'https://api.twitter.com/1.1/statuses/update.json'
      status = 'Me ha gustado %s. via swissknifesearch.herokuapp.com'
      r = requests.post(url=url,data={"status":status},auth=oauth)
      if r.status_code == 200:
          return template('tuitcorrecto.tpl')
      else:
          return template('tuiterror.tpl')
    else:
      redirect('/')

@get('/twitter_logout')
def twitter_logout():
    response.set_cookie("access_token", '',max_age=0)
    response.set_cookie("access_token_secret", '',max_age=0)
    redirect('/')

@route('/css/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='css')

@error(404)
def error404(error):
    return template("html/error.tpl")

run(host='0.0.0.0', port=argv[1])
#run(host='0.0.0.0', port=9000, debug=True)