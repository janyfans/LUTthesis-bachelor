@echo off
echo 正在清理LaTeX中间文件...

:: 定义要删除的文件扩展名列表
set extList=aux bbl bcf blg fdb_latexmk fls idx ilg ind lof log lot out run.xml synctex.gz toc thm

:: 清理当前目录下的中间文件
echo 清理当前目录...
for %%e in (%extList%) do (
    if exist *.%%e (
        del *.%%e /f /q
        echo 已删除 *.%%e
    )
)

:: 清理data目录下的中间文件
echo 清理data目录...
if exist data (
    for %%e in (%extList%) do (
        if exist data\*.%%e (
            del data\*.%%e /f /q
            echo 已删除 data\*.%%e
        )
    )
) else (
    echo data目录不存在，跳过清理
)

echo 清理完成！
pause