%include('header.tpl',title='Buscador De Imagen')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<form action='/pictureresults' method='post'>

								<br/>
								<strong><label>Escribir Imagen A Buscar:</label></strong>
								<input type = "text" name = 'text' required/>
								<br/><br/>

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

								<strong><label for='sort'>Orden De Resultados</label></strong>
									<select id='sort' name='sort'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value='date-posted-asc'>Fecha De Publicación (Ascendente)</option>
										<option value='date-posted-desc'>Fecha De Publicación (Descendente)</option>
										<option value='interestingness-asc'>Interés De Publicación (Ascendente)</option>										<option value='interestingness-desc'>Interés De Publicación (Descendente)</option>										<option value='relevance'>Relevancia</option>
									</select>
								<br/><br/>
								<input type = "submit" value = "Buscar">
								<input type="reset" value = "Limpiar">
								<br/><br/>

							</form>
						
							<p><strong><a href="panel" class="button">Volver Al Panel De Buscadores</a></strong></p>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
