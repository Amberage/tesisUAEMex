<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../../../sources/css/changePersonalData.css">
    <link rel="stylesheet" href="../../../../../sources/css/fonts/loadPoppins.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../../../../sources/libraries/sweetalert2.min.js"></script>
</head>

<body class="changePersonalData" style="animation: showSlow 3s;">
    <div style="display: flex; flex-direction: column; align-items: center">
        <h1 style="color: var(--verde);">Modificacion de Datos Personales</h1>
        <h3>BUSQUEDA POR LISTA DE ALUMNOS</h3>
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
                <select name="students" id="students" style="width: 350px">
                    <option value="">Lista de alumnos</option>
                </select>
            </div>
        </div>
    </form>



    <!-- Datos del Alumno -->
    <div class="objectIdSearch">
        <h3 style="margin-top: .5rem">BUSQUEDA POR IDENTIFICADOR DE OBJETO</h3>
        <div style="display: flex;">
            <input type="number" id="idGlobal" placeholder="Ingrese un objectId">
            <button type="button" onclick="objectIdSearch()">Buscar</button>
        </div>
        <div id="injectServerData" class="getServerData"></div>
    </div>
    <div class="footer">NOTA: La función de "Busqueda por Lista" recupera los datos de los alumnos (Nombre, Carrera y Plantel) de un JSON incluido en los ficheros de este proyecto y despues solcita la información más reciente al servidor, por lo que, al modificar el nombre de un alumno, este no se reflejará en la "Busqueda por Lista", pero si en el servidor.</div>
    <script src="./changePersonalData.js"></script>
</body>

</html>