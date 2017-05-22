%include('header.tpl',title='Buscador De Imagen')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

							<h3><strong>SwissKnife Picture</strong></h3>

							<br/><br/>							

							<form action='/pictureresults' method='post'>
								<strong><label>Escribir Imagen A Buscar:</label></strong>
								<input type = "text" name = 'text' required/>
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
