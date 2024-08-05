@echo off
chcp 65001
set PRE=C:/Users/Eve/conlanging/languages
echo Please enter language family:
set /p LEX=

:loop
cd C:/Users/Eve/conlanging/sca/bin
if "%~1"=="" (
	echo At least one argument is required.
	cd %USERPROFILE\
	exit /b 1
)

notepad "words.wli"
for %%I in (%*) do (
	echo Processing %%~I.lsc
	call lexurgy.bat sc "%PRE%/%LEX%/%%~I.lsc" words.wli > nul
	copy /y words_ev.wli words.wli > nul
)

echo -----------------------------------------
echo.
rem Trim the output using a temporary file
(for /f "usebackq delims=" %%L in ("words.wli") do echo %%L) > "temp.wli"
type "temp.wli"
del "temp.wli"
echo.
echo -----------------------------------------

pause
goto loop
