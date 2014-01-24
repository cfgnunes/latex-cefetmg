# Variaveis definidas
SOURCE = "main"
TEX = pdflatex
BIBTEX = bibtex

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
		-sOutputFile=$(SOURCE)_compressed.pdf \
		 $(SOURCE).pdf
	@echo "Terminado."

# Remove arquivos temporarios
clean:
	@echo "Limpando arquivos temporários..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.pdf *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex.*
	@echo "Terminado."

pdf: clean all
	@evince $(SOURCE).pdf
