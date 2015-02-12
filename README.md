# LaTeX CEFET-MG
Modelo para trabalhos acadêmicos do CEFET-MG em LaTex baseado nas normas da ABNT. 

Este projeto consiste em uma customização do projeto abnTeX2 hospedado em: <https://code.google.com/p/abntex2/>

### Pacotes necessários para usuários do Ubuntu

Para instalar os pacotes necessários,
execute os seguintes comandos no terminal: 

```sh
$ sudo apt-get install texlive texlive-latex-extra texlive-science
$ sudo apt-get install texlive-publishers texlive-lang-portuguese
$ sudo apt-get install make
```

Para instalar a versão mais recente do abntex2,
siga as instruções em:
https://code.google.com/p/abntex2/wiki/InstalacaoLinux

### Compilar documento

Para compilar o projeto e gerar o documento no formato PDF,
execute o seguinte comando dentro do diretório do projeto: 

```sh
$ make
```

### Limpar projeto

Para limpar os arquivos temporários,
execute o seguinte comando dentro do diretório do projeto: 

```sh
$ make clean
```
