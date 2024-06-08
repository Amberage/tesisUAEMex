# Recopilación de Vulnerabilidades del SDCE de la UAEMéx
Este repositorio es parte de mi proyecto de tesis para obtener el título de Licenciado en Ingeniería en Computación por la Universidad Autónoma del Estado de México (UAEMéx).

El objetivo de este proyecto es compilar todas las vulnerabilidades encontradas en el sistema de control escolar de la universidad, creando un repositorio que documenta cómo, mediante el uso del panel de depuración del navegador, se pueden realizar modificaciones al sistema de control escolar.

Las modificaciones al sistema incluyen:

* __Bypass para el login de alumnos__: Permite el acceso no autorizado de estudiantes.
* __Desbloqueo de acciones restringidas__: Todas las acciones que estaban restringidas de forma nativa ahora están accesibles.
* __Menú adicional "Admin Tools"__: Añadido a la cinta de opciones original, este menú ofrece herramientas adicionales para administración.

Dentro del menú Admin Tools se encuentran compiladas diversas acciones que vulneran el sistema, así como exploits que permiten modificar la información del sistema.

## Instrucciones de Instalación

1. Descargar el repositorio
2. Ir al sitio del [Sistema de Control Escolar](https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/indexLogin.html)
3. Abrir el Panel de Depuración (F12)
4. Dirigirse a _Sources_ y buscar la opción de _Override_ (Dar clic sobre el botón: >>)
5. Dar clic sobre "Seleccionar Carpeta" o "Select Folder".
6. En el gestor de archivos apuntar hacia la carpeta que contenga 'README.md' y la carpeta 'controlescolar.uaemex.mx'

## Instrucciones de Uso

1. Ir al sitio del [Sistema de Control Escolar](https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/indexLogin.html)
2. Abrir el Panel de Depuración (F12)
3. Mantener el Panel de Depuración abierto y actualizar el sitio.
4. El menu se encontrará activo, para desactivar basta con cerrar el panel de depuración o eliminar la carpeta seleccionada durante la instalación.