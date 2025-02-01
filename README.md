# Proyecto de Titulación: UAEMéx
Este repositorio incluye todos los archivos y recursos usados y generados durante el desarrollo de mi tesis titulada __Impacto de las Brechas de Seguridad en el Sistema de Control Escolar de la Universidad Autónoma del Estado de México: Un Análisis y Mitigación de Riesgos__.

## Índice

1. [Descripción](#descripción)
2. [Tecnologías Utilizadas](#tecnologías-utilizadas)
3. [Instalación y Uso](#instalación-y-uso)
4. [Documentación Adicional](#documentación-adicional)
5. [Miscelánea](#miscelánea)
6. [Autor](#autor)

## Descripción
En este repositorio se recopilan todos los archivos generados durante el desarrollo del pentesting aplicado al __Sistema de Control Escolar de la Universidad Autónoma del Estado de México__:

<p style="text-align: center;"><a href="https://controlescolar.uaemex.mx/">https://controlescolar.uaemex.mx/</a></p>

Estos archivos incluyen tres carpetas, correspondiente a tres herramientas usadas en el pentesting:

* __controlescolar.uaemex.mx__:

    Mediante las herramientas de desarrollador del navegador se realizó la modificación del cliente web usado por el Sistema de Control Escolar de la UAEMéx, estas modificaciones implementan un menú donde se recopilan los exploits del sistema, también se deshabilitaron el control de validaciones del JavaScript en formularios y se habilitaron todas las funciones que permanecían ocultas en el menu del sistema.

    [Para más información acerca de este proyecto puede leer este _readme_.](/controlescolar.uaemex.mx/readme.md)

* __Tampermonkey__:
    
    _Tampermonkey_ es una extensión de navegador que permite cargar scripts de JavaScripts de manera automática al visitar un sitio web, esta extensión resultó particularmente util porque el SDCE oculta muchos datos interesantes en el código HTML, durante el pentesting esto fue util para analizar el comportamiento del sistema y aplicar ingeniería inversa al sistema.

    [Para más información de esta extensión puede leer este _readme_.](/Tampermonkey/readme.md)

* __Scripts__:

    Con Python se realizaron varios scripts para automatizar la recuperación y análisis de datos mediante la construcción de una base de datos en MySQL usando la técnica de "_Web Scrapping_" combinándola con exploits que permitiesen acceder a datos de otros miembros de la UAEMéx.

    También se incluyen otros scripts útiles durante el pentesting al sistema.

    [Para más información de estos scripts puede leer este _readme_.](/Scripts/readme.md)

## Tecnologías Utilizadas
* __controlescolar.uaemex.mx__:
    * Java
    * JavaScript
    * HTML y CSS

* __Tampermonkey__:
    * JavaScript
    
* __Scripts__:
    * Python
        * Selenium (_Web Scrapping_)
        * base64 (Codificación y decodificación de archivos)
    * MySQL
    
## Instalación y Uso

Cada una de las tres herramientas se usa e instala de manera distinta, puede leer los siguientes _readme_ para las instrucciones de instalación y uso.

* [__Modificación del Cliente (Menú de Exploits)__](/controlescolar.uaemex.mx/readme.md#instrucciones-de-instalación)
* [__Extensión "Tampermonkey"__](/Tampermonkey/readme.md#instrucciones-de-instalación)
* [__Scripts de Python__](/Scripts/readme.md#instalación)

## Documentación Adicional
Se incluye esta documentación sobre la estructura, vulnerabilidades y exploits existentes en el SDCE, esta documentación se realizó de manera informal y con fines personales mediante notas digitales usando la aplicación de __Notion__.

> [!NOTE]
> Notion es un software de gestión de proyectos y para tomar notas. Está diseñado para ayudar a los miembros de una empresa u organización a corto plazos, objetivos y tareas en áreas de la eficiencia y la productividad.

La documentación en Notion incluye notas sobre aspectos relevantes del SDCE:

* __Documentación sobre la estructura del sistema.__
* __Vulnerabilidades encontradas en el sistema.__
    * Cross-site Scripting (XSS)
    * Inyección SQL
    * Ataques DDoS
    * Parameter Tempering (Manipulación de Solicitudes)
    * Manipulación del Cliente Web
    * Inyección y Ejecución de código en el Servidor
    * Almacenamiento Inseguro de Información Sensible
* __Exploits encontrados en el sistema.__
    * Ver Datos Personales y Académicos
    * Modificación de Datos Personales y Académicos
    * Forzar Accesos No Autorizados

[La documentación de las vulnerabilidades mencionadas esta disponible en este enlace.](https://www.notion.so/UAEM-x-164abd56f0c0809a9acded7cd86e7a50?pvs=4)

## Miscelánea
En la carpeta [Misc](./Misc/) se almacenan archivos que fueron útiles o resultantes durante las etapas de diseño, análisis e implementación del proyecto, pero que no son esenciales para el propósito final de la investigación de tesis.

## Autor

Desarrollado por Alejandro Galicia en 2025, como parte del proyecto te titulación por tesis para obtener el grado de Licenciado en Ingeniería en Computación por la Universidad Autónoma del Estado de México.