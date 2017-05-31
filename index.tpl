%include('header.tpl',title='SwissKnife (Search)')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<header>
								<h2><strong>¡Bienvenidos A SwissKnife (Search)!</strong></h2>
							</header>
							<br/><br/>
							<p><img src="/css/images/SK1.jpg" alt="" /></p>
							<br/>
							<p><strong>SwissKnife (Search)</strong> es una Aplicación Web, que actúa como un <strong>"Buscador de Internet"</strong>, donde su función principal, es realizar <strong>Búsquedas de Información,</strong> que hacen referencias a Imágenes, Vídeos, Canciones y Gifs existentes en <strong>Internet,</strong> pero de una forma más <strong>Rápida.</strong></p>

                            <p>El proyecto, está pensado a utilizar varias <strong>API's Web de Buscadores Web,</strong> con la funcionalidad principal de poder realizar <strong>"Diferentes acciones",</strong> donde su resultado, se mostrará en la Aplicación Web<strong>SwissKnife (Search).</strong> Algunos ejemplos podría ser: Buscar Gifs <strong>"Más virales"</strong> en Internet por el momento, Buscar un vídeo que contenga <strong>"Subtítulos",</strong> Buscar canciones mediante un <strong>"Artista o Disco"</strong> determinado y Buscar imágenes con un <strong>"Tamaño determinado".</strong></p>

                            <p>El proyecto de <strong>SwissKnife (Search),</strong> se ha realizado, con el fin de poder <strong>Facilitar la búsqueda</strong> de contenido por <strong>Internet,</strong> accediendo de una forma <strong>Rápida,</strong> a través de una Aplicación Web, que se encarga de mostrarte <strong>"Varios resultados"</strong> al instante, sobre un <strong>"Criterio de búsqueda"</strong> a realizar, para poder encontrarlo <strong>"En tiempo real.</strong></p>

							<br/><br/>							

							<form action='/searchquick' method='post'>
							<br/>
								<strong><label>Escribir Un Término De Búsqueda:</label></strong>
								<input type = "text" name = 'search' required/>
								<br/><br/>
								<input type = "submit" value = "Buscar">
								<input type="reset" value = "Limpiar">
								<br/><br/>
							</form>

							<br/><br/>

							% if cont == 1:
								<h3>Conectado con</h3>
								<img src="css/images/twitter.png" />
								<a href="/twitter_logout"><h3>Desconectar</h3></a>
							% else:
								<a href="{{authorize_url}}"><h3>Conectar con Twitter</h3></a>
							% end
							
							<br/>							

							<p><strong><a href="panel" class="button">Acceder A La Aplicación SwissKnife (Search) >>></a></strong></p>

						</section>
					</div>
					
					<!-- Sidebar -->

					<div id="sidebar" class="4u">
						<section>
							<ul>

								<li>
									<p><strong>¿Que Es SwissKnife (Search)?</strong></p>
									<br/>
									<p class="text">SwissKnife (Search) es una Aplicación Web, donde podemos realizar diferentes búsquedas de información, que podemos encontrar día a día en Internet. Para éste caso, se realizarán busquedas de Imágenes, Canciones, Vídeos, Gifs, Eventos y Películas.</p>
								</li>

								<li>
                                    					<p><strong>¿Que Funciones Realiza SwissKnife (Search)?</strong></p>
									<br/>	
									<p class="text">Realizar criterios de búsqueda, sobre una imagen que queremos encontrar, una cacnción que queremos buscar, un vídeo que queremos ver, un gif que queremos encontrar, un evento que queremos encontrar y películas que queremos buscar, en tiempo real, y de forma rápida.</p>
								</li>

								<li>
									<p><strong>¿Donde Surgió La Idea De SwissKnife Search?</strong></p>
									<br/>
									<p class="text">La idea del nombre de SwissKnife (Search) surgió, a través de la funcionalidades que realiza la Aplicación Web, dando a entender que es una Navaja Suiza (Swiss Knife), que es un utensilio, donde tiene varias herramientas útiles, en nuestro día a día y vida cotidiana.</p>

								</li>
							</ul>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')

