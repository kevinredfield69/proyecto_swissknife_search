%include('header.tpl',title='Opiniones')

<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
								<div class="6u skel-cell-important">
							<section id="content" >
							<form action="http://www.gonzalonazareno.org/josedom/resultado.php" method="post" enctype="multipart/form-data">						
								<hr/>
								<br/>
								<strong><label class="titulo" for="nombre">Datos Personales<span class="requerido">*</span></label></strong>							

								<div>
									<br/>
 									<span class="completo">
										<label for="nombre">Nombre</label>
										<br/>
										<input id="nombre" name="Nombre" value="" />
    									</span>
									
									<br/>

									<span class="completo">
      									<br/>
										<label for="Primer_Apellido">Primer apellido</label>
										<br/>
										<input id="Primer_Apellido" name="Primer Apellido" value="" />
      
									</span>

									<br/>

									<span class="completo">
									<br/>
										<label for="Segundo_Apellido">Segundo Apellido</label>
										<br/>
										<input id="Segundo_Apellido" name="Segundo Apellido" value="" />
									</span>
									
									<br/>

									<span class="completo">
      									<br/>
										<label for="Correo_Electronico">Correo Electrónico</label>
										<br/>
										<input id="Correo_Electronico" name="Correo_Electronico" value="" />
      
									</span>
									
									<br/><br/>
									<hr/>
  
									<span class="completo">
									<br/>
										<strong><label class="titulo" for="nombre">Sexo<span class="requerido">*</span></label></strong>
										<br/><br/>

										<input type="radio" name="Sexo" value="Hombre" /> Hombre
										<input type="radio" name="Sexo" value="Mujer"/> Mujer
    									</span>

									<br/><br/>
									<hr/>

									<span class="completo">
									<br/><br/>
										<strong><label for="Fecha_De_Nacimiento">Fecha De Nacimiento<span class="requerido">*</span></label></strong>	
										
										<br/><br/>

										<input type="text" size="3" maxlength="2" id="Fecha_De_Nacimiento" name="Dia"/>
										de
											<select id="fecha_mes" name="Mes">
												<option value="1">Enero</option>
												<option value="2">Febrero</option>
												<option value="3">Marzo</option>
												<option value="4">Abril</option>
												<option value="5">Mayo</option>
												<option value="6">Junio</option>
												<option value="7">Julio</option>
												<option value="8">Agosto</option>
												<option value="9">Septiembre</option>
												<option value="10">Octubre</option>
												<option value="11">Noviembre</option>
												<option value="12">Diciembre</option>
											</select>

										de
											<input type="text" size="5" maxlength="4" id="fecha_ano" name="Ano"/>
									</span>
								</div>								
								
								<br/><br/>
								<hr/>

								<div>
									<br/>
    									<span class="completo">									
      										<strong><label>¿Te Ha Gustado La Realizacion De Mi Pagina Web?</label></strong>
										<br/><br/>		

										<input type="radio" name="Te ha gustado la realizacion de mi pagina Web" value="Si"/>Sí
										<input type="radio" name="Te ha gustado la realizacion de mi pagina Web" value="No"/>No<br/>
									</span>

								<br/>
								<hr/>

									<span class="completo">
									<br/>
										<strong><label for="Calificacion">Calificacion</label></strong>
										<select id="Calificacion" name="Calificacion">
											<option value="" selected="selected">-	selecciona   -</option>
											<option value="0">0</option>
											<option value="1">1</option>
    											<option value="2">2</option>
    											<option value="3">3</option>
   		 									<option value="4">4</option>
    											<option value="5">5</option>
    											<option value="6">6</option>
    											<option value="7">7</option>
    											<option value="8">8</option>
    											<option value="9">9</option>
    											<option value="10">10</option>
										</select>
									</span>

								<br/><br/>
								<hr/>

								</div>
								
								<div>
									
									<br/>
									
									<span class="completo">

      										<strong><label for="descripcion">Sugerencias</label></strong>
										
										<br/><br/>
										
										<textarea name="Sugerencias" id="descripcion" cols="40" rows="10"></textarea>
									</span>
								</div>
								
								<br/>
							
									<input type="submit"/>
									<input type="reset"/>
							</form>
						</section>
					</div>	

					<br/>
					<hr/>					
					
							<p><strong><a href="swissknife" class="button">Volver A La Página Principal</a></strong></p>

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
