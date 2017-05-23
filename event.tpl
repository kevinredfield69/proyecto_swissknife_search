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
								<label>Ciudad:</label>
								<input type = "text" name = 'ciudad' required/>
	
							<br><br>
	
								<label>Busqueda:</label>
								<input type = "text" name = 'termino' required/>

								<br/><br/>

								<label>Rango De Búsqueda:</label>

								<select name="rango">
									<option value="Past">Past</option>
									<option value="Today">Today</option>
									<option value="Future">Future</option>
									<option value="This_Week">This Week</option>
									<option value="Next_Week">Next Week</option>
								</select>
		
								<br/><br/>

								<label>Tipo De Búsqueda:</label>
	
								<select name="tipo">
									<option value="Relevance">Relevance</option>
									<option value="Date">Date</option>
									<option value="Popularity">Popularity</option>
								</select>

								<br/><br/>

								<label>Orden De Búsqueda:</label>

								<select name="orden">
									<option value="Ascending">Ascending</option>
									<option value="Descending">Descending</option>
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
