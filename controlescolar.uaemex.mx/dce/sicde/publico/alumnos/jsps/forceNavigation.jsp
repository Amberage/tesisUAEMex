<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../css/camila_I.css" />
    <link rel="stylesheet" type="text/css" href="../../../../sicde/css/sicde_I.css" />
    <script src="../../../../../sources/libraries/sweetalert2.min.js"></script>
</head>
<script>
    /* Función para invocar una ventana con una URL especificada,
    la idea es navegar con una cookie activa de una sesión abierta*/
    document.addEventListener("DOMContentLoaded", function () {
        Swal.fire({
            title: "Forzar Navegación",
            html: `Esta función se usa para generar una ventana con la URL solicitada. Esta función se diseñó para ahorrar tiempo al navegar con una cookie activa y evitar las redirecciones de seguridad, así como para explotar <b>Parameter Tempering</b> e <b>Inyecciones SQL</b>.`,
            input: "text",
            icon: "info",
            inputAttributes: {
                autocapitalize: "off",
                placeholder: "Ingrese una URL.",
                autocomplete: "off",
            },
            showCancelButton: true,
            confirmButtonText: "Forzar Navegación",
            showLoaderOnConfirm: true,
            allowEscapeKey: false,
            allowOutsideClick: false,
            preConfirm: (invokeUrl) => {
                top.body.location.href = invokeUrl;
            },
        });
    });
</script>

<style>
    @keyframes showSlow {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }
</style>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="animation: showSlow 3s">
    <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
        <tr>
            <td width="40%" align="center" class="sicde_label_title_body_1">
                <br /><br />
                <img width="400" height="400" src="../../../../../sources/assets/index_alumnos.gif" />
                <br /><br /><br />
                <p class="sicde_label_title_body_1" align="left"><a href="https://github.com/Amberage/tesisUAEMex"> Repositorio en GitHub</a></p>
                <p class="sicde_label_title_body_1" align="left"><a href="https://www.notion.so/UAEM-x-164abd56f0c0809a9acded7cd86e7a50?pvs=4"> Documentación en Notion</a></p>
            </td>
        </tr>
    </table>
</body>

</html>