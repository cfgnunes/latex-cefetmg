SRC = meu-trabalho
SRC_COMP = meu-trabalho-compactado
OUTPUT_DIR = latex.out

TEX_FILES = $(shell find . -type f -iname "*.tex" -or -iname "*.cls" -or -iname "*.bib")
IMG_FILES = $(shell find . -type f -iname "*.png" -or -iname "*.jpg" -or -iname "*.eps")
PDF_FILES = $(shell find . -type f -iname "*.pdf" ! -iname "$(SRC).pdf" ! -iname "$(SRC_COMP).pdf")
SVG_FILES = $(shell find . -type f -iname "*.svg")

.PHONY: default help compile compress clean

default: compress

help:
	@echo "'make': Gera o documento em PDF."
	@echo "'make compress': Gera o documento em PDF (compactado)."
	@echo "'make clean': Remove os arquivos gerados."
	@echo

compile: $(OUTPUT_DIR)/$(SRC).pdf

$(OUTPUT_DIR)/$(SRC).pdf: $(TEX_FILES) $(IMG_FILES) $(PDF_FILES) $(SVG_FILES:.svg=.pdf)
	@echo "Compilando o projeto..."
	@latexmk \
		-pdf \
		-synctex=1 \
		-output-directory=$(OUTPUT_DIR) \
		$(SRC).tex 2>/dev/null
	@touch $(OUTPUT_DIR)/$(SRC).pdf
	@echo "Pronto!"
	@echo

%.pdf: %.svg
	@echo "Convertendo imagem SVG para PDF..."
	@echo " > convertendo '$<'..."
	@inkscape \
		--without-gui \
		--export-area-drawing \
		--export-pdf-version=1.5 \
		--export-margin=1 \
		--file=$< \
		--export-pdf=$@ 2>/dev/null
	@echo "Pronto!"
	@echo

compress: $(OUTPUT_DIR)/$(SRC_COMP).pdf

$(OUTPUT_DIR)/$(SRC_COMP).pdf: $(OUTPUT_DIR)/$(SRC).pdf
	@echo "Compactando o arquivo final..."
	@gs \
		-q \
		-dNOPAUSE \
		-dBATCH \
		-dSAFER \
		-dFastWebView \
		-sDEVICE=pdfwrite \
		-dPDFSETTINGS=/printer \
		-sOutputFile=$(OUTPUT_DIR)/$(SRC_COMP).pdf \
		$(OUTPUT_DIR)/$(SRC).pdf 2>/dev/null
	@touch $(OUTPUT_DIR)/$(SRC_COMP).pdf
	@echo "Pronto!"
	@echo

clean:
	@echo "Limpando arquivos gerados..."
	@rm -rf $(OUTPUT_DIR)
	@echo "Pronto!"
	@echo
