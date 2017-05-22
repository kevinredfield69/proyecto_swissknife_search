%include('header.tpl',title='Buscador De Gif')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">

						<section>

							<h3><strong>SwissKnife GIF</strong></h3>

							<br/><br/>

							<form action='/gifresults' method='post'>
								<br/>
								<strong><label>Escribir GIF A Buscar:</label></strong>
								<input type = "text" name = 'q' required/>
								<br/><br/>
								<input type = "submit" value = "Buscar">
								<input type="reset" value = "Limpiar">
								<br/><br/>

							</form>
							<p><strong><a href="panel" class="button">Volver Al Panel De Buscadores</a></strong></p>
							<br/>

						</section>
					</div>
				</div>
			</div>
		</div>

%include('footer.tpl')
