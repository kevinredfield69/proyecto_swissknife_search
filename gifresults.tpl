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
								</ul>
							%end

							<p><strong><a href="gif" class="button">Volver Al Buscador De GIF</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
