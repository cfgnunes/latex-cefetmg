# Definição de variáveis
SOURCE      = meu-trabalho
LATEX       = pdflatex
BIBTEX      = bibtex
MAKEINDEX   = makeindex
GHOSTSCRIPT = gs

# Compila o código fonte
# Pode-se compilar também apenas com o comando "latexmk -pdf meu-trabalho.tex"
all:
	@echo "Compilando arquivos..."
	$(LATEX) $(SOURCE).tex
	$(MAKEINDEX) $(SOURCE).idx
	$(BIBTEX) $(SOURCE).aux
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	@echo "Comprimindo o arquivo pdf..."
	@$(GHOSTSCRIPT) -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile=$(SOURCE)-compactado.pdf \
		$(SOURCE).pdf
	@echo "Terminado."

# Remove arquivos temporários
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex.*
	@rm -f $(SOURCE).pdf $(SOURCE)-compactado.pdf
	@echo "Terminado."
