@echo off
echo ��������LaTeX�м��ļ�...

:: ����Ҫɾ�����ļ���չ���б�
set extList=aux bbl bcf blg fdb_latexmk fls idx ilg ind lof log lot out run.xml synctex.gz toc thm

:: ����ǰĿ¼�µ��м��ļ�
echo ����ǰĿ¼...
for %%e in (%extList%) do (
    if exist *.%%e (
        del *.%%e /f /q
        echo ��ɾ�� *.%%e
    )
)

:: ����dataĿ¼�µ��м��ļ�
echo ����dataĿ¼...
if exist data (
    for %%e in (%extList%) do (
        if exist data\*.%%e (
            del data\*.%%e /f /q
            echo ��ɾ�� data\*.%%e
        )
    )
) else (
    echo dataĿ¼�����ڣ���������
)

echo ������ɣ�
pause