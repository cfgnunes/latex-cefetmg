# Variaveis definidas
SOURCE = "main"

# Compila o fonte
all:
	@echo "Compilando arquivos..."
	@latex $(SOURCE).tex
	@bibtex $(SOURCE).aux
	@latex $(SOURCE).tex
	@latex $(SOURCE).tex
	@dvips $(SOURCE).dvi
	@ps2pdf -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true $(SOURCE).ps
	@echo "Terminado."

# Remove os arquivos temporarios
clean:
	@echo "Limpando arquivos temporários..."
	@find . -type f -iname "*.aux" -delete	
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.ps *.l* *.idx *.bbl *.glo *.dvi *.pdf *.toc *.blg *.ilg *.ind *.out *.wsp
	@echo "Terminado."

pdf: clean all
	@evince $(SOURCE).pdf

