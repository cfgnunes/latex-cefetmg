%
% abnt-cefetmg.cls
%
%
%	Autor: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>
%
%	dependência: abntex2 >= 1.7

\NeedsTeXFormat{LaTeX2e}

\PassOptionsToClass{
	% -- opções da classe memoir --
	12pt,				% tamanho da fonte
	openright,			% capítulos começam em pág ímpar (insere página vazia caso preciso)
	oneside,			% para impressão em verso e anverso. Oposto a oneside
	a4paper,			% tamanho do papel.
	sumario=tradicional,		% seleciona o sumário tradicional
	% -- opções da classe abntex2 --
	%chapter=TITLE,			% títulos de capítulos convertidos em letras maiúsculas
	%section=TITLE,			% títulos de seções convertidos em letras maiúsculas
	%subsection=TITLE,		% títulos de subseções convertidos em letras maiúsculas
	%subsubsection=TITLE,		% títulos de subsubseções convertidos em letras maiúsculas
	% -- opções do pacote babel --
	brazil,				% o último idioma é o principal do documento
	}{abntex2}

\LoadClass{abntex2}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMANDOS DE DADOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% comandos de dados - programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARÁGRAFOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tamanho da identação do parágrafo
\setlength{\parindent}{1.3cm}

% espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.2cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% redefinição de fontes
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

% travessão no sumário para apêndices e anexos
\renewcommand{\cftchapteraftersnum}{\hfill{} -- \hfill{}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define os títulos das listas
\addto\captionsbrazil{
	\renewcommand{\listadesiglasname}{Lista de abreviaturas e siglas}
	\renewcommand{\listadesimbolosname}{Lista de s\'imbolos}
	\renewcommand{\listfigurename}{Lista de figuras}
	\renewcommand{\listtablename}{Lista de tabelas}
}
\newcommand{\listofquadrosname}{Lista de quadros}
\newcommand{\listofalgoritmosname}{Lista de algoritmos}

% cria a lista de quadros
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

% cria a lista de algoritmos
\newcommand{\algoritmoname}{Algoritmo}
\newfloat[chapter]{algoritmo}{loa}{\algoritmoname}
\newlistof{listofalgoritmos}{loa}{\listofalgoritmosname}
\newlistentry{algoritmo}{loa}{0}

\counterwithout{algoritmo}{chapter}
\renewcommand{\cftalgoritmoname}{\algoritmoname\space} 
\renewcommand*{\cftalgoritmoaftersnum}{\hfill--\hfill}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\renewcommand{\imprimircapa}{
	\begin{capa}

		\begin{center}
			\vspace*{-2.7cm}
			\includegraphics[width=0.15\textwidth]{./04-figuras/cefet_logo.eps}

			\normalfont\scshape{\imprimirinstituicao}\\
			\normalfont\scshape{\imprimirprograma}
		\end{center}

		\vspace{50pt}
		\center
		\large\normalfont\scshape\textbf\imprimirautor

		\vfill
		\ABNTEXchapterfont\Large\scshape\imprimirtitulo

		\vfill
		\vspace{100pt}
		\begin{center}
			\normalfont\scshape\normalsize{\imprimirlocal}\\
			\normalfont\scshape\normalsize{\imprimirdata}
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
	
		\vspace*{\fill}\vspace*{\fill}
		\begin{center}
			\ABNTEXchapterfont\Large\scshape\imprimirtitulo
		\end{center}
		\vspace*{\fill}
	
		\abntex@ifnotempty{\imprimirpreambulo}{
			\hspace{.45\textwidth}
			\begin{minipage}{.5\textwidth}
				\SingleSpacing
				\imprimirpreambulo
			\end{minipage}
			\vspace*{\fill}
		}

		{\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}
	
		{\large\imprimirorientadorRotulo~\imprimirorientador\par}
		\abntex@ifnotempty{\imprimircoorientador}{
			{\large\imprimircoorientadorRotulo~\imprimircoorientador}
		}
		\vspace*{\fill}

		\begin{center}
			\normalfont\scshape\normalsize{\imprimirlocal}\\
			\normalfont\scshape\normalsize{\imprimirdata}
		\end{center}

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
