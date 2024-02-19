@echo off

title 	Crea Usuario

REM ********************************
REM * Nombre: ej02-crea_usuario.sh
REM * Autor: Kai Rodríguez García
REM *
REM * Objetivo: Dar info del usuario
REM * 
REM *
REM ********************************

set nombre=Kai
set /p apellido=Escribe tu apellido:
set usuario=$1
echo Bienvenido, %nombre%
echo Tus datos son: %nombre%, %apellido%
echo Vamos a crear tu usuario: %usuario%
echo Tu nueva ID es %RANDOM%