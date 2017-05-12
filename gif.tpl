%include('header.tpl',title='Buscador De Gif')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

							<form action='/gifresults' method='post'>
								<strong><label>Escribir GIF A Buscar:</label></strong>
								<input type = "text" name = 'q' required/>
								<br/><br/>
								<hr/>
								<br/>
								<strong><label for='limit'>Límite De Resultados</label></strong>
									<select id='limit' name='limit'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value="25">25 resultados</option>
										<option value="30">30 resultados</option>
    										<option value="40">40 resultados</option>
    										<option value="50">50 resultados</option>
   		 								<option value="60">60 resultados</option>
    										<option value="70">70 resultados</option>
    										<option value="80">80 resultados</option>
    										<option value="90">90 resultados</option>
    										<option value="10">100 resultados</option>
									</select>
								<br/><br/>
								<hr/>
								<br/>
								<input type = "submit" value = "Buscar">
								<input type="reset" value = "Limpiar">

							</form>

							<br/><br/>

							<p><img src="/css/images/gif2.gif" alt="" /></p>

							<p><strong><a href="panel" class="button">Volver Al Panel De Buscadores</a></strong></p>

						</section>
					</div>
					
					<!-- Sidebar -->
					<div id="sidebar" class="4u">
						<section>
							<h1>¿Que Es SwissKnife (Search)?</h1>
															
							<br/>							

							<ul class="style">
								<li>
                                    					<img src="/css/images/SKD1.png" alt="" />
									<p class="text">SwissKnife (Search) es una Aplicación Web, donde podemos realizar diferentes búsquedas de información, que podemos encontrar día a día en Internet. Para éste caso, se realizarán busquedas de Imágenes, Canciones, Vídeos y Gifs.</p>
								</li>
								<li>
                                    					<h1>¿Que Funciones Realiza SwissKnife (Search)?</h1>
									<br/>	
									<img src="/css/images/SKD1.png" alt="" />	
									<p class="text">Realizar criterios de búsqueda, sobre una imagen que queremos encontrar, una cacnción que queremos escuchar, un vídeo que queremos ver y un gif que queremos encontrar, en tiempo real, y de forma rápida.</p>
								</li>
								<li>
									<h1>¿Donde Surgió La Idea y Nombre de SwissKnife Search?</h1>
									<br/>
									<img src="/css/images/SKD1.png" alt="" />
									<p class="text">La idea del nombre de SwissKnife (Search) surgió, a través de la funcionalidades que realiza la Aplicación Web, dando a entender que es una Navaja Suiza (Swiss Knife), que es un utensilio, donde tiene varias herramientas útiles, en nuestro día a día y vida cotidiana.</p>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
