SOURCE := meu-trabalho
COMPRESSED_SUFFIX := compactado
OUTPUT_DIR := latex.out

# Input and output filenames.
INPUT_TEX := $(SOURCE).tex
OUTPUT_PDF := $(SOURCE).pdf
OUTPUT_PDF_150_DPI := $(SOURCE)-$(COMPRESSED_SUFFIX)-150dpi.pdf
OUTPUT_PDF_300_DPI := $(SOURCE)-$(COMPRESSED_SUFFIX)-300dpi.pdf

# Lists of different source file types.
TEX_FILES := $(shell find . -type f -iname "*.tex" -or -iname "*.cls" -or -iname "*.bib" ! -path "*/$(OUTPUT_DIR)/*")
IMG_FILES := $(shell find . -type f -iname "*.png" -or -iname "*.jpg" -or -iname "*.eps" ! -path "*/$(OUTPUT_DIR)/*")
PDF_FILES := $(shell find . -type f -iname "*.pdf" ! -path "*/$(OUTPUT_DIR)/*")
SVG_FILES := $(shell find . -type f -iname "*.svg" ! -path "*/$(OUTPUT_DIR)/*")

# Convert SVG filenames to their equivalent PDF filenames.
SVG_TO_PDF_FILES := $(SVG_FILES:.svg=.pdf)
SOURCE_FILES := $(TEX_FILES) $(IMG_FILES) $(PDF_FILES) $(SVG_TO_PDF_FILES)

# Targets without a file name association.
.PHONY: default help compile compress compress-max clean view

# By default, compress the PDF at 150 DPI.
default: compress-max

# Display instructions on available make commands.
help:
	@echo "Usage:"
	@echo "  make              : Generate the PDF document."
	@echo "  make compress-max : Compress the PDF document at 150 DPI."
	@echo "  make compress     : Compress the PDF document at 300 DPI."
	@echo "  make clean        : Delete all generated files."
	@echo "  make view         : Open the PDF in the default viewer."
	@echo ""

# Compile the LaTeX source into a PDF.
compile: $(OUTPUT_DIR)/$(OUTPUT_PDF)

$(OUTPUT_DIR)/$(OUTPUT_PDF): $(SOURCE_FILES)
	@echo "Building the project..."
	@mkdir -p $(OUTPUT_DIR)
	@latexmk -pdf -synctex=1 -output-directory=$(OUTPUT_DIR) $(INPUT_TEX)
	@echo "Done!"
	@echo

# Convert SVG files to PDF.
%.pdf: %.svg
	@echo "Converting SVG to PDF..."
	@echo " > File: '$<'..."
	@inkscape --export-area-drawing --export-margin=1 --export-filename=$@ $<
	@echo "Done!"
	@echo

# Compress the generated PDF to 300 DPI.
compress: $(OUTPUT_DIR)/$(OUTPUT_PDF_300_DPI)

$(OUTPUT_DIR)/$(OUTPUT_PDF_300_DPI): $(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Compressing the document (300 DPI)..."
	@gs -q -dNOPAUSE -dBATCH -dFastWebView -sDEVICE=pdfwrite \
		-dPDFSETTINGS=/printer \
		-sOutputFile=$(OUTPUT_DIR)/$(OUTPUT_PDF_300_DPI) \
		$(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Done!"
	@echo

# Compress the generated PDF to 150 DPI.
compress-max: $(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI)

$(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI): $(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Compressing the document (150 DPI)..."
	@gs -q -dNOPAUSE -dBATCH -dFastWebView -sDEVICE=pdfwrite \
		-dPDFSETTINGS=/ebook \
		-sOutputFile=$(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI) \
		$(OUTPUT_DIR)/$(OUTPUT_PDF)
	@echo "Done!"
	@echo

# Remove generated output files.
clean:
	@echo "Cleaning up generated files..."
	@rm -rf $(OUTPUT_DIR)
	@echo "Done!"
	@echo

# Open the PDF with the default viewer.
view: $(OUTPUT_DIR)/$(OUTPUT_PDF_150_DPI)
	@echo "Opening PDF viewer..."
	@xdg-open $(OUTPUT_DIR)/$(OUTPUT_PDF) 2>/dev/null &
	@echo "Done!"
	@echo
