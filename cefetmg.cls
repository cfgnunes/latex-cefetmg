% ------------------------------------------------------------------------------
% Centro Federal de Educação Tecnológica de Minas Gerais - CEFET-MG
%
% Declaração da classe 'cefetmg', uma extenssão das classes 'memoir' e 'abntex2'
%
% Projeto hospedado em: https://github.com/cfgnunes/latex-cefetmg
%
% Autor: Cristiano Nunes <cfgnunes@gmail.com>
% ------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cefetmg}[2021/05/04 v9.0]

% Captura a opção 'nomecapitulo' para imprir a palavra "Capítulo" no início
\providecommand{\flagnomecapitulo}{false}
\DeclareOption{nomecapitulo}{
    \renewcommand{\flagnomecapitulo}{true}
}

% Repassa os parâmetros à classe 'abntex2'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\PassOptionsToClass{%
    % Opções da classe 'memoir'
    12pt,                  % Tamanho da fonte
    openright,             % Capítulos começam sempre em páginas ímpares
    a4paper,               % Tamanho do papel
    sumario=tradicional,   % Seleciona o sumário tradicional
    % Opções da classe 'babel'
    brazil,                % Idioma do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

% ------------------------------------------------------------------------------
% Pacotes utilizados
% ------------------------------------------------------------------------------
\RequirePackage{hyperref}
\RequirePackage{chngcntr}
\RequirePackage{etoolbox}
\RequirePackage{pdfpages}
\RequirePackage[brazilian, hyperpageref]{backref}
\RequirePackage[portuguese, onelanguage, algoruled]{algorithm2e}
\RequirePackage{color}
\RequirePackage[%
    alf,
    abnt-emphasize=bf,
    bibjustif,
    recuo=0cm,
    abnt-doi=expand,
    abnt-url-package=hyperref,
    abnt-refinfo=yes,
    abnt-etal-cite=3,
    abnt-etal-list=3,
    abnt-thesis-year=final
]{abntex2cite}

% ------------------------------------------------------------------------------
% Configurações gerais
% ------------------------------------------------------------------------------

% Define a cor utilizada nos links do PDF
\definecolor{blue_link}{RGB}{0,80,128}

% Configuração dos links do PDF (pacote: hyperref)
\hypersetup{%
    portuguese,
    colorlinks=true,        % true: links coloridos; false: links em caixas
    linkcolor=blue_link,    % Cor dos links internos
    citecolor=blue_link,    % Cor dos links para as citações
    filecolor=blue_link,    % Cor dos links para arquivos
    urlcolor=blue_link,     % Cor dos links de URLs
    breaklinks=true,
}

% Cria o índice remissivo
\makeindex

% Retira o espaço extra desnecessário nas frases
\frenchspacing

% Aumenta o espaço da largura número da página em TOCs (evitar 'overfull \hbox')
\renewcommand\@pnumwidth{1.8em}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% Adiciona um espaço após as equações
\AtEndEnvironment{equation}{%
    \vspace{8pt}
}

% Posiciona floats sempre no topo da página (em páginas vazias)
% https://github.com/abntex/abntex2/issues/170
\setlength{\@fptop}{5pt}

% Coloca floats sempre acima do rodapé
\feetbelowfloat

% Macro \autoref para equações
\def\equationautorefname~#1\null{Equa\c c\~ao~(#1)\null}

% Comando para colocar rodapés sempre no final da página
\newcommand{\bottomfootnote}{%
    \renewcommand\footnoterule{%
        \vspace*{\fill}%
        \kern-3\p@%
        \hrule%
        \kern2.6\p@%
    }
}

\AfterPreamble{%
    % Colocar rodapés sempre no final da página
    \bottomfootnote
    % Para utilizar múltiplas figuras um uma única figura
    \newsubfloat{figure}
    % Configuração dos metadados do PDF (pacote: hyperref)
    \hypersetup{%
        pdftitle={\@title},
        pdfauthor={\@author}
    }
}

% ------------------------------------------------------------------------------
% Parágrafos
% ------------------------------------------------------------------------------

% Define o tamanho do recuo do parágrafo
\setlength{\parindent}{1.25cm}

% Define o espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.0cm}

% ------------------------------------------------------------------------------
% Fontes
% ------------------------------------------------------------------------------

% Redefine tamanho das fontes de capítulos e seções
% (redefinições da classe 'abntex2')
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\HUGE}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\Large}

\renewcommand{\ABNTEXsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\large}

\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% Redefine tamanho das fontes de figuras
% (redefinições da classe 'memoir')
\captiontitlefont{\small}
\captionnamefont{\small}
\subcaptionsize{\small}
\subcaptionlabelfont{\small}
\subcaptionfont{\small}

% ------------------------------------------------------------------------------
% Definição de novos comandos
% ------------------------------------------------------------------------------

% Comando de dados: Programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comando de dados: Subtítulo do trabalho
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comando de dados: Instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comando de dados: Instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Comando de dados: Tipo de trabalho acadêmico
% (tese, dissertação ou projeto de qualificação)
\providecommand{\imprimirprojeto}{}
\newcommand{\projeto}[1]{\renewcommand{\imprimirprojeto}{#1}}

% Comando de dados: Título acadêmico a ser alcançado (Doutor ou Mestre)
\providecommand{\imprimirtituloAcademico}{}
\newcommand{\tituloAcademico}[1]{\renewcommand{\imprimirtituloAcademico}{#1}}

% Comando de dados: Área de concentração do Programa
\newcommand{\imprimirareaconcentracaoRotulo}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Comando de dados: Linha de pesquisa do Programa
\newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
\providecommand{\imprimirlinhapesquisa}{}
\newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}

% Comando de figura: Logomarca da instituição
\providecommand{\imprimirlogoinstituicao}{}
\newcommand{\logoinstituicao}[2]{\renewcommand{\imprimirlogoinstituicao}%
    {\includegraphics[width={#1}\textwidth]{#2}}}

% Comando de listas: Imprimir lista de figuras
\newcommand{\imprimirlistafiguras}{%
    \pdfbookmark[0]{\listfigurename}{lof}
    \listoffigures*
    \cleardoublepage
}

% Comando de listas: Imprimir lista de tabelas
\newcommand{\imprimirlistatabelas}{%
    \pdfbookmark[0]{\listtablename}{lot}
    \listoftables*
    \cleardoublepage
}

% Comando de listas: Imprimir lista de quadros
\newcommand{\imprimirlistaquadros}{%
    \pdfbookmark[0]{\listofquadrosname}{loq}
    \listofquadros*
    \cleardoublepage
}

% Comando de listas: Imprimir lista de quadros
\newcommand{\imprimirlistaalgoritmos}{%
    \newcommand{\algoritmoname}{Algoritmo}
    \renewcommand{\listalgorithmcfname}{Lista de Algoritmos}

    \floatname{algocf}{\algoritmoname}
    \newlistof{listofalgoritmos}{loa}{\listalgoritmoname}
    \newlistentry{algocf}{loa}{0}

    \counterwithout{algocf}{chapter}
    \renewcommand{\cftalgocfname}{\algoritmoname\space}
    \renewcommand*{\cftalgocfaftersnum}{\hfill\textendash\hfill}

    \pdfbookmark[0]{\listalgorithmcfname}{loa}
    \listofalgorithms
    \cleardoublepage
}

% Comando: Imprimir sumário
\newcommand{\imprimirsumario}{%
    \pdfbookmark[0]{\contentsname}{toc}
    \tableofcontents*
    \cleardoublepage
}

% Comando: Imprimir referências
\newcommand{\imprimirreferencias}[1]{%
    % Carrega o arquivo "referencias.bib" com as referências do trabalho
    \bibliography{#1}{}
    % Define o estilo ABNT para formatar a lista de referências
    \bibliographystyle{abntex2-alf}
}

% ------------------------------------------------------------------------------
% Estilo de elementos
% ------------------------------------------------------------------------------

% Elementos pré-textuais
% (redefinições da classe 'abntex2')
\renewcommand{\pretextual}{%
    % Pela ABNT, NBR 14724/2011, as folhas ou páginas
    % pré-textuais devem ser contadas, mas não numeradas.
    %\pagenumbering{roman}              % Tipo de numeração das páginas
    \pagestyle{empty}
    \aliaspagestyle{chapter}{empty}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}

% Configura layout para elementos textuais
% (redefinições da classe 'abntex2')
\renewcommand{\textual}{%
    \ifthenelse{\equal{\flagnomecapitulo}{true}}{%
        \chapterstyle{default}
    }{%
        \chapterstyle{abnt}
    }
    \setlength{\beforechapskip}{-30pt}  % Remove espaço antes dos títulos
    %\pagenumbering{arabic}             % Tipo de numeração das páginas
    \pagestyle{abntheadings}
    \aliaspagestyle{chapter}{abntchapfirst}
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Configura layout para elementos pós-textuais
% (redefinições da classe 'abntex2')
\renewcommand{\postextual}{%
    \pagestyle{abntheadings}
}

% ------------------------------------------------------------------------------
% Objetos flutuantes
% ------------------------------------------------------------------------------

% Comando que trata o objeto flutuante "Fonte"
% (redefinições da classe 'abntex2')
\renewcommand{\fonte}[1]{%
    \vspace{4pt}\break%
    \centering\footnotesize{Fonte: #1}
}

% ------------------------------------------------------------------------------
% Sumário
% ------------------------------------------------------------------------------

% Travessão no sumário para apêndices e anexos
% (redefinições da classe 'memoir')
\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}

% Fontes da seção \part no sumário
% (redefinições da classe 'memoir')
\renewcommand{\cftpartfont}{\bfseries\large}
\renewcommand{\cftpartpagefont}{\normalfont\cftchapterfont}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{2.0ex}

% ------------------------------------------------------------------------------
% Tradução de labels
% ------------------------------------------------------------------------------

% Define os labels para português
% (redefinições da classe 'abntex2')
\addto\captionsbrazil{%
    % Ajusta nomes padrões do babel
    \renewcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
    \renewcommand{\listadesimbolosname}{Lista de S\'{i}mbolos}
    \renewcommand{\listfigurename}{Lista de Figuras}
    \renewcommand{\listtablename}{Lista de Tabelas}
    \renewcommand{\indexname}{\'{I}ndice Remissivo}
    % Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Se\c{c}\~ao}
    \renewcommand{\subsectionautorefname}{Subse\c{c}\~ao}
    \renewcommand{\subsubsectionautorefname}{Subsubse\c{c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse\c{c}\~ao}
    \renewcommand{\algorithmautorefname}{Algoritmo}
    \renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}
    \renewcommand*{\backrefalt}[4]{%
        \ifcase #1
            Nenhuma cita\c{c}\~ao no texto.
        \or
            Citado na p\'agina #2.
        \else
            Citado #1 vezes nas p\'aginas #2.
        \fi
    }
}

% ------------------------------------------------------------------------------
% Listas
% ------------------------------------------------------------------------------

% Cria a lista de quadros
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}

% Lista de abreviaturas e siglas
% (redefinições da classe 'abntex2')
\renewenvironment{siglas}{%
    \pretextualchapter{\listadesiglasname}
    \begin{symbols}
    \setSpacing{0.0} % <-- Adicionado para remover os espaços entre as listas
}{%
    \end{symbols}
    \cleardoublepage
}

% Lista de simbolos
% (redefinições da classe 'abntex2')
\renewenvironment{simbolos}{%
    \pretextualchapter{\listadesimbolosname}
    \begin{symbols}
    \setSpacing{0.0} % <-- Adicionado para remover os espaços entre as listas
}{%
    \end{symbols}
    \cleardoublepage
}

% ------------------------------------------------------------------------------
% Capa
% ------------------------------------------------------------------------------
\renewcommand{\imprimircapa}{%
    \begin{capa}
        % Imprime logo, instituição e o nome do programa
        \begin{center}
            \imprimirlogoinstituicao{} \\
            \normalfont\scshape{\imprimirinstituicao} \\
            \normalfont\scshape{\imprimirprograma} \\
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{2}}

        % Imprime o título do trabalho
        \begin{center}
            \ABNTEXchapterfont\LARGE\scshape\SingleSpacing{%
                \imprimirtitulo%
                \abntex@ifnotempty{\imprimirsubtitulo}{%
                    {:\\}{\Large\imprimirsubtitulo}}%
            }
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{1}}

        % Imprime o nome do autor
        \begin{center}
            \normalfont\large\scshape\textbf\imprimirautor
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{1}}

        % Imprime os orientadores
        \begin{center}
            \abntex@ifnotempty{\imprimirorientador}{%
                \small\imprimirorientadorRotulo~\imprimirorientador \\
                \small\imprimirinstOrientador \\
            }
            \abntex@ifnotempty{\imprimircoorientador}{%
                \begin{SingleSpacing}\par\end{SingleSpacing}
                \small\imprimircoorientadorRotulo~\imprimircoorientador \\
                \small\imprimirinstCoorientador
            }
        \end{center}

        % Espaço vertical
        \vspace*{\stretch{1}}

        % Imprime local e data
        \begin{center}
            \normalfont\scshape{\imprimirlocal}\\
            \normalfont\scshape{\imprimirdata}
        \end{center}

    \end{capa}
}

% ------------------------------------------------------------------------------
% Folha de rosto
% ------------------------------------------------------------------------------
\renewcommand{\folhaderostocontent}{%

    % Imprime o nome do autor
    \begin{center}
        \normalfont\large\scshape\textbf\imprimirautor
    \end{center}

    % Espaço vertical
    \vspace*{\stretch{2}}

    % Imprime o título do trabalho
    \begin{center}
        \ABNTEXchapterfont\LARGE\scshape\SingleSpacing{%
            \imprimirtitulo%
            \abntex@ifnotempty{\imprimirsubtitulo}{%
                {:\\}{\Large\imprimirsubtitulo}}%
        }
    \end{center}

    % Espaço vertical
    \vspace*{\stretch{0.5}}

    % Imprime o preambulo
    \abntex@ifnotempty{\imprimirpreambulo}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \hyphenpenalty=10000\hbadness=10000%
                \imprimirpreambulo
            \end{minipage}
        \end{SingleSpacing}
    }

    % Imprime a área de concentração
    \abntex@ifnotempty{\imprimirareaconcentracao}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \hyphenpenalty=10000\hbadness=10000%
                \imprimirareaconcentracaoRotulo~\imprimirareaconcentracao
            \end{minipage}
        \end{SingleSpacing}
    }

    % Imprime a linha de pesquisa
    \abntex@ifnotempty{\imprimirlinhapesquisa}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \hyphenpenalty=10000\hbadness=10000%
                \imprimirlinhapesquisaRotulo~\imprimirlinhapesquisa
            \end{minipage}
        \end{SingleSpacing}
    }

    % Imprime o nome do orientador
    \abntex@ifnotempty{\imprimirorientador}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \hyphenpenalty=10000\hbadness=10000%
                \imprimirorientadorRotulo~\imprimirorientador \\
                \imprimirinstOrientador
            \end{minipage}
        \end{SingleSpacing}
    }

    % Imprime o nome do coorientador
    \abntex@ifnotempty{\imprimircoorientador}{%
        \begin{SingleSpacing}
            \hspace{.3\textwidth}
            \begin{minipage}{.6\textwidth}
                \hyphenpenalty=10000\hbadness=10000%
                \imprimircoorientadorRotulo~\imprimircoorientador \\
                \imprimirinstCoorientador
            \end{minipage}
        \end{SingleSpacing}
    }

    % Espaço vertical
    \vspace*{\stretch{1}}

    % Imprime instituição, nome do programa, local e data
    \begin{center}
        \normalfont\scshape{\imprimirinstituicao}\\
        \normalfont\scshape{\imprimirprograma}\\
        \normalfont\scshape{\imprimirlocal}\\
        \normalfont\scshape{\imprimirdata}
    \end{center}
}

% ------------------------------------------------------------------------------
% Folha de aprovação
% ------------------------------------------------------------------------------
\newcommand{\importarfolhadeaprovacao}[1]{%
    \begin{folhadeaprovacao}
        \IfFileExists{#1}{\includepdf[pages=last-last]{#1}}{%
            \vspace*{\fill}
            \begin{adjustwidth}{2cm}{2cm}%
                \begin{center}
                    Coloque o arquivo \textbf{\detokenize{#1}}, fornecido pela
                    instituição, no mesmo diretório do trabalho.
                    Assim, a folha de aprovação será automaticamente
                    inserida aqui.
                \end{center}
            \end{adjustwidth}
        }
    \end{folhadeaprovacao}
}

% ------------------------------------------------------------------------------
% Ficha catalográfica
% ------------------------------------------------------------------------------
\newcommand{\importarfichacatalografica}[1]{%
    \begin{fichacatalografica}
        \IfFileExists{#1}{\includepdf[pages=last-last]{#1}}{%
            \vspace*{\fill}
            \begin{adjustwidth}{2cm}{2cm}%
                \begin{center}
                    Coloque o arquivo \textbf{\detokenize{#1}}, fornecido pela
                    instituição, no mesmo diretório do trabalho.
                    Assim, a ficha catalográfica será automaticamente
                    inserida aqui.
                \end{center}
            \end{adjustwidth}
        }
    \end{fichacatalografica}
}

% ------------------------------------------------------------------------------
% Dedicatória
% ------------------------------------------------------------------------------
\renewenvironment{dedicatoria}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}

% ------------------------------------------------------------------------------
% Epígrafe
% ------------------------------------------------------------------------------
\renewenvironment{epigrafe}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}

% ------------------------------------------------------------------------------
% Resumo
% ------------------------------------------------------------------------------
% (redefinições da classe 'abntex2')
\renewenvironment{resumo}[1][\resumoname]{%
    \PRIVATEbookmarkthis{#1}
    \renewcommand{\abstractnamefont}{\chaptitlefont}
    \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
    \begin{abstract}
    \vspace{23pt} % <-- Adicionado para manter um espaço igual aos capítulos
}{%
    \end{abstract}\PRIVATEclearpageifneeded
}
