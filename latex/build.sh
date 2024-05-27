#!/bin/bash

# Clean up previous build files
rm -rf build
mkdir build

# Run LaTeX
pdflatex -output-directory=build -interaction=nonstopmode litepaper.tex

# Run BibTeX
bibtex build/litepaper.aux

# Run LaTeX again
pdflatex -output-directory=build -interaction=nonstopmode litepaper.tex

# Run LaTeX once more to resolve references
pdflatex -output-directory=build -interaction=nonstopmode litepaper.tex

# Clean up temporary files
rm -rf build/*.aux build/*.log build/*.out build/*.toc build/*.bbl build/*.blg

echo "Build completed!"

open build/litepaper.pdf
