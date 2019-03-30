# LaTeX CEFET-MG

[![Build Status](https://travis-ci.org/cfgnunes/latex-cefetmg.svg?branch=master)](https://travis-ci.org/cfgnunes/latex-cefetmg)

Modelo de trabalho acadêmico desenvolvido para os alunos do [CEFET-MG](http://www.cefetmg.br/).
Este projeto consiste em uma estrutura básica de arquivos em [LaTeX](https://www.latex-project.org/) para o desenvolvimento de trabalhos monográficos.
Inspirado no projeto [abnTeX2](https://github.com/abntex/abntex2), o modelo é compatível com as normas [ABNT](http://www.abnt.org.br/) vigentes.

## Começando

### Instalar os pré-requisitos (Ubuntu)

Esta seção assume o Ubuntu 16.04 (também testado no Ubuntu 18.04), mas o procedimento é semelhante para outras distribuições Linux.
Para instalar os pacotes necessários, execute os seguintes comandos no terminal:

```sh
sudo appt-get install make
sudo appt-get install latexmk
sudo appt-get install texlive
sudo appt-get install texlive-lang-portuguese
sudo appt-get install texlive-latex-extra
sudo appt-get install texlive-publishers
sudo appt-get install texlive-science
sudo appt-get install texlive-xetex
sudo appt-get install ghostscript

```

### Compilar documento

Para compilar o projeto e gerar o documento no formato PDF, execute o seguinte comando no terminal:

```sh
make
```

### Gerar uma versão compacta do documento

Para gerar uma vesão mais compacta do documento final no formato PDF, execute o seguinte comando no terminal após compilar o documento:

```sh
make compress
```

### Limpar arquivos temporários

Para limpar os arquivos temporários, execute o seguinte comando no terminal:

```sh
make clean
```

## Contribuindo

Se você encontrar um problema ou quiser melhorar o código, ou até mesmo melhorar o conteúdo, você pode:

* [Abrir um problema](https://github.com/cfgnunes/latex-cefetmg/issues/new) descrevendo o erro ou a ideia de uma funcionalidade nova;
* Criar um fork do projeto, realizar mudanças, e submeter um pull request.

## Autores

* **Cristiano Nunes** - *Desenvolvimento*
* **Cristina Murta** - *Sugestões e revisão*
* **Henrique Borges** - *Sugestões e revisão*

## Agradecimentos

* Denise Souza
* Guilherme Tonioli
* Izaquiel Bessas
* Lauro César
* Talles Coelho
