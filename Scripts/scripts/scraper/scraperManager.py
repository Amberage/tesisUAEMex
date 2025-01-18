from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import NoSuchElementException
from webdriver_manager.chrome import ChromeDriverManager
import time

class ScraperManager:
    def __init__(self):
        self.driver = None

    def startBrowser(self, username, password, userType, waitToStart=False, delay=2):
        """### Inicia el navegador y realiza el login en el portal indicado por userType.

        Args:
            username (string): Cuenta de usuario del alumno, profesor o trabajador SICDE
            password (string): Contraseña del usuario
            userType (string): Tipo de usuario esperado: 'alumno', 'profesor', 'SICDE'
            waitToStart (bool, optional): Esperar antes de iniciar el login, util activar VPN por default es False.
            delay (float, optional): Número de segundos para esperar entre peticiones, util cuando el servidor va lento, por default es 2.

        Returns:
            boolean: Retorna un booleano con el resultado del login.
        """
        #- Validación de datos: userType
        LOGIN_URLS = {
            'alumno': r'https://controlescolar.uaemex.mx/dce/sicde/publico/alumnos/indexLogin.html',
            'profesor': r'https://controlescolar.uaemex.mx/dce/sicde/publico/profesores/indexLogin.html',
            'sicde': r'https://controlescolar.uaemex.mx/dce/sicde/site/login.jsp'
        }

        LOGIN_URL = LOGIN_URLS.get(userType.lower())
        if not LOGIN_URL:
            return [False, f'Error al iniciar el navegador, {userType} no es un tipo de usuario válido.']

        #- Iniciar la configuración del navegador y el navegador en si.
        '''
        service: Instalar Chrome, si ya esta instalado entonces no se hace nada.
        options: Inicia la configuración de Chrome
        options.add_argument("--window-size=1280,720") : Ejecuta en una ventana en 1280 x 720
        option.add_argument("--headless") : Ejecuta en modo headless (sin ventana).
        webdriver.Chrome(service=service, options=options) : Crea el navegador.
        '''
        service = Service(ChromeDriverManager().install())
        options = webdriver.ChromeOptions()
        options.add_argument("--window-size=1280,720")
        self.driver = webdriver.Chrome(service=service, options=options)

        #- Proceso de login
        self.driver.get(LOGIN_URL)
        #? Espera antes de iniciar el login
        if waitToStart:
            input('Presione Enter cuando desee iniciar el login...')
        else:
            time.sleep(delay)

        
        try:
            #? El login, asi como muchos elementos se generan en iframes o frames, por lo que para interacturar con los elementos dentro de ellos se debe cambiar al frame correspondiente.
            self.driver.switch_to.frame('body')
            self.driver.find_element(By.NAME, 'usuario').send_keys(username)
            self.driver.find_element(By.NAME, 'password').send_keys(password)

            #? Mandar la IP a 0.0.0.0 en caso de que sea alumno o profesor (SICDE no tiene un input de IP)
            if userType.lower() != 'sicde':
                ipUsuario = self.driver.find_element(By.NAME, "ipUsuario")
                self.driver.execute_script("arguments[0].value='0.0.0.0';", ipUsuario)
            
            self.driver.find_element(By.ID, 'btnFirmarse').click()
            time.sleep(delay)
            self.driver.switch_to.default_content()

            # Verificar login exitoso
            self.driver.find_element(By.ID, "subheader")
            return [True, 'Login exitoso.']
        except NoSuchElementException:
            return [False, f'No fue posible acceder al sistema con las credenciales proporcionadas.']

    def scrapingId(self, url, ids: list, searchContent: list, delay=1, savePath=r'./scrap.csv'):
        """_summary_

        Args:
            url (string): Endpoint donde se mandará la solicitud.
            ids (list): Arreglo de dos elementos tal que: [idInicial, idFinal]
            searchContent (list): Diccionario que contiene: {"etiqueta", "criterio", "idCriterio"}
            
            diccioinarioEjemplo = [
                {'etiqueta': 'idObjeto', 'criterio': 'NAME', 'idCriterio': '__targetObjectId__', 'tipoAtributo': 'value'},
                {'etiqueta': 'Nombre', 'criterio': 'XPATH', 'idCriterio': '//*[@id="tableList"]/tbody/tr[4]/td[2]', 'tipoAtributo': 'innerText'},
            ]

            delay (float, optional): Número de segundos para esperar entre peticiones, util cuando el servidor va lento, por default es 1.
            savePath (string, optional): Ruta para guardar el fichero resultante del scraping.
        """             

        #- Validación de arreglos
        if not isinstance(ids, list):
            raise ValueError("El segundo argumento debe ser una lista con dos elemntos, un idInicial y un idFinal")
        if len(ids) != 2:
            raise ValueError("El segundo argumento debe tener dos elementos, un idInicial y un idFinal.")
        if not isinstance(searchContent, list):
            raise ValueError("El tercer argumento debe ser una lista que contenga los identificadores que se buscarán en la web.")
        
        #- Iniciar el scraping
        idInicial = ids[0]
        idFinal = ids[1]
        errorCounter = 0
        saveData = open(savePath, 'a', encoding="utf8")

        #? Generar los headers
        headersContent = [content['etiqueta'] for content in searchContent]

        #? Verificar si el archivo está vacío antes de escribir los encabezados
        if saveData.tell() == 0:  # Si el archivo está vacío
            saveData.write('id,')
            saveData.write(','.join(headersContent) + '\n')
        
        #? Determinar el rango del scraping
        while(idInicial <= idFinal):
            #? Solicitar Id
            self.driver.get(url + str(idInicial))
            time.sleep(delay)

            try:
                #?Buscar Parametros
                tempContent = [] #? En cada iteración aqui se almacenara la información de los scraps.
                for content in searchContent:
                    scrapValue = ''

                    TIPOS_CRITERIO = {
                        'ID': By.ID,  # Se utiliza para localizar un elemento por su atributo ID único
                        'NAME': By.NAME,  # Se utiliza para localizar un elemento por su atributo name
                        'XPATH': By.XPATH,  # Se utiliza para localizar un elemento mediante su ruta XPath
                        'CLASS_NAME': By.CLASS_NAME,  # Se utiliza para localizar un elemento por su clase CSS
                        'CSS_SELECTOR': By.CSS_SELECTOR,  # Se utiliza para localizar un elemento usando un selector CSS
                        'LINK_TEXT': By.LINK_TEXT,  # Se utiliza para localizar un enlace completo mediante su texto
                        'PARTIAL_LINK_TEXT': By.PARTIAL_LINK_TEXT,  # Se utiliza para localizar un enlace mediante una parte de su texto
                        'TAG_NAME': By.TAG_NAME,  # Se utiliza para localizar un elemento por su nombre de etiqueta HTML
                    }

                    TIPOS_ATRIBUTO = {
                        'value': 'value',  # Obtiene el valor de un campo de formulario (input, select, textarea, etc.)
                        'innertext': 'innerText',  # Obtiene el texto visible de un elemento, excluyendo etiquetas HTML y elementos ocultos.
                        'textcontent': 'textContent',  # Obtiene el texto dentro de un elemento, incluyendo contenido de elementos ocultos por CSS.
                        'outerhtml': 'outerHTML',  # Obtiene el HTML completo de un elemento, incluyendo su etiqueta de apertura y cierre.
                        'innerhtml': 'innerHTML',  # Obtiene el HTML interno de un elemento, sin las etiquetas de apertura y cierre.
                        'class': 'class',  # Obtiene el valor del atributo 'class' del elemento (clases CSS).
                        'id': 'id',  # Obtiene el valor del atributo 'id' de un elemento (para identificación única).
                        'href': 'href',  # Para enlaces <a>, obtiene el destino (URL) de la página o recurso.
                        'src': 'src',  # Para elementos de imagen, iframe, etc., obtiene la fuente o la URL del recurso.
                        'alt': 'alt',  # Para imágenes, obtiene el texto alternativo que se muestra si la imagen no se carga.
                        'title': 'title',  # Obtiene el valor del atributo 'title', que suele ser el texto que aparece al pasar el cursor sobre un elemento.
                        'style': 'style',  # Obtiene los estilos CSS en línea aplicados directamente al elemento.
                        'disabled': 'disabled',  # Para campos de formulario, obtiene "true" si el elemento está deshabilitado.
                        'checked': 'checked',  # Para elementos de tipo checkbox o radio, devuelve "true" si está seleccionado.
                        'selected': 'selected',  # Para opciones de un <select>, devuelve "true" si está seleccionada.
                        'readonly': 'readonly',  # Para campos de texto y textarea, obtiene "true" si el campo es de solo lectura.
                        'maxlength': 'maxlength',  # Para campos de texto, obtiene el valor máximo de caracteres permitidos.
                        'placeholder': 'placeholder',  # Para campos de formulario, obtiene el texto del atributo 'placeholder'.
                        'role': 'role',  # Para accesibilidad, obtiene el valor del atributo 'role' (usado en ARIA).
                        'aria-label': 'aria-label',  # Para accesibilidad, obtiene el valor del atributo 'aria-label'.
                        'aria-hidden': 'aria-hidden',  # Para accesibilidad, obtiene el valor del atributo 'aria-hidden', que indica si el elemento es accesible.
                        'aria-live': 'aria-live',  # Para accesibilidad, indica la prioridad de actualización de contenido para lectores de pantalla.
                        'data-*': 'data-*',  # Atributos personalizados de datos (ej. data-id, data-name), útiles para almacenar información adicional en elementos HTML.
                        'text': 'text' # Obtiene el texto dentro de cierto tipo de elementos, alternativa al innerHTML
                    }

                    CRITERIO = content['criterio'].upper()
                    IDENTIFICADOR = content['idCriterio']
                    ATRIBUTO = content['tipoAtributo'].lower()

                    # Obtener el valor de scrapValue si el criterio es válido
                    if not CRITERIO in TIPOS_CRITERIO:
                        return [False, f'{content['criterio']} no es un criterio válido, las opciones disponibles son: \n{TIPOS_CRITERIO}']
                    
                    if not ATRIBUTO in TIPOS_ATRIBUTO:
                        return [False, f'{content['tipoAtributo']} no es un atributo válido, las opciones disponibles son: \n{TIPOS_ATRIBUTO}']
                    
                    scrapValue = self.driver.find_element(TIPOS_CRITERIO[CRITERIO], IDENTIFICADOR).get_attribute(TIPOS_ATRIBUTO[ATRIBUTO])
                    tempContent.append(scrapValue)

                '''#? Guardar información.
                A este punto existen dos arreglos:
                    * headersContent: Contiene los nombres de las etiquetas.
                    * tempContent: Contiene los nombres de los valores obtenidos por el scrap.
                
                Teoricamente, ambos arreglos deberian tener la misma dimensión, a continuación
                se crea la estructura usada para almacenar la información en el .csv
                '''
                if(len(headersContent) == len(tempContent)):
                    index = 0
                    consoleLog = f'ID: {idInicial}'
                    cvsLog = f'{idInicial}'
                    for elements in headersContent:
                        consoleLog += f' | {elements}: {tempContent[index]}'
                        cvsLog += f',{tempContent[index]}'
                        index += 1

                    print(consoleLog)
                    saveData.write(cvsLog + '\n')
                else:
                    errorMsg = f'Error lógico: Los datos recopilados del id {idInicial} no tienen el mismo tamaño que los header detectados.\nheaders[{len(headersContent): headersContent}]\nheaders[{len(tempContent): tempContent}]'
                    return [False, errorMsg]

            except Exception as e:
                print(f"Error al procesar ID {idInicial}: {e}")
                errorCounter += 1
            
            idInicial += 1
        
        saveData.close()
        return [True, f'El scrap finalizó con éxito en los {ids[1] - ids[0] + 1} proporcionados con {errorCounter} errores.']
    
    def closeBrowser(self):
        """Cierra el navegador y sale del programa."""
        if self.driver:
            self.driver.quit()
        print('Navegador cerrado.')