\NeedsTeXFormat{LaTeX2e}                                                    % Tells the compiler which version of LaTeX the package is for.
\ProvidesClass{UC3M_slides}[Template for UC3M slides]                       % Gives the compiler some information about your package.
\LoadClass{beamer}                                                          % Our template is based on beamer.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 UC3M slides template                 %
%           Universidad Carlos III de Madrid           %
%              Author: Aitor Alonso Núñez              %
%              Last update: January 2019               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Required Packages %%%%%
\RequirePackage{color}                                                          % Colors
\RequirePackage{xcolor}                                                         % More colors
\RequirePackage{colortbl}                                                       % Table colors
\usepackage[scaled]{helvet}                                                     % Helvet font as is the UC3M corporate identity font
\RequirePackage{graphicx}                                                       % To add images and graphics.
\RequirePackage{caption}                                                        % To add captions
\RequirePackage[spanish, es-noindentfirst, es-noshorthands, es-tabla]{babel}    % Language format package (Spanish).
\RequirePackage[utf8]{inputenc}                                                 % UTF-8 input encode always!!
\RequirePackage{textcomp}                                                       % To write symbols like €
\RequirePackage{tikz}                                                           % To set header image
\RequirePackage{fancybox}                                                       % To set title into a box
\RequirePackage{array}                                                          % Table formating

%%%%% Colors %%%%%
\definecolor{gray}{rgb}{0.2509803922, 0.2509803922, 0.2509803922}
\definecolor{grayLight}{rgb}{0.4980392157, 0.4980392157, 0.4980392157}
% Color UC3M corporative identity
% - Old corporative identity
\definecolor{uc3mDarkBlue}{RGB}{0, 7, 121}
\definecolor{uc3mBlue}{RGB}{32, 85, 138}
\definecolor{uc3mLightBlue}{RGB}{99, 158, 200}
% - New corporative identity
\definecolor{uc3mNewBlue}{RGB}{0, 29, 133}
% Set main color and titles color
\setbeamercolor{structure}{fg=uc3mNewBlue}              % Slides structure
\setbeamercolor{title}{fg=white,bg=uc3mNewBlue}         % Title slide blue box
\setbeamercolor{frametitle}{fg=white,bg=uc3mNewBlue}    % Frame title header
\setbeamercolor{footline}{fg=white,bg=uc3mNewBlue}      % Footer

%%%%% Lists formating %%%%%
\renewcommand{\labelitemi}{\textcolor{uc3mNewBlue}{$\bullet$}}
\renewcommand{\labelitemii}{\textcolor{uc3mNewBlue}{$\circ$}}
\renewcommand{\labelitemiii}{\textcolor{uc3mNewBlue}{\textbullet}}
\renewcommand{\labelitemiv}{\textcolor{uc3mNewBlue}{$\diamond$}}
\renewcommand{\@listI}{ % List margins
    \leftmargin=25pt
    \rightmargin=0pt
    \labelsep=5pt
    \labelwidth=20pt
    \itemindent=0pt
    \listparindent=0pt
    \topsep=-5pt
    \partopsep=0pt plus 1pt minus 1pt
    \parsep=0pt plus 1pt
    \itemsep=\parsep
}

%%%%% Table formating %%%%%
\renewcommand{\arraystretch}{1.25} % Table cells margin
\newcommand{\hcell}[1]{\cellcolor{uc3mNewBlue}{\color{white} \textbf{#1}}} % Table header cell, blue background with white bold text.
% Table cells with fixed size
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}} % Left aligned
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}} % Centered
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}} % Right aligned

%%%%% Table of contents theme
\useinnertheme{circles}

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
\newcommand{\documentdata}[3]{
    \def\studyname{#1}
    \def\subjectname{#2}
    \def\documenttitle{#3}
}

%%%%% Email addresses of document coauthors %%%%
\newcommand{\emails}[4]{
    \def\emailI{#1}
    \def\emailII{#2}
    \def\emailIII{#3}
    \def\emailIV{#4}
}




%%%%% Header %%%%%
\addtobeamertemplate{frametitle}{}{
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north east,xshift=-3pt,yshift=-3pt] at (current page.north east) {\includegraphics[scale=0.06]{template/uc3m_MoscaSombra.png}};
    \end{tikzpicture}
}

% %%%%% Footer %%%%%
\setbeamertemplate{navigation symbols}{} % Remove navigation simbols
\setbeamertemplate{footline}{
    \hbox{
        \hspace{-5pt}
        \begin{beamercolorbox}[wd=.84\paperwidth,ht=1.8em,dp=1ex,left]{footline}
            \hspace*{4ex}\normalsize{\documenttitle}
        \end{beamercolorbox}
        \begin{beamercolorbox}[wd=.16\paperwidth,ht=1.8em,dp=1ex,right]{footline}
            \normalsize{\insertpagenumber}\hspace*{4ex}
        \end{beamercolorbox}
    }
}

%%%%% Title page %%%%%
\setbeamertemplate{title page}{
    \begin{center}
        \begin{beamercolorbox}[sep=8pt,center,rounded=true]{title}
            \huge{\fontseries{bx}{\selectfont\documenttitle}}
        \end{beamercolorbox}
        ~\\[0.1 cm]
        \large\mdseries\textcolor{gray}{
        \textbf{\studyname}
        \textbf{\\\subjectname}}
    \end{center}
    \begin{flushright}
    \ifauthorstwo
        \ifemail
        \begin{tabular}{ r r r }
            \footnotesize{\authorI} & \footnotesize{\niaI} & \footnotesize{\groupI}\\
            \multicolumn{3}{r}{\footnotesize{\emailI}}\\
            \footnotesize{\authorII} & \footnotesize{\niaII} & \footnotesize{\groupII}\\
            \multicolumn{3}{r}{\footnotesize{\emailII}}
        \end{tabular}
        \else
        \begin{tabular}{ r r r }
            \footnotesize{\authorI} & \footnotesize{\niaI} & \footnotesize{\groupI}\\
            \footnotesize{\authorII} & \footnotesize{\niaII} & \footnotesize{\groupII}
        \end{tabular}
        \fi
    \fi
    \ifauthorsthree
        \ifemail
        \begin{tabular}{ r r r }
            \footnotesize{\authorI} & \footnotesize{\niaI} & \footnotesize{\groupI}\\
            \multicolumn{3}{r}{\footnotesize{\emailI}}\\
            \footnotesize{\authorII} & \footnotesize{\niaII} & \footnotesize{\groupII}\\
            \multicolumn{3}{r}{\footnotesize{\emailII}}\\
            \footnotesize{\authorIII} & \footnotesize{\niaIII} & \footnotesize{\groupIII}\\
            \multicolumn{3}{r}{\footnotesize{\emailIII}}
        \end{tabular}
        \else
        \begin{tabular}{ r r r }
            \footnotesize{\authorI} & \footnotesize{\niaI} & \footnotesize{\groupI}\\
            \footnotesize{\authorII} & \footnotesize{\niaII} & \footnotesize{\groupII}\\
            \footnotesize{\authorIII} & \footnotesize{\niaIII} & \footnotesize{\groupIII}
        \end{tabular}
        \fi
    \fi
    \ifauthorsfour
        \ifemail
        \begin{tabular}{ r r }
            \multicolumn{2}{r}{\footnotesize{\groupIV}}\\
            \footnotesize{\authorIofIV} & \footnotesize{\niaIofIV}\\
            \multicolumn{2}{r}{\footnotesize{\emailI}}\\
            \footnotesize{\authorIIofIV} & \footnotesize{\niaIIofIV}\\
            \multicolumn{2}{r}{\footnotesize{\emailII}}\\
            \footnotesize{\authorIIIofIV} & \footnotesize{\niaIIIofIV}\\
            \multicolumn{2}{r}{\footnotesize{\emailIII}}\\
            \footnotesize{\authorIVofIV} & \footnotesize{\niaIVofIV}\\
            \multicolumn{2}{r}{\footnotesize{\emailIV}}
        \end{tabular}
        \else
        \begin{tabular}{ r r }
            \multicolumn{2}{r}{\footnotesize{\groupIV}}\\
            \footnotesize{\authorIofIV} & \footnotesize{\niaIofIV}\\
            \footnotesize{\authorIIofIV} & \footnotesize{\niaIIofIV}\\
            \footnotesize{\authorIIIofIV} & \footnotesize{\niaIIIofIV}\\
            \footnotesize{\authorIVofIV} & \footnotesize{\niaIVofIV}
        \end{tabular}
        \fi
    \fi
    \end{flushright}
    \begin{center}
    \includegraphics[scale=0.25]{template/acronimo_nombre1l.eps}
    \end{center}
}
