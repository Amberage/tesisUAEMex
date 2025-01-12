// ==UserScript==
// @name         SDCE: Revelar todos los campos ocultos
// @namespace    http://tampermonkey.net/
// @version      2024-12-12
// @description  try to take over the world!
// @author       You
// @match        https://controlescolar.uaemex.mx/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=adquiramexico.com.mx
// @grant        none
// @run-at       document-end
// ==/UserScript==

(function () {
    // Función para mostrar todos los elementos ocultos
    function showHiddenElements() {
        // Seleccionar todos los inputs con type="hidden"
        const hiddenInputs = document.querySelectorAll('input[type="hidden"]');
  
        // Cambiar el atributo type de "hidden" a "text" para que sean visibles
        hiddenInputs.forEach((input) => {
            input.setAttribute("type", "text");
            input.setAttribute("style", "color: blue");
            console.log(`Input cambiado:`, input);
        });
  
        console.log(`Se hicieron visibles ${hiddenInputs.length} inputs ocultos.`);
    }
  
    // Ejecutar la función
    showHiddenElements();
  })();