%
% abntex2-cefetmg.cls
%
%
%   Autor: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>
%
%   Dependência: abntex2 >= 1.7
%
%   Agradecimentos:
%       Lauro César https://code.google.com/p/abntex2/
%       Henrique Borges <henrique@lsi.cefetmg.br>
%       Cristina Murta <cristina@decom.cefetmg.br>
%       Denise Souza <densouza@gmail.com>


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntex2-cefetmg}[2014/01/25 v5.2]

% Repassa os parâmetros ao abntex2
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{
    % Opções da classe memoir
    12pt,                       % Tamanho da fonte
    openright,                  % Capítulos começam em página ímpar (insere página vazia caso preciso)
    a4paper,                    % Tamanho do papel
    sumario=tradicional,        % Seleciona o sumário tradicional
    % Opções da classe abntex2
    %chapter=TITLE,             % Títulos de capítulos convertidos em letras maiúsculas
    %section=TITLE,             % Títulos de seções convertidos em letras maiúsculas
    %subsection=TITLE,          % Títulos de subseções convertidos em letras maiúsculas
    %subsubsection=TITLE,       % Títulos de sub-subseções convertidos em letras maiúsculas
    % Opções do pacote babel
    brazil,                     % Idioma do documento
    }{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian,hyperpageref]{backref}        % Produzir índice nas referências
\RequirePackage{makeidx}                                % Produzir índice remissivo de palavras
\RequirePackage{chngcntr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONFIGURACOES GERAIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Configurações do pacote backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
            Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% Redefine títulos
\renewcommand{\folhaderostoname}{Folha de Rosto}
\renewcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
\addto\captionsbrazil{
    % Ajusta nomes padrões do babel
    \renewcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
    \renewcommand{\listadesimbolosname}{Lista de S\'imbolos}
    \renewcommand{\listfigurename}{Lista de Figuras}
    \renewcommand{\listtablename}{Lista de Tabelas}
    % Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Se{\c c}\~ao}
    \renewcommand{\subsectionautorefname}{Subse{\c c}\~ao}
    \renewcommand{\subsubsectionautorefname}{Subse{\c c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse{\c c}\~ao}
}
\newcommand{\listofquadrosname}{Lista de Quadros}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESTILO DE ELEMENTOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Elementos pré-textuais
\renewcommand{\pretextual}{
    \pagenumbering{roman} % Algarismos romanos
    \aliaspagestyle{chapter}{plain}
    \pagestyle{plain}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}

% Elementos textuais
\renewcommand{\textual}{
    \pagenumbering{arabic} % Inicia a numeração em 1
    \ifthenelse{\equal{\ABNTEXisarticle}{true}}{
        \pagestyle{plain}
    }
    {
        \pagestyle{abntheadings}
        \aliaspagestyle{chapter}{abntchapfirst}
    }
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Elementos pós-textuais
\renewcommand{\postextual}{
    \phantompart
    \renewcommand{\indexname}{\'Indice Remissivo}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMANDOS DE DADOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comandos de dados - programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comandos de dados - subtítulo
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comandos de dados - instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comandos de dados - instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Criação do comando para área de concentração (folha de rosto)
\newcommand{\imprimirareaconcentracaoRotulo}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Criação do comando para linha de pesquisa (folha de rosto)
\newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
\providecommand{\imprimirlinhapesquisa}{}
\newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OBJETOS FLUTUANTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]{
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \centering\small{Fonte: #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]{
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{p{.05\textwidth}p{.9\textwidth}}
        Nota: & #1
    \end{tabular}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARÁGRAFOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tamanho da endentação do parágrafo
\setlength{\parindent}{1.3cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.2cm}

% Espaço entre o texto e o footer
\setlength{\footskip}{0.0cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Redefinição de fontes
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\Large}

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUMÁRIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Travessão no sumário para apêndices e anexos
\renewcommand{\cftchapteraftersnum}{\hfill{} -- \hfill{}}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cria a lista de quadros
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\renewcommand{\imprimircapa}{
    \begin{capa}

        \hspace{-2.0cm}
        \begin{minipage}{.2\textwidth}
            \includegraphics[width=0.8\textwidth]{./04-figuras/cefet_logo}
        \end{minipage}
        \quad
        \hspace{-1.5cm}
        \begin{minipage}{.9\textwidth}
            \begin{center}
            \normalfont\scshape{\imprimirinstituicao}\\
            \normalfont\scshape{\imprimirprograma}\\
            \abntex@ifnotempty{\imprimirareaconcentracao}
            {
                \normalfont\scshape{\imprimirareaconcentracao}
            }
            \end{center}
        \end{minipage}

        \vspace*{200pt}

        \begin{center}
            \ABNTEXchapterfont\Large\scshape\imprimirtitulo
            \abntex@ifnotempty{\imprimirsubtitulo}{
                {\ABNTEXchapterfont\Large\scshape{\hspace*{-0.3em}: }}{\ABNTEXchapterfont\large\scshape\imprimirsubtitulo}
            }
        \end{center}

        \vspace*{80pt}

        \begin{center}
            \large\normalfont\scshape\textbf\imprimirautor
        \end{center}

        \vspace*{10pt}

        \begin{center}
            \small\imprimirorientadorRotulo{} \imprimirorientador \\
            \small\imprimirinstOrientador \\
            \abntex@ifnotempty{\imprimircoorientador}
            {
                \begin{SingleSpacing}\par\end{SingleSpacing}
                \small\imprimircoorientadorRotulo{} \imprimircoorientador \\
                \small\imprimirinstCoorientador
            }
        \end{center}

        \vspace*{\fill}

        \begin{center}
            \normalfont\scshape{\imprimirlocal}\\
            \normalfont\scshape{\imprimirdata}
        \end{center}

    \end{capa}
}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\renewcommand{\folhaderostocontent}{
    \begin{center}
        {\large\normalfont\scshape\textbf\imprimirautor}
    \end{center}

    \vspace*{150pt}

    \begin{center}
        \ABNTEXchapterfont\Large\scshape\imprimirtitulo
        \abntex@ifnotempty{\imprimirsubtitulo}{
            {\ABNTEXchapterfont\Large\scshape{\hspace*{-0.3em}: }}{\ABNTEXchapterfont\large\scshape\imprimirsubtitulo}
        }
    \end{center}

    \vspace*{90pt}

    \abntex@ifnotempty{\imprimirpreambulo}{
        \SingleSpacing
        \begin{tabular}{p{.25\textwidth}p{.13\textwidth}p{.44\textwidth}}
            & \multicolumn{2}{p{.6\textwidth}}{\small\hyphenpenalty=10000{\imprimirpreambulo}} \\ & & \\
            \abntex@ifnotempty{\imprimirareaconcentracao}
            {
                & \multicolumn{2}{p{.6\textwidth}}{\small\hyphenpenalty=10000{\imprimirareaconcentracaoRotulo\imprimirareaconcentracao}} \\ & & \\
            }
            \abntex@ifnotempty{\imprimirlinhapesquisa}
            {
                    & \multicolumn{2}{p{.6\textwidth}}{\small\hyphenpenalty=10000{\imprimirlinhapesquisaRotulo\imprimirlinhapesquisa}} \\ & & \\
            }
            & \small\imprimirorientadorRotulo & \imprimirorientador \\
            & & \small\imprimirinstOrientador \\ & & \\
            \abntex@ifnotempty{\imprimircoorientador}
            {
                & \small\imprimircoorientadorRotulo & \imprimircoorientador \\
                & & \small\imprimirinstCoorientador
            }
        \end{tabular}
    }

    \vspace*{\fill}

    \begin{center}
        \normalfont\scshape{\imprimirinstituicao}\\
        \normalfont\scshape{\imprimirprograma}\\
        \normalfont\scshape{\imprimirlocal}\\
        \normalfont\scshape{\imprimirdata}
    \end{center}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEDICATORIA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{dedicatoria}[1][]
{
    \ifthenelse{\equal{#1}{}}{
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EPIGRAFE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{epigrafe}[1][]
{
    \ifthenelse{\equal{#1}{}}{
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
}
