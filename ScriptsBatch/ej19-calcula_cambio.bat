@echo off

title Calculadora de Cambio

REM ************************************
REM * NOMBRE: ej19-calcula_cambio.bat
REM * AUTOR: Kai Rodríguez García
REM *
REM * OBJETIVO: Calcular el cambio a devolver al cliente.
REM *
REM * ENTRADAS: Precio del artículo y dinero entregado
REM * SALIDAS: Cambio a devolver
REM *
REM ************************************

REM Asegurarse de que se introduzca un argumento
if "%~1"=="" (
    echo ERROR: Debes escribir un valor (numérico), el precio del artículo.
    exit /b 1
)

REM El primer argumento es el precio del artículo
set /a "precio_articulo=%~1"

REM billetes que hay
set "billetes=500 200 100 50 20 10 5 2 1"

REM Pedir el dinero entregado
set /p "dinero_entregado=Indique el dinero pagado: "

REM Calcular el cambio
set /a "cambio=dinero_entregado - precio_articulo"

REM Mensaje informando
echo Se ha comprado un artículo de %precio_articulo% euros y ha pagado %dinero_entregado% euros.
echo El cambio son %cambio% euro(s), debe entregar:

REM Bucle que va dividiendo el cambio actualizando el cambio
for %%billete in (%billetes%) do (
    set /a "num_billete=cambio / %%billete"
    if !num_billete! gtr 0 (
        echo !num_billete! billete(s) de %%billete euro(s)
        set /a "cambio=cambio - num_billete * %%billete"
    )
)

exit /b 0
