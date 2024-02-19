@echo off

title Calculadora de IMC

REM ************************************
REM * NOMBRE: ej08-imc.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Calcular el IMC
REM *
REM * ENTRADAS: Altura (en centímetros) y peso (en Kg)
REM * SALIDAS: IMC y diagnóstico
REM *
REM ************************************

if "%~2"=="" (
    echo ERROR: Debes escribir dos argumentos.
    echo SINTAXIS: %0 ^<altura_en_cm^> ^<peso_en_kg^>
    exit /b 1
)

set "altura=%~1"
set "peso=%~2"

REM IMC = 10000 * peso / altura^2
set /a IMC=10000 * peso / (altura * altura)
echo Tu IMC es %IMC%

if %IMC% lss 16 (
    echo Delgadez severa
) elif %IMC% leq 16.99 (
    echo Delgadez moderada
) elif %IMC% leq 18.49 (
    echo Delgadez leve
) elif %IMC% leq 24.99 (
    echo Peso Normal
) elif %IMC% leq 29.99 (
    echo Sobrepeso
) elif %IMC% leq 34.99 (
    echo Obesidad leve
) elif %IMC% leq 39.99 (
    echo Obesidad media
) else (
    echo Obesidad severa
)

exit /b 0
