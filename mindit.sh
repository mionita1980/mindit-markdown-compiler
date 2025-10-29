#!/bin/sh
INPUT=$1
TEMPLATE=$2
if [ $# -lt 1 ]; then
    echo "ERROR: At least one parameter must be provided, the input file name."
    exit 1
fi
if [ $# -lt 2 ]; then
    #default template eisvogel, see https://pandoc-templates.org/template/eisvogel/
    TEMPLATE="eisvogel"
fi
INPUT_NAME=${INPUT%.*}
OUTPUT="${INPUT_NAME}.pdf"
echo "Input file: $INPUT"
echo "Output file: $OUTPUT"
echo "Template: $TEMPLATE"
pandoc /documents/${INPUT} --filter pandoc-plantuml --number-sections --shift-heading-level-by=-1 --template ${TEMPLATE} -o /documents/${OUTPUT}
