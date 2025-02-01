# Miscelánea
Aquí se encuentran diversos archivos relacionados con la investigación de esta tesis. A continuación, se describe el contenido de cada carpeta y su utilidad.


## Descripción de las carpetas y archivos

### Contraseñas
Contiene los usuarios y contraseñas de todos los profesores y usuarios del SICDE asi como los scripts usados para obtener estos datos.  
<span style='font-style: italic; color: #fa384a;'>Por razones evidentes, tanto los libros de Excel como los archivos comprimidos (.zip) están protegidos con contraseña. Si bien las contraseñas de profesores y de usuarios del SICDE son un resultado derivado de la investigación de esta tesis, no se encuentra en un motivo válido por el cual alguien podría querer acceder a estos datos sin tener fines malintencionados. No obstante, si desea obtener acceso a esta información, puede solicitar la contraseña contactando al desarrollador a través del correo electrónico amberage.exe@gmail.com, explicando de manera clara y detallada los motivos por los que requiere acceder a dichos archivos.</span>


- [**Contraseñas Profesores**](./Contraseñas/Contraseñas%20Profesores/)  
    El .zip contiene las contraseñas en el formato de _reporte.uaemrpt_ de todos los profesores, así como el script usado para volverlo un excel.

    > [!IMPORTANT]
    > Las contraseñas fueron recuperadas en codificación ANSI, por lo que al recodificarlas en UTF-8 algunas contraseñas ocurrieron perdidas de caracteres, a continuación, se muestra la tabla de equivalencias posibles para intentar recuperar los caracteres perdidos.

    | Carácter          | Carácter Real |
    |-------------------|---------------|
    | A                 | Á             |
    | Espacio en Blanco | á             |
    | E                 | É             |
    | e                 | é             |
    | I                 | Í             |
    | ¡                 | í             |
    | O                 | Ó             |
    | ¢                 | ó             |
    | U                 | Ú             |
    | £                 | ú             |
    
    _Nota: Las contraseñas durante su recuperación fueron sometidas a la función trim/strip, función que elimina todos los espacios en blanco al final o inicio de la contraseña, por lo que la contraseña también podría haber perdido algún espacio al inicio o final_ 

- [**Contraseñas SICDE**](./Contraseñas/Contraseñs%20SICDE/)  
    El .zip contiene los archivos originales con los que se realizó la obtención de contraseñas, asi como los scripts utilizados en el proceso.


### HTML
Contiene el código fuente HTML de sitios web a los que ya no se puede acceder. Estos archivos son útiles para futuros análisis y referencias.

- [**Enviar Calificaciones.html**](./HTML/Enviar%20Calificaciones.html):  
    Código fuente HTML de una página relacionada con el envío de calificaciones en el subsistema de profesores.

---
### Identificadores
Contiene listados de identificadores que se utilizan para identificar objetos dentro del Sistema de Control Escolar de la UAEMéx (SDCE).

- [**Lista de clases.csv**](./Identificadores/Lista%20de%20clases.csv):  
    Listado de clases existentes en SDCE.
- [**OrganismoAcademico.csv**](./Identificadores/OrganismoAcademico.csv):  
    Identificadores de los organismos académicos de la Universidad Autónoma del Estado de México
- [**PeriodoDeEstudios.csv**](./Identificadores/PeriodoDeEstudios.csv):  
    Identificadores de los periodos de estudios (semestres) de la Universidad Autónoma del Estado de México.
- [**Calificaciones.csv**](./Identificadores/Calificaciones.csv):  
    Identificadores de las calificaciones, usados para asignar calificaciones.  
    _Nota: El indicador de aprobación se escribe como una cadena, no como un identificador, osea (A, R o -)_

---
### Reportes
Contiene reportes emitidos por el SDCE y el software necesario para abrirlos. Estos archivos se guardan con fines de análisis.

- [**reporte clases.uaemrpt**](./Reportes/):  
    Reporte relacionado con las clases existentes dentro del SDCE (contiene lo mismo que Lista de clases.csv)
- [**reporte tiposDoc.uaemrpt**](./Reportes/):  
    Reporte relacionado con los tipos de documentos dentro del SDCE.
- [**SicdePrintUtilitySetup64.exe**](./Reportes/):  
    Software necesario para abrir los reportes.

### Screenshot
Guarda capturas de pantalla de momentos clave de la investigación.

- [**sicde_admin_actualizar**](./screenshot/sicde_admin_actualizar.png):  
    Captura de pantalla de la función _Actualizar_ del sistema de administración.
