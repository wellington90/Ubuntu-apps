#!/bin/bash

# Encontra a última imagem na pasta atual
last_image=$(ls -1t *.png 2>/dev/null | head -n1)

if [ -z "$last_image" ]; then
    echo "Nenhuma imagem encontrada na pasta."
    exit 1
fi
echo "$last_image"
echo ""

# Remove mensagens indesejadas antes de passar para o Tesseract
filtered_text=$(tesseract "$last_image" stdout 2>/dev/null | grep -Ev 'Screenshot from|Estimating resolution')

echo "$filtered_text"
