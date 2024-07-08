<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="../../../../css/camila_I.css" />
    <link rel="stylesheet" type="text/css" href="../../../../sicde/css/sicde_I.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../../../libraries/sweetalert2.min.js"></script>
    <script src="./adminTools.js"></script>

    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

      @keyframes scale {
        0%,
        100% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.1);
        }
      }

      @keyframes showSlow {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }

      @keyframes hideSlow {
        from {
          opacity: 1;
        }
        to {
          opacity: 0;
        }
      }

      :root {
        --verde: #2b5031;
        --dorado: #978011;
        --guinda: #9D2348;
      }

      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif !important;
      }

      .adminTools {
        background-color: #ffffff;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='111' height='111' viewBox='0 0 100 100'%3E%3Cg stroke='%23CCC' stroke-width='0' %3E%3Crect fill='%23F5F5F5' x='-60' y='-60' width='94' height='240'/%3E%3C/g%3E%3C/svg%3E");
        padding: 1rem;
      }

      table {
        width: 50%;
      }

      td.param {
        text-align: right;
        font-weight: bold;
      }

      .centerTable {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .dataAlumno {
        width: 80%;
        border-collapse: collapse;
        margin: 20px 0;
        font-family: Arial, sans-serif;
      }
      .dataAlumno th,
      .dataAlumno td {
        border: 1px solid #000;
        padding: 0px;
        text-align: center;
      }
      .dataAlumno th {
        background-color: #f2f2f2; /* Color de fondo para el encabezado */
        font-weight: bold;
        padding: 0px;
      }

      .dataAlumno tr:nth-child(even) {
        background-color: #f9f9f9; /* Color de fondo para filas pares */
      }

      .footer {
        position: fixed;
        bottom: 10px; /* Ajusta esta distancia según sea necesario */
        right: 10px; /* Ajusta esta distancia según sea necesario */
        cursor: pointer;
        font-size: small;
        font-style: italic;
      }

      .buttonGrid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 1em;
        justify-items: center;
        max-width: 600px;
        justify-content: center;
        margin: 0 auto;
        margin-top: 1em;
      }

      .buttonGrid button {
        cursor: pointer;
        width: 150px;
        border-radius: 1em;
        background-color: var(--verde);
        color: white;

        &:hover {
          animation: scale 2s;
          background-color: var(--dorado);
        }
      }

      .security {
        background-color: var(--guinda) !important;

        &:hover {
          background-color: var(--dorado) !important;
        }
      }

    </style>
  </head>

  <body class="adminTools" style="animation: showSlow 3s;">
    <div style="display: flex; flex-direction: column; align-items: center">
      <h1 style="color: var(--guinda);">Modificar Alumnos</h1>
      <h3 style="margin-top: .5rem">Busqueda de Alumnos</h3>
    </div>

    <form>
      <div class="masterSearch" style="display: flex; flex-direction: column">
        <div class="centerTable">
          <table>
            <!-- Busqueda 1 -->
            <tr>
              <td class="param"><label for="textFilter">NOMBRE: </label></td>
              <td><input style="width: 95%; padding-left: 10px; margin-left: 10px" name="textFilter" type="text" id="searchInput" placeholder="Buscar por matrícula o nombre" /></td>
            </tr>

            <!-- Busqueda 2 -->
            <tr>
              <td class="param"><label for="career">CARRERA: </label></td>
              <td>
                <select name="career" id="career" style="width: 95%; padding-left: 10px; margin-left: 10px">
                  <option value="">TODAS</option>
                  <option value="CIRUJANO DENTISTA - F3">CIRUJANO DENTISTA - F3</option>
                  <option value="FISICO - F3">FISICO - F3</option>
                  <option value="INGENIERO AGRONOMO EN PRODUCCION - F3">INGENIERO AGRONOMO EN PRODUCCION - F3</option>
                  <option value="INGENIERO AGRONOMO ZOOTECNISTA - F3">INGENIERO AGRONOMO ZOOTECNISTA - F3</option>
                  <option value="INGENIERO EN SISTEMAS ENERGETICOS SUSTENTABLES - F3">INGENIERO EN SISTEMAS ENERGETICOS SUSTENTABLES - F3</option>
                  <option value="INGENIERO EN SISTEMAS INTELIGENTES - F3">INGENIERO EN SISTEMAS INTELIGENTES - F3</option>
                  <option value="INGENIERO EN TRANSPORTE - F3">INGENIERO EN TRANSPORTE - F3</option>
                  <option value="LICENCIADO DE INGENIERO EN PLASTICOS - F16">LICENCIADO DE INGENIERO EN PLASTICOS - F16</option>
                  <option value="LICENCIADO DE INGENIERO EN PRODUCCION INDUSTRIAL - F16">LICENCIADO DE INGENIERO EN PRODUCCION INDUSTRIAL - F16</option>
                  <option value="LICENCIADO DE INGENIERO EN SOFTWARE - F16">LICENCIADO DE INGENIERO EN SOFTWARE - F16</option>
                  <option value="LICENCIADO EN ACTUARIA - F3">LICENCIADO EN ACTUARIA - F3</option>
                  <option value="LICENCIADO EN ADMINISTRACION - F18 -">LICENCIADO EN ADMINISTRACION - F18 -</option>
                  <option value="LICENCIADO EN ARTE DIGITAL - F3">LICENCIADO EN ARTE DIGITAL - F3</option>
                  <option value="LICENCIADO EN ARTES PLASTICAS - F3">LICENCIADO EN ARTES PLASTICAS - F3</option>
                  <option value="LICENCIADO EN BIOINGENIERIA MEDICA - F3">LICENCIADO EN BIOINGENIERIA MEDICA - F3</option>
                  <option value="LICENCIADO EN BIOTECNOLOGIA - F3">LICENCIADO EN BIOTECNOLOGIA - F3</option>
                  <option value="LICENCIADO EN CIENCIAS POLITICAS Y ADMINISTRACION PUBLICA - F19">LICENCIADO EN CIENCIAS POLITICAS Y ADMINISTRACION PUBLICA - F19</option>
                  <option value="LICENCIADO EN COMERCIO INTERNACIONAL - F3">LICENCIADO EN COMERCIO INTERNACIONAL - F3</option>
                  <option value="LICENCIADO EN CULTURA FISICA Y DEPORTE - F3">LICENCIADO EN CULTURA FISICA Y DEPORTE - F3</option>
                  <option value="LICENCIADO EN DERECHO INTERNACIONAL - F3">LICENCIADO EN DERECHO INTERNACIONAL - F3</option>
                  <option value="LICENCIADO EN ECONOMIA - F3">LICENCIADO EN ECONOMIA - F3</option>
                  <option value="LICENCIADO EN EDUCACION - F3">LICENCIADO EN EDUCACION - F3</option>
                  <option value="LICENCIADO EN EDUCACION PARA LA SALUD - F3">LICENCIADO EN EDUCACION PARA LA SALUD - F3</option>
                  <option value="LICENCIADO EN ENSEÑANZA DEL INGLES - F3">LICENCIADO EN ENSEÑANZA DEL INGLES - F3</option>
                  <option value="LICENCIADO EN LENGUAS - F3">LICENCIADO EN LENGUAS - F3</option>
                  <option value="LICENCIADO EN LOGISTICA - F3">LICENCIADO EN LOGISTICA - F3</option>
                  <option value="LICENCIADO EN NEGOCIOS INTERNACIONALES - F3">LICENCIADO EN NEGOCIOS INTERNACIONALES - F3</option>
                  <option value="LICENCIADO EN NEGOCIOS INTERNACIONALES, BILINGÑE - F3">LICENCIADO EN NEGOCIOS INTERNACIONALES, BILINGÑE - F3</option>
                  <option value="LICENCIADO EN RELACIONES ECONOMICAS INTERNACIONALES - F3">LICENCIADO EN RELACIONES ECONOMICAS INTERNACIONALES - F3</option>
                  <option value="LICENCIATURA DE INGENIERIA EN COMPUTACION - F19">LICENCIATURA DE INGENIERIA EN COMPUTACION - F19</option>
                  <option value="LICENCIATURA DE INGENIERIA EN ELECTRONICA - F19">LICENCIATURA DE INGENIERIA EN ELECTRONICA - F19</option>
                  <option value="LICENCIATURA DE INGENIERIA MECANICA - F19">LICENCIATURA DE INGENIERIA MECANICA - F19</option>
                  <option value="LICENCIATURA DE INGENIERO AGRONOMO EN FLORICULTURA - F15">LICENCIATURA DE INGENIERO AGRONOMO EN FLORICULTURA - F15</option>
                  <option value="LICENCIATURA DE INGENIERO AGRONOMO FITOTECNISTA - F15">LICENCIATURA DE INGENIERO AGRONOMO FITOTECNISTA - F15</option>
                  <option value="LICENCIATURA DE INGENIERO AGRONOMO INDUSTRIAL - F15">LICENCIATURA DE INGENIERO AGRONOMO INDUSTRIAL - F15</option>
                  <option value="LICENCIATURA EN ADMINISTRACION - F18">LICENCIATURA EN ADMINISTRACION - F18</option>
                  <option value="LICENCIATURA EN ADMINISTRACION Y PROMOCION DE LA OBRA URBANA - F15">LICENCIATURA EN ADMINISTRACION Y PROMOCION DE LA OBRA URBANA - F15</option>
                  <option value="LICENCIATURA EN ARQUEOLOGIA - F16">LICENCIATURA EN ARQUEOLOGIA - F16</option>
                  <option value="LICENCIATURA EN ARTES TEATRALES-F15">LICENCIATURA EN ARTES TEATRALES-F15</option>
                  <option value="LICENCIATURA EN BIOLOGIA - F19">LICENCIATURA EN BIOLOGIA - F19</option>
                  <option value="LICENCIATURA EN CIENCIAS AMBIENTALES - F16">LICENCIATURA EN CIENCIAS AMBIENTALES - F16</option>
                  <option value="LICENCIATURA EN CIENCIAS DE LA INFORMACION DOCUMENTAL - F15">LICENCIATURA EN CIENCIAS DE LA INFORMACION DOCUMENTAL - F15</option>
                  <option value="LICENCIATURA EN COMUNICACION - F19">LICENCIATURA EN COMUNICACION - F19</option>
                  <option value="LICENCIATURA EN CONTADURIA - F18">LICENCIATURA EN CONTADURIA - F18</option>
                  <option value="LICENCIATURA EN DANZA - F17">LICENCIATURA EN DANZA - F17</option>
                  <option value="LICENCIATURA EN DERECHO - F15">LICENCIATURA EN DERECHO - F15</option>
                  <option value="LICENCIATURA EN DISEÑO INDUSTRIAL - F15">LICENCIATURA EN DISEÑO INDUSTRIAL - F15</option>
                  <option value="LICENCIATURA EN ENFERMERIA - F15">LICENCIATURA EN ENFERMERIA - F15</option>
                  <option value="LICENCIATURA EN ESTUDIOS CINEMATOGRAFICOS - F3">LICENCIATURA EN ESTUDIOS CINEMATOGRAFICOS - F3</option>
                  <option value="LICENCIATURA EN FILOSOFIA - F15">LICENCIATURA EN FILOSOFIA - F15</option>
                  <option value="LICENCIATURA EN GASTRONOMIA - F16">LICENCIATURA EN GASTRONOMIA - F16</option>
                  <option value="LICENCIATURA EN GEOGRAFIA - F17">LICENCIATURA EN GEOGRAFIA - F17</option>
                  <option value="LICENCIATURA EN GEOINFORMATICA - F18">LICENCIATURA EN GEOINFORMATICA - F18</option>
                  <option value="LICENCIATURA EN GEOLOGIA AMBIENTAL Y RECURSOS HIDRICOS - F19">LICENCIATURA EN GEOLOGIA AMBIENTAL Y RECURSOS HIDRICOS - F19</option>
                  <option value="LICENCIATURA EN GERONTOLOGIA - F16">LICENCIATURA EN GERONTOLOGIA - F16</option>
                  <option value="LICENCIATURA EN GESTION DE LA INFORMACION EN REDES SOCIALES - F17">LICENCIATURA EN GESTION DE LA INFORMACION EN REDES SOCIALES - F17</option>
                  <option value="LICENCIATURA EN HISTORIA - F15">LICENCIATURA EN HISTORIA - F15</option>
                  <option value="LICENCIATURA EN INFORMATICA ADMINISTRATIVA - F18">LICENCIATURA EN INFORMATICA ADMINISTRATIVA - F18</option>
                  <option value="LICENCIATURA EN INGENIERIA PETROQUIMICA - F15">LICENCIATURA EN INGENIERIA PETROQUIMICA - F15</option>
                  <option value="LICENCIATURA EN INGENIERIA QUIMICA - F15">LICENCIATURA EN INGENIERIA QUIMICA - F15</option>
                  <option value="LICENCIATURA EN LENGUA Y LITERATURA HISPANICAS - F15">LICENCIATURA EN LENGUA Y LITERATURA HISPANICAS - F15</option>
                  <option value="LICENCIATURA EN MEDICINA VETERINARIA Y ZOOTECNIA - F15">LICENCIATURA EN MEDICINA VETERINARIA Y ZOOTECNIA - F15</option>
                  <option value="LICENCIATURA EN MEDIOS ALTERNOS DE SOLUCION DE CONFLICTOS MIXTA - F17">LICENCIATURA EN MEDIOS ALTERNOS DE SOLUCION DE CONFLICTOS MIXTA - F17</option>
                  <option value="LICENCIATURA EN MERCADOTECNIA - F18">LICENCIATURA EN MERCADOTECNIA - F18</option>
                  <option value="LICENCIATURA EN MUSICA - F3">LICENCIATURA EN MUSICA - F3</option>
                  <option value="LICENCIATURA EN NUTRICION - F16">LICENCIATURA EN NUTRICION - F16</option>
                  <option value="LICENCIATURA EN PLANEACION TERRITORIAL - F16">LICENCIATURA EN PLANEACION TERRITORIAL - F16</option>
                  <option value="LICENCIATURA EN QUIMICA - F15">LICENCIATURA EN QUIMICA - F15</option>
                  <option value="LICENCIATURA EN QUIMICA EN ALIMENTOS - F15">LICENCIATURA EN QUIMICA EN ALIMENTOS - F15</option>
                  <option value="LICENCIATURA EN QUIMICA FARMACEUTICA BIOLOGICA - F15">LICENCIATURA EN QUIMICA FARMACEUTICA BIOLOGICA - F15</option>
                  <option value="LICENCIATURA EN SEGURIDAD CIUDADANA - F16">LICENCIATURA EN SEGURIDAD CIUDADANA - F16</option>
                  <option value="LICENCIATURA EN SOCIOLOGIA - F19">LICENCIATURA EN SOCIOLOGIA - F19</option>
                  <option value="LICENCIATURA EN TRABAJO SOCIAL - F19">LICENCIATURA EN TRABAJO SOCIAL - F19</option>
                  <option value="LICENCIATURA EN TURISMO - F15">LICENCIATURA EN TURISMO - F15</option>
                  <option value="MATEMATICO - F3">MATEMATICO - F3</option>
                  <option value="TECNICO SUPERIOR UNIVERSITARIO EN ARBORICULTURA - F3">TECNICO SUPERIOR UNIVERSITARIO EN ARBORICULTURA - F3</option>
                  <option value="TECNICO SUPERIOR UNIVERSITARIO EN PROTESIS BUCODENTAL - F16">TECNICO SUPERIOR UNIVERSITARIO EN PROTESIS BUCODENTAL - F16</option>
                </select>
              </td>
            </tr>

            <!-- Busqueda 3 -->
            <tr>
              <td class="param"><label for="campus">PLANTEL: </label></td>
              <td>
                <select name="campus" id="campus" style="width: 95%; padding-left: 10px; margin-left: 10px">
                  <option value="">TODAS</option>
                  <option value="000 UNIVERSIDAD AUTONOMA DEL ESTADO DE MEXICO">000 UNIVERSIDAD AUTONOMA DEL ESTADO DE MEXICO</option>
                  <option value="O91 UNIVERSIDAD DE IXTLAHUACA CUI, A.C.">O91 UNIVERSIDAD DE IXTLAHUACA CUI, A.C.</option>
                  <option value="201 FACULTAD DE ODONTOLOGIA">201 FACULTAD DE ODONTOLOGIA</option>
                  <option value="202 FACULTAD DE MEDICINA">202 FACULTAD DE MEDICINA</option>
                  <option value="203 FACULTAD DE ENFERMERIA Y OBSTETRICIA">203 FACULTAD DE ENFERMERIA Y OBSTETRICIA</option>
                  <option value="204 FACULTAD DE QUIMICA">204 FACULTAD DE QUIMICA</option>
                  <option value="205 FACULTAD DE INGENIERIA">205 FACULTAD DE INGENIERIA</option>
                  <option value="206 FACULTAD DE ARQUITECTURA Y DISEÑO">206 FACULTAD DE ARQUITECTURA Y DISEÑO</option>
                  <option value="207 FACULTAD DE DERECHO">207 FACULTAD DE DERECHO</option>
                  <option value="208 FACULTAD DE CONTADURIA Y ADMINISTRACION">208 FACULTAD DE CONTADURIA Y ADMINISTRACION</option>
                  <option value="209 FACULTAD DE HUMANIDADES">209 FACULTAD DE HUMANIDADES</option>
                  <option value="210 FACULTAD DE CIENCIAS POLITICAS Y SOCIALES">210 FACULTAD DE CIENCIAS POLITICAS Y SOCIALES</option>
                  <option value="211 FACULTAD DE ECONOMIA">211 FACULTAD DE ECONOMIA</option>
                  <option value="212 FACULTAD DE GEOGRAFIA">212 FACULTAD DE GEOGRAFIA</option>
                  <option value="213 FACULTAD DE CIENCIAS AGRICOLAS">213 FACULTAD DE CIENCIAS AGRICOLAS</option>
                  <option value="214 FACULTAD DE MEDICINA VETERINARIA Y ZOOTECNIA">214 FACULTAD DE MEDICINA VETERINARIA Y ZOOTECNIA</option>
                  <option value="215 FACULTAD DE CIENCIAS DE LA CONDUCTA">215 FACULTAD DE CIENCIAS DE LA CONDUCTA</option>
                  <option value="216 FACULTAD DE TURISMO Y GASTRONOMIA">216 FACULTAD DE TURISMO Y GASTRONOMIA</option>
                  <option value="218 FACULTAD DE PLANEACION URBANA Y REGIONAL">218 FACULTAD DE PLANEACION URBANA Y REGIONAL</option>
                  <option value="219 CENTRO UNIVERSITARIO UAEM ATLACOMULCO">219 CENTRO UNIVERSITARIO UAEM ATLACOMULCO</option>
                  <option value="220 CENTRO UNIVERSITARIO UAEM AMECAMECA">220 CENTRO UNIVERSITARIO UAEM AMECAMECA</option>
                  <option value="221 FACULTAD DE CIENCIAS">221 FACULTAD DE CIENCIAS</option>
                  <option value="222 CENTRO UNIVERSITARIO UAEM ZUMPANGO">222 CENTRO UNIVERSITARIO UAEM ZUMPANGO</option>
                  <option value="223 FACULTAD DE LENGUAS">223 FACULTAD DE LENGUAS</option>
                  <option value="224 CENTRO UNIVERSITARIO UAEM TEXCOCO">224 CENTRO UNIVERSITARIO UAEM TEXCOCO</option>
                  <option value="225 CENTRO UNIVERSITARIO UAEM VALLE DE MEXICO">225 CENTRO UNIVERSITARIO UAEM VALLE DE MEXICO</option>
                  <option value="226 FACULTAD DE ARTES">226 FACULTAD DE ARTES</option>
                  <option value="227 CENTRO UNIVERSITARIO UAEM ECATEPEC">227 CENTRO UNIVERSITARIO UAEM ECATEPEC</option>
                  <option value="228 CENTRO UNIVERSITARIO UAEM VALLE DE CHALCO">228 CENTRO UNIVERSITARIO UAEM VALLE DE CHALCO</option>
                  <option value="229 CENTRO UNIVERSITARIO UAEM TEMASCALTEPEC">229 CENTRO UNIVERSITARIO UAEM TEMASCALTEPEC</option>
                  <option value="230 CENTRO UNIVERSITARIO UAEM VALLE DE TEOTIHUACAN">230 CENTRO UNIVERSITARIO UAEM VALLE DE TEOTIHUACAN</option>
                  <option value="231 CENTRO UNIVERSITARIO UAEM TENANCINGO">231 CENTRO UNIVERSITARIO UAEM TENANCINGO</option>
                  <option value="232 CENTRO UNIVERSITARIO UAEM NEZAHUALCOYOTL">232 CENTRO UNIVERSITARIO UAEM NEZAHUALCOYOTL</option>
                  <option value="233 UNIDAD ACADEMICA PROFESIONAL TIANGUISTENCO">233 UNIDAD ACADEMICA PROFESIONAL TIANGUISTENCO</option>
                  <option value="234 UNIDAD ACADEMICA PROFESIONAL CHIMALHUACAN">234 UNIDAD ACADEMICA PROFESIONAL CHIMALHUACAN</option>
                  <option value="235 UNIDAD ACADEMICA PROFESIONAL CUAUTITLAN IZCALLI">235 UNIDAD ACADEMICA PROFESIONAL CUAUTITLAN IZCALLI</option>
                  <option value="236 UNIDAD ACADEMICA PROFESIONAL HUEHUETOCA">236 UNIDAD ACADEMICA PROFESIONAL HUEHUETOCA</option>
                  <option value="237 UNIDAD ACADEMICA PROFESIONAL ACOLMAN">237 UNIDAD ACADEMICA PROFESIONAL ACOLMAN</option>
                  <option value="238 ESCUELA DE ARTES ESCENICAS">238 ESCUELA DE ARTES ESCENICAS</option>
                  <option value="239 UNIDAD ACADEMICA PROFESIONAL TEJUPILCO">239 UNIDAD ACADEMICA PROFESIONAL TEJUPILCO</option>
                </select>
              </td>
            </tr>
          </table>
        </div>

        <div style="text-align: center; margin: 1em">
          <h3>Resultados</h3>
          <select name="students" id="students" style="width: 350px">
            <option value="">Seleccione un alumno</option>
          </select>
        </div>
      </div>
    </form>

    <!-- Datos del alumno -->
    <div style="padding: 1em; text-align: center">
      <div class="centerTable">
        <table class="dataAlumno">
          <tr>
            <td style="width: 120px; text-align: right; font-weight: bold; padding-right: 0.5em;">Matrícula</td>
            <td style="text-align: left; padding-left: 0.5em;" id="html_matricula">SELECCIONE ALUMNO</td>
          </tr>
          <tr>
            <td style="width: 120px; text-align: right; font-weight: bold; padding-right: 0.5em;">Nombre</td>
            <td style="text-align: left; padding-left: 0.5em;" id="html_nombre">SELECCIONE ALUMNO</td>
          </tr>
          <tr>
            <td style="width: 120px; text-align: right; font-weight: bold; padding-right: 0.5em;">idAlumno</td>
            <td style="text-align: left; padding-left: 0.5em;" id="html_idAlumno">SELECCIONE ALUMNO</td>
          </tr>
          <tr>
            <td style="width: 120px; text-align: right; font-weight: bold; padding-right: 0.5em;">idPersona</td>
            <td style="text-align: left; padding-left: 0.5em;" id="html_idPersona">SELECCIONE ALUMNO</td>
          </tr>
          <tr>
            <td style="width: 120px; text-align: right; font-weight: bold; padding-right: 0.5em;">Plantel</td>
            <td style="text-align: left; padding-left: 0.5em;" id="html_plantel">SELECCIONE ALUMNO</td>
          </tr>
          <tr>
            <td style="width: 120px; text-align: right; font-weight: bold; padding-right: 0.5em;">Licenciatura</td>
            <td style="text-align: left; padding-left: 0.5em;" id="html_licenciatura">SELECCIONE ALUMNO</td>
          </tr>
        </table>
      </div>
    </div>

    <!-- Acciones -->
    <div style="margin-top: -1em; text-align: center; display: none" id="actions">
      <h3 style="color: var(--verde)">Acciones</h3>
      <div class="buttonGrid">
        <button class="btnOption" type="button" onclick="optionSelector(1)">Trayectoria Académica</button>
        <button class="btnOption" type="button" onclick="optionSelector(2)">Historial de Calificaciones</button>
        <button class="btnOption" type="button" onclick="optionSelector(3)">Indicadores Académicos</button>
        <button class="btnOption" type="button" onclick="optionSelector(4)">Gráfica de Desempeño</button>
        <button class="btnOption" type="button" onclick="optionSelector(5)">Datos Personales</button>
        <button class="btnOption" type="button" onclick="optionSelector(6)">Domicilio</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Modificar Datos Personales</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Modificar Domicilio</button>
        <button class="btnOption" type="button" onclick="optionSelector(7)">Cambiar Contraseña</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Cambiar Correo Personal</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Cambiar Correo Institucional</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Modificar Plan Estudios</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Modificar Trayectoria Académica</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Modificar Servicio Social</button>
        <button class="btnOption security" type="button" onclick="optionSelector(999)">Modificar Prácticas Profesionales</button>
      </div>
    </div>

    <div class="footer" onclick="dataDebugger()">Desarrollado con fines académicos para un proyecto de tesis.</div>
  </body>
</html>
