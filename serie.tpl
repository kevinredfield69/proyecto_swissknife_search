%include('header.tpl',title='Buscador De Series')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>

							<h3><strong>SwissKnife Serie</strong></h3>

							<br/><br/>							

							<form action='/serieresults' method='post'>
							<br/>
								<strong><label>Escribir Nombre De Una Serie:</label></strong>
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
