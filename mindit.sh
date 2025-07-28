#!/bin/sh
INPUT=$1
INPUT_NAME=${INPUT%.*}
OUTPUT="${INPUT_NAME}.pdf"
echo "Input file: $INPUT"
echo "Output file: $OUTPUT"
pandoc /documents/${INPUT} --filter pandoc-plantuml --number-sections --shift-heading-level-by=-1 --template eisvogel -o /documents/${OUTPUT}
