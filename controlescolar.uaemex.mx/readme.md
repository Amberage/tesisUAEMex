# Modificaciones al Sistema de Control Escolar de la UAMEéx

Los navegadores basados en Chromium tienen en sus herramientas de depuración una herramienta llamada _Override_, esta herramienta permite modificar los ficheros que el cliente solicita durante el uso de un sitio web (_HTML, CSS, JavaScript, etc._).

En esta carpeta se incluyen modificaciones realizadas al Sistema de Control Escolar de la Universidad Autónoma del Estado de México con el propósito de cambiar el comportamiento del sistema y realizar acciones que en situaciones normales no serían permitidas por el sistema, las modificaciones realizadas al sistema incluyen:

* [__Alumnos__](https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/)
    * __Bypass para el login de alumnos__: Permite el acceso sin una cuenta de estudiante.
    * __Desbloqueo de acciones restringidas__: Todas las acciones que estaban restringidas de forma nativa ahora están accesibles.
    * __Menú adicional "Joyride Tools"__: Añadido a la cinta de opciones original, este menú ofrece los exploits recopilados que permiten modificar datos del sistema.

        _En el menú de Exploits, se encuentra una pequeña "base de datos" que contiene únicamente información de los alumnos que ingresaron al nivel superior de la Universidad Autónoma del Estado de México en el año 2019. Estos datos son representativos, fueron obtenidos en 2022 y no están vinculados directamente con la base de datos interna del SDCE._

        _Sin embargo, cualquier modificación realizada mediante exploits afectará directamente la base de datos del SDCE. Esto podría generar discrepancias entre la información almacenada en el SDCE y los datos mostrados en la interfaz de exploits._
    
    * __Funciones Desbloqueadas__: Algunas funciones que se encuentran comúnmente desactivadas o son exclusivas de alumnos que cumplen ciertas condiciones fueron habilitadas sin importar cual sea el caso.
    * __Omisión de Validaciones__: Algunos formularios del SDCE usan JavaScript para validar la información que se envía al backend, estas validaciones fueron deshabilitadas.

* [__Profesores__](https://controlescolar.uaemex.mx/dce/sicde/publico/profesores/)
    * __Login de profesores__: Permite el acceso a cuentas de algunos profesores.

## Instrucciones de Instalación

> Es necesario contar con un navegador basado en Chromium para acceder a la función de _Override_.

1. Descargar el repositorio
2. Ir al sitio del [Sistema de Control Escolar](https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/indexLogin.html)
3. Abrir el Panel de Depuración (F12)
4. Dirigirse a _Sources_ y buscar la opción de _Override_ (Dar clic sobre el botón: >>)
5. Dar clic sobre "Seleccionar Carpeta" o "Select Folder".
6. En el gestor de archivos apuntar hacia la carpeta raíz de este repositorio.  
    _(Es la que contiene las carpetas de Tampermonkey, Scripts, controlescolar.uaemex.mx y el README)_

## Instrucciones de Uso

1. Ir al sitio del [Sistema de Control Escolar](https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/indexLogin.html)
2. Abrir el Panel de Depuración (F12)
3. Mantener el Panel de Depuración abierto y actualizar el sitio.
4. El menu se encontrará activo, para desactivar basta con cerrar el panel de depuración o eliminar la carpeta seleccionada durante la instalación.

> [!IMPORTANT]
> [Para una mejor comprensión de esta herramienta __se recomienda encarecidamente__ leer previamente la documentación de las vulnerabilidades y exploits del sistema.](/README.md#documentación-adicional)