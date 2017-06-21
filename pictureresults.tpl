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
									<li><h1><strong>{{titulo}}</strong></h1></li>
            								<li><img width="600" height="400" src="{{imagen[0]}}"/></li>
									<li><h2><strong><a href="https://twitter.com/share?url=google.com&text=Me gusta la imagen {{imagen[0]}} de SwissKnife Picture">Twittear</a></strong></h2></li>
								</ul>
							%end

							<p><strong><a href="picture" class="button">Volver A SwissKnife Picture</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
