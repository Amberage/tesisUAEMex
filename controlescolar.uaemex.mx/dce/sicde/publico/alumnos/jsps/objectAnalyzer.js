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

//region Inyección de Datos
//- Inyección de Datos
//? Constantes
const inputGlobal = document.getElementById("idGlobal");
const injectServerData = document.getElementById("injectServerData");

async function getServerData(idGlobal) {
  const old_endpoint = "https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/detalle.jsp?idPersona=";
  const endpoint = "https://controlescolar.uaemex.mx/dce/sicde/Inscripciones/flexible/jsps/cursosFlexibles.jsp?&idPeriodoDeInscripcion="
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

      //* Inyectar el formualario
      dataForm === false ? (injectServerData.innerHTML = "") : (injectServerData.innerHTML = dataForm);

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
  replace = replace.replace(/field key=/g, 'input class="getServerData" type="text" disabled id='); // Cambiar field por inputs
  replace = replace.replace(/">/g, '" value="'); // Eliminiar los cierres de la primer etiqueta, el valor del key ahora sera el value del input
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

//region Busqueda de Datos
//- Busqueda de Datos: Manual
function objectIdSearch() {
  const globalId = inputGlobal.value;
  getServerData(globalId);
}

//- Busqueda de Datos: Manual
function objectIdSearch_minus() {
    const minusId = document.getElementById('minusId').value === '' ? null : Number(document.getElementById('minusId').value);
    if (minusId === null) {
        swal2('error', 'Error ObjectId', 'Por favor, ingrese un valor para restar al identificador.');
        return false;
    } else {
        const inputId = inputGlobal.value === '' ? 0 : Number(inputGlobal.value);
        const globalId = inputId - minusId;

        if(globalId <= 1) {
        swal2('error', 'Error ObjectId', 'El identificador proporcionado no puede ser menor o igual a 1.');
        return false;
    } else {
        getServerData(globalId);
        inputGlobal.value = globalId;
    }
    }
}

//- Busqueda de Datos: Manual
function objectIdSearch_add() {
    const addId = document.getElementById('addId').value === '' ? null : Number(document.getElementById('addId').value);
    if (addId === null) {
        swal2('error', 'Error ObjectId', 'Por favor, ingrese un valor para sumar al identificador.');
        return false;
    } else {
        const inputId = inputGlobal.value === '' ? 0 : Number(inputGlobal.value);
        const globalId = inputId + addId;

        if(globalId <= 1) {
        swal2('error', 'Error ObjectId', 'El identificador proporcionado no puede ser menor o igual a 1.');
        return false;
    } else {
        getServerData(globalId);
        inputGlobal.value = globalId;
    }
    }
}
