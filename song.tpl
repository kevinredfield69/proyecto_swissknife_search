%include('header.tpl',title='Buscador De Canciones')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<form action='/songresults' method='post'>
							<br/>
								<strong><label>Escribir Artista, Canción O Álbum A Buscar:</label></strong>
								<input type = "text" name = 'track' required/>
								<br/><br/>

								<strong><label for='limit'>Límite De Resultados</label></strong>
									<select id='limit' name='limit'>
										<option value="" selected="selected">-	Selecciona   -</option>										<option value="30">30 resultados</option>
										<option value="40">40 resultados</option>
    										<option value="50">50 resultados</option>
    										<option value="60">60 resultados</option>
   		 								<option value="70">70 resultados</option>
    										<option value="80">80 resultados</option>
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

