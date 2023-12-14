#!/bin/bash

# Ruta al repositorio local
repo_local="/c/Users/sergi/Desktop/LEGOPS"

# Ruta al archivo página.html
archivo_html="pagina.html"

# Log para depuración
echo "Recibida solicitud webhook en $(date)" >> webhook.log

# Actualizar el repositorio local
cd $repo_local
git pull origin main

# Reiniciar el servidor local
pkill -f "python -m http.server 8080"  # Detener el servidor existente
python -m http.server 8080 &  # Iniciar el servidor en segundo plano
