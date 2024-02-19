@echo off

title comparador de Números

REM ************************************
REM * NOMBRE: ej07-compara.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Comparar dos números y determinar cuál es mayor o si son iguales
REM *
REM * ENTRADAS: Dos números
REM * SALIDAS: Indicar cuál es mayor o si son iguales
REM *
REM ************************************
set num1=%1
set num2=%2

REM Si no se proporcionan los números, pedirlos por teclado
if "%num1%"=="" (
    set /p "num1=Por favor, introduzca el primer valor: "
)

if "%num2%"=="" (
    set /p "num2=Por favor, introduzca el segundo valor: "
)

REM Comparar los números y mostrar el resultado
if %num1% lss %num2% (
    echo %num2% es mayor que %num1%
) else if %num1% gtr %num2% (
    echo %num1% es mayor que %num2%
) else (
    echo %num1% y %num2% son iguales.
)

exit /b 0
