#!/bin/bash

# Encontra a última imagem na pasta atual
last_image=$(ls -1t *.png 2>/dev/null | head -n1)

if [ -z "$last_image" ]; then
    echo "Nenhuma imagem encontrada na pasta."
    exit 1
fi
echo ""
echo ""
echo "$last_image"

# Executa o Tesseract com a última imagem encontrada e os idiomas inglês e alemão
tesseract "$last_image" stdout -l eng+deu
