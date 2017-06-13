%include('header.tpl',title='Resultados Eventos')

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
							% for evento,inicio_evento,direccion,ubicacion in zip(lista_eventos,comenzar_eventos,direcciones_eventos,ubicaciones_eventos):
								<ul>
            								<li><p><strong>{{evento}}</strong></p></li>
									<li><p><strong>Hora De Comienzo Del Evento:</strong> {{inicio_evento}}</p>
									<p><strong>Ubicación Del Evento:</strong> {{ubicacion}}</p>
									<p><strong>Dirección Del Evento:</strong> {{direccion}}</p></li>

									% if cont == 1:
										<li><a href="/twittear"><h1 class="centro">Compartir en Twitter</h1></a></li>
									% end
								</ul>
							%end 


							<p><strong><a href="event" class="button">Volver A SwissKnife Event</a></strong></p>


						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
