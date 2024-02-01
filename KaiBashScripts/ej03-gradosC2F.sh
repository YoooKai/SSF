###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: ej03-gradosC2F.sh
#
#Objetivo: Crear un script llamado ej03-gradosC2F.sh al que se le pase un argumento (c: grados Celsius) 
#y muestre en pantalla el resultado de convertirlo a grados Fahrenheit, según la fórmula: f = c * 1.8 + 32.
#
# Entradas:  valor con grados celsius
# Salidas: valor en farenheit
#
# Historial:
#   2023-12-18: versión 1
#
############################################

if [ $# -ne 1 ]
then
    echo "Error: Debes proporcionar un valor en grados Celsius."
    exit
fi

celsius=$1

fahrenheit=$(echo "$celsius * 1.8 + 32" | bc)

#farenheit= $((celsius*1.8+32 ))


echo "$celsius grados celsius son $farenheit grados farenheit"