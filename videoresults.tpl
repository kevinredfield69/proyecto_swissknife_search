%include('header.tpl',title='Resultados Vídeos')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<h1><strong>Se han encontrado {{maxResults}} resultados sobre la búsqueda {{q}}:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for id,video in zip(lista_ids,titulos_videos):
								<ul>
									<li><h2><strong>{{video}}</strong></h2></li>
            								<li><iframe width="600" height="400" src="https://www.youtube.com/embed/{{id}}" frameborder="0" allowfullscreen></iframe></li> 
								</ul>
							%end

							<p><strong><a href="video" class="button">Volver Al Buscador De Vídeo</a></strong></p>
						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
