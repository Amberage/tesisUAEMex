# Tampermonkey
[Tampermonkey es una extensión gratuita para el navegador](https://www.tampermonkey.net/) y el gestor más popular de userscript para los navegadores basados en Blink y WebKit como Chrome, Microsoft Edge, Safari, Opera Next, y Firefox.

Aunque algunos de los navegadores con los que funciona tienen su propio soporte nativo de userscript, Tampermonkey le resultará mucho más cómodo a la hora de gestionar sus userscripts. Ofrece funciones como la fácil instalación de scripts, la comprobación automática de actualizaciones, un resumen sencillo – en una pestaña – de que los scripts se ejecutan, un editor integrado y hay una buena probabilidad de que los scripts incompatibles se ejecuten bien con Tampermonkey.

## Scripts
* [Uncover](/Tampermonkey/unhide.js)  
    Este script busca todos los elementos de tipo `input` cuyo `value` sea `hidden` dentro de HTML y los cambia a `text` de tal manera que los vuelve visibles.


## Instrucciones de Instalación
[Mediante su sitio web](https://www.tampermonkey.net/) podemos acceder a la instalación de la extensión adecuada para nuestro navegador.

> [!IMPORTANT]
> Por seguridad, es necesario activar manualmente el modo desarrollador de la extensión desde las opciones de la misma extensión.

## Instrucciones de Uso

Cuando se accede a la extensión es posible genera una plantilla similar a esta:
```javascript
// ==UserScript==
// @name         Nombre del script
// @namespace    http://tampermonkey.net/
// @version      1990-1-1
// @description  Descripción del script
// @author       Nombre del autor
// @match        https://dirección.sitio.web/*
// @icon         https://www.dirección.del.icono/seGeneraAutomaticamente
// @grant        none
// @run-at       document-end
// ==/UserScript==

(function () {
    function cuerpoScript() {
        
    }

    cuerpoScript();
  })();

```
Al inicio del script existen parámetros de configuración para el script, se recomienda [leer la documentación](https://www.tampermonkey.net/documentation.php) para diseñar los scripts según la necesidad del mismo.
