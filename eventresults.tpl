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
            								<li><h1><strong>{{evento}}</strong></h1></li>
									<li><p><strong>Hora De Comienzo Del Evento:</strong> {{inicio_evento}}</p>
									<p><strong>Ubicación Del Evento:</strong> {{ubicacion}}</p>
									<p><strong>Dirección Del Evento:</strong> {{direccion}}</p></li>
									<li><h2><strong><a href="https://twitter.com/share?url=google.com&text=Voy a asistir al evento {{evento}} a las {{inicio_evento}} en {{ubicacion}}">Twittear</a></strong></h2></li>

								</ul>
							%end 


							<p><strong><a href="event" class="button">Volver A SwissKnife Event</a></strong></p>


						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
