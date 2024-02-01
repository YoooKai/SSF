###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: ej02-crea_usuario.sh
#
#Objetivo: Crear un script llamado ej04-dia_semana.sh al que se le pasen tres parámetros (1: día, 2: mes, 3: año). 
# El script deberá devolver un texto diciendo: "El día de la semana de la fecha indicada (día/mes/año) fue: xxxx".
#
# Entradas:  (1: día, 2: mes, 3: año)
# Salidas: "El día de la semana de la fecha indicada (día/mes/año) fue: xxxx".
#
# Historial:
#   2023-12-18: versión 1
#
############################################

if [ $# -ne 3 ]
then    
    echo "Error, debe indicar 3 valores"
    echo "SINTAXIS $0 <día><mes><año>"
    exit
fi

dia=$1
mes=$2
anyo=$3

fecha="$anyo-$mes-$dia"
nombre_dia=$(date -d "$fecha" "+%A")

echo "El día de la semana de la fecha indicada ($dia/$mes/$anyo) fue: $nombre_dia"