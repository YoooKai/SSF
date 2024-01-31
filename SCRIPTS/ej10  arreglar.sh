
###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: archivo.sh
#
#Objetivo: Haz un script con nombre ej10-menu_sistema.sh que muestre un menú que acepte las ciertas opciones. 
#
# Entradas: 
# Salidas: 
#
#Historial:
#   2024-22-01: versión 1
#
############################################

echo "*********************"
echo "*******Menú**********"
echo "*********************"
echo ""

echo "1) Indica el espacio libre de la partición raíz (en porcentaje)."
echo "2) Indica el espacio libre de la partición raíz (en tamaño)."
echo "3) Indica el usuario actual."
echo "4) Indica el nombre de la máquina."
echo "5) Indica el número de usuarios del sistema."
echo "6) Total de espacio usado en todos mis directorios personales (en formato "humano": M, G, ...)"
echo "7) Mostrar permisos"
echo "8) Salir"
echo ""
read -p "Introduzca su opción: " opcion

case "$opcion" in
    1) df -h | cut -f1
    ;;
    2) df -h
    ;;
    3) whoami
    ;;
    4) hostname
    ;;
    5) df -h
    ;;
    6) du -sh ~ | cut -f1
    ;;
    7) ls -l ~
    ;;
    8) exit
    ;;
    *)  ECHO "Error: '$opcion' no es una opción correcta"
    ;;
