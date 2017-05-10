%include('header.tpl',title='Buscador De Imagen')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<form action='/pictureresults' method='post'>
								<strong><label>Escribir Imagen A Buscar:</label></strong>
								<input type = "text" name = 'text' required/>
								<br/><br/>
								<hr/>
								<br/>
								<strong><label for='per_page'>Límite De Resultados</label></strong>
									<select id='per_page' name='per_page'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value="100">100 resultados</option>
										<option value="150">150 resultados</option>
    										<option value="200">200 resultados</option>
    										<option value="250">250 resultados</option>
   		 								<option value="300">300 resultados</option>
    										<option value="350">350 resultados</option>
    										<option value="400">400 resultados</option>
    										<option value="450">450 resultados</option>
    										<option value="500">500 resultados</option>
									</select>
								
								<br/><br/>
								<hr/>
								<br/>
								<strong><label for='sort'>Orden De Resultados</label></strong>
									<select id='sort' name='sort'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value='date-posted-asc'>Fecha De Publicación (Ascendente)</option>
										<option value='date-posted-desc'>Fecha De Publicación (Descendente)</option>
										<option value='interestingness-asc'>Interés De Publicación (Ascendente)</option>										<option value='interestingness-desc'>Interés De Publicación (Descendente)</option>										<option value='relevance'>Relevancia</option>
									</select>
								<br/><br/>
								<hr/>
								<br/>
								<input type = "submit" value = "Buscar">
								<input type="reset" value = "Limpiar">

							</form>

							<br/><br/>

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
