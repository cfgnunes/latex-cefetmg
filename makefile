SOURCE := meu-trabalho
COMPRESSED_SUFFIX := compactado
OUTPUT_DIR := latex.out

INPUT_TEX := $(SOURCE).tex
OUTPUT_PDF := $(SOURCE).pdf
OUTPUT_PDF_150_DPI := $(SOURCE)-$(COMPRESSED_SUFFIX)-150dpi.pdf
OUTPUT_PDF_300_DPI := $(SOURCE)-$(COMPRESSED_SUFFIX)-300dpi.pdf

TEX_FILES := $(shell find . -type f -iname "*.tex" -or -iname "*.cls" -or -iname "*.bib" ! -path "*/$(OUTPUT_DIR)/*")
IMG_FILES := $(shell find . -type f -iname "*.png" -or -iname "*.jpg" -or -iname "*.eps" ! -path "*/$(OUTPUT_DIR)/*")
PDF_FILES := $(shell find . -type f -iname "*.pdf" ! -path "*/$(OUTPUT_DIR)/*")
SVG_FILES := $(shell find . -type f -iname "*.svg" ! -path "*/$(OUTPUT_DIR)/*")
SVG_TO_PDF_FILES := $(SVG_FILES:.svg=.pdf)
SOURCE_FILES := $(TEX_FILES) $(IMG_FILES) $(PDF_FILES) $(SVG_TO_PDF_FILES)

# Define phony targets (not associated with file names)
.PHONY: default help compile compress compress-max clean

# Default target: compress PDF to 150 DPI
default: compress-max

# Display help information
help:
	@echo "Usage:"
	@echo "  make              : Create the PDF document."
	@echo "  make compress-max : Create the compressed PDF document (150 DPI)."
	@echo "  make compress     : Create the compressed PDF document (300 DPI)."
	@echo "  make clean        : Remove generated files."
	@echo ""

# Compile the project
compile: $(OUTPUT_DIR)/$(OUTPUT_PDF)

$(OUTPUT_DIR)/$(OUTPUT_PDF): $(SOURCE_FILES)
	@echo "Building the project..."
	@mkdir -p $(OUTPUT_DIR)
	@latexmk -pdf -synctex=1 -output-directory=$(OUTPUT_DIR) $(INPUT_TEX)
	@echo "Done!"
	@echo

# Convert SVG files to PDF
%.pdf: %.svg
	@echo "Converting SVG to PDF..."
	@echo " > File: '$<'..."
	@inkscape --export-area-drawing --export-margin=1 --export-filename=$@ $<
	@echo "Done!"
	@echo

# Compress the PDF at 300 DPI
compress: $(OUTPUT_DIR)/$(OUTPUT_PDF_300_DPI)

$(OUTPUT_DIR)/$(OUTPUT_PDF_300_DPI): $(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Compressing the document (300 DPI)..."
	@gs -q -dNOPAUSE -dBATCH -dFastWebView -sDEVICE=pdfwrite \
		-dPDFSETTINGS=/printer \
		-sOutputFile=$(OUTPUT_DIR)/$(OUTPUT_PDF_300_DPI) \
		$(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Done!"
	@echo

# Compress the PDF at 150 DPI
compress-max: $(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI)

$(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI): $(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Compressing the document (150 DPI)..."
	@gs -q -dNOPAUSE -dBATCH -dFastWebView -sDEVICE=pdfwrite \
		-dPDFSETTINGS=/ebook \
		-sOutputFile=$(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI) \
		$(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Done!"
	@echo

# Clean up all generated files
clean:
	@echo "Cleaning up generated files..."
	@rm -rf $(OUTPUT_DIR)
	@echo "Done!"
	@echo
