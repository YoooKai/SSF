###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: ej06-calcula_tiempos.sh
#
#Objetivo:  Crea un script llamado ej07-compara.sh al que se le pasen dos números como argumentos 
#(si no se le indica alguno, lo pedirá luego por teclado). 
#El script nos debe decir cuál de los dos números es mayor, o si son iguales.
#
# Entradas:  dos números
# Salidas:  decir cuál es mayor, o si son iguales
#
# Historial:
#   2023-12-18: versión 1
#
############################################

num1=$1
num2=$2

# si no los indica los pide por teclado
if [ -z "$num1" ]
then
	read -p "Por favor, introduzca el primer valor: " num1
fi

if [ -z "$num2" ]
then
	read -p "Por favor, introduzca el segundo valor: " num2
fi


if [ "$num1" -lt "$num2" ]
then
    echo "$num2" es mayor que "$num1"
elif [ "$num1" -gt "$num2" ]
then
    echo "$num1" es mayor que "$num2"
else
    echo "$num1" y "$num2" son iguales.
fi