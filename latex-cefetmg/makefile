# Definição de variáveis
SOURCE      = meu-trabalho
LATEX       = pdflatex
LATEXMK     = latexmk
BIBTEX      = bibtex
MAKEINDEX   = makeindex
GHOSTSCRIPT = gs
OPENPDF     = evince

# Executa o processo completo de limpeza, compilação e compressão
all: clean compile2 open

# Compila o código fonte
compile:
	@echo "Compilando arquivos..."
	$(LATEX) $(SOURCE).tex
	$(MAKEINDEX) $(SOURCE).idx
	$(BIBTEX) $(SOURCE).aux
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	@echo "Pronto."

# Compila o código fonte (método alternativo)
compile2:
	@echo "Compilando arquivos..."
	$(LATEXMK) -pdf -synctex=1 $(SOURCE).tex
	@echo "Pronto."

# Comprime o arquivo PDF gerado
compress:
	@echo "Comprimindo o arquivo PDF..."
	@$(GHOSTSCRIPT) -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile=$(SOURCE)-compactado.pdf \
		$(SOURCE).pdf
	@echo "Pronto."

# Remove arquivos temporários
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex.*
	@rm -f $(SOURCE).pdf $(SOURCE)-compactado.pdf
	@echo "Pronto."

# Visualiza o arquivo PDF gerado
open:
	@echo "Limpando arquivos temporarios..."
	$(OPENPDF) $(SOURCE).pdf &
	@echo "Pronto."