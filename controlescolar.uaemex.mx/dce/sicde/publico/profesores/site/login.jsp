

<html>
<head>
	<link rel="stylesheet" type="text/css" href="../../../../css/camila_I.css">
	<link rel="stylesheet" type="text/css" href="../../../../sicde/css/sicde_I.css" />
</head>

<style>
	@import url("../../../../../sources/css/styles.css");
</style>
<script src="../../../../../sources/libraries/sweetalert2.min.js"></script>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" class="bodyLogin">



<script>
	function forgetPassword()
	{
		document.form1.action = "enviaContrasenia.jsp";
		document.form1.submit();
	}
	
	function firmarse(){
		var pass = document.form1.password.value;
		var usuario = document.form1.usuario.value;
		
		if(pass.length > 0 && usuario.length > 3){
			var btnFirmarse = document.getElementById('btnFirmarse');
			btnFirmarse.disabled = true;
			document.form1.submit();
		}else{
			alert("Favor de ingresar usuario y/o contrase\u00F1a correcta.");	
		}
	}
</script>

<script>
document.addEventListener('DOMContentLoaded', () => {
	let jsonData = []; // Variable global para almacenar el JSON

	// Constantes
	const selectLogin = document.getElementById('bypassLogin');
	const loginForm = document.getElementById('loginForm');
	const userInput = document.getElementsByName('usuario');
	const passwordInput = document.getElementsByName('password');

	function classicLogin(hidden = false) {
		valueLogin = hidden ? "block" : "none"
		loginForm.style.display = valueLogin;
	}

	function loadLoginData(idCuenta) {
		const foundItem = jsonData.find(item => item.idCuenta === idCuenta);

		if (!foundItem) {
			alert(`No se encontró un objeto con idCuenta: ${idCuenta}, ingrese manualmente.`);
			userInput.value = '';
			passwordInput.value = '';
			classicLogin(true);
			return false;
		}

		// Asignar los atributos a variables
		let idJSON = foundItem.idCuenta;
		let userJSON = foundItem.user;
		let passwordJSON = foundItem.password;
		let typeJSON = foundItem.type;
		let descriptionJSON = foundItem.description;
		userInput[0].value = userJSON;
		passwordInput[0].value = passwordJSON;

		// Devolver un objeto con las variables
		// return { id, user, password, type, description };
	}

	selectLogin.addEventListener("change", function(){
		loadLoginData(selectLogin.value)
		if (selectLogin.value == '99') {
			classicLogin(true);
		} else {
			classicLogin(false);
		}
	});
	
    // Leer el archivo JSON con fetch
	fetch('./../../../../../sources/data/access.json')
    .then(response => {
        if (!response.ok) {
			document.getElementById("btnFirmarse").style.display = 'none';
			function confirmCallback() {
				location.reload();
			}
			let errorBody = `<span style="color: var(--guinda)">No se ha encontrado el fichero <b>controlescolar.uaemex.mx\\sources\\data\\access.json</b>.</span>
			<br><br>
			Para poder ingresar a esta versión del sistema necesita este arichvo, 
			puede descargarlo desde <a href="https://drive.google.com/file/d/1D0pklCj0LfELi5x6ZqZWsumozvau5N5k" target="_blank">aqui</a>.
			<br><br>
			Por seguridad, el archivo se encuentra protegido con contraseña, para solicitarla <a href=mailto:amberage.exe@gmail.com>pongasé en contacto con el desarrollador</a>.

			 `
			Swal.fire({
				title: '¡Error: Fichero Faltante!',
				html: errorBody,
				icon: 'error',
				confirmButtonColor: "#1A5C50",
				confirmButtonText: "Ya tengo el archivo, recargar sitio.",
				backdrop: false,
				preConfirm: () => {
					if (confirmCallback && typeof confirmCallback === "function") {
						confirmCallback()
					}
					return true; // Retorna true explícitamente
				},
			});
            throw new Error(`Error al cargar el archivo JSON: ${response.statusText}`);
        }
        return response.json(); // Parsear la respuesta como JSON
    })
    .then(data => {
		document.getElementById("btnFirmarse").style.display = 'block';
        jsonData = data; // Asignar los datos cargados a la variable global
        // Filtrar las cuentas con type "all" o "alumno"
        const filteredData = jsonData.filter(item => item.type === "profesor");

        // Iterar sobre los datos filtrados y llenar el <select>
        filteredData.forEach(item => {
            const option = document.createElement('option');
            option.value = item.idCuenta; // Asignar el idCuenta como valor
            option.textContent = item.description; // Asignar la descripción como texto
            selectLogin.appendChild(option); // Agregar la opción al <select>
        });
    })
    .catch(error => {
        	Swal.fire({
				title: 'Error: No se pudó procesar el JSON',
				text: 'Ocurrió un error al procesar el JSON, el fichero se encontro pero no se pudo procesar. <br><br> Favor de informar al desarrollador.',
				icon: 'error',
				backdrop: false // Desactiva el fondo difuminado
			});
		document.getElementById("btnFirmarse").style.display = 'none';
		console.error('Error al procesar el JSON:', error);
    });
});

</script>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr><td align="center">
	<table cellpadding="0" border="0" align="center" cellspacing="0">
	<form name="form1" method="post" action="../txs/processLogin.jsp">

		<tr>
			<td class="" align="center">
				
			</td>
		</tr>
		<tr>
			<td class="camila_table_text">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="sicde_label_title_body_1" align="center">
				Bienvenido al Portal de Profesores
			</td>
		</tr>			
		<tr>
			<td class="camila_table_text">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<div class="bypassLogin">
					<span style="margin-right: 10px;">Acceder como: </span>
					<select name="bypassLogin" id="bypassLogin">
					</select>
				</div>

				<table id="loginForm" style="display: none;" cellpadding="4" border="0" align="center" cellspacing="1" bgcolor="#999999">
					<tr class="camila_table_row_title">
					<!-- 
						<td class="camila_form_title_label">Campo</td>
						<td class="camila_form_title_text">Valor</td>
					 -->
						<td class="camila_form_title_label"><br></td>
						<td class="camila_form_title_text"></td>
					</tr>
			
					<tr>
						<td height="25" class="camila_form_label">Usuario*</td>
						<td class="camila_form_text">
							<input name="usuario" type="text" size="60" class="camila_form_inputText" maxlength="255" value="*********">
						</td>
					</tr>
			
					<tr> 
						<td height="25" class="camila_form_label">Contraseña*</td>
						<td class="camila_form_text">
							<input name="password" type="text" size="60" class="camila_form_inputText" maxlength="255" value="*********UAEM">
						</td>
					</tr>

					<tr>
						<td height="25" class="camila_form_label">Dirección IP</td>
						<td class="camila_form_text">
							<input type="text" name="ipUsuario" size="60" class="camila_form_inputText" value="0.0.0.0">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="white">
				<table border="0" width="100%" height="100%">
					<tr width="100%" height="100%">
						<td align="left">
							<a class="camila_table_text" style="font-size: 0.7rem;" href="javascript:forgetPassword();">Olvidé mi contraseña</a>
						</td>
						<td align="right">
							<!-- 
							<input name="submit1" type="submit" value="Firmarse"
								class="camila_form_button" maxlength="255">							
							 -->
							<input id="btnFirmarse" name="btnFirmarse" type="button" value="Ingresar" style="font-size: 0.7rem;" class="camila_form_button"  onclick="firmarse()" />
								
						</td>
					</tr>
				</table>
			</td>
		</tr> 
<tr>
			<td>

	
	<table cellpadding="0" border="0" align="center" cellspacing="0">
		<tr height="30">
			<td></td>
		</tr>
		<tr height="30">
			<td align="left" width="50%"><font class="camila_table_text" style="font-weight: bold; color: var(--guinda);">Joyride Tools | By: Remk0r3</font></td>
			<td align="right" width="50%">&nbsp;</td>
		</tr>		
		<tr>
			<td colspan="2">

				<table cellpadding="4" border="0" align="center" cellspacing="1" width="400">
				    <tr class="camila_table_row_title">
				    	<td colspan="4">
					    	<B>
				    		<font class="sicde_form_title_text">
				    			&nbsp;&nbsp;
				    		</font>
				    		</B>
				    	</td>
				    </tr>
				    <tr>
				    <td>
				    </td>
				    </tr>
					<tr>
						<td><font class="sicde_label_title_body_1">
								<center>
									<a href="https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/" class="titulo">Portal de Alumnos</a><br>
								</center>
							</font>			    
						</td>
				    </tr>
					<tr>
						<td><font class="sicde_label_title_body_1">
								<center>
									<a href="https://controlescolar.uaemex.mx/dce/sicde/" class="titulo">Portal de Control Escolar</a><br>
								</center>
							</font>			    
						</td>
				    </tr>
			
				</table>
			</td>
		</tr>
	</table>					
			</td>
		</tr>
		<tr>
		</tr>		
	</form>
	</table>
</td></tr></table>
<br>
</table>
<h5 class="sicde_label_title_body_1" align="center">Joyride Tools es una versión modificada del Sistema de Control Escolar de la UAEMéx</h5>
<h5 class="sicde_label_title_body_1" align="center">que recopila exploits, deshabilita validaciones y muestra opciones ocultas en el sistema.</h5>
<br/>
<div style="display: flex; justify-content: center; cursor: pointer;">
	<img src="./../../../../../sources/assets/github.png" alt="Repositorio de GitHub" style="height: 20px; cursor: pointer; margin-right: 10px;" onclick="window.open('repo', '_blank');" />
	<h5 class="sicde_label_title_body_1" align="center" style="color: blue !important;" onclick="window.open('https://github.com/Amberage/tesisUAEMex', '_blank');">Este proyecto fue desarrollado con fines académicos, puede consultar el repositorio en GitHub de este proyecto aquí.</h5>
</div>
</table>	
</body>
</html>