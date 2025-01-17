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
  Swal.fire({
    title: title,
    html: body,
    icon: type,
    confirmButtonColor: "#1A5C50",
    confirmButtonText: "Confirmar",
    backdrop: false
  });
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
      function confirmCallback() {
				location.reload();
			}
			let errorBody = `<span style="color: var(--guinda)">No se ha encontrado el fichero <b>\\sources\\data\\students.json</b>.</span>
			<br><br>
			Para usar esta función del sistema necesita este arichvo, 
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
  studentInfo = `<b>Nombre</b>: ${nombre}<br><br>
  <b>Matricula</b>: ${matricula}<br><br>
  <b>idAlumno</b>: ${idAlumno}<br><br>
  <b>idPersona</b>: ${idPersona}<br><br>
  <b>Plantel</b>: ${plantel}<br><br>
  <b>Licenciatura</b>: ${licenciatura}`;
  swal2('info', 'Data Debugger', studentInfo)
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
      swal2('error', 'Error', 'Ocurrió un error en la función de "optionSelection", favor de comunicar al desarrollador.')
      break;
  }
}

