@ECHO OFF

REM Script para bloquear o ransomware Bad-Rabbit
REM uma gentileza da PC Avariou
REM

REM Uso: BlockBadRabbit [ /F ]
REM  	/F ignora a verificacao do ficheiro e obriga a instalacao


REM Verifica se o ficheiro c:\windows\cscc.dat ou c:\windows\infpub.dat existem e aborta se sim

	setlocal enabledelayedexpansion
	if "%1"=="/f" goto :CREATE
	set "err="
	if exist "C:\Windows\cscc.dat" set "err=C:\WINDOWS\CSCC.DAT "
	if exist "C:\Windows\infpub.dat" (
		if not "%err%"=="" ( set "err=Both %err%and " )
		set "err=!err!C:\WINDOWS\INFPUB.DAT"
	)
	if not "%err%"=="" (
		echo.
		echo WARNING: %err% ja existe
		echo   Recomenda-se verificacao de Infeccoes por Malware!
		goto :EOF
	)

:CREATE	

REM Criar c:\windows\cscc.dat e c:\windows\infpub.dat 

	echo Block Bad-Rabbit Ransomware > C:\Windows\cscc.dat
	echo Block Bad-Rabbit Ransomware > C:\Windows\infpub.dat

REM Remover heranca de ficheiros criados anteriormente

	icacls C:\Windows\cscc.dat /inheritance:r
	icacls C:\Windows\infpub.dat /inheritance:r

REM tudo feito e limpo

	echo Windows foi vacinado com sucesso! 
	echo.
	echo Nota: nao podemos garantir que isto va prevenir todas as infeccoes.

:EOF
	echo.
	echo.Pressione qualquer tecla para terminar
	PAUSE>nul