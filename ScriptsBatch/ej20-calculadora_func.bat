
@echo off

title CALCULADORA

REM ************************************
REM * NOMBRE: ej11-calculadora.sh
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Realizar una calculadora que sume, reste, multiplique y divida. USANDO FUNCIONES
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

if %errorlevel% EQU 1 call :sumar %a% %b%
if %errorlevel% EQU 2 call :restar %a% %b%
if %errorlevel% EQU 3 call :multiplicar %a% %b%
if %errorlevel% EQU 4 call :dividir %a% %b%
 
exit /b 0
 
:sumar
  set /a res=%1 + %2
  echo El resultado de la suma es %res%
  exit /b 0
  
:multiplicar
  set /a res=%1 * %2
  echo El resultado de la multiplicacion es %res%
  exit /b 0  

:restar
  set /a res=%1 - %2
  echo El resultado de la resta es %res%
  exit /b 0

:dividir
  set /a res=%1 / %2
  echo El resultado de la division es %res%
  exit /b 0


 

