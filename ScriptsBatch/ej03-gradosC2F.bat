@echo off

title ej03-gradosC2F

REM ************************************
REM * NOMBRE: ej03-gradosC2F.sh 
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Convertir grados Celsius a Fahrenheit
REM *
REM * ENTRADAS: Valor en Celsius
REM * SALIDA: Valor en Fahrenheit
REM *
REM *****************************************

set celsius=%1

if "%celsius%" == "" (
  echo ERROR! No has escrito ningún valor.
  set /p celsius=Escribe el valor de los grados Celsius: 
  
)

set /a fahr=%celsius%*9/5+32

echo %CELSIUS%.C son %Fahr%.F

