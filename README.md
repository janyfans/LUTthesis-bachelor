# 兰州理工大学本科毕业设计 LaTeX 模板

<br>

<div>
    <img alt="license" src="https://img.shields.io/badge/License-GPLv3-blue.svg">
</div>
<div>
    <img alt="license" src="https://img.shields.io/badge/License-LPPL%201.3c-orange.svg">
</div>
</br>


> [!CAUTION] 
>
> **许可证重要声明**  
> 本项目是基于 [北航毕设论文 LaTeX 模板](https://github.com/BHOSC/BUAAthesis) 的二次开发版本，受 GPLv3 和 LPPL 1.3c 双协议约束。  
>
> 本项目旨在为 LUT 本科的同学们提供一个 LaTeX 的毕业设计模板。

## 📥 环境配置

要使用该 LaTeX 模板，需要配置 CTeX 环境。

- 推荐安装 [TeX Live](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/) 软件（建议使用 $.iso$ 镜像文件直接安装）。

安装好后使用以下命令检查配置是否正确：

```bash
latex -version
```

对于编译器的选择，可以使用以下编译器：

- **[VS Code](https://code.visualstudio.com/)：** 安装 LaTeX 相关插件。
- **[TeXStudio](https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/)：**（推荐）专为 LaTeX 设计的编译器。
- **[Overleaf](https://cn.overleaf.com/)：**（免安装）网页在线协作。

## ✨ 项目信息

以下是文件的目录结构：

```bash
LUTthesis-bachelor/
│  clean.bat	# 用于清理中间文件
│  gbt7714-author-year.bst
│  gbt7714-numerical.bst
│  gbt7714.sty
│  LICENSE
│  lutthesis-bachelor.cls	# 配置文件
│  LUTthesis-bachelor.pdf	# 生成的毕业设计文档
│  LUTthesis-bachelor.tex	# 主项目
│  README.md
│
├─code/	# 代码文件夹
│      hello.cpp
│
├─data/	# 页面/数据存放目录
│      abstract.tex	# 摘要
│      acknowledgement.tex	# 致谢
│      appendix-code.tex	# 附录
│      bibs.bib	# 参考文献填写处
│      chapter1-intro.tex
│      chapter2-config.tex
│      chapter3-download.tex
│      chapter4-basic.pdf
│      chapter4-basic.tex
│      chapter5-usage.tex
│      chapter6-implement.tex
│      com_info.tex	# 个人信息
│      foreign_translation.tex	# 外文翻译
│      reference.tex	# 参考文献页面（这个通常不需要更改，仅更改 `bibs.bib` 文件即可）
│
└─figure/	# 图片存放目录
    │  image.pdf
    │
    └─mark/	# 学校图标
```

以下对部分重要文件进行解释：

- `clean.bat`：主要用于在 `Windows` 平台中清理不需要的中间文件。使用的时候双击即可。
- `LUTthesis-bachelor.pdf`：即最终的毕业设计文件。
- `LUTthesis-bachelor.tex`：为整个文档的框架，组织各个分点分档的顺序。
- `bibs.bib`：**填写参考文献的地方**。
- `com_info.tex`：**个人信息**在此处进行填写。

## 🍀 预设命令

在此文档中预设了部分命令，旨在减少同学们的学习成本。

> [!NOTE]
>
> 通常此类预设仅用于满足部分特殊情况，**不同页面的文字已经做了相关设置**。如中文摘要部分为宋体小四，英文摘要为 Times New Roman 字体。
>
> 没有特殊要求的情况下，全局默认 ASCII 字符为 Times New Roman 字体，全局中文字体为宋体。
>
> **（推荐仅在正文部分使用以下命令）**

### 🅰️ 字体

预设有以下几种字体：

- **宋体：**`\songti`
- **黑体：**`\heiti`
- **华文行楷：**`\hwxingkai`
- **华文楷体：**`\hwkaiti`
- **华文新魏：**`\hwxinwei`

使用方式如下：

```latex
{\songti 我是宋体}
```

### 🔢 字号

有两种方式可以设置字号，看个人喜好选择即可：

1. 使用 <kbd>\\</kbd> + 拼音（支持初号 ~ 六号），如：

   ```latex
   {\chuhao 我是初号}
   {\xiaochu 我是小初}
   ```

2. 使用`\zihao{<number>}`

   ```latex
   {\zihao{0} 我是初号}
   {\zihao{-0} 我是小初}
   {\zihao{1} 我是一号}
   ```

如果要使用宋体小四，则可以这样写：

```latex
{\songti\zihao{-4} 我是宋体小四}
```

## 📜 免责声明

本模板为编写者依据兰州理工大学《本科生毕业设计（论文）规范化要求（修改版）》编写而成，旨在方便兰州理工大学本科毕业生撰写学位论文使用。

本模板基于北京航空开源俱乐部维护的《北航毕设论文 LaTeX模板》（网址：https://github.com/BHOSC/BUAAthesis/ ），进行二次开发而成，部分代码参照其内部实现。

如前所述，本模板依据学校以及学院的要求规范编写，学校目前并未提供官方 LaTeX 模板，也未授权第三方模板为官方模板，故此模板**仅为论文规范的参考实现**，不保证格式能完全满足审查老师要求。

---

- **任何由于使用本模板而引起的论文格式等问题，以及造成的可能后果，均与本模板编写者无关。**

- **任何组织或个人以本模板为基础进行修改、扩展而生成新模板，请严格遵守相关协议。由于违反协议而引起的任何纠纷争端均与本模板编写者无关。**

---