@echo off

title Calcula_Tiempos

REM ************************************
REM * NOMBRE: ej06-calcula_tiempos.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Calcular días, horas, minutos y segundos a partir de segundos
REM *
REM * ENTRADAS: Número de segundos
REM * SALIDA: Tiempo en días, horas, minutos y segundos
REM *
REM ************************************

set segundos=%1

if "%segundos%" == "" (
  set /p segundos=Introduce el número de segundos: 
)

set /a dias=segundos / 86400
set /a horas=(segundos % 86400) / 3600
set /a minutos=((segundos % 86400) % 3600) / 60
set /a segundos=((segundos % 86400) % 3600) % 60

echo %1 segundos son %dias% días, %horas% horas, %minutos% minutos y %segundos% segundos.
exit /b 0
