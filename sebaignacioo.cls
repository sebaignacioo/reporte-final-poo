%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | Personal LaTeX template | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | Template class          | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | by Sebastian Garcia     | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% | @sebaignacioo           | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% |                         | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% |          2021           | %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sebaignacioo}[2021/05/28 sebaignacioo.dev v1.0b, Class for my
personal LaTeX template.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% | Paquetes requeridos | %%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[a-1b]{pdfx}
\RequirePackage{styles}
\RequirePackage{accsupp}
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{ifxetex,ifluatex}
\RequirePackage{scrlfile}
\RequirePackage{xparse}
\RequirePackage{titlesec}
\RequirePackage[breakable]{tcolorbox}
\RequirePackage{minted}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% | Manejo de fuentes | %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hypersetup{%
    pdfborder = {0 0 0}
}

\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\ifxetexorluatex
  \RequirePackage{fontspec}
\else
  \RequirePackage{cmap}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfgentounicode=1
\fi

% Seleccionar fuente. Por defecto: Lato y Roboto Mono
\ifxetexorluatex
  \setmainfont{Roboto}
  \setmonofont{Roboto Mono}
\else
  \usepackage[default]{roboto}
  \usepackage[regular,scaled=0.9]{roboto-mono}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% | Manejo de colores | %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}

\usemintedstyle{autumn}

% Colores generales
\definecolor{DarkGrey}{gray}{0.075}
\definecolor{LightGrey}{gray}{0.925}
\definecolor{MyGreen}{RGB}{36, 176, 71}
\definecolor{MyRed}{RGB}{176, 71, 64}
\definecolor{MyBlue}{RGB}{64, 131, 176}
\definecolor{MyYellow}{RGB}{204, 168, 53}

% Colores de lenguajes de programacion
%% Python
\definecolor{PythonYellow}{RGB}{255, 212, 59}
\definecolor{PythonBlue}{RGB}{48, 105, 152}
%% C
\definecolor{CBlack}{gray}{0.15}
%% Shell
\definecolor{ShellWhite}{gray}{0.85}
%% Java
\definecolor{JavaRed}{RGB}{204, 53, 52}

\colorlet{general}{black}
\colorlet{header}{black}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% | Header | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Variables
\newcommand{\institucion}[1]{\def\@institucion{#1}}
\newcommand{\facultad}[1]{\def\@facultad{#1}}
\newcommand{\escuela}[1]{\def\@escuela{#1}}
\newcommand{\claveAsignatura}[1]{\def\@claveAsignatura{#1}}
\newcommand{\nombreAsignatura}[1]{\def\@nombreAsignatura{#1}}
\newcommand{\numSemestre}[1]{\def\@numSemestre{#1}}
\newcommand{\numAnno}[1]{\def\@numAnno{#1}}
\newcommand{\nombre}[1]{\def\@nombre{#1}}
\newcommand{\tituloDocumento}[1]{\def\@tituloDocumento{#1}}
\newcommand{\subtituloDocumento}[1]{\def\@subtituloDocumento{#1}}

% Definiciones de tamaños de imagenes
\newlength{\sebaignacioo@images@width}
\newlength{\sebaignacioo@image@diam@left}
\newlength{\sebaignacioo@image@diam@right}
\def\sebaignacioo@left@images{}
\def\sebaignacioo@right@images{}

% Agregar imagenes
\newcommand{\@makeaimage}[2]{%
  \begin{minipage}{#1}%
      \includegraphics[width=\linewidth]{#2}
  \end{minipage}%
}

\newcommand{\sebaignacioo@add@image@left}[1]{%
  \appto{\sebaignacioo@left@images}{%
    \@makeaimage{\sebaignacioo@image@diam@left}{#1}\hspace{0.25ex}%
  }%
  \addtolength{\sebaignacioo@images@width}{\sebaignacioo@image@diam@left}%
  \addtolength{\sebaignacioo@images@width}{1ex}%
}
\newcommand{\sebaignacioo@add@image@right}[1]{%
  \appto{\sebaignacioo@right@images}{%
    \@makeaimage{\sebaignacioo@image@diam@right}{#1}\hspace{1ex}%
  }%
  \addtolength{\sebaignacioo@images@width}{\sebaignacioo@image@diam@right}%
  \addtolength{\sebaignacioo@images@width}{1ex}%
}
\newcommand{\imageL}[2]{%
  \setlength{\sebaignacioo@image@diam@left}{#1}%
  \forcsvlist{\sebaignacioo@add@image@left}{#2}%
}
\newcommand{\imageR}[2]{%
  \setlength{\sebaignacioo@image@diam@right}{#1}%
  \forcsvlist{\sebaignacioo@add@image@right}{#2}%
}
\let\image\imageR

\newcommand{\generalFont}{\normalsize}
\newcommand{\titleFont}{\LARGE\bfseries}
\newcommand{\subtitleFont}{\normalsize}

% Comando que realiza el header
\newcommand{\makeHeader}{%
  \begingroup
    \sebaignacioo@left@images\hfill%
    \begin{minipage}{(\dimexpr\linewidth-\sebaignacioo@images@width)/2}%
    \raggedright%
    {\generalFont\color{header}\@institucion\par}
    {\generalFont\color{header}Facultad de \@facultad\par}
    {\generalFont\color{header}\underline{Escuela de \@escuela}\par}
    \end{minipage}%
    \begin{minipage}{(\dimexpr\linewidth-\sebaignacioo@images@width-5em)/2}%
    \raggedleft%
    {\generalFont\color{header}\@claveAsignatura - \@nombreAsignatura\par}
    \underline{{\generalFont\color{header}\@numSemestre } {\generalFont\color{header}Semestre - \@numAnno\par}}
    \end{minipage}\hfill%
    \sebaignacioo@right@images\par%
  \endgroup
  \vspace{5ex}
  \begingroup
    {\centering\titleFont\color{general}\@tituloDocumento\par}
    \vspace{3mm}
    {\centering\subtitleFont\color{general}\@subtituloDocumento\par}
  \endgroup
  \vspace{5ex}
}

%% | Créditos | %%
\newcommand{\creditos}{%
  \vfill%
  \textbf{Este informe fue generado y escrito en \LaTeX, y su código es de acceso público a través del {\color{MyGreen}\href{https://github.com/sebaignacioo/reporte-final-poo}{repositorio GitHub}}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% | Lenguajes Minted | %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lenguaje Python
\newmintedfile[pycode]{python3}{
  baselinestretch=1.1,
  fontsize=\small,
  linenos,
  numbersep=15pt,
}

% Lenguaje C
\newmintedfile[ccode]{c}{
  baselinestretch=1.1,
  fontsize=\small,
  linenos,
  numbersep=15pt,
}

% Salida Shell
\newmintedfile[shellcode]{console}{
  baselinestretch=1.1,
  fontsize=\scriptsize,
}

% Lenguaje Java
\newmintedfile[javacode]{java}{
  baselinestretch=1.1,
  fontsize=\small,
  linenos,
  numbersep=15pt,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% | Cajas de contenido | %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Parámetros: Color, Titulo y Contenido
%
\newcommand{\colorBox}[3]{%
    \begin{tcolorbox}
          [colback=#1!15!white,
           colframe=#1,
           breakable,
           title=#2]
      #3
    \end{tcolorbox}
}

%
% Parámetros: Titulo y Contenido
%

% Info box
\newcommand{\infoBox}[2]{%
  \colorBox{MyBlue}{\faInfo\hspace{0.75em}\textbf{Info} - #1}{#2}
}

% Info box
\newcommand{\darkBox}[2]{%
  \colorBox{DarkGrey}{\faPlay\hspace{0.75em} #1}{#2}
}

% Warning box
\newcommand{\warningBox}[2]{%
  \colorBox{MyYellow}{\faExclamation\hspace{0.75em}\textbf{Cuidado!} - #1}{#2}
}

% Error box
\newcommand{\errorBox}[2]{%
  \colorBox{MyRed}{\faTimes\hspace{0.75em}\textbf{Error!} - #1}{#2}
}

% Success box
\newcommand{\successBox}[2]{%
  \colorBox{MyGreen}{\faCheck\hspace{0.75em}\textbf{Bien!} - #1}{#2}
}

% Code boxes

% Python
\newcommand{\pyFileBox}[2]{%
    \begin{tcolorbox}
          [colback=PythonYellow!10!white,
           leftupper=25pt, 
           adjusted title=flush left,
           halign title=flush left,
           colframe=PythonBlue,
           coltitle=PythonYellow,
           title=\faPython\hspace{0.75em}\textbf{#1.py}]
        \pycode{#2}
    \end{tcolorbox}
}

% C
\newcommand{\cFileBox}[2]{%
    \begin{tcolorbox}
          [colback=CBlack!10!white,
           leftupper=25pt, 
           adjusted title=flush left,
           halign title=flush left,
           colframe=CBlack,
           coltitle=white,
           title=\faCuttlefish\hspace{0.75em}\textbf{#1.c}]
        \ccode{#2}
    \end{tcolorbox}
}

% Shell exit
\newcommand{\Shell}[2]{%
    \usemintedstyle{monokai}
    \begin{tcolorbox}
          [colback=black!90!white,
           leftupper=25pt, 
           adjusted title=flush left,
           halign title=flush left,
           colframe=MyGreen!90!black,
           coltitle=white,
           title=\faTerminal\hspace{0.75em}Consola: \textbf{#1}]
        \shellcode{#2}
    \end{tcolorbox}
    \usemintedstyle{colorful}
}

% Java
\newcommand{\javaFileBox}[2]{%
    \begin{tcolorbox}
          [colback=white,
           leftupper=25pt, 
           adjusted title=flush left,
           halign title=flush left,
           colframe=JavaRed,
           coltitle=white,
           title=\faJava\hspace{0.75em}\textbf{#1.java},
           breakable]
        \javacode{#2}
    \end{tcolorbox}
}