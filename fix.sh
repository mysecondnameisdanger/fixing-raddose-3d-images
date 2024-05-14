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

# Añadir instalación de webshot2 en el script R si no está presente
sed -i '1s/^/# Instalar webshot2 si no está instalado\nif (!require("webshot2")) {\n  if (!requireNamespace("remotes", quietly = TRUE)) {\n    install.packages("remotes")\n  }\n  remotes::install_github("rstudio/webshot2")\n  library(webshot2)\n}\n\n/' output-DoseState.R

# Sustituir rgl.viewpoint por view3d en el script R
sed -i 's/rgl.viewpoint/view3d/g' output-DoseState.R

# Sustituir rgl.snapshot por snapshot3d e incluir los parámetros width y height
sed -i 's/rgl.snapshot(\(.*\))/snapshot3d(\1, width = 800, height = 600)/' output-DoseState.R

echo "Modificaciones al script R completadas."

# Ejecutar el script R
echo "Ejecutando el script en R..."
Rscript output-DoseState.R

echo "Proceso completado. Las imágenes deben haberse generado correctamente."
