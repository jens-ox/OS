\ProvidesClass{summary}[summary class (Jens Ochsenmeier)]
\NeedsTeXFormat{LaTeX2e}[1996/06/01]


% load base class
\LoadClass[aip,jmp,amsmath,amssymb,reprint,nobalancelastpage]{revtex4-1}


% Packages --- General
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[ngerman,english]{babel}
\RequirePackage[paperwidth=210mm,paperheight=297mm,centering,hmargin=1cm,vmargin=1cm]{geometry}
\RequirePackage[parfill]{parskip}
\RequirePackage[pdfstartview={FitH},pdfborder={0 0 0},hyperindex=false]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{crimson}
\RequirePackage{scrextend}
\RequirePackage{titlesec}
\RequirePackage{environ}
\RequirePackage[compatibility=true]{caption}


% Packages --- Math
\RequirePackage[fleqn]{mathtools}
\RequirePackage[hyperref,amsmath]{ntheorem}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{fdsymbol}

% Packages --- Code
\RequirePackage{listings}

% Packages --- Graphics
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{tcolorbox}


% Glyph-to-Unicode Translation for searching in PDFs (needs PdfTex >=1.4)
\InputIfFileExists{glyphtounicode}{\pdfgentounicode=1}{}


% Title
\renewcommand{\title}[1]{%
  \gdef\@title{#1}%
  \pdfstringdef{\@pdftitle}{\@title}%
  \hypersetup{pdftitle=\@pdftitle}%
}


% Author
\renewcommand{\author}[1]{%
  \gdef\@author{#1}%
  \pdfstringdef{\@pdfauthor}{\@author}%
  \hypersetup{pdfauthor=\@pdfauthor}%
}


% QED symbol
\renewcommand{\qedsymbol}{$\square$}
\newcommand{\mathqed}{}
\DeclareRobustCommand{\qed}{%
  \ifmmode \mathqed
  \else
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\qedsymbol}%
  \fi  
}


% Lists
\setlist{leftmargin=1em,itemsep=0em,topsep=0em,parsep=0em}
\renewcommand{\labelitemii}{$ \circ $}
\renewcommand{\labelitemiii}{--}
\renewcommand{\labelitemiv}{--}


% Math declarations
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\ot}{\leftarrow}
\newcommand{\To}{\implies}
\newcommand{\e}{\text{\rmfamily e}}
\renewcommand{\i}{\text{\rmfamily i}}
\renewcommand{\O}{\mathcal{O}}

% better limits
\let\lim\undefined
\DeclareMathOperator{\lim}{lim}
\let\liminf\undefined
\DeclareMathOperator{\liminf}{lim\,inf}
\let\limsup\undefined
\DeclareMathOperator{\limsup}{lim\,sup}

% better greek letters
\let\origphi\phi
\let\phi\varphi
\let\origtheta\theta
\let\theta\vartheta
\let\origepsilon\epsilon
\let\epsilon\varepsilon
\let\origupepsilon\upepsilon
\let\upepsilon\upvarepsilon

% better small fraction
\let\smallfrac\@undefined
\newcommand{\smallfrac}[2]{\ensuremath{\frac{#1}{#2}}}


% prettier links
\newcommand{\term}[1]{\textcolor{red!70!black}{\textbf{#1}}}
\hypersetup{
    colorlinks,
    linkcolor={red!70!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}


% custom section
\titleformat{\section}{\normalfont\huge}{}{0em}{}


% custom paragraph
\titleformat{\paragraph}{\large\bfseries\scshape}{}{0em}{}
\titlespacing*{\paragraph}{0em}{1em}{0em}


% reduce font size
\changefontsizes[10pt]{8pt}

% reduce equation margins
\AtBeginDocument{\abovedisplayskip=0pt}
\AtBeginDocument{\abovedisplayshortskip=0pt}
\AtBeginDocument{\belowdisplayskip=0pt}
\AtBeginDocument{\belowdisplayshortskip=0pt}

% no page numbering
\pagenumbering{gobble}

% graphics
\graphicspath{{assets/images/}}

% code
% better C highlighting
\lstdefinestyle{customc}{
  language=C,
  breaklines=true,
  xleftmargin=4pt,
  showstringspaces=false,
  basicstyle=\ttfamily,
  keywordstyle=\bfseries\color{green!40!black},
  commentstyle=\itshape\color{purple!40!black},
  identifierstyle=\color{blue},
  stringstyle=\color{orange},
}

% better bash highlighting
\lstdefinestyle{custombash}{
  language=bash,
  breaklines=true,
  xleftmargin=\parindent,
  showstringspaces=false,
  basicstyle=\ttfamily,
  keywordstyle=\bfseries\color{green!40!black},
  commentstyle=\itshape\color{purple!40!black},
  identifierstyle=\color{gray},
  stringstyle=\color{orange},
}

\newcommand{\code}[1]{\lstinline[language=c,basicstyle=\ttfamily]|#1|}
\lstset{basicstyle=\ttfamily}
\lstset{escapechar=@,style=customc}
\lstset{columns=spaceflexible}
\newcommand*\lstinputpath[1]{\lstset{inputpath=#1}}
\lstinputpath{assets/code/}


% summary environment
\newenvironment{summary}
  {
    \begin{tcolorbox}[colback=black!3!white,colbacktitle=black!15!white,colframe=black!10!red,coltitle=black,fonttitle=\bfseries,title=Summary,arc=0mm,toprule=0.2mm,bottomrule=0.2mm,leftrule=0.2mm,rightrule=0.2mm,left=1mm,right=1mm,titlerule=0mm]
  }
  {
    \end{tcolorbox}
  }

\NewEnviron{rotanswer}{%
  \begin{tikzpicture}
  \node[rotate=180,inner sep=0pt] {\parbox{\linewidth}{%
  \footnotesize
  \BODY
  }};
\end{tikzpicture}%
}

\newenvironment{assignment}
  {
    \begin{tcolorbox}[colback=black!3!white,colframe=black!15!white,coltitle=black,fonttitle=\bfseries,title=Assignment,arc=0mm,toprule=0.2mm,bottomrule=0.2mm,leftrule=0.2mm,rightrule=0.2mm,left=1mm,right=1mm,titlerule=0mm]
  }
  {
    \end{tcolorbox}
  }
\DeclareCaptionLabelFormat{mylabel}{#1}
\captionsetup{labelfont=bf,labelformat=mylabel,textformat=period,font={small}}

\endinput