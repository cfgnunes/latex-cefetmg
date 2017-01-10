# Definição de variáveis
SOURCE      = meu-trabalho
LATEXMK     = latexmk
GHOSTSCRIPT = gs
PDFVIEWER   = evince

# Executa o processo de limpeza, compilação e abertura do arquivo
all: clean compile open

# Compila o código fonte
compile:
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
	@find . -type f -iname "*-blx.*" -delete
	@find . -type f -iname "*-converted-to.*" -delete
	@find . -type f -iname "*.*~" -delete
	@find . -type f -iname "*.acn" -delete
	@find . -type f -iname "*.acr" -delete
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.backup" -delete
	@find . -type f -iname "*.bak" -delete
	@find . -type f -iname "*.bbl" -delete
	@find . -type f -iname "*.bcf" -delete
	@find . -type f -iname "*.blg" -delete
	@find . -type f -iname "*.brf" -delete
	@find . -type f -iname "*.cb" -delete
	@find . -type f -iname "*.cb2" -delete
	@find . -type f -iname "*.dvi" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.fls" -delete
	@find . -type f -iname "*.fmt" -delete
	@find . -type f -iname "*.fot" -delete
	@find . -type f -iname "*.glg" -delete
	@find . -type f -iname "*.glo" -delete
	@find . -type f -iname "*.gls" -delete
	@find . -type f -iname "*.glsdefs" -delete
	@find . -type f -iname "*.idx" -delete
	@find . -type f -iname "*.ilg" -delete
	@find . -type f -iname "*.ind" -delete
	@find . -type f -iname "*.ist" -delete
	@find . -type f -iname "*.lo*" -delete
	@find . -type f -iname "*.nav" -delete
	@find . -type f -iname "*.out" -delete
	@find . -type f -iname "*.pdfsync" -delete
	@find . -type f -iname "*.pre" -delete
	@find . -type f -iname "*.ps" -delete
	@find . -type f -iname "*.run.xml" -delete
	@find . -type f -iname "*.sav" -delete
	@find . -type f -iname "*.snm" -delete
	@find . -type f -iname "*.synctex*" -delete
	@find . -type f -iname "*.toc" -delete
	@find . -type f -iname "*.vrb" -delete
	@echo "Pronto."

# Visualiza o arquivo PDF gerado
open:
	@echo "Abrindo o arquivo PDF..."
	@$(PDFVIEWER) $(SOURCE).pdf &
	@echo "Pronto."
