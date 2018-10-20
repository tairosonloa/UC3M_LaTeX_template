\NeedsTeXFormat{LaTeX2e}                                                    % Tells the compiler which version of LaTeX the package is for.
\ProvidesClass{template_memorias}[2016/04/21 Template for UC3M work report] % Gives the compiler some information about your package.
\LoadClass{article}                                                         % Our template is based on article.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               UC3M Work report template              %
%           Universidad Carlos III de Madrid           %
%              Author: Aitor Alonso Núñez              %
%              Last update: October 2018               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Required Packages %%%%%
\RequirePackage[pdftex, usenames, dvipsnames]{color}                            % So that we can define colors and change color fonts.
\RequirePackage[table,xcdraw]{xcolor}                                           % So that we can color tables cells, row, columns...
\RequirePackage{xcolor}                                                         % More colors
\RequirePackage{ragged2e}                                                       % To allign some lines.
\RequirePackage[T1]{fontenc}                                                    % Because we use vectorial fonts (type-1).
\usepackage[scaled]{helvet}                                                     % Helvet font as is the UC3M corporate identity font
\renewcommand\familydefault{\sfdefault}                                         %
\RequirePackage{courier}                                                        % To add code snippets.
\RequirePackage{geometry}                                                       % To define paper format and general margins.
\RequirePackage{graphicx}                                                       % To add images and graphics.
\RequirePackage[spanish, es-noindentfirst, es-noshorthands, es-tabla]{babel}    % Language format package (Spanish).
\RequirePackage{setspace}                                                       % Used when we modify spacing between lines.
\RequirePackage{fancyhdr}                                                       % So that we can add header and footer.
\RequirePackage{titlesec}                                                       % Useful to set title styles.
\RequirePackage{afterpage}                                                      % To change backgroud colors per page.
\RequirePackage{float}                                                          % Important on figures.
\RequirePackage[utf8]{inputenc}                                                 % UTF-8 input encode always!!
\RequirePackage{multirow}                                                       % So that we can merge cells in tables
\RequirePackage{xkeyval}                                                        % Macros
\RequirePackage{textcomp}                                                       % To write symbols like €

%%%%% Setting margins %%%%%
\setlength{\headheight}{50pt}
\setlength{\footskip}{30pt}
\geometry{verbose,a4paper,tmargin=40mm,bmargin=40mm,lmargin=25mm,rmargin=20mm}

\onehalfspace                   % Spacing between lines.
\setlength{\parindent}{0cm}     % Indent length.

\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist   %To change margins of a few lines.

%%%%% Colors %%%%%
\definecolor{gray}{rgb}{0.2509803922, 0.2509803922, 0.2509803922}
\definecolor{grayLight}{rgb}{0.4980392157, 0.4980392157, 0.4980392157}
%Color UC3M corporative identity
% - Old corporative identity
\definecolor{uc3mDarkBlue}{RGB}{0, 7, 121}
\definecolor{uc3mBlue}{RGB}{32, 85, 138}
\definecolor{uc3mLightBlue}{RGB}{99, 158, 200}
% - New corporative identity
\definecolor{uc3mNewBlue}{RGB}{0, 29, 133}

%%%%% Some booleans to format header %%%%%
\newif\ifauthorstwo
\newif\ifauthorsthree
\newif\ifauthorsfour
\newif\ifemail

%%%%% Coauthors (students), NIA and group, up to three coauthors %%%%%
\newcommand{\authorsuptothree}[9]{
    \def\authorI{#1}
    \def\niaI{#2}
    \def\groupI{#3}
    \def\authorII{#4}
    \def\niaII{#5}
    \def\groupII{#6}
    \def\authorIII{#7}
    \def\niaIII{#8}
    \def\groupIII{#9}
}

%%%%% Coauthors (students) with NIA and without group, up to four coauthors %%%%%
\newcommand{\authorsfour}[9]{
    \def\authorIofIV{#1}
    \def\niaIofIV{#2}
    \def\authorIIofIV{#3}
    \def\niaIIofIV{#4}
    \def\authorIIIofIV{#5}
    \def\niaIIIofIV{#6}
    \def\authorIVofIV{#7}
    \def\niaIVofIV{#8}
    \def\groupIV{#9}
}

%%%%% Basic data about document (degree, subject, document title, campus and page number custom text) %%%%%
\newcommand{\documentdata}[5]{
    \def\studyname{#1}
    \def\subjectname{#2}
    \def\documenttitle{#3}
    \def\campus{#4}
    \def\mypagename{#5}
}

%%%%% Email addresses of document coauthors %%%%
\newcommand{\emails}[4]{
    \def\emailI{#1}
    \def\emailII{#2}
    \def\emailIII{#3}
    \def\emailIV{#4}
}

%%%%% Header %%%%%
\newcommand{\header}[0]{
    %%%% Left part of header %%%%
    \ifauthorstwo
    \lhead{
        \textcolor{gray}{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{lll}
        \authorI & \niaI\\
        \authorII & \niaII\\
        \end{tabular}}
    }
    \fi
    \ifauthorsthree
    \lhead{
        \textcolor{gray}{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{ll}
        \authorI & \niaI\\
        \authorII & \niaII\\
        \authorIII & \niaIII\\
        \end{tabular}}
    }
    \fi
    \ifauthorsfour
    \lhead{
        \textcolor{gray}{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{ll}
        \authorIofIV & \niaIofIV\\
        \authorIIofIV & \niaIIofIV\\
        \authorIIIofIV & \niaIIIofIV\\
        \authorIVofIV & \niaIVofIV\\
        \end{tabular}}
    }
    \fi

    %%%% Right part of header %%%%
    \ifauthorsfour
        \rhead{\includegraphics[scale=0.12]{template/logo_completo_horizontal.png}} % Logo image uc3m
    \else
        \rhead{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{c}
        \includegraphics[scale=0.12]{template/logo_completo_horizontal.png} % Logo image uc3m
        \end{tabular}}
    \fi
    \renewcommand{\headrulewidth}{0pt}  % To erase header line
}

%%%%% Footer %%%%%
\newcommand{\footer}[0]{
    \renewcommand{\footrulewidth}{0.1pt}  % Separation rule
    \cfoot{\vspace{1mm}\textcolor{uc3mNewBlue}{Universidad Carlos III de Madrid - \campus}
    \textcolor{uc3mNewBlue}{\\\studyname
    \\\subjectname}}
    \rfoot{\vspace{1mm} \mypagename \thepage} % Current page
}

%%%%% Title page %%%%%
\newcommand{\titleMain}[0]{
    \begin{titlepage}
    ~\\[0.1 cm]
    \begin{center}
    \textcolor{uc3mNewBlue}{\rule{\textwidth}{3px}} 
    {\Huge {\textcolor{gray}{\fontseries{bx}{\selectfont \documenttitle}}}
    ~\\[0.1 cm]
    \textcolor{uc3mNewBlue}{\rule{\textwidth}{3px}}}
    ~\\[0.1 cm]
    \Large \mdseries\textcolor{gray}{
    \textbf{\studyname}
    \textbf{\\\subjectname}}
    \end{center}
    \vspace{5mm}
    \begin{flushright}
    \ifauthorstwo
        \ifemail
        \begin{tabular}{ r r r }
            \large{\authorI} & \large{\niaI} & \large{\groupI}\\
            \multicolumn{3}{r}{\large{\emailI}}\\
            \large{\authorII} & \large{\niaII} & \large{\groupII}\\
            \multicolumn{3}{r}{\large{\emailII}}\\
        \end{tabular}
        \else
        \begin{tabular}{ r r r }
            \large{\authorI} & \large{\niaI} & \large{\groupI}\\
            \large{\authorII} & \large{\niaII} & \large{\groupII}\\
        \end{tabular}
        \fi
    \fi
    \ifauthorsthree
        \ifemail
        \begin{tabular}{ r r r }
            \large{\authorI} & \large{\niaI} & \large{\groupI}\\
            \multicolumn{3}{r}{\large{\emailI}}\\
            \large{\authorII} & \large{\niaII} & \large{\groupII}\\
            \multicolumn{3}{r}{\large{\emailII}}\\
            \large{\authorIII} & \large{\niaIII} & \large{\groupIII}\\
            \multicolumn{3}{r}{\large{\emailIII}}\\
        \end{tabular}
        \else
        \begin{tabular}{ r r r }
            \large{\authorI} & \large{\niaI} & \large{\groupI}\\
            \large{\authorII} & \large{\niaII} & \large{\groupII}\\
            \large{\authorIII} & \large{\niaIII} & \large{\groupIII}\\
        \end{tabular}
        \fi
    \fi
    \ifauthorsfour
        \ifemail
        \begin{tabular}{ r r }
            \multicolumn{2}{r}{\large{\groupIV{}}}\\
            \large{\authorIofIV} & \large{\niaIofIV}\\
            \multicolumn{2}{r}{\large{\emailI}}\\
            \large{\authorIIofIV} & \large{\niaIIofIV}\\
            \multicolumn{2}{r}{\large{\emailII}}\\
            \large{\authorIIIofIV} & \large{\niaIIIofIV}\\
            \multicolumn{2}{r}{\large{\emailIII}}\\
            \large{\authorIVofIV} & \large{\niaIVofIV}\\
            \multicolumn{2}{r}{\large{\emailIV}}\\
        \end{tabular}
        \else
        \begin{tabular}{ r r }
            \multicolumn{2}{r}{\large{\groupIV{}}}\\
            \large{\authorIofIV} & \large{\niaIofIV}\\
            \large{\authorIIofIV} & \large{\niaIIofIV}\\
            \large{\authorIIIofIV} & \large{\niaIIIofIV}\\
            \large{\authorIVofIV} & \large{\niaIVofIV}\\
        \end{tabular}
        \fi
    \fi
    \end{flushright}
    \vspace{1cm}
    \begin{center}
    \includegraphics[scale=0.25]{template/logo_completo_vertical.png}
    \end{center}
    \end{titlepage}
    \newpage
}

%%%%% Paragraph style %%%%%
% \newcommand{\p}{\justify\mdseries\normalsize{\hspace{0cm}}} % \justify\mdseries\normalsize{\hspace{0cm}}}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.75em}


%%%%% Section style %%%%%
\titleformat{\section}{
    \large\bfseries\color{uc3mNewBlue}{}\setlength{\parskip}{0em}}
    {}{0em}
      {}
      [\color{uc3mNewBlue}{\titlerule[2pt]}\vspace{0.3cm}]


%%%%% Subsection style %%%%%
\titleformat{\subsection}{
    \normalsize\bfseries\color{uc3mNewBlue}{}\setlength{\parskip}{0em}}
    {}{0em}
      {}


%%%%% Subsubsection style %%%%%
\titleformat{\subsubsection}{
    \normalsize\color{uc3mNewBlue}{}\setlength{\parskip}{0em}}
    {}{0em}
      {}
