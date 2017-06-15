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

									% if cont == 1:
										<li><a href="/twittear"><h1 class="centro">Compartir en Twitter</h1></a></li>
									% end

									<li><a href="https://twitter.com/share?url=google.com&text=Me gusta el gif {{gi2}} de Swissknife Search>Tweet</a></li>
								</ul>
							%end

							<p><strong><a href="gif" class="button">Volver A SwissKnife GIF</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
