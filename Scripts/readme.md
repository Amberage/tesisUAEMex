# Python Scripts

Esta sección incluye todos los script usados durante el desarrollo de mi tesis, en lo general, todos los scripts están enfocados de obtener y procesar información extraída de la base de datos del SDCE.

## Índice
* [Instalación](#instalación)
* [Scraping Web](#scraping-web)
* [Base de Datos](#base-de-datos)
* [Decodificador Base64](#decodificador-base64)

## Instalación
Basta con instalar las librerías usadas en estos script.
```bash
pip install -r requirements.txt
```
## Scraping Web
Para obtener información de la base de datos del SDCE se usó la técnica de scraping web.
> [!NOTE]
>Web scraping o raspado web es una técnica utilizada mediante programas de software para extraer información de sitios web.​ Usualmente, estos programas simulan la navegación de un humano en la World Wide Web ya sea utilizando el protocolo HTTP manualmente, o incrustando un navegador en una aplicación.

Esta técnica fue la base del análisis del SDCE, particularmente para comprender el sistema de identificadores que usa el SDCE.

Mediante el uso de Selenium se creo un pequeño programa que facilita la implementación de esta técnica en los tres diferentes portales del SDCE _(Alumnos, Profesores y SICDE)_,

```python
from scripts.scraper import scraperManager as scraper


if __name__ == '__main__':
    # Ejemplo de uso
    scrap = scraper.ScraperManager()
    tryLogin = scrap.startBrowser("usuario", "contraseña", "tipoPerfil", False)

    if (tryLogin[0] == True):
        url = 'https://controlescolar.uaemex.mx/dce/sicde/publico/commons/jsps/detalle.jsp?idPersona='
        ids = [219373880, 219373885]
        searchContent = [
            {'etiqueta': 'idObjeto', 'criterio': 'NAME', 'idCriterio': '__targetObjectId__', 'tipoAtributo': 'value'},
            {'etiqueta': 'Nombre', 'criterio': 'XPATH', 'idCriterio': '//*[@id="tableList"]/tbody/tr[4]/td[2]', 'tipoAtributo': 'innerText'},
            {'etiqueta': 'Usuario', 'criterio': 'XPATH', 'idCriterio': '//*[@id="tableList"]/tbody/tr[1]/td[2]', 'tipoAtributo': 'innerText'},
        ]
        
        tryScrap = scrap.scrapingId(url, ids, searchContent, 0.5)
        print(tryScrap[1])
    else:
        print(tryLogin[1])


    scrap.closeBrowser()
```

_Para más información del uso de este programa leer los docstring en [scraperManager.py](./scripts/scraper/scraperManager.py)_

## Base de Datos
Este script tiene el propósito de almacenar los resultados del scraping dentro de una base de datos para analizar la información de manera más ordenada.

> [!IMPORTANT]
> Si bien, nos ahorraría un proceso el almacenar directamente del scraping a la base de datos, por comodidad se tomo la decisión de separar estos procesos y evitar la menor cantidad de costes de solicitudes al SDCE debido a la gran cantidad de solicitudes que se realizaron unicamente para tomar un grupo de muestras, las cuales fueron los siguientes rangos:
>  * idPersona: 203811000 al 219373882
>  * idAlumno: 203848300 al 203862700
>  
> Los archivos que contienen el resultado de este scrap son [idPersona.txt](./.sql/idPersona.txt) e [idAlumno.txt](./.sql/idAlumno.txt)

Este script busca volcar la información de estos `.txt` en una base de datos.
```python
from scripts.database import databaseManager as database

if __name__ == '__main__':
    # Ejemplo de uso
    database.insertStudent_idPersona(r'./.sql/idPersona.txt')
    database.updateStudent_idAlumno(r'./.sql/idAlumno.txt')
```
> [!IMPORTANT]
> Es importante llenar los parámetros de conexión con la base de datos en el archivo [.env](./.sql/.env)  
> Es importante respetar el orden de inserción, los datos de idAlumno dependen de que existan los de idPersona, por lo que primero se deberá insertar idPersona y después actualizar idAlumno.

## Decodificador Base64
Muchos archivos en la base de datos del SDCE están codificados en `base64`, por lo que mediante el uso de la biblioteca del mismo nombre y el uso del magic number es posible reconstruir el fichero mediante esta cadena cifrada y que se puede obtener de varios tipos de objetos en el SDCE.

> [!NOTE]
> Un magic number en informática se refiere a unos caracteres alfanuméricos que de manera codificada identifican un archivo, generalmente ubicados al comenzar dicho archivo.

El uso de este script es el más sencillo, basta con proporcionarle la ruta de un archivo de texto plano que contenga la cadena en base64 y posteriormente ejecutar el script.