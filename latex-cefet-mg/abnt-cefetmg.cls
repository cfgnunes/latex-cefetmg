%
% abnt-cefetmg.cls
%
%
%	Autor: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>
%	Baseado nas classes:
%			abnt.cls
%			abnt-UTFPR.cls
%			normas-utf-tex.cls
%
%	Agradecimentos:
%		Miguel Vinicius Santini Frasson <frasson@icmc.usp.br>
%		Diogo Rosa Kuiaski <diogo.kuiaski@gmail.com>
%		Hugo Vieira Neto <hvieir@utfpr.edu.br>
%		César M. Vargas Benítez <cesarvargasb@gmail.com>
%		Marcos Talau <talau@users.sourceforge.net>
%
%	Dependência: abntex >= 0.9-beta2

\NeedsTeXFormat{LaTeX2e}

\RequirePackage{silence}
\WarningFilter{relsize}{Failed to get list of defined font sizes.} % ignora o warning causado pelo abnt.cls + relsize.sty

\RequirePackage{float} % utilizado para construir lista de gráficos e quadros
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage{uniquecounter}

\newboolean{@myopt@logo}
\setboolean{@myopt@logo}{false}
\DeclareOption{logo}{\setboolean{@myopt@logo}{true}}

\newboolean{@myopt@trabalhos}
\setboolean{@myopt@trabalhos}{false}
\DeclareOption{trabalhos}{\setboolean{@myopt@trabalhos}{true}}

\newboolean{@myopt@oneside}
\setboolean{@myopt@oneside}{true}
\DeclareOption{oneside}{\setboolean{@myopt@oneside}{true}}
\DeclareOption{twoside}{\setboolean{@myopt@oneside}{false}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abnt}}
\ProcessOptions*
\ifthenelse{\boolean{@myopt@oneside}}
	{\PassOptionsToClass{oneside}{abnt}}
	{\PassOptionsToClass{twoside}{abnt}}

%\PassOptionsToClass{pagestart=firstchapter, chapter=TITLE, section=TITLE, floatnumber=continuous}{abnt}
\PassOptionsToClass{pagestart=firstchapter, appendix=Name, floatnumber=continuous}{abnt}

\LoadClass{abnt}

\RequirePackage{hyperref}
\RequirePackage{hypdvips}
\footnotecolor{black}

\makeatletter % para interpretação do símbolo @


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINICOES DE COMANDOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\DOCdepartamentodata}{}
\newcommand{\departamento}[1]{\renewcommand{\DOCdepartamentodata}{#1}}

\providecommand{\DOCprogramadata}{}
\newcommand{\programa}[1]{\renewcommand{\DOCprogramadata}{#1}}

\providecommand{\DOCareadata}{}
\newcommand{\area}[1]{\renewcommand{\DOCareadata}{#1}}

\providecommand{\DOCdocumentodata}{}
\newcommand{\documento}[1]{\renewcommand{\DOCdocumentodata}{#1}}

\providecommand{\DOCtitulacaodata}{}
\newcommand{\titulacao}[1]{\renewcommand{\DOCtitulacaodata}{#1}}

\providecommand{\DOCunidadedata}{}
\newcommand{\unidade}[1]{\renewcommand{\DOCunidadedata}{#1}}

\providecommand{\DOCautordoisdata}{}
\newcommand{\autordois}[1]{\renewcommand{\DOCautordoisdata}{#1}}

\providecommand{\DOCautortresdata}{}
\newcommand{\autortres}[1]{\renewcommand{\DOCautortresdata}{#1}}

\providecommand{\DOCautorquatrodata}{}
\newcommand{\autorquatro}[1]{\renewcommand{\DOCautorquatrodata}{#1}}

\providecommand{\DOCautorcincodata}{}
\newcommand{\autorcinco}[1]{\renewcommand{\DOCautorcincodata}{#1}}

\providecommand{\DOCautorseisdata}{}
\newcommand{\autorseis}[1]{\renewcommand{\DOCautorseisdata}{#1}}

\providecommand{\DOCautorsetedata}{}
\newcommand{\autorsete}[1]{\renewcommand{\DOCautorsetedata}{#1}}

\providecommand{\DOCtitledata}{}
\renewcommand{\title}[1]{\renewcommand{\DOCtitledata}{#1}}

\providecommand{\DOCsubtitulodata}{}
\newcommand{\subtitulo}[1]{\renewcommand{\DOCsubtitulodata}{#1}}

\providecommand{\DOCpalavraschavedata}{}
\newcommand{\palavraschave}[1]{\renewcommand{\DOCpalavraschavedata}{#1}}

\providecommand{\DOCkeywordsdata}{}
\newcommand{\keywords}[1]{\renewcommand{\DOCkeywordsdata}{#1}}

\providecommand{\DOCcoorientadorbdata}{}
\newcommand{\coorientadorb}[1]{\renewcommand{\DOCcoorientadorbdata}{#1}}

\providecommand{\ABNTtextoaprovacaodata}{}
\newcommand{\textoaprovacao}[1]{\renewcommand{\ABNTtextoaprovacaodata}{#1}}

\providecommand{\ABNTprimeiroassinadata}{}
\newcommand{\primeiroassina}[1]{\renewcommand{\ABNTprimeiroassinadata}{#1}}

\providecommand{\ABNTsegundoassinadata}{}
\newcommand{\segundoassina}[1]{\renewcommand{\ABNTsegundoassinadata}{#1}}

\providecommand{\ABNTterceiroassinadata}{}
\newcommand{\terceiroassina}[1]{\renewcommand{\ABNTterceiroassinadata}{#1}}

\providecommand{\ABNTquartoassinadata}{}
\newcommand{\quartoassina}[1]{\renewcommand{\ABNTquartoassinadata}{#1}}

\providecommand{\ABNTlocaldiadata}{}
\newcommand{\localdia}[1]{\renewcommand{\ABNTlocaldiadata}{#1}}

\newcommand{\DOCifnotempty}[3]{\ifthenelse{\not\equal{#1}{}}{#2}{#3}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\capa}{
	\begin{titlepage}
		\pagestyle{empty}
		\begin{center}
			\ifthenelse{\boolean{@myopt@logo}}
			{
				\vspace*{-2.7cm}
				\includegraphics[width=0.15\textwidth]{./figuras/cefet_logo.eps}
			}
			{}
			\par
			\normalfont\scshape{\ABNTinstituicaodata}\\
			\normalfont\scshape{\DOCprogramadata}\\
			\ABNTifnotempty{\DOCdepartamentodata}
			{
				\normalfont\scshape{\DOCdepartamentodata}
			}
		\end{center}
		\ifthenelse{\boolean{@myopt@trabalhos}}
		{
			\vspace{180pt}
			\begin{center}
				\begin{espacosimples}
					\ABNTchapterfont\Large\scshape{\ABNTtitulodata}
				\end{espacosimples}
			\end{center}
			\begin{center}
				\begin{espacosimples}
					\DOCifnotempty{\DOCsubtitulodata}{\Large\scshape\DOCsubtitulodata}{\vspace{28pt}}
				\end{espacosimples}
			\end{center}
			\vspace{60pt}
			\hspace{-40pt}
			\begin{tabular}{r l}
				\large\normalfont\scshape\textbf{Professor:}& \large\normalfont\ABNTorientadordata\\
				\large\normalfont\scshape\textbf{\DOCifnotempty{\DOCautordoisdata}{Alunos:}{Aluno:}} & \large\normalfont\ABNTautordata\\
				\DOCifnotempty{\DOCautordoisdata}{& \large\normalfont\DOCautordoisdata\\}{}
				\DOCifnotempty{\DOCautortresdata}{& \large\normalfont\DOCautortresdata\\}{}
				\DOCifnotempty{\DOCautorquatrodata}{& \large\normalfont\DOCautorquatrodata\\}{}
				\DOCifnotempty{\DOCautorcincodata}{& \large\normalfont\DOCautorcincodata\\}{}
				\DOCifnotempty{\DOCautorseisdata}{& \large\normalfont\DOCautorseisdata\\}{}
				\DOCifnotempty{\DOCautorsetedata}{& \large\normalfont\DOCautorsetedata\\}{}
			\end{tabular}
		}
		{
			\vspace{40pt}
			\begin{center}
				\begin{espacosimples}
					\large\normalfont\scshape\textbf{\ABNTautordata}\\
					\DOCifnotempty{\DOCautordoisdata}{\large\normalfont\scshape\textbf{\DOCautordoisdata}\\}{\vspace{18pt}}
					\DOCifnotempty{\DOCautortresdata}{\large\normalfont\scshape\textbf{\DOCautortresdata}\\}{\vspace{18pt}}
					\DOCifnotempty{\DOCautorquatrodata}{\large\normalfont\scshape\textbf{\DOCautorquatrodata}\\}{\vspace{18pt}}
					\DOCifnotempty{\DOCautorcincodata}{\large\normalfont\scshape\textbf{\DOCautorcincodata}\\}{\vspace{18pt}}
					\DOCifnotempty{\DOCautorseisdata}{\large\normalfont\scshape\textbf{\DOCautorseisdata}\\}{\vspace{18pt}}
					\DOCifnotempty{\DOCautorsetedata}{\large\normalfont\scshape\textbf{\DOCautorsetedata}\\}{\vspace{18pt}}
				\end{espacosimples}
			\end{center}
			\vspace{40pt}
			\begin{center}
				\begin{espacosimples}
					\ABNTchapterfont\Large\scshape{\ABNTtitulodata}
				\end{espacosimples}
			\end{center}
			\begin{center}
				\begin{espacosimples}
					\DOCifnotempty{\DOCsubtitulodata}{\Large\scshape\DOCsubtitulodata}{\vspace{28pt}}
				\end{espacosimples}
			\end{center}
		}
		\vfill
		\begin{center}
			\normalfont\scshape{\ABNTlocaldata}\\
			\normalfont\scshape{\ABNTdatadata}
		\end{center}
		\if@openright\cleardoublepage\else\clearpage\fi
	\end{titlepage}
	\if@twoside\addtocounter{page}{-2}\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\campoduplo}[2]
{
	\leftskip 0em
	\@tempdima 6.5em
	\advance\leftskip\@tempdima \null\nobreak\hskip -\leftskip
	{#1#2\hfil}
}

\renewcommand{\folhaderosto}
{
	\begin{titlepage}
		\setchaptertype{}
		\pretextualchapter{}
		\vspace{-30pt}
		\begin{center}
			\begin{espacosimples}
				\large\normalfont\scshape\textbf{\ABNTautordata}\\
				\DOCifnotempty{\DOCautordoisdata}{\large\normalfont\scshape\textbf{\DOCautordoisdata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautortresdata}{\large\normalfont\scshape\textbf{\DOCautortresdata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautorquatrodata}{\large\normalfont\scshape\textbf{\DOCautorquatrodata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautorcincodata}{\large\normalfont\scshape\textbf{\DOCautorcincodata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautorseisdata}{\large\normalfont\scshape\textbf{\DOCautorseisdata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautorsetedata}{\large\normalfont\scshape\textbf{\DOCautorsetedata}\\}{\vspace{18pt}}
			\end{espacosimples}
		\end{center}
		\vspace{40pt}
		\begin{center}
			\begin{espacosimples}
				\ABNTchapterfont\Large\scshape{\ABNTtitulodata}
			\end{espacosimples}
		\end{center}
		\vspace{80pt}
		\begin{flushright}
			\begin{minipage}{.5\textwidth}
				\begin{espacosimples}
					\hyphenpenalty=10000{\ABNTcomentariodata\par} % evita hifenizacao
					\DOCifnotempty{\DOCareadata}
					{
						\campoduplo{\'Area de concentra\c{c}\~ao: }{\DOCareadata}\par
					}
					\DOCifnotempty{\DOCcoorientadorbdata}
					{	% se houver mais de um co-orientador
						\campoduplo{\numberline{\ABNTorientadorname}}{\hspace{15pt}\ABNTorientadordata}\par	% orientador
						\campoduplo{\numberline{\ABNTcoorientadorname}}{\hspace{15pt}\ABNTcoorientadordata}\\	% co-orientador A
						\campoduplo{}{\hspace{93pt}\DOCcoorientadorbdata}					% co-orientador B
					}
					{	% caso contrário, se houver apenas um ou nenhum orientador
						\campoduplo{\numberline{\ABNTorientadorname}}{\ignorespaces\ABNTorientadordata}\par	% orientador
						\ABNTifnotempty{\ABNTcoorientadordata}
						{
							\campoduplo{\numberline{\ABNTcoorientadorname}}{\ignorespaces\ABNTcoorientadordata}	% coorientador
						}
					}
				\end{espacosimples}
			\end{minipage}
		\end{flushright}
		\vfill
		\begin{center}
			\normalfont\scshape{\ABNTlocaldata}\\
			\normalfont\scshape{\ABNTdatadata}
		\end{center}
		\if@openright\cleardoublepage\else\clearpage\fi
	\end{titlepage}
	\if@twoside\else\addtocounter{page}{1}\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE APROVACAO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\folhadeaprovacao}
{
	\begin{titlepage}
		\setchaptertype{}
		\pretextualchapter{}
		\begin{center}
			\begin{espacosimples}
				\large\normalfont\scshape\textbf{\ABNTautordata}\\
				\DOCifnotempty{\DOCautordoisdata}{\large\normalfont\scshape\textbf{\DOCautordoisdata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautortresdata}{\large\normalfont\scshape\textbf{\DOCautortresdata}\\}{\vspace{18pt}}
				\DOCifnotempty{\DOCautorquatrodata}{\large\normalfont\scshape\textbf{\DOCautorquatrodata}\\}{\vspace{18pt}}
			\end{espacosimples}
		\end{center}
		\vspace{20pt}
		\begin{center}
			\begin{espacosimples}
				\ABNTchapterfont\Large\scshape{\ABNTtitulodata}
			\end{espacosimples}
		\end{center}
		\vspace{80pt}
		\begin{flushright}
			\begin{minipage}{.5\textwidth}
				\begin{espacosimples}
					\hyphenpenalty=10000{\noindent\ABNTtextoaprovacaodata\par}
				\end{espacosimples}
			\end{minipage}
		\end{flushright}
		\vspace{20pt}
		\begin{center}
			\ABNTlocaldiadata
		\end{center}
		\setlength{\ABNTsignthickness}{0.4pt}
		\setlength{\ABNTsignskip}{1.5cm}
		\ABNTifnotempty{\ABNTprimeiroassinadata}
		{
			\begin{center}
				\vspace{-0.5cm}
				\assinatura{\ABNTprimeiroassinadata}
			\end{center}
		}
		\ABNTifnotempty{\ABNTsegundoassinadata}
		{
			\begin{center}
				\vspace{-0.5cm}
				\assinatura{\ABNTsegundoassinadata}
			\end{center}
		}
		\ABNTifnotempty{\ABNTterceiroassinadata}
		{
			\begin{center}
				\vspace{-0.5cm}
				\assinatura{\ABNTterceiroassinadata}
			\end{center}
		}
		\ABNTifnotempty{\ABNTquartoassinadata}
		{
			\begin{center}
				\vspace{-0.5cm}
				\assinatura{\ABNTquartoassinadata}
			\end{center}
		}

		\if@openright\cleardoublepage\else\clearpage\fi
	\end{titlepage}
	\if@twoside\else\addtocounter{page}{1}\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEDICATORIA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{dedicatoria}
{
	\setchaptertype{}
	\pretextualchapter{}
	\vfill
	\begin{flushright}
		\begin{minipage}{.5\textwidth}
			\begin{espacosimples}
				\setlength\parindent{0pt}
				\setlength\parskip{12pt}
}
{
			\end{espacosimples}
		\end{minipage}
	\end{flushright}
	\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AGRADECIMENTOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{agradecimentos}
{
	\setchaptertype{}
	\pretextualchapter{Agradecimentos}
}
{
	\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EPIGRAFE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{epigrafe}
{
	\setchaptertype{}
	\pretextualchapter{}
	\vfill
	\begin{flushright}
		\begin{minipage}{.5\textwidth}
			\begin{espacosimples}
				\setlength\parindent{0pt}
				\setlength\parskip{12pt}
}
{
			\end{espacosimples}
		\end{minipage}
	\end{flushright}
	\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{resumo}
{
	\setchaptertype{resumo}
	\pretextualchapter{\resumoname}
	\begin{espacosimples}
		\setlength\parindent{0pt}
		\setlength\parskip{12pt}
}
{
		\par\textbf{Palavras-chave:} \DOCpalavraschavedata
	\end{espacosimples}
	\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ABSTRACT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{abstract}
{
	\setchaptertype{abstract}
	\pretextualchapter{\ABNTabstractname}
	\begin{espacosimples}
		\setlength\parindent{0pt}
		\setlength\parskip{12pt}
}
{
		\par\textbf{Keywords:} \DOCkeywordsdata
		\end{espacosimples}
	\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE FIGURAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% cria um comando auxiliar para montagem da lista de figuras
\newcommand{\figfillnum}[1]
{
	\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
	\hb@xt@\@pnumwidth{\hfil\normalfont #1}{}
	\begin{espacosimples}\par\end{espacosimples}
}

% altera a forma de montagem da lista de figuras
\renewcommand{\listadefiguras}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{ABNTrestorecol}{true}\onecolumn}
		{\setboolean{ABNTrestorecol}{false}}
	\setchaptertype{listoffigures}
	\pretextualchapter{Lista de Figuras}
	\begin{espacosimples}
	\@starttoc{lof}
	\end{espacosimples}
	\ifthenelse{\boolean{ABNTrestorecol}}
		{\twocolumn}
		{}
}

\renewcommand*{\l@figure}[2]
{
	\leftskip 3.4em
	\rightskip 1.8em
	\parfillskip -\rightskip
	\parindent 0em
	\@tempdima 2.8em
	--\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{\MakeUppercase{Figura} \normalfont #1}\nobreak \figfillnum{#2}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE QUADROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\floatstyle{plaintop}
\newfloat{quadro}{hpb}{loqr}
\newcommand{\listadequadros}{\listof{quadro}{lista de quadro}}

% cria um comando auxiliar para montagem da lista de quadros
\newcommand{\quadrofillnum}[1]
{
	\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
	\hb@xt@\@pnumwidth{\hfil\normalfont #1}{}
	\begin{espacosimples}\par\end{espacosimples}
}

% altera a forma de montagem da lista de quadros
\renewcommand{\listadequadros}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{ABNTrestorecol}{true}\onecolumn}
		{\setboolean{ABNTrestorecol}{false}}
	\setchaptertype{listadequadros}
	\pretextualchapter{Lista de Quadros}
	\begin{espacosimples}
	\@starttoc{loqr}
	\end{espacosimples}
	\ifthenelse{\boolean{ABNTrestorecol}}
		{\twocolumn}
		{}
}

\newcommand*{\l@quadro}[2]
{
	\leftskip 3.4em
	\rightskip 1.8em
	\parfillskip -\rightskip
	\parindent 0em
	\@tempdima 2.8em
	--\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{\MakeUppercase{Quadro} \normalfont #1}\nobreak \graficofillnum{#2}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE GRAFICOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\floatstyle{plain}
\newfloat{grafico}{hpb}{logr}
\newcommand{\listadegraficos}{\listof{grafico}{lista de graficos}}

% cria um comando auxiliar para montagem da lista de gráficos
\newcommand{\graficofillnum}[1]
{
	\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
	\hb@xt@\@pnumwidth{\hfil\normalfont #1}{}
	\begin{espacosimples}\par\end{espacosimples}
}

% altera a forma de montagem da lista de gráficos
\renewcommand{\listadegraficos}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{ABNTrestorecol}{true}\onecolumn}
		{\setboolean{ABNTrestorecol}{false}}
	\setchaptertype{listadegraficos}
	\pretextualchapter{Lista de Gr\'aficos}
	\begin{espacosimples}
	\@starttoc{logr}
	\end{espacosimples}
	\ifthenelse{\boolean{ABNTrestorecol}}
		{\twocolumn}
		{}
}

\newcommand*{\l@grafico}[2]
{
	\leftskip 3.4em
	\rightskip 1.8em
	\parfillskip -\rightskip
	\parindent 0em
	\@tempdima 2.8em
	--\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{\MakeUppercase{Gr\'afico} \normalfont #1}\nobreak \graficofillnum{#2}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE TABELAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% cria um comando auxiliar para montagem da lista de tabelas
\newcommand{\tabfillnum}[1]
{
	\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
	\hb@xt@\@pnumwidth{\hfil\normalfont #1}{}
	\begin{espacosimples}\par\end{espacosimples}
}

% altera a forma de montagem da lista de tabelas
\renewcommand{\listadetabelas}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{ABNTrestorecol}{true}\onecolumn}
		{\setboolean{ABNTrestorecol}{false}}
	\setchaptertype{listoftables}
	\pretextualchapter{Lista de Tabelas}
	\begin{espacosimples}
	\@starttoc{lot}
	\end{espacosimples}
	\ifthenelse{\boolean{ABNTrestorecol}}
		{\twocolumn}
		{}
}

\renewcommand*{\l@table}[2]
{
	\leftskip 3.4em
	\rightskip 1.8em
	\parfillskip -\rightskip
	\parindent 0.em
	\@tempdima 2.8em
	--\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{\MakeUppercase{Tabela} \normalfont #1}\nobreak \tabfillnum{#2}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE SIMBOLOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define os comandos que montam a lista de simbolos
\newcommand{\listadesimbolos}
{
	\pretextualchapter{Lista de S\'imbolos}
	\begin{espacosimples}
	\@starttoc{losb}
	\end{espacosimples}
}

\newcommand{\simbolo}[2]
{
	{\addcontentsline{losb}{simbolo}{\numberline{#1}{#2}}}#1
}

\newcommand{\l@simbolo}[2]
{
	\vspace{-0.50cm}
	\leftskip 0em
	\parindent 0em
	\@tempdima 5em
	\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{\normalfont #1}\hfil\nobreak\par
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE SIGLAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define o comando que monta a lista de siglas
\newcommand{\listadesiglas}
{
	\pretextualchapter{Lista de Abreviaturas e Siglas}
	\begin{espacosimples}
	\@starttoc{losg}
	\end{espacosimples}
}

\newcommand{\sigla}[2] {{\addcontentsline{losg}{sigla}{\numberline{#1}{#2}}}#1}

\newcommand{\l@sigla}[2]
{
	\vspace{-0.50cm}
	\leftskip 0em
	\parindent 0em
	\@tempdima 5em
	\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{\normalfont #1}\hfil\nobreak\par
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUMARIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% altera o espacamento entre dots
\renewcommand\@dotsep{2}

% altera a forma do sumario
\renewcommand{\sumario}{
	\pretextualchapter{Sum\'ario}
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{ABNTrestorecol}{true}\onecolumn}
		{\setboolean{ABNTrestorecol}{false}}
	\thispagestyle{\chaptertitlepagestyle}
	\global\@topnum\z@
	\@afterindentfalse
	\@afterheading
	\@mkboth{\contentsname}{\contentsname}
	\@starttoc{toc}
	\ifthenelse{\boolean{ABNTrestorecol}}
		{\twocolumn}
		{}
	\setboolean{ABNTaftertoc}{true}
}

% altera forma de montagem dos capitulos
\renewcommand{\l@chapter}[2]
{
	\vspace{0.5cm} % espaço entre os capitulos no sumário
	\ifnum
		\c@tocdepth > \m@ne
		\addpenalty{-\@highpenalty}
		\setlength\@tempdima{1.5em}
		\begingroup
			\ifthenelse{\boolean{ABNTpagenumstyle}}
				{\renewcommand{\@pnumwidth}{7mm}}
				{}
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode \normalsize \ABNTtocchapterfont
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\normalsize\normalfont\bfseries
			#1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
			\ifthenelse{\boolean{ABNTpagenumstyle}}
			{
				\hb@xt@\@pnumwidth{\hss
				\ifthenelse{\not\equal{#2}{}}{{#2}}{}}
				\begin{espacosimples}
					\par
				\end{espacosimples}
			}
			{
				\hb@xt@\@pnumwidth{\hss #2}\par
			}
			\penalty\@highpenalty
		\endgroup
	\fi
}

% altera forma de montagem das secoes
\renewcommand{\l@section}[2]
{
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\setlength\@tempdima{2em}
		\begingroup
			\ifthenelse{\boolean{ABNTpagenumstyle}}
				{\renewcommand{\@pnumwidth}{7mm}}
				{}
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\hspace*{0.5cm}
			#1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
			\hb@xt@\@pnumwidth{\hss{#2}}
			\begin{espacosimples}
				\par
			\end{espacosimples}
			\penalty\@highpenalty
		\endgroup
	\fi
}

% capítulos e sessões maiusculas no sumário
\let\realchapter\chapter
\renewcommand{\chapter}[1]
{
	\ifthenelse{\boolean{ABNTcapchap}}
		{\realchapter{\texorpdfstring{\MakeUppercase{#1}}{#1}}}
		{\realchapter{#1}}
}

\let\realsection\section
\renewcommand{\section}[1]
{
	\ifthenelse{\boolean{ABNTcapsec}}
		{\realsection{\texorpdfstring{\MakeUppercase{#1}}{#1}}}
		{\realsection{#1}}
}

% altera forma de montagem das subsecoes
\renewcommand{\l@subsection}[2]
{
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\setlength\@tempdima{2.5em}
		\begingroup
			\renewcommand{\@pnumwidth}{7mm}
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\hspace*{1.0cm}
			#1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
			\hb@xt@\@pnumwidth{\hss{#2}}
			\begin{espacosimples}
				\par
			\end{espacosimples}
			\penalty\@highpenalty
		\endgroup
	\fi
}

% altera forma de montagem das subsubsecoes
\renewcommand{\l@subsubsection}[2]
{
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\setlength\@tempdima{3em}
		\begingroup
			\renewcommand{\@pnumwidth}{7mm}
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\hspace*{1.5cm}
			#1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill\nobreak
			\hb@xt@\@pnumwidth{\hss{#2}}
			\begin{espacosimples}
				\par
			\end{espacosimples}
			\penalty\@highpenalty
		\endgroup
	\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPITULOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% altera o tamanho das fontes
%\renewcommand{\ABNTchapterfont}{\bfseries}
%\renewcommand{\ABNTchaptersize}{\normalsize}
%\renewcommand{\ABNTsectionfont}{\normalfont}
%\renewcommand{\ABNTsectionfontsize}{\normalsize}
%\renewcommand{\ABNTsubsectionfont}{\normalfont}
%\renewcommand{\ABNTsubsectionfontsize}{\normalsize}
%\renewcommand{\ABNTsubsubsectionfont}{\normalfont}
%\renewcommand{\ABNTsubsubsectionfontsize}{\normalsize}
%\renewcommand{\ABNTanapsize}{\normalsize}

\renewcommand{\ABNTanapsize}{\normalfont\Large\bfseries}
\renewcommand{\ABNTchapterfont}{\normalfont\Large\bfseries}
\renewcommand{\ABNTsectionfont}{\normalfont\Large}
\renewcommand{\ABNTsubsectionfont}{\normalfont\large}
\renewcommand{\ABNTsubsubsectionfont}{\normalfont}

% alteração de fonte compatível com Arial
%\renewcommand{\rmdefault}{phv}
%\renewcommand{\sfdefault}{phv}
%\renewcommand{\ttdefault}{phv}

% altera titulo das subsecoes (lowercase)
\def\ABNTsect#1#2#3#4#5#6[#7]#8{%
	\ifnum #2>\c@secnumdepth
		\let\@svsec\@empty
	\else
		\refstepcounter{#1}%
		\protected@edef\@svsec{\@seccntformat{#1}\relax}%
	\fi
	\@tempskipa #5\relax
	\ifdim \@tempskipa>\z@
		\begingroup
			#6{
			\@hangfrom{\hskip #3\relax\@svsec}
			\interlinepenalty \@M
			\ifnum #2<\c@secnumdepth
				\ifthenelse{\boolean{ABNTcapsec}}
					{\MakeUppercase{#8}}
					{#8}
					\@@par
			\else
				{#8}\@@par % lowercase
			\fi}
		\endgroup
		\@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
		\ABNTaddcontentsline{toc}{#1}
		{
			\ifnum #2>\c@secnumdepth \else
				\protect\numberline{\csname the#1\endcsname}
			\fi
		#7}
	\else
		\def\@svsechd
		{
			#6{\hskip #3\relax
			\@svsec \ifthenelse{\boolean{ABNTcapsec}}
				{\MakeUppercase{#8}}
				{#8}
			}
			\@ifundefined{ABNT#1mark}{}{\csname ABNT#1mark\endcsname{#7}}
			\ABNTaddcontentsline{toc}{#1}{
				\ifnum #2>\c@secnumdepth \else
					\protect\numberline{\csname the#1\endcsname}
				\fi
			#7}
		}
	\fi
	\@xsect{#5}
}

% define como será a escrita de \chapter [modificado do abnt.cls]
\def\@makechapterhead#1{
  {
  \normalfont\ABNTchaptersize\ABNTchapterfont
  \espaco{simples}
  \noindent
  \parbox[b]{\textwidth}{
    \parbox[t]{2.5ex}{\thechapter}
    \parbox[t]{\textwidth-4ex-1ex}
      {\interlinepenalty\@M\raggedright
	\ifthenelse{\boolean{ABNTcapchap}}
	  {\MakeUppercase{#1}}
	  {#1}
      }
    \vspace*{0cm}
    }
  \vspace{25pt}
  }
}

% define como será a escrita de \chapter* [modificado do abnt.cls]
\def\@makeschapterhead#1{
  \vspace*{-33pt}
  {\centering\normalfont\ABNTchaptersize\ABNTchapterfont
   \ifthenelse{\boolean{ABNTcapchap}}
     {\MakeUppercase{#1}}
     {#1}
    \par}
  \vspace{45pt}
  \par
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NUMERACAO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define o tipo de numeracao de figuras, tabelas e equacoes como contínuo
\let\newcounter\ABNToldnewcounter\relax
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\theequation}{\arabic{equation}}
\def\ABNTeatbrackets[#1]{\relax}
\renewcommand{\newcounter}[1]
{
	\ifthenelse{\equal{#1}{figure}\or\equal{#1}{table}\or\equal{#1}{equation}}
		{\ABNToldnewcounter{#1}\@ifnextchar[{\ABNTeatbrackets}{}}
		{\ABNToldnewcounter{#1}}
}


% define o tipo de numeracao das paginas
\renewcommand{\chaptertitlepagestyle}{plain}

% altera a posicao da numeracao de paginas dos elementos pre-textuais
\renewcommand{\pretextualchapter}
{
	\pagestyle{empty}
	\if@openright\cleardoublepage\else\clearpage\fi
	\global\@topnum\z@
	\@afterindentfalse
	\renewcommand{\thepage}{}
	\@schapter
}

% altera a posicao da numeracao de paginas dos elementos textuais
\renewcommand{\ABNTchaptermark}[1]
{
	\ifthenelse{\boolean{ABNTNextOutOfTOC}}
		{
			\markboth{\ABNTnextmark}{\ABNTnextmark}
		}
		{
			\chaptermark{#1}
			\pagestyle{\chaptertitlepagestyle}
		}
}

% Redefine o tipo de numeracao das paginas
\renewcommand{\ABNTBeginOfTextualPart}
{
	\if@twoside
		\@twosidetrue \@mparswitchtrue
			%\addtocounter{page}{-1}
			\raggedbottom
	\fi
	\renewcommand{\chaptertitlepagestyle}{plainheader}
	\renewcommand{\thepage}{\arabic{page}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LEGENDAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\fonte}[1]
{
	\begin{flushleft}
		\begin{espacosimples}\par\end{espacosimples}
		\centering\small{Fonte: #1}
	\end{flushleft}
}

\renewcommand{\fnum@figure}{\textbf{Figura \arabic{figure}}}
\renewcommand{\fnum@table}{\textbf{Tabela \arabic{table}}}
\renewcommand{\fnum@grafico}{\textbf{Gr\'afico \arabic{grafico}}}
\renewcommand{\fnum@quadro}{\textbf{Quadro \arabic{quadro}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REFERENCIAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{ABNTcapsec}}
	{\renewcommand{\ABNTbibliographyname}{\texorpdfstring{\MakeUppercase{Refer\^encias}}{Refer\^encias}}}
	{\renewcommand{\ABNTbibliographyname}{Refer\^encias}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AJUSTES DIVERSOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ajuste para citacao direta: para mais de 3 linhas, deve estar em um parágrafo próprio, com recuo de 4cm, espacamento simples e fonte tamanho 10
\renewenvironment{quote}{\list{}{\leftmargin=4cm\rightmargin=0cm\footnotesize\singlespace}\item[]}{\endlist}

% permite mais de três níveis no sumário
\setcounter{secnumdepth}{10}
\setcounter{tocdepth}{10}

% altera o tamanho da indentacao do paragrafo
\setlength{\parindent}{1.5cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APÊNDICES E ANEXOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\anapchaptername}{\relax}

\renewcommand*{\ABNTtravessao}{--}

\def\@anapchapter[#1]#2{
	\refstepcounter{chapter}
	\ifthenelse{\boolean{ABNTAnApName}}
	{
		\begingroup
			\ifthenelse{\equal{#1}{}}
				{\def\thechapter{\anapchaptername{} \Alph{chapter}}}
				{\def\thechapter{\anapchaptername{} \Alph{chapter}{}\ABNTtravessao{} #1}}
			\ABNTchaptermark{}
		\endgroup

		\if@twocolumn
			\@topnewpage[\@makeanapchapterhead{#2}]
		\else
			\@makeanapchapterhead{#2}
			\@afterheading
		\fi
	}
	{
		\ABNTchaptermark{#1}
	 	\if@twocolumn
			\@topnewpage[\@makechapterhead{#2}]
		 \else
			\@makechapterhead{#2}
			\@afterheading
		\fi
	}

	\ifnum \c@secnumdepth >\m@ne
		\typeout{\@chapapp\space\thechapter.}
		\ifthenelse{\boolean{ABNTAnApName}}
		{
			\ifthenelse{\equal{#1}{}}
				{\ABNTaddcontentsline{toc}{chapter}{\anapchaptername{} \thechapter}}
				{\ABNTaddcontentsline{toc}{chapter}{\anapchaptername{} \thechapter{} \ABNTtravessao{} #1}}
		}
		{
			\ABNTaddcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
		}
	\else
		\ABNTaddcontentsline{toc}{chapter}{#1}
	\fi
	\par
}

\renewcommand{\ABNTaposindicativoanap}{\relax}

\def\@makeanapchapterhead#1{
	{
		\normalfont\ABNTchapterfont\ABNTanapsize
		\espaco{simples}
		\ifthenelse{\boolean{ABNTAnApIndicativoIndent}}
			{
				\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
					{\settowidth{\ABNTanapindent}{\MakeUppercase{\anapchaptername}\thechapter{} \ABNTtravessao{}}}
					{\settowidth{\ABNTanapindent}{\anapchaptername\thechapter{} \ABNTtravessao{}}}
			}
			{}

		\begin{list}
			{}
			{
				\setlength{\listparindent}{0cm}
				\setlength{\itemindent}{-\ABNTanapindent}
				\setlength{\rightmargin}{0cm}
				\setlength{\leftmargin}{\ABNTanapindent}
				\setlength{\parsep}{0pt}
			}
			\item
			\begin{center}
				\ifthenelse{\equal{#1}{}}
					{
						\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
							{\MakeUppercase{\anapchaptername}}
							{\anapchaptername}
						\thechapter \ABNTaposindicativoanap
					}
			 		{
						\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
							{\MakeUppercase{\anapchaptername}}
							{\anapchaptername}
						\thechapter{} \ABNTtravessao{} \ABNTaposindicativoanap
						\ifthenelse{\boolean{ABNTcapchap}}
							{\MakeUppercase{#1}}
							{#1}
					}
			\end{center}
		\end{list}
		\par\vspace{35pt}
	}
}

\renewcommand{\appendix}
{
	\setcounter{chapter}{0}
	\resetsubcounters{chapter}
	\gdef\thechapter{\Alph{chapter}}
	\setchaptertype{appendix}
	\gdef\@chapapp{Apendice}
	\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
		{\renewcommand{\appendixname}{\texorpdfstring{\MakeUppercase{Ap\^endice}}{Ap\^endice}}}
		{\renewcommand{\appendixname}{Ap\^endice}}
	\renewcommand{\anapchaptername}{\appendixname}
	\global\let\@chapter\@anapchapter
}

\let\apendice\appendix

\renewcommand{\annex}
{
	\setcounter{chapter}{0}
	\resetsubcounters{chapter}
	\gdef\thechapter{\Alph{chapter}}
	\setchaptertype{annex}
	\ifthenelse{\boolean{ABNTCapAnnexAppendix}}
		{\renewcommand{\annexname}{\texorpdfstring{\MakeUppercase{Anexo}}{Anexo}}}
		{\renewcommand{\annexname}{Anexo}}
	\renewcommand{\anapchaptername}{\annexname}
	\global\let\@chapter\@anapchapter
}

\let\anexo\annex
