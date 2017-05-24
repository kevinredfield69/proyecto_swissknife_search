%include('header.tpl',title='Resultados De Busqueda De Prueba')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

						<h1><strong>Los resultados encontrados sobre la búsqueda {{search}} son:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for gif4 in coleccion_gifs:
								<ul>
									<li><p><strong>{{gif4}}</strong></p></li>
            								
								</ul>
							%end
						<br/>
							%for video5 in coleccion_videos:
								<ul>
									<li><p><strong>{{video5}}</strong></p></li>
            								
								</ul>
							%end

						<br/>
							%for imagen2 in coleccion_imagenes:
								<ul>
									<li><p><strong>{{imagen2}}</strong></p></li>
            								
								</ul>
							%end
						<br/>
							%for sonido2 in coleccion_sonidos:
								<ul>
									<li><p><strong>{{sonido2}}</strong></p></li>
            								
								</ul>
							%end
						<br/>
							%for evento2 in coleccion_eventos:
								<ul>
									<li><p><strong>{{evento2}}</strong></p></li>
            								
								</ul>
							%end
						<br/>
							%for pelicula2 in coleccion_peliculas:
								<ul>
									<li><p><strong>{{pelicula2}}</strong></p></li>
            								
								</ul>
							%end

							<p><strong><a href="/" class="button">Volver A La Página Principal</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
