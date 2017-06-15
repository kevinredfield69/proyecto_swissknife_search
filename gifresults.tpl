%include('header.tpl',title='Resultados GIFs')

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
							%for gif,gif2 in zip(lista_gifs,titulos_gifs):
									
								<ul>
									<li><h2><strong>{{gif2}}</strong></h2></li>
            								<li><img width="600" height="400" src="{{gif}}"/></li>
									<li><h1><strong><a href="https://twitter.com/share?url=google.com&text=Me gusta el gif https://media2.giphy.com/media/{{gif}}/giphy.gif de SwissKnife GIF">Twittear</strong></a></h1></li>
								</ul>
							%end

							<p><strong><a href="gif" class="button">Volver A SwissKnife GIF</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
