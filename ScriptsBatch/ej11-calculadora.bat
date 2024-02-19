
@echo off

title CALCULADORA

REM ************************************
REM * NOMBRE: ej11-calculadora.sh
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Realizar una calculadora que sume, reste, multiplique y divida.
REM *
REM * ENTRADAS: Dos valores
REM * SALIDA: Resultado del cálculo
REM *
REM *****************************************

set a=%1
set b=%2

if "%a%" == "" ( set /p a=Introduce un valor:
)
if NOT DEFINED b ( set /p b=Introduce otro valor:
)
cls
echo.
echo ********************************************
echo ****************** M E N U ****************
echo *******************************************
echo.
echo Tus valores son a=%a% y b=%b%
echo.
echo 1. Sumar
echo 2. Restar
echo 3. Multiplicar
echo 4. Dividir

choice /C 1234 /M "Elige entre una de las opciones "
if %errorlevel% EQU 2 set /a resultado=a-b
if %errorlevel% EQU 3 set /a resultado=a*b
if %errorlevel% EQU 1 set /a resultado=a+b
if %errorlevel% EQU 4 set /a resultado=a/b

echo El resultado de la operación es %resultado%


 

