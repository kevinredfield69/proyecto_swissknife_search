%include('header.tpl',title='Resultados Canciones')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

						<h1><strong>Se han encontrado {{limit}} resultados sobre la búsqueda {{track}}:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for cancion,cancion2,cancion3,cancion4 in zip(lista_canciones,titulos_canciones,imagenes_canciones,sonido_canciones):
								<ul>
									<li><h2><strong>{{cancion}} - </strong>{{cancion2}}</h2></li>
									<li><img width="600" height="400" src="{{cancion3}}"/></li>
									<li><audio src="{{cancion4}}" controls></audio></li>
								</ul>
							%end

							<p><strong><a href="song" class="button">Volver Al Buscador De Canción</a></strong></p>


						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
