# latex-cefet-mg
Modelo para trabalhos acadêmicos do CEFET-MG em LaTex baseado nas normas da ABNT. 

Este projeto consiste em uma customização do projeto abntex2 hospedado em: <https://code.google.com/p/abntex2/>


## Instalação

### Ubuntu

Para instalar os pacotes necessários,
execute os seguintes comandos no terminal: 

<code> $ sudo apt-get install texlive texlive-latex-extra texlive-science</code>

<code> $ sudo apt-get install texlive-publishers texlive-lang-portuguese</code>

<code> $ sudo apt-get install make </code>

Para instalar a versão mais recente do abntex2,
siga as instruções em:
<https://code.google.com/p/abntex2/wiki/InstalacaoLinux>


## Comandos

### Compilar

Para compilar o projeto e gerar o arquivo PDF,
execute o seguinte comando no terminal dentro do diretório do projeto: 

<code> $ make </code>

### Limpar projeto

Para limpar os arquivos temporários,
execute o seguinte comando no terminal dentro do diretório do projeto: 

<code> $ make clean </code>
