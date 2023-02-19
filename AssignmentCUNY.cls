%% AssignmentCUNY
%% Copyright 2022 Alex Washburn

\LoadClass[%
parskip=half,           % spacing value / method for paragraphs
chapterprefix=true,     % prefix for chapter marks
10pt,                   % font size
headings=normal,        % size of headings
bibliography=totoc,     % include bib in toc
listof=totoc,           % include listof entries in toc
listof=numberline,      % include listof entries in toc
listof=nochaptergap,
titlepage=on,           % own page for each title page
captions=tablebelow,    % display table captions above the float env
chapterprefix=false,    % do not display a prefix for chapters
appendixprefix=false,   % but display a prefix for appendix chapter
draft=false,            % value for draft version
toc=flat,
toc=numberline,
numbers=noenddot
]{scrreprt}%

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{AssignmentCUNY}[2023/02/18 v1.2.1 A LaTeX style CUNY assignments]

\RequirePackage{lmodern}

\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}

\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}

\renewcommand*\familydefault{\sfdefault}

\RequirePackage{geometry}
\geometry{%
a4paper,
bottom=20mm,
left=20mm,
right=20mm,
top=20mm
}


%----------------------------- CUNY Assignment variables -------------------------
\global\let\VarAssignmentNumber\empty%
\global\let\VarCourseName\empty%
\global\let\VarCourseNumber\empty%
\global\let\VarStudentName\empty%
\global\let\VarStudentNumber\empty%

\global\let\VarAssignmentNumber\relax
\global\let\VarCourseName\relax
\global\let\VarCourseNumber\relax
\global\let\VarStudentName\relax
\global\let\VarStudentNumber\relax

\def\AssignmentNumber#1{\def\VarAssignmentNumber{#1}}
\def\CourseName#1{\def\VarCourseName{#1}}
\def\CourseNumber#1{\def\VarCourseNumber{#1}}
\def\StudentName#1{\def\VarStudentName{#1}}
\def\StudentNumber#1{\def\VarStudentNumber{#1}}
%----------------------------- CUNY Assignment variables -------------------------


\RequirePackage[dvipsnames,svgnames,hyperref]{xcolor}
\KOMAoptions{twoside=false}

\DeclareTOCStyleEntry[beforeskip=-0.1in]{chapter}{chapter}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{section}{section}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{default}{subsection}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{default}{subsubsection}
%----------------------------- Setup table of contents -------------------------


%----------------------------- Modify style of page numbering  -------------------------
\addtokomafont{pagenumber}{\oldstylenums}
\addtokomafont{chapterentrypagenumber}{\oldstylenums}
\RedeclareSectionCommand[tocpagenumberformat=\oldstylenums]{section}
\RedeclareSectionCommand[tocpagenumberformat=\oldstylenums]{subsection}
%----------------------------- Modify style of page numbering -------------------------


%----------------------------- Modify paragraph format -------------------------
\newlength\savedparfillskip%
\newcommand*{\saveparfillskip}[1]{\setlength{\savedparfillskip}{\dimexpr\parfillskip\relax}}
\AddtoDoHook{heading/postinit/chapter}{\saveparfillskip}
\renewcommand{\chapterlinesformat}[3]{%
	\ctchaptertitle{#3}%
	#2%
	\hspace{-\savedparfillskip}%
}
\setlength{\abovedisplayskip}{1pt}
\setlength{\belowdisplayskip}{1pt}
\setlength{\abovedisplayshortskip}{1pt}
\setlength{\belowdisplayshortskip}{1pt}
%----------------------------- Modify paragraph format -------------------------


%----------------------------- Setup math modemodifications -------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{nicefrac}
\PassOptionsToPackage{%
group-separator={,},
number-mode=text
}%
{siunitx}
\RequirePackage{siunitx}
\RequirePackage{xspace}

% Upgraded fraction representation
\let\oldfrac\frac% Store \frac
\renewcommand{\frac}[2]{%
\mathchoice%
{\oldfrac{#1}{#2}}% display style
{\nicefrac{#1}{#2}}% text style
{\nicefrac{#1}{#2}}% script style
{\nicefrac{#1}{#2}}% script-script style
}

% Number Categories
\newcommand{\Nats}{\ensuremath{\mathbb{N}}\xspace}
\newcommand{\Ints}{\ensuremath{\mathbb{Z}}\xspace}
\newcommand{\Rats}{\ensuremath{\mathbb{Q}}\xspace}

% Logical connectives
\newcommand{\ImpliesOne}{\ensuremath{\rightarrow}\xspace}
\newcommand{\ImpliesTwo}{\ensuremath{\implies}\xspace}
\newcommand{\ModelsOne}{\ensuremath{\vdash}\xspace}
\newcommand{\ModelsTwo}{\ensuremath{\implies}\xspace}

% Groupings
\newcommand{\Parens}[1]{\ensuremath{\left(\;#1\;\right)}\xspace}
\newcommand{\SetNote}[1]{\ensuremath{\left\{\;#1\;\right\}}\xspace}
\newcommand{\IndexRange}[2]{\ensuremath{\texttt{{[}\,#1,\ #2\,{]}}}\xspace}
\newcommand{\NumericRange}[2]{\ensuremath{\left[\,#1,\; #2\,\right]}\xspace}

% Quantity styling
\newcommand{\Qty}[2]{\oldstylenums{\qty[number-mode=text]{#1}{#2}}}
%----------------------------- Setup math mode modifications -------------------


%----------------------------- Other packages ----------------------------------
\usepackage{setspace}
\usepackage{latexsym}

%----------------------------- Other packages ----------------------------------


%----------------------------- Update sectioning -------------------------------
\usepackage{longfbox}
\usepackage{changepage}

\renewcommand{\sectionlinesformat}[4]{%
\@tempswafalse
\Ifstr{#1}{section}{%
\begin{adjustwidth}{-17mm}{-17mm}%
\hspace*{#2}%
\begin{longfbox}[
border-width=1mm,
margin=0pt,
padding-top=6mm,
padding-right=16mm,
padding-left=16mm,
padding-bottom=6mm
]
\raggedsection#3~\\[2mm]\Large\textbf{#4}%
\end{longfbox}%
\end{adjustwidth}%
}{\@hangfrom{\hskip #2#3}{#4}}
}

\addtokomafont{disposition}{\normalfont}
\addtokomafont{part}{\scshape\LARGE}
\addtokomafont{chapter}{\scshape\Huge}
\addtokomafont{section}{\sffamily\bfseries\Large}
\addtokomafont{subsection}{\bfseries}
\addtokomafont{subsubsection}{\bfseries}
\addtokomafont{paragraph}{\normalfont}
\addtokomafont{subparagraph}{\normalfont}

\renewcommand*{\thesection}{\LARGE\textsc{Problem}~\arabic{section}:}
\renewcommand*{\thesubsection}{\arabic{section}~(\alph{subsection}):}
\renewcommand*{\thesubsubsection}{\arabic{section}~(\alph{subsubsection})~(\Roman{subsubsection}):}
\RedeclareSectionCommands[beforeskip=-3ex,afterskip=2ex]{section,subsection,subsubsection}
%----------------------------- Update sectioning -------------------------------


%--------------------------------- Internal commands ---------------------------
\newcommand{\CourseTitle}{CSc~\VarCourseNumber~--~\VarCourseName}
\newcommand{\AssignmentTitle}{Assignment~\textnumero\VarAssignmentNumber}
\newcommand{\HomeworkText}[1]{\textbf{``#1''}}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
\parindent=0pt
\KOMAoptions{fontsize=12pt}
\begin{center}
\singlespacing%
~\vfill
\Huge\CourseTitle\\[1cm]
\AssignmentTitle\normalsize\\[1cm]
by\\[1cm]
\Large\VarStudentName\normalsize\\[1cm]
on\\[1cm]
\Large\today\\[1cm]%
~\vfill
\end{center}
\KOMAoptions{fontsize=10pt}
}
%--------------------------------- Internal commands ---------------------------


%--------------------------------- Exported Commands ---------------------------
\newcommand{\CoverPage}{%
\begin{titlepage}
% Always use Arabic numbering, even in Front-matter
\setcounter{page}{1}
\pagenumbering{arabic}
\maketitle%
\doublespacing%
\end{titlepage}
}

\newcommand{\Problem}[1]{%
\clearpage%
\newgeometry{bottom=20mm,left=20mm,right=20mm,top=3mm}%
\section{#1}%
%\afterpage{\restoregeometry}
}%

\newcommand{\SubProblem}[1]{\subsection{\HomeworkText{#1}}}%

\newcommand{\SubSubProblem}[1]{\subsubsection{\HomeworkText{#1}}}%

