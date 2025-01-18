import base64, tkinter as tk

try:
    with open('tools\\decodery\\input.txt', 'r') as file:
        data = file.read()
        file.close()
        tryDecode = True
except FileNotFoundError:
    print("No se encontró el archivo 'input'.")
    tryDecode = False
    exit()

if tryDecode:
    decoded_data = base64.b64decode(data)

    # Leer los primeros bytes
    magic_number = decoded_data[:8]  # Leer hasta 8 bytes
    print("Magic number:", magic_number.hex().upper())  # Mostrar en hexadecimal

    # Comparar con magic numbers conocidos
    if magic_number.startswith(bytes.fromhex("89504E47")):
        print("El archivo es un PNG.")
        extension = '.png'
    elif magic_number.startswith(bytes.fromhex("FFD8FF")):
        print("El archivo es un JPG/JPEG.")
        extension = '.jpg'
    elif magic_number.startswith(bytes.fromhex("25504446")):
        print("El archivo es un PDF.")
        extension = '.pdf'
    elif magic_number.startswith(bytes.fromhex("D0CF11E0A1B11AE1")):
        print("El archivo es un DOC (antiguo).")
        extension = '.doc'
    elif magic_number.startswith(bytes.fromhex("504B0304")):
        print("El archivo es un DOCX, XLSX o ZIP.")
        extension = '.zip'
    elif magic_number.startswith(bytes.fromhex("3C3F786D6C20")):
        print("El archivo es un XML.")
        extension = '.xml'
    elif magic_number.startswith(bytes.fromhex("0000001866747970")):
        print("El archivo es un MP4.")
        extension = '.mp4'
    else:
        print("Tipo de archivo desconocido.")
        extension = '.bin'

    saveFile = input("¿Desea guardar el archivo? Y/N\n")
    if saveFile.lower() == 'y':
        # Guardar como un archivo (PDF, imagen, etc.)
        with open(f"output{extension}", "wb") as file:
            file.write(decoded_data)
        print("Archivo generado correctamente.")