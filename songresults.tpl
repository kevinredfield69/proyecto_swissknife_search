%include('header.tpl',title='Resultados Canciones')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							%for cancion,cancion2,cancion3 in zip(lista_canciones,titulos_canciones,imagenes_canciones):
								<ul>
									<li><p><strong>{{cancion}} - </strong>{{cancion2}}</p></li>
									<li><img width="600" height="400" src="{{cancion3}}"/></li>
								</ul>
							%end

							<p><strong><a href="song" class="button">Volver Al Buscador De Canción</a></strong></p>


						</section>
					</div>
					
					<!-- Sidebar -->
					<div id="sidebar" class="4u">
						<section>
							<h1>¿Que Es SwissKnife (Search)?</h1>
															
							<br/>							

							<ul class="style">
								<li>
                                    					<img src="/css/images/SKD1.png" alt="" />
									<p class="text">SwissKnife (Search) es una Aplicación Web, donde podemos realizar diferentes búsquedas de información, que podemos encontrar día a día en Internet. Para éste caso, se realizarán busquedas de Imágenes, Canciones, Vídeos y Gifs.</p>
								</li>
								<li>
                                    					<h1>¿Que Funciones Realiza SwissKnife (Search)?</h1>
									<br/>	
									<img src="/css/images/SKD1.png" alt="" />	
									<p class="text">Realizar criterios de búsqueda, sobre una imagen que queremos encontrar, una cacnción que queremos escuchar, un vídeo que queremos ver y un gif que queremos encontrar, en tiempo real, y de forma rápida.</p>
								</li>
								<li>
									<h1>¿Donde Surgió La Idea y Nombre de SwissKnife Search?</h1>
									<br/>
									<img src="/css/images/SKD1.png" alt="" />
									<p class="text">La idea del nombre de SwissKnife (Search) surgió, a través de la funcionalidades que realiza la Aplicación Web, dando a entender que es una Navaja Suiza (Swiss Knife), que es un utensilio, donde tiene varias herramientas útiles, en nuestro día a día y vida cotidiana.</p>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
