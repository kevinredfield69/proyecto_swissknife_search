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
									<li><p>{{pelicula}}</p></li>
									<li><p>{{descripcion}}</p></li>
									<li><p>Fecha De Estreno: {{fecha}}</p></li>
									<li><p>Calificación De La Película: {{calificacion}}</p></li>
            								
								</ul>
							%end

							<p><strong><a href="film" class="button">Volver A SwissKnife Film</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
