# LaTeX CEFET-MG

Modelo de trabalho acadêmico desenvolvido para os alunos do [CEFET-MG](http://www.cefetmg.br/).  
Este projeto consiste em uma estrutura básica de arquivos em [LaTeX](https://www.latex-project.org/) para o desenvolvimento de trabalhos monográficos.
Inspirado no projeto [abnTeX2](https://github.com/abntex/abntex2), o modelo é compatível com as normas [ABNT](http://www.abnt.org.br/) vigentes.

### Instalação de pacotes no Ubuntu

Para instalar os pacotes necessários, execute os seguintes comandos no terminal:

```
$ sudo apt-get install texlive texlive-latex-extra texlive-science
$ sudo apt-get install texlive-publishers texlive-lang-portuguese
$ sudo apt-get install latexmk make
```

### Compilar documento

Para compilar o projeto e gerar o documento no formato PDF, execute o seguinte comando dentro do diretório do projeto:

```
$ make
```

### Limpar projeto

Para limpar os arquivos temporários, execute o seguinte comando dentro do diretório do projeto:

```
$ make clean
```

### Agradecimentos

Cristina Murta  
Denise Souza  
Guilherme Tonioli  
Henrique Borges  
Izaquiel Bessas  
Lauro César  
Talles Coelho  
