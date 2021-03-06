\ProvidesClass{ssb-resume}[2016/05/27 Resume class]
\NeedsTeXFormat{LaTeX2e}

% This class is a customization of friggeri-cs.cls by Adrien Friggeri

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{black}{HTML}{000000}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{5A33C6}
\definecolor{red}{HTML}{F81818}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{myblue}{HTML}{3182DE}
\definecolor{darkblue}{HTML}{0B0B3B}


\ifdefined\@cv@print
  \colorlet{green}{black}
  \colorlet{orange}{black}
  \colorlet{purple}{black}
  \colorlet{red}{black}
  \colorlet{blue}{black}
  \colorlet{myblue}{black}
  \colorlet{darkblue}{black}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\else
  \colorlet{fillheader}{lightgray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{myblue}

%%%%%%%%%
% Fonts %
%%%%%%%%%

% \RequirePackage[quiet]{fontspec}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% 
% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% 
% \setmathfont{XITS Math}

%%% modified by Karol Kozioł for ShareLaTex use
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Light.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}
%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
	%    \node [anchor=north] at (name.south) {%
	%      \fontsize{14pt}{24pt}\color{header}%
	%      \thinfont #3%
	%    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor{%
  {%
    \color{%
    \ifcase\value{colorCounter}%
        black\or%
        black\or%
        black\or%
        black\or%
        black\else%
        black\fi
	%	I didn't like the colors...
	%      \ifcase\value{colorCounter}%
	%        blue\or%
	%        red\or%
	%        orange\or%
	%        green\or%
	%        purple\else%
	%        headercolor\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{darkblue}}
% entry with 4 args
\newcommand{\entry}[4]{%
	{\addfontfeature{Color=darkgray}#1}
	&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\addfontfeature{Color=gray} #3}\\
    #4\vspace{\parsep}%
  }\\}
% entry with 3 args
\newcommand{\sentry}[3]{%
  {\addfontfeature{Color=darkgray}#1}
  &\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\addfontfeature{Color=gray} #3}
  }\\}
% entry with 5 args, #1 and #2 are dates
\newcommand{\lentry}[5]{%
	{\addfontfeature{Color=darkgray}#1}
	&\parbox[t]{11.8cm}{%
    \textbf{#3}%
    \hfill%
    {\addfontfeature{Color=gray} #4}}\\
  {\addfontfeature{Color=darkgray}#2}
	&\parbox[t]{11.8cm}{%
  	#5\vspace{\parsep}%
  }\\}
% entry with 2 args for extra date + discription (to accompany sentry)
\newcommand{\edentry}[2]{%
  {\addfontfeature{Color=darkgray}#1}
  &\parbox[t]{11.8cm}{%
    {#2}
    \vspace{\parsep}
  }\\}

% hidden entries
\newcommand{\hentry}[4]{}
\newcommand{\hsentry}[3]{}
\newcommand{\hedentry}[2]{}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\LARGE\headingfont\color{headercolor} ##1\vspace{1.5mm}}
  }
  \begin{textblock}{3.9}(1.5, 3.9)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{#3}{}{#3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.0cm,top=1cm,right=1.5cm,bottom=1cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}