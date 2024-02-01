###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej17-deposito.sh
#
#Objetivo: 
 # Imagina que vas a invertir tus ahorros y contratas en el banco un depósito a plazo fijo de interés compuesto.
 # Realiza un script llamado ej17-deposito.sh que sea un simulador de este depósito. El usuario debe indicar 3 argumentos: 
 # la cantidad en euros del depósito, el %TAE del interés y la cantidad de años del depósito. Si no introduce alguno de estos
 # valores, mostrarás un error indicando que se deben indicar 3 valores y cuáles son y el script finalizará con código de error
 #  100.
#Si se reciben los datos correctos, debes mostrar para cada año cuánto dinero tiene el banco y lo que ha ido ganando con 
#respecto a la cantidad aportada inicialmente. El interés y los euros se podrán indicar hasta con 2 decimales. 
#Para calcular el dinero que tiene el depósito sólo tienes que multiplicar el dinero que tenía el año anterior * (1+interés/100). 
#
#Por ejemplo, para un depósito de 1000 euros con un interés compuesto del 7% TAE a 3 años, la salida deberá ser la siguiente:
#
#Ejemplo: ./ej17-deposito.sh 1000 7 3
#
#Mostrando los datos para un depósito de 1000 euros con interés 7% a 3 años:
#Año 1: 1000 * (1+ 7/100) = 1070 euros (en total has ganado 70 euros)
#Año 2: 1070 * (1+ 7/100) = 1144,9 euros (en total has ganado 144,9 euros)
#Año 3: 1144,9 * (1+ 7/100) = 1225,04 euros (en total has ganado 225,04 euros)


# Entradas: la cantidad en euros del depósito, el %TAE del interés y la cantidad de años del depósito.
# Salidas: cuánto dinero tiene el banco y lo que ha ido ganando con respecto a la cantidad aportada inicialmente
#Historial:
#   2024-01-02: versión 1
#
############################################

if [ -z "$1" ]
then
    echo "Debes indicar la cantidad de euros del depósito"
    read -p "Escriba el argumento de cantidad del depósito: " deposito
elif [ -z "$2" ]
then
    echo "Debes indicar el % TAE"
    read -p "Indica el % TAE: " TAE
elif [ -z "$3" ]
then
    echo "Debes indicar la cantidad de años del depósito"
    read -p "Indica la cantidad de años: " anyos
else
    deposito=$1
    TAE=$2
    anyos=$3

    echo "Has ingresado los 3 argumentos, que son $deposito como depósito, con un interés de $TAE % TAE a $anyos años."

    echo "Mostrando los datos para un depósito de $deposito euros con interés $TAE% a $anyos años:"

    for (( i=1; i<=$anyos; i++ )) 
    do
        ganado=$(echo "scale=2; $deposito * $TAE / 100" | bc)
        total=$(echo "scale=2; $deposito + $ganado" | bc)
        echo "Año $i: $deposito * (1 + $TAE/100) = $total euros (en total has ganado $ganado euros)"
        deposito=$total
    done
fi
