# Variaveis definidas
TEX = pdflatex
BIBTEX = bibtex
# Este deve ser o nome do arquivo principal para ser compilado
SOURCE = "meu-trabalho"

# Compila o fonte
all:
	@echo "Compilando arquivos..."
	$(TEX) $(SOURCE).tex
	$(BIBTEX) $(SOURCE).aux
	$(TEX) $(SOURCE).tex
	$(TEX) $(SOURCE).tex
	@echo "Comprimindo o arquivo pdf..."
	@gs	-q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile=$(SOURCE)-compactado.pdf \
		 $(SOURCE).pdf
	@echo "Terminado."

# Remove arquivos temporarios
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex.*
	@rm -f $(SOURCE).pdf $(SOURCE)-compactado.pdf
	@echo "Terminado."
