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
        <h1 style="color: var(--verde);">Analizador de ObjectId</h1>
    </div>

    <!-- Datos del Alumno -->
    <div class="objectIdSearch">
        <div style="display: flex;">
            <input type="number" id="idGlobal" placeholder="Ingrese un objectId">
            <button type="button" onclick="objectIdSearch()">Buscar ID</button>
        </div>

        <div class="navegacionRapida" style="margin-top: 5px;">
            <h3>Navegación Rápida</h3>
            <div style="display: flex; margin-top: 5px;">
                <input type="number" id="minusId" placeholder="Restar n Id's">
                <button type="button" onclick="objectIdSearch_minus()">Restar ID's</button>
            </div>
            <div style="display: flex; margin-top: 5px;">
                <input type="number" id="addId" placeholder="Sumar n Id's">
                <button type="button" onclick="objectIdSearch_add()">Sumar ID's</button>
            </div>
        </div>
        <div id="injectServerData" style="margin-top: 15px;" class="getServerData"></div>
    </div>
    <script src="./objectAnalyzer.js"></script>
</body>

</html>