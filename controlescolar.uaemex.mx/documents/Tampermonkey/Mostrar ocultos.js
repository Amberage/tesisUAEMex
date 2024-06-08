// ==UserScript==
// @name         Mostrar campos ocultos
// @namespace    http://tampermonkey.net/
// @version      2024-06-06
// @description  try to take over the world!
// @author       You
// @match        https://controlescolar.uaemex.mx/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=uaemex.mx
// @grant        none
// ==/UserScript==
// Función para mostrar los elementos ocultos
function showHiddenElements() {
  // Obtiene todos los elementos input del documento
  var inputs = document.querySelectorAll('input[type="hidden"]');

  // Recorre todos los elementos encontrados
  inputs.forEach(function (input) {
    input.type = "text";
    input.style.color = "rgb(44, 82, 52)";
    input.style.backgroundColor = "rgba(156, 132, 18, .5)";
    input.style.fontWeight = "600";
    input.style.fontStyle = "italic";
    input.style.border = "2px solid red";
  });
}

// Llamar a la función para mostrar los elementos ocultos
showHiddenElements();