#!/bin/bash

MODE=${1:-"html"} 

STYLESHEET=style.css
RESUME_HTML=index.html
RESUME_PDF=resume.pdf

if [ "$MODE" = "html" ]; then
    echo "build html version: $RESUME_HTML"
    pandoc resume.md -f markdown -t html -c $STYLESHEET -s -o $RESUME_HTML
elif [ "$MODE" = "pdf" ]; then
    echo "build pdf version: $RESUME_PDF"
    pandoc resume.md -f markdown -t pdf  --pdf-engine=weasyprint --css style.css -s -o resume.pdf
fi