%include('header.tpl',title='Resultados Vídeos')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<h1><strong>Los resultados encontrados sobre la búsqueda {{q}} son:</strong></h1>
						<br/>
						<hr/>
						<br/>
							%for id,video,descripcion,canal in zip(lista_ids,titulos_videos,descripciones_videos,canales_videos):
								<ul>
									<li><h2><strong>{{video}}</strong></h2></li>
									<li><p><strong>Nombre Del Canal:</strong> {{canal}}</p>
            								<iframe width="600" height="400" src="https://www.youtube.com/embed/{{id}}" frameborder="0" allowfullscreen></iframe>
									<br/>
									
									<p><strong>Descripción Del Vídeo:</strong> {{descripcion}}</p></li>
								</ul>
							%end

							<p><strong><a href="video" class="button">Volver A SwissKnife Vídeo</a></strong></p>
						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
