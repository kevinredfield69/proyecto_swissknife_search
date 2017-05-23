%include('header.tpl',title='Resultados Canciones')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

						<h1><strong>Los resultados encontrados sobre la búsqueda {{termino}} en {{ciudad}} son:</strong></h1>
						<br/>
						<hr/>
						<br/>
							% for evento in lista_eventos:
								<ul>
            								<li>{{evento}}</li> 
								</ul>
							%end 


							<p><strong><a href="event" class="button">Volver A SwissKnife Event</a></strong></p>


						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
