const html_matricula = document.getElementById("html_matricula");
const html_nombre = document.getElementById("html_nombre");
const html_idAlumno = document.getElementById("html_idAlumno");
const html_idPersona = document.getElementById("html_idPersona");
const html_plantel = document.getElementById("html_plantel");
const html_licenciatura = document.getElementById("html_licenciatura");

var matricula = null;
var nombre = null;
var idAlumno = null;
var idPersona = null;
var plantel = null;
var licenciatura = null;
var studentData = null;

function swal2(type, title, body) {
  swal2.fire({
    title: title,
    html: body,
    icon: type,
    confirmButtonColor: "#1A5C50",
    confirmButtonText: "Confirmar",
  });
}

function swal2_withFuncion(type, title, body, confirmCallback) {
  swal2.fire({
    title: title,
    html: body,
    icon: type,
    confirmButtonColor: "#1A5C50",
    confirmButtonText: "Confirmar",
    preConfirm: () => {
      if (confirmCallback && typeof confirmCallback === "function") {
        confirmCallback();
      }
    },
  });
}

function changePassword() {
  var checkStatus = document.getElementById("students").value;

  if (checkStatus === "NULL") {
    swal2.fire("ERROR", "Seleccione un alumno.", "error");
  } else {
    alert("La contraseña ha sido modificada.");
    exec(document.getElementById("button1"));
  }
}

function exec(objeto) {
  if (objeto.id === "button1") {
    document.form1.action = "../txs/update.jsp";
  }
  document.form1.submit();
}

$(document).ready(function () {
  // Obtén referencias a los elementos del DOM
  const html_matricula = document.getElementById("html_matricula");
  const html_nombre = document.getElementById("html_nombre");
  const html_idAlumno = document.getElementById("html_idAlumno");
  const html_idPersona = document.getElementById("html_idPersona");
  const html_plantel = document.getElementById("html_plantel");
  const html_licenciatura = document.getElementById("html_licenciatura");

  // Verifica que todos los elementos fueron encontrados
  if (!html_matricula || !html_nombre || !html_idAlumno || !html_idPersona || !html_plantel || !html_licenciatura) {
    console.error("Uno o más elementos del DOM no fueron encontrados.");
    return;
  }

  // Realiza una petición AJAX para obtener los datos del archivo JSON
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

      /*       // Obtener opciones únicas para la licenciatura y el plantel
      var uniqueCareers = [...new Set(records.map((record) => record.licenciatura))];
      var uniqueCampuses = [...new Set(records.map((record) => record.plantel))];

      // Agregar las opciones a los select de licenciatura y plantel
      var careerSelect = $("#career");
      var campusSelect = $("#campus");
      uniqueCareers.forEach(function (career) {
        var option = $("<option></option>").val(career).text(career);
        careerSelect.append(option);
      });
      uniqueCampuses.forEach(function (campus) {
        var option = $("<option></option>").val(campus).text(campus);
        campusSelect.append(option);
      }); */

      // Inicialmente muestra todos los registros
      populateOptions(records);
    },
    error: function (jqXHR, textStatus, errorThrown) {
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
      html_matricula.innerHTML = selectedRecord.matricula || "";
      html_nombre.innerHTML = selectedRecord.nombre || "";
      html_idAlumno.innerHTML = selectedRecord.idAlumno || "";
      html_idPersona.innerHTML = selectedRecord.idPersona || "";
      html_plantel.innerHTML = selectedRecord.plantel || "";
      html_licenciatura.innerHTML = selectedRecord.licenciatura || "";

      html_matricula.innerHTML = selectedRecord.matricula;
      html_nombre.innerHTML = selectedRecord.nombre;
      html_idAlumno.innerHTML = selectedRecord.idAlumno;
      html_idPersona.innerHTML = selectedRecord.idPersona;
      html_plantel.innerHTML = selectedRecord.plantel;
      html_licenciatura.innerHTML = selectedRecord.licenciatura;

      matricula = selectedRecord.matricula;
      nombre = selectedRecord.nombre;
      idAlumno = selectedRecord.idAlumno;
      idPersona = selectedRecord.idPersona;
      plantel = selectedRecord.plantel;
      licenciatura = selectedRecord.licenciatura;

      let acciones = document.getElementById("actions");

      if (matricula !== "SELECCIONE ALUMNO") {
        acciones.style.display = "block";
      } else {
        acciones.style.display = "none";
      }
    } else {
      console.warn("No se encontró el registro seleccionado."); // Advertencia si no se encuentra el registro
    }
  });
});

function dataDebugger() {
  console.log(studentData);
  console.log(matricula);
  console.log(nombre);
  console.log(idAlumno);
  console.log(idPersona);
  console.log(plantel);
  console.log(licenciatura);
}

function optionSelector(option) {
  function openWindow(url) {
    let left = (screen.width - 600) / 2;
    let top = (screen.height - 400) / 2;

    window.open(url, "_blank", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1375,height=650,left=" + left + ",top=" + top);
  }

  let trayectoriaAcademica = `https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/listas/trayectoriaIdeal.jsp?idModeloCurricularPorAlumno=${idAlumno}`;
  let calificaciones = `https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/listas/calificaciones.jsp?idModeloCurricularPorAlumno=${idAlumno}`;
  let indicadores = `https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/listas/indicadores.jsp?idModeloCurricularPorAlumno=${idAlumno}`;
  let graficaDesempeno = `https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/histograma.jsp?idModeloCurricularPorAlumno=${idAlumno}`;
  let datosPersonales = `https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/detalle.jsp?idPersona=${idPersona}`;
  let domicilio = `https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/domicilio.jsp?idPersona=${idPersona}`;

  switch (option) {
    case 1:
      openWindow(trayectoriaAcademica);
      break;

    case 2:
      openWindow(calificaciones);
      break;

    case 3:
      openWindow(indicadores);
      break;

    case 4:
      openWindow(graficaDesempeno);
      break;

    case 5:
      openWindow(datosPersonales);
      break;

    case 6:
      openWindow(domicilio);
      break;

    case 7:
      changePassword();
      break;

    default:
      shield();
      break;
  }

  function shield() {
    var tokenAuth = prompt("Por seguridad, ingrese el token de autentificación:");

    if (tokenAuth === "tokenAuth2") {
      alert("Función en desarrollo...");
    } else {
      alert("Token inválido.");
    }
  }
}

function test() {
  alert("Evento detectado");
}

function changePassword() {
  Swal.fire({
    title: "Cambiar Contraseña",
    html: `Está intentando cambiar la contraseña de <strong>${nombre}</strong> con número de cuenta <strong>${matricula}</strong>`,
    input: "text",
    icon: "warning",
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
