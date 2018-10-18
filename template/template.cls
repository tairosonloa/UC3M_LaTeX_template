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
\newif\ifcoauthorstwo
\newif\ifcoauthorsthree
\newif\ifcoauthorsfour
\newif\ifemail

%%%%% Coauthors (students), NIA and group, up to two coauthors %%%%%
\newcommand{\coauthorstwo}[6]{
    \def\coauthorIofII{#1}
    \def\niaIofII{#2}
    \def\groupIofII{#3}
    \def\coauthorIIofII{#4}
    \def\niaIIofII{#5}
    \def\groupIIofII{#6}
}

%%%%% Coauthors (students), NIA and group, up to three coauthors %%%%%
\newcommand{\coauthorsthree}[9]{
    \def\coauthorIofIII{#1}
    \def\niaIofIII{#2}
    \def\groupIofIII{#3}
    \def\coauthorIIofIII{#4}
    \def\niaIIofIII{#5}
    \def\groupIIofIII{#6}
    \def\coauthorIIIofIII{#7}
    \def\niaIIIofIII{#8}
    \def\groupIIIofIII{#9}
}

%%%%% Coauthors (students) with NIA and without group, up to four coauthors %%%%%
\newcommand{\coauthorsfour}[8]{
    \def\coauthorIofIV{#1}
    \def\niaIofIV{#2}
    \def\coauthorIIofIV{#3}
    \def\niaIIofIV{#4}
    \def\coauthorIIIofIV{#5}
    \def\niaIIIofIV{#6}
    \def\coauthorIVofIV{#7}
    \def\niaIVofIV{#8}
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
\newcommand{\emailstwo}[2]{
    \def\emailIofII{#1}
    \def\emailIIofII{#2}
}
\newcommand{\emailsthree}[3]{
    \def\emailIofIII{#1}
    \def\emailIIofIII{#2}
    \def\emailIIIofIII{#3}
}
\newcommand{\emailsfour}[4]{
    \def\emailIofIV{#1}
    \def\emailIIofIV{#2}
    \def\emailIIIofIV{#3}
    \def\emailIVofIV{#4}
}

%%%%% Header %%%%%
\newcommand{\header}[0]{
    %%%% Left part of header %%%%
    \ifcoauthorstwo
    \lhead{
        \textcolor{gray}{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{lll}
        \coauthorIofII & \niaIofII\\
        \coauthorIIofII & \niaIIofII\\
        \end{tabular}}
    }
    \fi
    \ifcoauthorsthree
    \lhead{
        \textcolor{gray}{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{ll}
        \coauthorIofIII & \niaIofIII\\
        \coauthorIIofIII & \niaIIofIII\\
        \coauthorIIIofIII & \niaIIIofIII\\
        \end{tabular}}
    }
    \fi
    \ifcoauthorsfour
    \lhead{
        \textcolor{gray}{
        \vspace*{-\baselineskip} % To remove white spaces up and down the header table
        \begin{tabular}{ll}
        \coauthorIofIV & \niaIofIV\\
        \coauthorIIofIV & \niaIIofIV\\
        \coauthorIIIofIV & \niaIIIofIV\\
        \coauthorIVofIV & \niaIVofIV\\
        \end{tabular}}
    }
    \fi

    %%%% Right part of header %%%%
    \ifcoauthorsfour
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
    \ifcoauthorstwo
        \ifemail
        \begin{tabular}{ r r r }
            \large{\coauthorIofII} & \large{\niaIofII} & \large{\groupIofII}\\
            \multicolumn{3}{r}{\large{\emailIofII}}\\
            \large{\coauthorIIofII} & \large{\niaIIofII} & \large{\groupIIofII}\\
            \multicolumn{3}{r}{\large{\emailIIofII}}\\
        \end{tabular}
        \else
        \begin{tabular}{ r r r }
            \large{\coauthorIofII} & \large{\niaIofII} & \large{\groupIofII}\\
            \large{\coauthorIIofII} & \large{\niaIIofII} & \large{\groupIIofII}\\
        \end{tabular}
        \fi
    \fi
    \ifcoauthorsthree
        \ifemail
        \begin{tabular}{ r r r }
            \large{\coauthorIofIII} & \large{\niaIofIII} & \large{\groupIofIII}\\
            \multicolumn{3}{r}{\large{\emailIofIII}}\\
            \large{\coauthorIIofIII} & \large{\niaIIofIII} & \large{\groupIIofIII}\\
            \multicolumn{3}{r}{\large{\emailIIofIII}}\\
            \large{\coauthorIIIofIII} & \large{\niaIIIofIII} & \large{\groupIIIofIII}\\
            \multicolumn{3}{r}{\large{\emailIIIofIII}}\\
        \end{tabular}
        \else
        \begin{tabular}{ r r r }
            \large{\coauthorIofIII} & \large{\niaIofIII} & \large{\groupIofIII}\\
            \large{\coauthorIIofIII} & \large{\niaIIofIII} & \large{\groupIIofIII}\\
            \large{\coauthorIIIofIII} & \large{\niaIIIofIII} & \large{\groupIIIofIII}\\
        \end{tabular}
        \fi
    \fi
    \ifcoauthorsfour
        \ifemail
        \begin{tabular}{ r r }
            \large{\coauthorIofIV} & \large{\niaIofIV}\\
            \multicolumn{2}{r}{\large{\emailIofIV}}\\
            \large{\coauthorIIofIV} & \large{\niaIIofIV}\\
            \multicolumn{2}{r}{\large{\emailIIofIV}}\\
            \large{\coauthorIIIofIV} & \large{\niaIIIofIV}\\
            \multicolumn{2}{r}{\large{\emailIIIofIV}}\\
            \large{\coauthorIVofIV} & \large{\niaIVofIV}\\
            \multicolumn{2}{r}{\large{\emailIVofIV}}\\
        \end{tabular}
        \else
        \begin{tabular}{ r r }
            \large{\coauthorIofIV} & \large{\niaIofIV}\\
            \large{\coauthorIIofIV} & \large{\niaIIofIV}\\
            \large{\coauthorIIIofIV} & \large{\niaIIIofIV}\\
            \large{\coauthorIVofIV} & \large{\niaIVofIV}\\
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

%%%%% Section style %%%%%
\titleformat{\section}{
    \large\bfseries\color{uc3mNewBlue}{}}
    {}{0em}
      {}
      [\color{uc3mNewBlue}{\titlerule[2pt]}\vspace{0.3cm}]
     
%%%%% Subsection style %%%%%
\titleformat{\subsection}{
    \normalsize\bfseries\color{uc3mNewBlue}{}}
    {}{0em}
      {}


%%%%% Subsubsection style %%%%%
\titleformat{\subsubsection}{
    \normalsize\color{uc3mNewBlue}{}}
    {}{0em}
      {}
      
%%%%% Text style %%%%%
\newcommand{\p}{\justify\mdseries\normalsize{\hspace{0cm}}} % \justify\mdseries\normalsize{\hspace{0cm}}}
