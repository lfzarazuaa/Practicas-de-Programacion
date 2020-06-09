#!/bin/bash

NEW_DIR=platzi #Define el directorio donde se guardará.

if [ ! -d "~/$NEW_DIR" ]; then # Si no existe el directorio lo crea, con ~ se accede al directorio principal.
    mkdir ~/$NEW_DIR #Crea el directorio.
fi

cp pagina.txt ~/$NEW_DIR/ #Copia el archivo pagina.txt al nuevo directorio.
echo "`date`: Todo listo jefe! (programa terminado)"#Manda mensaje de finalización.
