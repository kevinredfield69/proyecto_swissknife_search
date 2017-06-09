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
							%for actor,cartel,descripcion in zip(lista_actores,actores_imagenes,actores_descripciones):
								<ul>
									<li><p><strong>{{actor}}</strong></p></li>
									<li><img width="600" height="400" src="{{cartel}}"/>
									<p><strong>Sinopsis De La Película: </strong>{{descripcion}}</p></li>
									% if cont == 1:
										<a href="/twittear"><h1 class="centro">Compartir en Twitter</h1></a></li>
									% end
            								
								</ul>
							%end

							<p><strong><a href="actor" class="button">Volver A SwissKnife Actor</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
