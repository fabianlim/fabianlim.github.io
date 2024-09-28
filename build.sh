#!/bin/bash

STYLESHEET=style.css
RESUME_HTML=index.html
RESUME_PDF=resume.pdf

build_html () {
    echo "build html version: $RESUME_HTML"
    pandoc resume.md -f markdown -t html -c $STYLESHEET -s -o $RESUME_HTML
}

build_pdf () {
    echo "build pdf version: $RESUME_PDF"
    pandoc resume.md -f markdown -t pdf --pdf-engine=weasyprint --css pdf-style.css -s -o resume.pdf
}

for name in "$@"; do
    if [ "$name" = "html" ]; then
        build_html
    elif [ "$name" = "pdf" ]; then
        build_pdf
    fi
done