###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: ej05-calcula_segundos.sh
#
#Objetivo: Crear un script llamado ej05-calcula_segundos.sh al que se le pasen 4 parámetros 
#(1: días, 2: horas, 3: minutos, 4: segundos). El script devolverá el total de segundos del tiempo indicado.
#
#Ejemplo: ./calcula_segundos.sh 4 3 29 54
#4 días, 3 horas, 29 minutos y 54 segundos son 358.194 segundos.
#
# Entradas:  (1: días, 2: horas, 3: minutos, 4: segundos)
# Salidas:  total de segundos
#
# Historial:
#   2023-12-18: versión 1
#
############################################

if [ $# -ne 4 ]
then
    echo "ERROR: debes indicar 4 valores"
    echo "Los valores son en orden: $0 <días> <horas> <minutos> <segundos>"
    exit
fi

dias=$1
horas=$2
minutos=$3
segundos=$4

total_segundos=$((dias*86400+horas*3600+minutos*60+segundos))

echo "$dias días, $horas horas, $minutos minutos y $segundos segundos hace un total de $total_segundos segundos."