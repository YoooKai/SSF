@echo off

title verificador de Múltiplos

REM ************************************
REM * NOMBRE: ej12-multiplo.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Verificar si varios números son múltiplos de un valor dado.
REM *
REM * ENTRADAS: Uno o más números y un valor para comprobar múltiplos.
REM * SALIDAS: Indicar si cada número es múltiplo o no del valor dado.
REM *
REM ************************************

REM Asegurarse de que se introduzca al menos un número como argumento
if "%~1"=="" (
    echo ERROR: Escribe al menos un número como argumento.
    exit /b 1
)

REM Pedir al usuario que introduzca un valor.
set /p "valor=Introduzca un valor: "

REM Bucle para cada argumento, comprobando si es múltiplo del valor
for %%num in (%*) do (
    set /a "resto=%%num %% valor"
    
    if !resto! equ 0 (
        echo El número %%num es múltiplo de %valor%
    ) else (
        echo El número %%num no es múltiplo de %valor%
    )
)

exit /b 0
