%include('header.tpl',title='Resultados Canciones')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

						<h1><strong>Los resultados encontrados sobre la búsqueda {{track}} son:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for cancion,cancion2,cancion3,cancion4 in zip(lista_canciones,titulos_canciones,imagenes_canciones,oyentes_canciones):
								<ul>
									<li><h1><strong>{{cancion}} - </strong>{{cancion2}}</h1></li>
									<li><img width="600" height="400" src="{{cancion3}}"/>
									<br/>
									<p><strong>Oyentes:</strong> {{cancion4}} personas que lo han escuchado</p></li>
									<li><h2><strong><a href="https://twitter.com/share?url=google.com&text=Me gusta la canción / artista / album {{cancion}} - {{cancion2}} de SwissKnife Song">Twittear</a></strong></h2></li>
								</ul>
							%end

							<p><strong><a href="song" class="button">Volver A SwissKnife Song</a></strong></p>


						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
