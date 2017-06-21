%include('header.tpl',title='Resultados Actores')

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
							%for actor,descripcion,fecha,calificacion in zip(lista_actores,actores_descripciones,actores_fechas,actores_calificaciones):
								<ul>
									<li><p><strong>{{actor}}</strong></p></li>
									<li><p><strong>Sinopsis De La Película: </strong>{{descripcion}}</p>
									<p><strong>Fecha De Estreno: </strong>{{fecha}}</p>
									<p><strong>Calificación: </strong>{{calificacion}}</p></li>
									<li><h2><strong><a href="https://twitter.com/share?url=google.com&text=Me gusta la película {{actor}} del actor {{query}} de SwissKnife Actor">Twittear</a></strong></h2></li>
            								
								</ul>
							%end

							<p><strong><a href="actor" class="button">Volver A SwissKnife Actor</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
