%include('header.tpl',title='Resultados GIFs')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							%for gif,gif2 in zip(lista_gifs,titulos_gifs):
								<ul>
									<li><p><strong>{{gif2}}</strong></p></li>
            								<li><img width="600" height="400" src="{{gif}}"/></li>
								</ul>
							%end

							<br/>

							<p><strong><a href="gif">Volver Al Buscador De GIFs SwissKnife (Search)</a></strong></p>

							<br/>
							
							<p><strong><a href="swissknife">Volver A La Página Principal SwissKnife (Search)</a></strong></p>	

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
