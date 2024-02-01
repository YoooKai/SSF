###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: ej05-calcula_segundos.sh
#
#Objetivo: Crear un script llamado ej06-calcula_tiempos.sh al que se le pase un único parámetro, el número de segundos. 
# El script devolverá a cuántos días, horas, minutos y segundos corresponden los segundos indicados.
#
# Ejemplo: ./calcula_tiempos.sh 358194
# 358.194 segundos son 4 días, 3 horas, 29 minutos y 54 segundos.
#
# Entradas:  segundos
# Salidas:  días, horas, minutos y segundos
#
# Historial:
#   2023-12-18: versión 1
#
############################################

if [ $# -eq 0 ]
then
	echo "ERROR: No has indicado un argumenyto"
	echo "SINTAXIS: $0 <total_segundos>"
	exit 

elif [ $# -eq 1 ]
then
	echo "Correcto!"
else
	echo "Has indicado $# argumentos, se usará el primeros y se ignorará el resto"
fi

segundos_totales=$1

dias=$((segundos_totales/86400))
seg_restantes=$((segundos_totales % 86400))

horas=$((seg_restantes / 3600))
seg_restantes=$((seg_restantes % 3600))

minutos=$((seg_restantes / 60))
segundos=$((seg_restantes % 60))

echo "$segundos_totales equivalen a:  $dias días, $horas horas, $minutos minutos y $segundos segundos."