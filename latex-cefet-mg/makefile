# Definicao de variaveis
SOURCE      = "main"
LATEX       = pdflatex
BIBTEX      = bibtex
MAKEINDEX   = makeindex
GHOSTSCRIPT = gs

# Compila o codigo fonte
all:
	@echo "Compilando arquivos..."
	$(LATEX) $(SOURCE).tex
	$(MAKEINDEX) $(SOURCE).idx
	$(BIBTEX) $(SOURCE).aux
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	echo "Comprimindo o arquivo pdf..."
	@$(GHOSTSCRIPT)	-q -dNOPAUSE -dBATCH -dSAFER \
			-sDEVICE=pdfwrite \
			-dEmbedAllFonts=true \
			-dSubsetFonts=true \
			-sOutputFile=$(SOURCE)_compressed.pdf \
			 $(SOURCE).pdf
	@echo "Terminado."

# Remove arquivos temporarios
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.pdf *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex.*
	@echo "Terminado."
