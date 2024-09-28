#!/bin/bash

MODE=${1:-"html"} 

STYLESHEET=style.css
RESUME_HTML=index.html

if [ "$MODE" = "html" ]; then
    echo "html version built: $RESUME_HTML"
    pandoc resume.md -f markdown -t html -c $STYLESHEET -s -o $RESUME_HTML
fi