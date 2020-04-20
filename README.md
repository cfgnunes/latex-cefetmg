# LaTeX CEFET-MG [![Build Status](https://travis-ci.org/cfgnunes/latex-cefetmg.svg?branch=master)](https://travis-ci.org/cfgnunes/latex-cefetmg)

Se você gosta desse modelo, faça uma doação para apoiar o desenvolvedor.
[![paypal](https://www.paypalobjects.com/pt_BR/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=28TY53S7HPN9S)
[![mercadopago](https://http2.mlstatic.com/ui/navigation/4.1.4/mercadopago/logo__small.png)](https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=77777663-0bd99901-1d1b-4d5d-a8d2-ae1d4eb75127)

Modelo não-oficial de trabalho acadêmico desenvolvido para os alunos do [CEFET-MG](http://www.cefetmg.br/).
Este projeto consiste em uma estrutura básica de arquivos em [LaTeX](https://www.latex-project.org/) para o desenvolvimento de trabalhos monográficos (TCC, Dissertação e Tese).
Inspirado no projeto [abnTeX2](https://github.com/abntex/abntex2), o modelo é compatível com as normas [ABNT](http://www.abnt.org.br/) vigentes.

Para um modelo de apresentação em slides, visite o projeto [latex-slides](https://github.com/cfgnunes/latex-slides/).

![exemplo](figuras/figura-exemplo.png)

## Começando

### Pré-requisitos

Esta seção assume o Ubuntu 16.04 (também testado no Ubuntu 20.04), mas o procedimento é semelhante para outras distribuições Linux.
Para poder compilar o documento, basta instalar os seguintes pacotes no terminal:

```sh
sudo apt -y install make
sudo apt -y install latexmk
sudo apt -y install texlive
sudo apt -y install texlive-lang-portuguese
sudo apt -y install texlive-latex-extra
sudo apt -y install texlive-publishers
sudo apt -y install texlive-science
sudo apt -y install texlive-xetex
```

### Compilar documento

Para compilar o projeto e gerar o documento no formato PDF, execute o seguinte comando no terminal:

```sh
make
```

## Contribuindo

Se você encontrar um problema ou quiser melhorar o código, ou até mesmo melhorar o conteúdo, você pode:

- [Abrir um problema](https://github.com/cfgnunes/latex-cefetmg/issues/new) descrevendo o erro ou a ideia de uma funcionalidade nova;
- Criar um fork do projeto, realizar mudanças, e submeter um pull request.

## Autores

- Cristiano Nunes - _Desenvolvedor_
- Cristina Murta - _Sugestões e revisão_
- Henrique Borges - _Sugestões e revisão_

## Agradecimentos

- Denise Souza
- Guilherme Tonioli
- Izaquiel Bessas
- Lauro César
- Talles Coelho
