#!/usr/bin/env bash
set -euo pipefail

# Moverse al directorio del script (por si lo invocan desde otro lado)
cd "$(dirname "$0")"

echo "Creando/activando venv"
# crea el venv solo si no existe
[ -d venv ] || python3 -m venv venv
. venv/bin/activate

echo "Instalando dependencias"
pip install --upgrade pip
pip install -r requirements.txt   # asegúrate que el nombre del archivo es este

echo "Ejecutando PyTest"
mkdir -p reports
python -m pytest tests/ \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html --self-contained-html

echo "OK: pruebas finalizadas; reportes en ./reports/"
