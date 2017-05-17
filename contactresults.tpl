%include('header.tpl',title='Resultado De Formulario')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
								<div class="6u skel-cell-important">
							<section id="content" >

							<h3><strong>Datos</strong></h3>

							<br/><br/>					

							<ul>							
							
							<li><p><strong>Nombre:</strong> {{Nombre}}</p>
							<p><strong>Primer Apellido:</strong> {{Primer_Apellido}}</p>
							<p><strong>Segundo Apellido:</strong> {{Segundo_Apellido}}</p>
							<p><strong>Correo:</strong> {{Correo_Electronico}}</p>
							<p><strong>Sexo:</strong> {{Sexo}}</p>
							<p><strong>Fecha De Naciciento:</strong> {{Dia}} de {{Mes}} de {{Anyo}}</p>
							<p><strong>¿Te Ha Gustado Mi Aplicación Web?:</strong> {{Gustar}}</p>
							<p><strong>Calificación:</strong> {{Calificacion}}</p>					<p><strong>Sugerencias:</strong> {{Sugerencias}}</p></li>
							</ul>							

							
								

						</section>
					</div>					
					
							<p><strong><a href="contact" class="button">Volver A La Página De Contacto</a></strong></p>

						</section>
					</div>
					
					<!-- Sidebar -->
					<div id="sidebar" class="4u">
						<section>						

							<ul>
								<li>
									<p><strong>¿Que Es SwissKnife (Search)?</strong></p>
                                    					<br/>
									<p class="text">SwissKnife (Search) es una Aplicación Web, donde podemos realizar diferentes búsquedas de información, que podemos encontrar día a día en Internet. Para éste caso, se realizarán busquedas de Imágenes, Canciones, Vídeos y Gifs.</p>
								</li>
								<li>
                                    					<p><strong>¿Que Funciones Realiza SwissKnife (Search)?</strong></p>
									<br/>		
									<p class="text">Realizar criterios de búsqueda, sobre una imagen que queremos encontrar, una cacnción que queremos escuchar, un vídeo que queremos ver y un gif que queremos encontrar, en tiempo real, y de forma rápida.</p>
								</li>
								<li>
									<p><strong>¿Donde Surgió La Idea y Nombre de SwissKnife Search?</strong></p>
									<br/>
									<p class="text">La idea del nombre de SwissKnife (Search) surgió, a través de la funcionalidades que realiza la Aplicación Web, dando a entender que es una Navaja Suiza (Swiss Knife), que es un utensilio, donde tiene varias herramientas útiles, en nuestro día a día y vida cotidiana.</p>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
