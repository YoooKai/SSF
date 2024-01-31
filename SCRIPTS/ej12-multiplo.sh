###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej12-multiplo.sh
#
#Objetivo: Implementa un script llamado ej12-multiplo.sh al que se le pasen varios números
 #como argumentos (no hay límite en la cantidad de argumentos que se le puedan indicar). 
 #Al comenzar el script se pedirá al usuario que introduzca por teclado un valor y 
 #luego el script indicará para cada argumento si es múltiplo o no de este valor.
#
# Entradas: uno o más números y un valor del que comprobar si es múltiplo
# Salidas: dicir si es o no múltiplo de ese valor o valores
#
#Historial:
#   2024-22-01: versión 1
#
############################################

if [ "$#" -eq 0 ]; then
    echo "ERROR: Escribe al menos un número como argumento."
    exit 
fi

read -p "Introduzca un valor: " valor

for num in $@
do
    resto=$((num%$valor))
    
    if [ "$resto" -eq 0 ]
    then
        echo "El número $num es múltiplo de $valor"
    else
        echo "El número $num no es múltiplo de $valor"
    fi
done
