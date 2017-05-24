%include('header.tpl',title='Buscador De Eventos')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

							<h3><strong>SwissKnife Event</strong></h3>

							<br/><br/>

							<form action='/eventresults' method='post'>
							<br/>
								<strong><label>Ciudad:</label></strong>
								<input type = "text" name = 'ciudad' required/>
	
								<strong><label>Busqueda:</label></strong>
								<input type = "text" name = 'termino' required/>

								<br/><br/>

								<strong><label>Rango De Búsqueda:</label></strong>

								<select name='rango'>
									<option value="" selected="selected">-	Selecciona   -</option>	
									<option value="Past">Pasado</option>
									<option value="Future">Futuro</option>
									<option value="This_Week">Esta Semana</option>
									<option value="Next_Week">Próxima Semana</option>
								</select>

								<strong><label>Tipo De Búsqueda:</label></strong>
	
								<select name='tipo'>
									<option value="" selected="selected">-	Selecciona   -</option>	
									<option value="Relevance">Relevancia</option>
									<option value="Date">Fecha</option>
									<option value="Popularity">Popularidad</option>
								</select>

								<br/><br/>

								<strong><label>Orden De Búsqueda:</label></strong>

								<select name='orden'>
									<option value="" selected="selected">-	Selecciona   -</option>	
									<option value="Ascending">Ascendente</option>
									<option value="Descending">Descendente</option>
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
