%include('header.tpl',title='Resultados Series')

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
							%for serie,voto,popularidad,inicio,origen in zip(lista_series,votos_series,popularidades_series,inicios_series,origenes_series):
								<ul>
									<li><p><strong>{{serie}}</strong></p></li>
									<li><p><strong>Fecha De Inicio De Serie: </strong>{{inicio}}</p>
									<p><strong>Popularidad De La Serie: </strong>{{popularidad}}</p>
									<p><strong>Calificacion: </strong>{{voto}}</p>
									<p><strong>Origen De La Serie: </strong>{{origen}}</p></li>

									% if cont == 1:
										<a href="/twittear"><h1 class="centro">Compartir en Twitter</h1></a></li>
									% end
            								
								</ul>
							%end

							<p><strong><a href="serie" class="button">Volver A SwissKnife Serie</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
