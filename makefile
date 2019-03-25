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
	"$(LATEXMK)" -pdf -synctex=1 "$(SOURCE).tex"
	@echo "Pronto."

# Comprime o arquivo PDF gerado
compress:
	@echo "Comprimindo o arquivo PDF..."
	@"$(GHOSTSCRIPT)" -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile="$(SOURCE)-compactado.pdf" \
		"$(SOURCE).pdf"
	@echo "Pronto."

# Remove arquivos temporários
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f \( \
		-iname "*-blx.*" \
		-or -iname "*-converted-to.*" \
		-or -iname "*.*~" \
		-or -iname "*.acn" \
		-or -iname "*.acr" \
		-or -iname "*.aux" \
		-or -iname "*.backup" \
		-or -iname "*.bak" \
		-or -iname "*.bbl" \
		-or -iname "*.bcf" \
		-or -iname "*.blg" \
		-or -iname "*.brf" \
		-or -iname "*.cb" \
		-or -iname "*.cb2" \
		-or -iname "*.dvi" \
		-or -iname "*.fdb_latexmk" \
		-or -iname "*.fls" \
		-or -iname "*.fmt" \
		-or -iname "*.fot" \
		-or -iname "*.glg" \
		-or -iname "*.glo" \
		-or -iname "*.gls" \
		-or -iname "*.glsdefs" \
		-or -iname "*.idx" \
		-or -iname "*.ilg" \
		-or -iname "*.ind" \
		-or -iname "*.ist" \
		-or -iname "*.lo*" \
		-or -iname "*.nav" \
		-or -iname "*.out" \
		-or -iname "*.pdfsync" \
		-or -iname "*.pre" \
		-or -iname "*.ps" \
		-or -iname "*.run.xml" \
		-or -iname "*.sav" \
		-or -iname "*.snm" \
		-or -iname "*.synctex*" \
		-or -iname "*.toc" \
		-or -iname "*.vrb" \
		\) ! -path "./.git/*" -delete
	@echo "Pronto."

# Visualiza o arquivo PDF gerado
open:
	@echo "Abrindo o arquivo PDF..."
	@"$(PDFVIEWER)" "$(SOURCE).pdf" &
	@echo "Pronto."
