@echo off

title num pares y sus Cuadrados

REM ************************************
REM * NOMBRE: ej14-pares.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Mostrar números pares y sus cuadrados entre dos valores.
REM *
REM * ENTRADAS: Dos números
REM * SALIDAS: Números pares y sus cuadrados
REM *
REM ************************************

set num1=%1
set num2=%2

if "%num1%"=="" set "num1=7"
if "%num2%"=="" set "num2=4"

if %num1% gtr %num2% (
    set /a "guardadovalor=num1, num1=num2, num2=guardadovalor"
)

for /L %%num in (%num1%,2,%num2%) do (
    set /a "cuadrado=%%num * %%num"
    echo El cuadrado del número %%num es !cuadrado!
)

exit /b 0