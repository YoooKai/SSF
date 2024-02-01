###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: archivo.sh
#
#Objetivo: hacer pruebas con scripts
#
# Entradas: 2 valores
# Salidas: resultado de una resta
#
#Historial:
#   2023-12-18: versión 1
#
############################################

if [ "$#" -ne 2 ]; then
    echo "Error: Debes proporcionar dos valores."
    echo "SINTAXIS: $0 <valor1> <valor2>"
    exit
fi

a=$1
b=$2
c=$(($a-$b))
echo "la resta de $a y $b es $c"
