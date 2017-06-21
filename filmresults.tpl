%include('header.tpl',title='Resultados Películas')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

						<h1><strong>Los resultados encontrados sobre la búsqueda {{query}} son:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for pelicula,descripcion,fecha,calificacion in zip(lista_peliculas,descripciones_peliculas,fechas_peliculas,calificaciones_peliculas):
								<ul>
									<li><p><strong>{{pelicula}}</strong></p></li>
									<li><p><strong>Sinopsis De La Película:</strong> {{descripcion}}</p>
									<p><strong>Fecha De Estreno:</strong> {{fecha}}</p>
									<p><strong>Calificación De La Película:</strong> {{calificacion}}</p></li>
									<li><h1><a href="https://twitter.com/share?url=google.com&text=Me gusta la película {{pelicula}} de SwissKnife Film">Twittear</a></h1></li>
            								
								</ul>
							%end

							<p><strong><a href="film" class="button">Volver A SwissKnife Film</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
