import mysql.connector, os
from mysql.connector import Error
from dotenv import load_dotenv

DOT_ENV_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '.sql', '.env'))
load_dotenv(dotenv_path = DOT_ENV_PATH)

HOST = os.getenv("HOST")
USER = os.getenv("USER")
PASSWORD = os.getenv("PASSWORD")
DATABASE = os.getenv("DATABASE")

def startConnection():
    global conn
    conn = mysql.connector.connect(host=HOST, user=USER, password=PASSWORD, database=DATABASE, charset='utf8')

def closeConnection():
    if conn.is_connected():
        conn.close()

def insertStudent(idPersona, matricula, nombre):
    """_summary_

    Args:
        idPersona (string): idPersona del alumno
        matricula (string): Matricula del alumno
        nombre (string): Nombre completo del alumno
    """    
    try:
        if conn.is_connected():
            cursor = conn.cursor()
            # Sentencia SQL para insertar un estudiante
            sql_insert_query = "INSERT INTO alumnos (idPersona, matricula, nombre) VALUES (%s, %s, %s)"
            # Valores a insertar
            values = (idPersona, matricula, nombre)
            # Ejecutar la sentencia SQL
            cursor.execute(sql_insert_query, values)
            conn.commit()
            print(f"{nombre} insertado correctamente.")
    except Error as e:
        print(f"Error al insertar estudiante: {e}")
    finally:
        if 'cursor' in locals():
            cursor.close()

def updateStudent(idAlumno, licenciatura, plantel, matricula):
    """_summary_

    Args:
        idAlumno (string): idAlumno del alumno.
        licenciatura (string): Licenciatura que cursa el alumno.
        plantel (string): Plantel donde estudia el alumno.
        matricula (string): Matricula del alumno. (FOREIGN_KEY)
    """    
    try:
        if conn.is_connected():
            cursor = conn.cursor()
            # Sentencia SQL para actualizar un estudiante
            sql_update_query = "UPDATE alumnos SET idAlumno = %s, licenciatura = %s, plantel = %s WHERE matricula = %s"
            # Valores a actualizar
            values = (idAlumno, licenciatura, plantel, matricula)
            # Ejecutar la sentencia SQL de actualización
            cursor.execute(sql_update_query, values)
            conn.commit()
            print(f"Estudiante con matricula {matricula} actualizado correctamente.")
    except Error as e:
        print(f"Error al actualizar estudiante: {e}")
    finally:
        if 'cursor' in locals():
            cursor.close()

def insertStudent_idPersona(dataPath):
    # Nombre del archivo de texto
    nombre_archivo = dataPath

    # Abre el archivo en modo lectura
    with open(nombre_archivo, "r", encoding="utf-8") as archivo:
        startConnection()

        # Lee cada línea del archivo
        for linea in archivo:
            # Divide la línea en partes usando "_____" como separador
            partes = linea.strip().split("_____")
            
            # Asigna las partes a las variables
            txt_idPersona = partes[0]
            txt_Matricula = partes[1]
            txt_Nombre = partes[2]

            if not txt_Nombre.startswith("CANCELADO"):
                insertStudent(txt_idPersona, txt_Matricula, txt_Nombre)
        closeConnection()

def updateStudent_idAlumno(dataPath):
    # Nombre del archivo de texto
    nombre_archivo = dataPath

    # Abre el archivo en modo lectura
    with open(nombre_archivo, "r", encoding="utf-8") as archivo:
        startConnection()
        # Lee cada línea del archivo
        for linea in archivo:
            # Divide la línea en partes usando "_____" como separador
            partes = linea.strip().split("_____")
        
            # Asigna las partes a las variables
            txt_idAlumno = partes[0]
            txt_Matricula = partes[1]
            txt_Licenciatura = partes[3]
            txt_Plantel = partes[4]

            updateStudent(txt_idAlumno, txt_Licenciatura, txt_Plantel, txt_Matricula)

        closeConnection()