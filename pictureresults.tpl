%include('header.tpl',title='Resultados Imagenes')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
						<h1><strong>Los resultados encontrados sobre la búsqueda {{text}} son:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for titulo,imagen in zip(titulos_imagenes,lista_imagenes):
								<ul>
									<li><h2><strong>{{titulo}}</strong></h2></li>
            								<li><img width="600" height="400" src="{{imagen[0]}}"/></li> 
								</ul>
							%end

							<p><strong><a href="picture" class="button">Volver Al Buscador De Imagen</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
