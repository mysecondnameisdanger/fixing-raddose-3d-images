#!/bin/bash

# Instalar Chromium
echo "Instalando Chromium..."
sudo dnf install -y chromium

# Confirmar instalación y añadir a PATH si es necesario
if ! command -v chromium-browser &> /dev/null
then
    echo "Chromium no se pudo encontrar. Por favor, asegúrese de que está instalado y en el PATH."
    exit 1
fi

echo "Chromium instalado y en el PATH."

# Mensaje para instalar webshot2
echo "Instale el paquete 'webshot2' en R para habilitar la captura de imágenes. Ejecute los siguientes comandos en R:"
echo "remotes::install_github('rstudio/webshot2')"
echo "library('webshot2')"

# Sustituir rgl.viewpoint por view3d en el script R
sed -i 's/rgl.viewpoint/view3d/g' output-DoseState.R

# Sustituir rgl.snapshot por snapshot3d e incluir los parámetros width y height
sed -i 's/rgl.snapshot(\(.*\))/snapshot3d(\1, width = 800, height = 600)/' output-DoseState.R

echo "Modificaciones al script R completadas."

# Ejecutar el script R
echo "Ejecutando el script en R..."
Rscript output-DoseState.R

echo "Proceso completado. Las imágenes deben haberse generado correctamente."
