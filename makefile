SRC = meu-trabalho
SRC_COMP = meu-trabalho-compactado
OUTPUT_DIR = latex.out

TEX_FILES = $(shell find . -type f -iname "*.tex" -or -iname "*.cls" -or -iname "*.bib")
IMG_FILES = $(shell find . -type f -iname "*.png" -or -iname "*.jpg" -or -iname "*.eps")
PDF_FILES = $(shell find . -type f -iname "*.pdf" ! -iname "$(SRC).pdf" ! -iname "$(SRC_COMP).pdf")
SVG_FILES = $(shell find . -type f -iname "*.svg")

.PHONY: default help compile compress clean

default: compile

help:
	@echo "Usage:"
	@echo "  make           : Create the PDF document."
	@echo "  make compress  : Create the compressed PDF document."
	@echo "  make clean     : Remove generated files."
	@echo ""

compile: $(OUTPUT_DIR)/$(SRC).pdf

$(OUTPUT_DIR)/$(SRC).pdf: $(TEX_FILES) $(IMG_FILES) $(PDF_FILES) $(SVG_FILES:.svg=.pdf)
	@echo "Building the project..."
	@mkdir -p $(OUTPUT_DIR)
	@latexmk \
		-pdf \
		-synctex=1 \
		-output-directory=$(OUTPUT_DIR) $(SRC).tex
	@touch $(OUTPUT_DIR)/$(SRC).pdf
	@echo "Done!"
	@echo

%.pdf: %.svg
	@echo "Converting SVG to PDF..."
	@echo " > File: '$<'..."
	@inkscape --export-area-drawing --export-margin=1 --export-filename=$@ $<
	@echo "Done!"
	@echo

compress: $(OUTPUT_DIR)/$(SRC_COMP).pdf

$(OUTPUT_DIR)/$(SRC_COMP).pdf: $(OUTPUT_DIR)/$(SRC).pdf
	@echo "Compressing the document..."
	@gs \
		-q \
		-dNOPAUSE \
		-dBATCH \
		-dFastWebView \
		-sDEVICE=pdfwrite \
		-dPDFSETTINGS=/printer \
		-sOutputFile=$(OUTPUT_DIR)/$(SRC_COMP).pdf \
		$(OUTPUT_DIR)/$(SRC).pdf
	@touch $(OUTPUT_DIR)/$(SRC_COMP).pdf
	@echo "Done!"
	@echo

clean:
	@echo "Cleaning up generated files..."
	@rm -rf $(OUTPUT_DIR)
	@echo "Done!"
	@echo
