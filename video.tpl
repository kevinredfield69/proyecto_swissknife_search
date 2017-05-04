%include('header.tpl',title='Buscador De Gif')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<form action='/videoresults' method='post'>
								<strong><label>Escribir Vídeo a Buscar:</label></strong>
								<input type = "text" name = 'q' required/>
								<br/><br/>
								<hr/>
								<br/>
								<strong><label for='maxResults'>Límite De Resultados</label></strong>
									<select id='maxResults' name='maxResults'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value="5">5 resultados</option>
										<option value="10">10 resultados</option>
    										<option value="15">15 resultados</option>
    										<option value="20">20 resultados</option>
   		 								<option value="25">25 resultados</option>
    										<option value="30">30 resultados</option>
    										<option value="35">35 resultados</option>
    										<option value="40">40 resultados</option>
    										<option value="45">45 resultados</option>
										<option value="50">50 resultados</option>
									</select>
								
								<br/><br/>
								<hr/>
								<br/>
								<strong><label for='order'>Orden De Resultados</label></strong>
									<select id='order' name='order'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value='date'>Fecha</option>
										<option value='relevance'>Relevancia</option>
    										<option value='viewCount'>Conteo De Visitas</option>
									</select>
								<br/><br/>
								<hr/>
								<br/>
								<input type = "submit" value = "Buscar">
								<input type="reset" value = "Limpiar">

							</form>

							<br/><br/>

							<p><strong><a href="panel">Volver Al Panel De Buscadores SwissKnife (Search)</a></strong></p>

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
