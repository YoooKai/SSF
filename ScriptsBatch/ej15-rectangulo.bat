@echo off

title Rectángulo

REM ************************************
REM * NOMBRE: ej15-rectangulo.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Pintar un rectángulo usndo símbolos y mostrar su área
REM *
REM * ENTRADAS: Base y altura del rectángulo
REM * SALIDAS: Área y rectángulo con *
REM *
REM ************************************

if "%~2"=="" (
    if "%~1"=="" (
        set "base=7"
        set "altura=4"
    ) else (
        set "base=%~1"
        set "altura=4"
    )
) else (
    set "base=%~1"
    set "altura=%~2"
)

set /a area=base * altura
REM Pintar el rectángulo
for /L %%i in (1,1,%altura%) do (
    for /L %%j in (1,1,%base%) do (
        set /p "=*" < NUL
    )
    echo.
)

echo El área del rectángulo es %area%
