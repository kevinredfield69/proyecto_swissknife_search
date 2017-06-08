%include('header.tpl',title='Buscador De Actores')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

							<h3><strong>SwissKnife Actor</strong></h3>

							<br/><br/>							

							<form action='/actorresults' method='post'>
							<br/>
								<strong><label>Escribir Nombre De Un Actor:</label></strong>
								<input type = "text" name = 'query' required/>
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
