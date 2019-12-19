SRC         = meu-trabalho
LATEXMK     = latexmk
GHOSTSCRIPT = gs
PDFVIEWER   = evince

.PHONY: all help compile compile-test compress clean run

all: clean compile run

help:
	@echo "'make all': Limpa diretório, compila e visualiza o PDF gerado."
	@echo "'make compile': Compila o código fonte."
	@echo "'make compress': Comprime o arquivo PDF gerado."
	@echo "'make clean': Remove arquivos gerados."
	@echo "'make run': Visualiza o PDF gerado."
	@echo

compile:
	@echo "Compilando arquivos..."
	@$(LATEXMK) -pdf -synctex=1 "$(SRC).tex"
	@echo "Pronto!"
	@echo

compile-test:
	@echo "Compilando arquivos..."
	@$(LATEXMK) -pdf -synctex=1 -xelatex -interaction=nonstopmode "$(SRC).tex"
	@echo "Pronto!"
	@echo

compress:
	@echo "Comprimindo o arquivo PDF..."
	@$(GHOSTSCRIPT) -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile="$(SRC)-compactado.pdf" \
		"$(SRC).pdf"
	@echo "Pronto!"
	@echo

clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f \( \
		-iname "*-blx.*" \
		-or -iname "*-blx.aux" \
		-or -iname "*-blx.bib" \
		-or -iname "*-concordance.tex" \
		-or -iname "*-converted-to.*" \
		-or -iname "*-gnuplottex-*" \
		-or -iname "*-tags.tex" \
		-or -iname "*-tikzDictionary" \
		-or -iname "*.4ct" \
		-or -iname "*.4tc" \
		-or -iname "*.?end" \
		-or -iname "*.[1-9]" \
		-or -iname "*.[1-9][0-9]" \
		-or -iname "*.[1-9][0-9][0-9]" \
		-or -iname "*.[1-9][0-9][0-9]R" \
		-or -iname "*.[1-9][0-9]R" \
		-or -iname "*.[1-9]R" \
		-or -iname "*.acn" \
		-or -iname "*.acr" \
		-or -iname "*.alg" \
		-or -iname "*.aux" \
		-or -iname "*.auxlock" \
		-or -iname "*.backup" \
		-or -iname "*.bak" \
		-or -iname "*.bbl" \
		-or -iname "*.bcf" \
		-or -iname "*.blg" \
		-or -iname "*.brf" \
		-or -iname "*.cb" \
		-or -iname "*.cb2" \
		-or -iname "*.cpt" \
		-or -iname "*.cut" \
		-or -iname "*.dpth" \
		-or -iname "*.dvi" \
		-or -iname "*.el" \
		-or -iname "*.eledsec[1-9]" \
		-or -iname "*.eledsec[1-9][0-9]" \
		-or -iname "*.eledsec[1-9][0-9][0-9]" \
		-or -iname "*.eledsec[1-9][0-9][0-9]R" \
		-or -iname "*.eledsec[1-9][0-9]R" \
		-or -iname "*.eledsec[1-9]R" \
		-or -iname "*.end" \
		-or -iname "*.ent" \
		-or -iname "*.fdb_latexmk" \
		-or -iname "*.fff" \
		-or -iname "*.fls" \
		-or -iname "*.fmt" \
		-or -iname "*.fot" \
		-or -iname "*.gaux" \
		-or -iname "*.glg" \
		-or -iname "*.glo" \
		-or -iname "*.gls" \
		-or -iname "*.glsdefs" \
		-or -iname "*.gtex" \
		-or -iname "*.hst" \
		-or -iname "*.idv" \
		-or -iname "*.idx" \
		-or -iname "*.ilg" \
		-or -iname "*.ind" \
		-or -iname "*.ist" \
		-or -iname "*.lg" \
		-or -iname "*.listing" \
		-or -iname "*.lo*" \
		-or -iname "*.lpz" \
		-or -iname "*.ltjruby" \
		-or -iname "*.lyx~" \
		-or -iname "*.lzo" \
		-or -iname "*.lzs" \
		-or -iname "*.maf" \
		-or -iname "*.md5" \
		-or -iname "*.mf" \
		-or -iname "*.mlf" \
		-or -iname "*.mlt" \
		-or -iname "*.mp" \
		-or -iname "*.mtc[0-9]*" \
		-or -iname "*.mw" \
		-or -iname "*.nav" \
		-or -iname "*.nlg" \
		-or -iname "*.nlo" \
		-or -iname "*.nls" \
		-or -iname "*.out" \
		-or -iname "*.pax" \
		-or -iname "*.pdfpc" \
		-or -iname "*.pdfsync" \
		-or -iname "*.pre" \
		-or -iname "*.pyg" \
		-or -iname "*.pytxcode" \
		-or -iname "*.run.xml" \
		-or -iname "*.sagetex.py" \
		-or -iname "*.sagetex.sage" \
		-or -iname "*.sagetex.scmd" \
		-or -iname "*.sav" \
		-or -iname "*.slf[0-9]*" \
		-or -iname "*.slt[0-9]*" \
		-or -iname "*.snm" \
		-or -iname "*.soc" \
		-or -iname "*.sout" \
		-or -iname "*.spl" \
		-or -iname "*.sta" \
		-or -iname "*.stc[0-9]*" \
		-or -iname "*.sympy" \
		-or -iname "*.synctex" \
		-or -iname "*.synctex(busy)" \
		-or -iname "*.synctex.gz" \
		-or -iname "*.synctex.gz(busy)" \
		-or -iname "*.t[1-9]" \
		-or -iname "*.t[1-9][0-9]" \
		-or -iname "*.tdo" \
		-or -iname "*.tfm" \
		-or -iname "*.thm" \
		-or -iname "*.tikz" \
		-or -iname "*.toc" \
		-or -iname "*.tps" \
		-or -iname "*.trc" \
		-or -iname "*.ttt" \
		-or -iname "*.upa" \
		-or -iname "*.upb" \
		-or -iname "*.ver" \
		-or -iname "*.vrb" \
		-or -iname "*.wrt" \
		-or -iname "*.xcp" \
		-or -iname "*.xdv" \
		-or -iname "*.xdy" \
		-or -iname "*.xmpi" \
		-or -iname "*.xref" \
		-or -iname "*.xyc" \
		-or -iname "*.xyd" \
		-or -iname "*~[0-9]*" \
		-or -iname "*.lb" \
		-or -iname "*.swp" \
		-or -iname "*.texpadtmp" \
		-or -iname "_minted*" \
		-or -iname "acs-*.bib" \
		-or -iname "TSWLatexianTemp*" \
		\) ! -path "./.git/*" -delete
	@echo "Pronto!"
	@echo

run:
	@echo "Abrindo o arquivo PDF..."
	@$(PDFVIEWER) "$(SRC).pdf" &
	@echo "Pronto!"
	@echo
