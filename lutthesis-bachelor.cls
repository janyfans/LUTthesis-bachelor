% !Mode:: "TeX:UTF-8"
% === 'lutthesis-bachelor.cls' === BEGIN

% =========== class clarification ===========
% 模板声明

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lutthesis-bachelor}
              [2025/08/07 v0.2.0
The LaTeX template for bachelor thesis of LUT]
\typeout{Document Class `lutthesis-bachelor' v0.2.0 by JanYFans (2025/08)}

% ============== class options ==============
% 模板选项

\newif\iflut@color\lut@colorfalse
\newif\iflut@twoteacher\lut@twoteacherfalse
\newif\iflut@nospace\lut@nospacefalse

\DeclareOption{color}{\lut@colortrue}
\DeclareOption{twoteacher}{\lut@twoteachertrue}
\DeclareOption{nospace}{\lut@nospacetrue}

% 选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 引用ctexbook及基本设置
\LoadClass[zihao=-4,a4paper]{ctexbook}[2007/10/19]

% ============== global package ==============
% 全局宏包

\RequirePackage{ifthen}

% ============== font ==============
% 数学和字体

\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}

% hyphen
% For the `\hyp{}` command. Allow the user to insert `hyp{}` manually to
% adjust the line break when necessary.
\RequirePackage{hyphenat}
% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
\setmainfont{Times New Roman}
% 重新定义宋体和黑体，让其能支持textbf
\let\songti\relax
\let\heiti\relax
\setCJKfamilyfont{songti}[AutoFakeBold = {2.17}]{SimSun}
\setCJKfamilyfont{heiti}[AutoFakeBold = {2.17}]{SimHei}
\setCJKfamilyfont{hwxingkai}[AutoFakeBold = {2.17}]{STXingkai}
\setCJKfamilyfont{hwkaiti}[AutoFakeBold = {2.17}]{STKaiti}
\setCJKfamilyfont{hwxinwei}[AutoFakeBold = {2.17}]{STXinwei}
\newcommand{\songti}{\CJKfamily{songti}}
\newcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\hwkaiti}{\CJKfamily{hwkaiti}}
\newcommand{\hwxinwei}{\CJKfamily{hwxinwei}}

% 预定义的字体大小
\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}     % 初号
\newcommand{\xiaochu}{\fontsize{32pt}{\baselineskip}\selectfont}    % 小初
\newcommand{\yihao}{\fontsize{26pt}{39pt}\selectfont}               % 一号
\newcommand{\xiaoyi}{\fontsize{24pt}{36pt}\selectfont}              % 小一
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}               % 二号
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}              % 小二
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}              % 三号
\newcommand{\xiaosan}{\fontsize{15pt}{22.5pt}\selectfont}           % 小三
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}               % 四号
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}              % 小四
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}          % 五号
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}             % 小五
\newcommand{\liuhao}{\fontsize{7.5pt}{11.25pt}\selectfont}          % 六号

% ============== color ==============
% 颜色设置

\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

% ============== page margin ==============
% 页面边距

\RequirePackage{geometry}
\newgeometry{
    top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.0cm,
    headheight=30pt,headsep=4.4mm,footskip=5mm
}
\savegeometry{bachelorgeometry}
\loadgeometry{bachelorgeometry}

% ============== space ==============
% 其他间距

\renewcommand{\baselinestretch}{1.5} % 1.5 倍行距
\setlength{\parindent}{2em} % 段落首行缩进
\setlength{\floatsep}{3pt plus 3pt minus 2pt} % 图形之间或图形与正文之间的距离
\setlength{\textfloatsep}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

% ============== header & footer ==============
% 页眉和页脚

\RequirePackage{fancyhdr}
\newif\iff@nch@compatViii
\let\f@nch@gbl\relax
\let\f@nch@gbl\global
    \f@nch@compatViiitrue

% 字体缩放，仅供页眉标题使用
\newcommand{\scaledtitle}[1]{
    {\fontsize{22pt}{26pt}\selectfont
    \scalebox{1.5}[1]{
        \kern-0.3em\strut#1
    }}
}

\fancypagestyle{frontmatter}{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
}

\fancypagestyle{mainmatter}{
    \fancyhead{}
    \fancyfoot{}
    \fancyhead[C]{
        \scaledtitle{\hwxingkai\lut@university 毕业设计}
    }
    \fancyfoot[C]{
        % Times New Roman
        \zihao{-5}\thepage
    }

    % 页眉线 （双横线）
    \renewcommand{\headrulewidth}{3.8bp}
    \renewcommand{\headruleskip}{0pt}
    \makeatletter
    \def\headrule{
        {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
        \vskip -2bp
        \hrule\@height 2bp
        \vskip 1bp
        \hrule\@height 0.8bp
        \vskip-\headrulewidth
        }
    }
    \makeatother

    % 页脚线
    % \renewcommand{\footrulewidth}{0.4bp}
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}

% ============== title ==============
% 标题设置

% 汉化
\renewcommand{\contentsname}{\heiti\zihao{3}\bfseries 目\quad 录}
\renewcommand\listfigurename{\heiti\zihao{3}\bfseries 插\ 图\ 目\ 录}
\renewcommand\listtablename{\heiti\zihao{3}\bfseries 表\ 格\ 目\ 录}
\renewcommand\bibname{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 格式
\ctexset{
    % 第1章 xxxxx
    chapter={
        format={\centering\songti\zihao{3}\bfseries},
        name={第,章},
        number={\arabic{chapter}},
        aftername={\quad},
        % 此部分若按照如下设置则会出现大段空白
        % beforeskip={1.0\baselineskip},
        beforeskip={-20pt},
        afterskip={0.5\baselineskip},
    },
    % 1.1 xxxxx
    section={
        format={\songti\zihao{4}\bfseries},
        aftername={\hspace{0.5em}},
        beforeskip={0.5\baselineskip},
        afterskip={0.5\baselineskip},
        indent=0pt,
    },
    % 1.1.1 xxxxx
    subsection={
        format={\songti\zihao{-4}\bfseries},
        aftername={\hspace{0.5em}},
        beforeskip={0.5\baselineskip},
        afterskip={0.5\baselineskip},
        indent=0pt,
    },
}

% ============== contents ==============
% 目录设置

\RequirePackage{titletoc}

%tip - 这里到时候要加摘要和Abstract的页码（已解决）

\iflut@nospace
    \titlecontents{chapter}[0pt]{\songti\zihao{-4}\bfseries}{\thecontentslabel\ }{}
        {\titlerule*[4pt]{.}\hspace{-.5em}\contentspage}
    \titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\titlerule*[4pt]{.}\hspace{-.5em}\contentspage}
    \titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\titlerule*[4pt]{.}\hspace{-.5em}\contentspage}
\else
    \titlecontents{chapter}[0pt]{\songti\zihao{-4}\bfseries}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{.}\hspace{-.5em}\contentspage}
    \titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{.}\hspace{-.5em}\contentspage}
    \titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{.}\hspace{-.5em}\contentspage}
\fi
% 取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

% 表目录图目录的格式设置
% 表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

% ============== cross reference ==============
% 交叉引用

\RequirePackage[xetex,unicode]{hyperref}
\iflut@color
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi

\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={LUT bachelor thesis},
    pdfauthor={JanYFans},
    pdfsubject={兰州理工大学毕业设计论文模板},
    pdfcreator={LaTeXed~By~JanYFans},
}

% ============== reference ==============
% 参考文献

\RequirePackage[sort&compress]{natbib}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% 重新定义参考文献环境
\renewenvironment{thebibliography}[1]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \chapter*{\centering\songti\zihao{3}\bibname}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
    \songti\zihao{5}
    \list{@biblabel{\@arabic\c@enumiv}}{%
        \settowidth\labelwidth{\@biblabel{#1}}
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}
        % 减小条目间距的关键参数
        \setlength{\itemsep}{2pt}   % 条目之间的垂直距离
        \setlength{\parsep}{1pt}    % 段落之间的距离
        \setlength{\parskip}{0pt}   % 段落内的额外间距
        }
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000
    \sfcode`\.\@m
}{
    \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
}

% ============== table ==============
% 表格设置

% 设置三线表格的上下边为粗实线
\RequirePackage{booktabs}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{5}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}

% ============== picture ==============
% 图片设置

\RequirePackage{graphicx}
\graphicspath{{figure/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

% ============== list ==============
% 列表设置

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

% ============== code ==============
% 代码设置

% Listing 的设置请参考 http://en.wikibooks.org/wiki/LaTeX/Packages/Listings
\RequirePackage{listings}
\lstset{
    backgroundcolor=\color{white},
    basicstyle=\zihao{5}\ttfamily,
    columns=flexible,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    frame=single,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    stepnumber=1,
    rulecolor=\color{black},
    tabsize=2,
    texcl=true,
    title=\lstname,
    escapeinside={\%*}{*)},
    extendedchars=false,
    mathescape=true,
    xleftmargin=3em,
    xrightmargin=3em,
}
\iflut@color
    \lstset{
        numberstyle=\color{gray},
        keywordstyle=\color{blue},
        commentstyle=\color{dkgreen},
        stringstyle=\color{mauve},
    }
\else
    \lstset{
        numberstyle=\color{black},
        keywordstyle=\color{black},
        commentstyle=\color{black},
        stringstyle=\color{black},
    }
\fi

% 重命名Listings标题头
\renewcommand{\lstlistingname}{代码}

% ============== theorem ==============
% 定理

\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

% ============== file directory ==============
% 文件目录

\RequirePackage{dirtree}
\iflut@color
    \renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
    \renewcommand*\DTstyle{\ttfamily\color{red}}
\fi

% ============== caption ==============
% 图表标题

\RequirePackage{caption}
\DeclareCaptionFormat{bachelorfigure}{\hwkaiti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{bachelortable}{\hwkaiti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{bachelorlstlisting}{\songti\bf\zihao{5}{#1\textrm{#2}#3}}

\captionsetup[figure]{format=bachelorfigure,labelsep=quad}
\captionsetup[table]{format=bachelortable,labelsep=quad}
\captionsetup[lstlisting]{format=bachelorlstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}

% ============== other settings ==============
% 杂项

% 设置<附录>的图表编号与当前附录章号关联
\newcommand{\rmrelation}{
    % 图、表、公式编号随 chapter 清零
    \@addtoreset{figure}{chapter}
    \@addtoreset{table}{chapter}
    \@addtoreset{equation}{chapter}
    %图、表、公式编号章节关联
    \renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
    \renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
    \renewcommand{\theequation}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
}
\let\oldappendix\appendix
\renewcommand{\appendix}{
    \oldappendix\rmrelation
}

% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

% 正文前的页码设置位大写罗马数字
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering{Roman}
}

% 保证偶数页结束章节 (oneside 不需要)
% \newcommand{\clearemptydoublepage}{%
%     \clearpage
%     \if@twoside
%         \ifodd
%             \c@page
%         \else
%             \hbox{}\thispagestyle{empty}\newpage
%             \if@twocolumn
%                 \hbox{}\newpage
%             \fi
%         \fi
%     \fi
% }

% ============== index ==============
% 首页

% 本科生首页底部的填写内容居中
% cvcbc : CoVer - Center - Bottom - Center
% \ulinecvcbc{<width>}{<content>}
\newcommand{\ulinecvcbc}[2]{\uline{\makebox[#1][c]{#2}}}

\RequirePackage{xparse} % 用于定义高级命令

% 定义紧缩间距命令
\ExplSyntaxOn
% 仅能处理单个单词内部的间距
\NewDocumentCommand{\tightenword}{O{-0.1em} m}
{
  \tl_set:Nn \l_tmpa_tl { #2 }
  \int_zero:N \l_tmpa_int
  \tl_map_inline:Nn \l_tmpa_tl
  {
    \int_incr:N \l_tmpa_int
    ##1
    \int_compare:nT { \l_tmpa_int < \tl_count:N \l_tmpa_tl }
    {
      \hspace{#1}
    }
  }
}
\ExplSyntaxOff

% 封面
\newcommand{\titlezh}{
    \begin{titlepage}
        \hfill
        \vskip 25bp
        \begin{center}
            \includegraphics[scale=1.0]{figure/mark/lutmark.pdf}
            ~~\\
            ~~\\
            \includegraphics[scale=1.0]{figure/mark/lutname.pdf}
            ~~\\
            \vspace*{-5bp}
            {
                \zihao{5}\bfseries
                \tightenword[-0.1em]{LANZHOU}
                \hspace{0.15em}
                \tightenword[-0.1em]{UNIVERSITY}
                \hspace{0.15em}
                \tightenword[-0.1em]{OF}
                \hspace{0.15em}
                \tightenword[-0.1em]{TECHNOLOGY}
            }
            ~~\\
            \vskip 40bp
            ~~\\
            {\hwxinwei\zihao{0} 毕\hspace{0.1em}业\hspace{0.1em}设\hspace{0.1em}计}
            ~~\\
            \vskip 35bp
            ~~\\
            {\heiti\zihao{-2} 题~目 \ulinecvcbc{18em}{\lut@thesistitle}}
            ~~\\
            \vskip 25bp
            ~~\\
            {
                \zihao{-3}\heiti
                \iflut@twoteacher
                    \begin{tabular}{cc}
                        学生姓名~~&\ulinecvcbc{11em}{\lut@thesisauthor}\\[1ex]
                        学生学号~~&\ulinecvcbc{11em}{\lut@studentID}\\[1ex]
                        专业班级~~&\ulinecvcbc{11em}{\lut@class}\\[1ex]
                        指导老师~~&\ulinecvcbc{11em}{\lut@teacher \quad \lut@subteacher}\\[1ex]
                        学~\quad~\quad~院~~&\ulinecvcbc{11em}{\lut@school 学院}\\[1ex]
                        答辩日期~~&\ulinecvcbc{11em}{\lut@defenseyear 年 \lut@defensemonth 月 \lut@defenseday 日}\\
                    \end{tabular}
                \else
                    \begin{tabular}{cc}
                        学~生~姓~名~~&\ulinecvcbc{11em}{\lut@thesisauthor}\\[1ex]
                        学~生~学~号~~&\ulinecvcbc{11em}{\lut@studentID}\\[1ex]
                        专~业~班~级~~&\ulinecvcbc{11em}{\lut@class}\\[1ex]
                        指~导~老~师~~&\ulinecvcbc{11em}{\lut@teacher}\\[1ex]
                        学~\quad~\quad~院~~&\ulinecvcbc{11em}{\lut@school 学院}\\[1ex]
                        答~辩~日~期~~&\ulinecvcbc{11em}{\lut@defenseyear 年 \lut@defensemonth 月 \lut@defenseday 日}\\
                    \end{tabular}
                \fi
            }
        \end{center}
    \end{titlepage}
}

% 扉页
\newcommand{\flyleaf}{
    \begin{titlepage}
        \begin{center}
            \hfill
            \vskip 130bp
            {\songti\zihao{4}\bfseries \lut@thesistitle}
            ~~\\
            {\songti\zihao{4}\bfseries \lut@thesistitleeng}
            ~~\\
            \vskip 130bp
            {\songti\zihao{4}\bfseries \lut@thesisauthor \hspace{0.5em} \lut@thesisauthoreng}
            ~~\\
            {\songti\zihao{4}\bfseries \lut@studentID}
        \end{center}
    \end{titlepage}
}

% ============== foreign translation ==============
% 外文翻译

\newcommand{\foreigntrans}{
    % 保存当前章节格式设置
    \let\save@chapter@format\CTEX@chapter@format
    \let\save@chapter@name\CTEX@chapter@name
    \let\save@chapter@number\CTEX@chapter@number
    \let\save@chapter@aftername\CTEX@chapter@aftername
    \let\save@chapter@beforeskip\CTEX@chapter@beforeskip
    \let\save@chapter@afterskip\CTEX@chapter@afterskip
    
    % 临时修改章节格式
    \ctexset{
        chapter/format = \raggedright\songti\zihao{3}\bfseries,
        chapter/name = {}, % 清除"第X章"前缀
        chapter/number = {}, % 清除章节编号
        chapter/aftername = {}, % 清除名称后的空格
        chapter/beforeskip = -20pt, % 保持与普通章节相同的顶部间距
        chapter/afterskip = 0.5\baselineskip
    }
    
    % 创建无编号章节
    \chapter*{外文翻译}
    \markboth{外文翻译}{} % 设置页眉
    \addcontentsline{toc}{chapter}{外文翻译} % 添加到目录
    
    % 恢复原始章节格式
    \ctexset{
        chapter/format = \save@chapter@format,
        chapter/name = \save@chapter@name,
        chapter/number = \save@chapter@number,
        chapter/aftername = \save@chapter@aftername,
        chapter/beforeskip = \save@chapter@beforeskip,
        chapter/afterskip = \save@chapter@afterskip
    }
}

% 保存原始section格式
\newcommand{\savesectionformat}{
    \let\save@section@format\CTEX@section@format
    \let\save@section@aftername\CTEX@section@aftername
    \let\save@section@beforeskip\CTEX@section@beforeskip
    \let\save@section@afterskip\CTEX@section@afterskip
}

% 恢复原始section格式
\newcommand{\restoresectionformat}{
    \ctexset{
        section/format = \save@section@format,
        section/aftername = \save@section@aftername,
        section/beforeskip = \save@section@beforeskip,
        section/afterskip = \save@section@afterskip
    }
}

% 原文标题
\newcommand{\originaltitle}{
    \savesectionformat % 保存当前section格式
    \ctexset{
        section/format = \raggedright\songti\zihao{4}\bfseries,
        section/aftername = {}, % 清除名称后的空格
        section/beforeskip = 0.5\baselineskip,
        section/afterskip = 0.5\baselineskip
    }
    \section*{原文} % 创建无编号section
    \restoresectionformat % 恢复原始section格式
}

% 译文标题
\newcommand{\translationtitle}{
    \savesectionformat % 保存当前section格式
    \ctexset{
        section/format = \raggedright\songti\zihao{4}\bfseries,
        section/aftername = {}, % 清除名称后的空格
        section/beforeskip = 0.5\baselineskip,
        section/afterskip = 0.5\baselineskip
    }
    \section*{译文} % 创建无编号section
    \restoresectionformat % 恢复原始section格式
}

% ============== abstract ==============
% 摘要

% 中文摘要
\newenvironment{abstractzh}{%
    \newpage
    % \vspace*{2bp}
    \centerline{\songti\zihao{4}\bfseries 摘\quad 要}
    \phantomsection
    \addcontentsline{toc}{chapter}{摘\quad 要}
    \vskip 10bp
    \par
    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    \noindent
    {\heiti\zihao{-4}\bfseries 关键词：}\songti\lut@keywordzh
}

% 英文摘要
\newenvironment{abstracten}{%
    \newpage
    % \vspace*{2bp}
    \centerline{\zihao{4}\bfseries Abstract}
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \par
    \vskip 10bp
    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    \noindent
    {\zihao{-4}\bfseries Key Words: }\lut@keyworden
}

% ============== denotation ==============
% 符号对照表

\newenvironment{denotation}
{
    \chapter*{主要符号对照表\markboth{主要符号对照表}{}} % no tocline
    \begin{list}{}%
    {
        \zihao{-4}
        \renewcommand\makelabel[1]{##1\hfil}
        \setlength{\labelwidth}{2.5cm} % 标签盒子宽度
        \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
        \setlength{\itemindent}{0cm} % 标签缩进量
        \setlength{\leftmargin}{10em} % 左边界
        \setlength{\rightmargin}{0cm}
        \setlength{\parsep}{0cm} % 段落间距
        \setlength{\itemsep}{0cm} % 标签间距
        \setlength{\listparindent}{0cm} % 段落缩进量
        \setlength{\topsep}{0cm} % 标签与上文的间距
    }
}
{\end{list}}

% ============== settings for custom pages ==============
% 首页重定义

\renewcommand{\maketitle}{%
    \titlezh
    \flyleaf
    \pagestyle{fancy}
    \frontmatter
    \songti\zihao{-4}
}

% ============== common user info ==============
% 用户信息

% 学校名称
\def\lut@university{兰州理工大学}
\def\lut@universityeng{Lanzhou University of Technology}
\newcommand{\university}[2]{%
    \def\lut@university{#1}
    \def\lut@universityeng{#2}
}
% 学院
\def\lut@school{}
\def\lut@schooleng{}
\newcommand{\school}[2]{%
    \def\lut@school{#1}
    \def\lut@schooleng{#2}
}
% 专业
\def\lut@major{}
\def\lut@majoreng{}
\newcommand{\major}[2]{%
    \def\lut@major{#1}
    \def\lut@majoreng{#2}
}
% 论文标题和副标题
\def\lut@thesistitle{}
\def\lut@thesissubtitle{}
\def\lut@thesistitleeng{}
\def\lut@thesissubtitleeng{}
\newcommand{\thesistitle}[4]{%
    \def\lut@thesistitle{#1}
    \def\lut@thesissubtitle{#2}
    \def\lut@thesistitleeng{#3}
    \def\lut@thesissubtitleeng{#4}
}
% 作者
\def\lut@thesisauthor{}
\def\lut@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
    \def\lut@thesisauthor{#1}
    \def\lut@thesisauthoreng{#2}
}
% 指导老师
\def\lut@teacher{}
\def\lut@teachereng{}
\newcommand{\teacher}[2]{%
    \def\lut@teacher{#1}
    \def\lut@teachereng{#2}
}
% 副指导老师
\def\lut@subteacher{}
\def\lut@subteachereng{}
\newcommand{\subteacher}[2]{%
    \def\lut@subteacher{#1}
    \def\lut@subteachereng{#2}
}
% 分类号
\def\lut@category{}
\newcommand{\category}[1]{%
    \def\lut@category{#1}
}
% 论文开始时间
\def\lut@thesisbeginyear{}
\def\lut@thesisbeginmonth{}
\def\lut@thesisbeginday{}
\newcommand{\thesisbegin}[3]{%
    \def\lut@thesisbeginyear{#1}
    \def\lut@thesisbeginmonth{#2}
    \def\lut@thesisbeginday{#3}
}
% 论文结束时间
\def\lut@thesisendyear{}
\def\lut@thesisendmonth{}
\def\lut@thesisendday{}
\newcommand{\thesisend}[3]{%
    \def\lut@thesisendyear{#1}
    \def\lut@thesisendmonth{#2}
    \def\lut@thesisendday{#3}
}

% 中文摘要关键字
\def\lut@keywordzh{}
\newcommand{\keywordzh}[1]{%
    \def\lut@keywordzh{#1}
}
% 英文摘要关键字
\def\lut@keyworden{}
\newcommand{\keyworden}[1]{%
    \def\lut@keyworden{#1}
}

% ============== bachelor user info ==============
% 本科生信息

% 班级
\def\lut@class{}
\newcommand{\class}[1]{%
    \def\lut@class{#1}
}
% 学号
\def\lut@studentID{}
\newcommand{\studentID}[1]{%
    \def\lut@studentID{#1}
}
% 答辩时间
\def\lut@defenseyear{}
\def\lut@defensemonth{}
\def\lut@defenseday{}
\newcommand{\defense}[3]{%
    \def\lut@defenseyear{#1}
    \def\lut@defensemonth{#2}
    \def\lut@defenseday{#3}
}

% === 'lutthesis-bachelor.cls' === END
