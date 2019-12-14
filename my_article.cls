%----------------------------------------------------------------------------------------
%	 BASIC REQUIREMENTS
%----------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_article}[2019/10/14 My custom article]
\LoadClass{article}


%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc} % Fonts package
\RequirePackage[utf8]{inputenc} % Fonts package
\RequirePackage[sfdefault,scale=1.1]{ClearSans} % Fonts package
\RequirePackage{titlesec} % Title package
\RequirePackage[absolute,overlay]{textpos} % Text position package
\RequirePackage{indentfirst} % Indent first paragraph after sectioning
\RequirePackage{float} % Float package
\RequirePackage{xstring} % String tests package
\RequirePackage{graphicx} % Images package
\RequirePackage{svg} % SVG package
\RequirePackage{xcolor} % Colors package
\RequirePackage{ifthen} % Conditions package
\RequirePackage{tikz} % Graphics package
\RequirePackage{hyperref} % Links package
\RequirePackage[left=2cm,top=1.5cm,right=2cm,bottom=1cm,nohead,includefoot]{geometry} % Geometry package

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgrey}{RGB}{27,29,33}
\definecolor{lightgrey}{RGB}{69,72,75}
\definecolor{lightgreen}{RGB}{173,248,67}


%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------
\graphicspath{ {./img/} } % Set images path

% Hyperlinks configuration
\hypersetup{
    colorlinks=true,
    linkcolor=mainblue,
    urlcolor=secblue,
    pdftitle={Sharelatex Example},
}

\setlength{\parindent}{1cm} % Disable paragraph indentation
\renewcommand{\baselinestretch}{1.2} % Set line spacing

\renewcommand{\contentsname}{Sommaire} % Redefining ToC title


%----------------------------------------------------------------------------------------
%	 FIRST PAGE CONFIGURATIONS
%----------------------------------------------------------------------------------------
\newcommand{\coverpic}[1]{\renewcommand{\coverpic}{#1}} % Cover picture of the first page
\newcommand{\headpic}[1]{\renewcommand{\headpic}{#1}} % Head picture of the first page
\newcommand{\articletitle}[1]{\renewcommand{\articletitle}{#1}} % Title of the article
\newcommand{\articleauthor}[1]{\renewcommand{\articleauthor}{#1}} % Author of the article
\newcommand{\articledate}[1]{\renewcommand{\articledate}{#1}} % Date of the article

% New command to print article title and author
\newcommand{\makearticletitle}{
    \ifthenelse{\equal{ \articletitle}{} \AND \equal{\articleauthor}{} }{}{
        \color{darkgrey}
        \LARGE\articletitle\\
        \vspace{.7cm}
        \normalsize\articledate
    }
}

% New command to print the first page of the article
\newcommand{\makefirstpage}{
    % Centered environment
    \begin{center}
        \includegraphics[scale=0.2]{\headpic}\\
        \vspace{.8cm}
        \makearticletitle\\ % Print the title
        \vspace{1cm}
        \includegraphics[width=\paperwidth]{\coverpic}\\ % Print the cover
        \vspace{1cm}
        \large\articleauthor
    \end{center}
}

% New environment firstpage
\newenvironment{articlefirstpage}{
    \newgeometry{left=0cm,top=1cm,right=0cm,bottom=0cm,nohead,nofoot}
}{
    \restoregeometry
}

% Hide links color for the given command
\newcommand{\nolinkscolor}[1]{
    { \hypersetup{hidelinks} #1 }
}


%----------------------------------------------------------------------------------------
%	 SECTIONS CONFIGURATIONS
%----------------------------------------------------------------------------------------
% New commmand to print section title with background color
\newcommand{\coloredtitle}[4]{%
    \tikz[baseline=(char.base)]
    \node[
      anchor=north west,
      draw,
      rectangle,
      inner sep=3pt,
      minimum size=8mm,
      text height=4mm,
      text width=#2,
      fill=#1,
      #1,
      text=#3
    ](char){#4};%
}

% Formating section title
\titleformat{name=\section}
 {\Large}
 {}
 {0pt}
 {\coloredtitle{darkgrey}{\paperwidth/2}{lightgreen}}
 
 % Formating subsection title
\titleformat{name=\subsection}
 {\large}
 {}
 {0pt}
 {\coloredtitle{lightgrey}{\paperwidth/2.5}{lightgreen}}
 
  % Formating subsubsection title
\titleformat{name=\subsubsection}
 {\normalsize}
 {}
 {0pt}
 {\coloredtitle{lightgreen}{\paperwidth/3.5}{darkgrey}}

%----------------------------------------------------------------------------------------
%	 LISTS CONFIGURATION
%----------------------------------------------------------------------------------------
% New environment for the glossary definitions
\newenvironment{glossarylist}{%
    \vspace{.2cm}
    \begin{description}
}{%
    \end{description}
    \vspace{.5cm}
}

% New command for default captioned pic
\newcommand{\truc}[3]{
    \begin{figure}[h]
        \centering
        \includegraphics[width=0.8\textwidth]{#1}
        \caption{#2}
        \label{fig:#3}
    \end{figure}
}

% New environment for captioned picture
\newenvironment{captionedpic}[2]{
    \vspace{.2cm}
    \begin{figure}[H]
        \newcommand{\piccaption}{#1}
        \newcommand{\piclabel}{#2}
}{
        \caption{\piccaption}
        \label{fig:\piclabel}
    \end{figure}
}

% New command for glossary definitions
\newcommand{\glossaryitem}[2]{
	\item[#1:] #2
}
