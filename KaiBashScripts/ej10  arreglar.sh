###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej10-menu_sistema.sh
#
#Objetivo: Haz un script con nombre ej10-menu_sistema.sh que muestre un menú que acepte las ciertas opciones. 
#porlibre o 1: Indica el espacio libre de la partición raíz (en porcentaje).
#tamlibre o 2: Indica el espacio libre de la partición raíz (en tamaño).
#usuario o 3: Indica el usuario actual.
#maquina o 4: Indica el nombre de la máquina.
#usuarios o 5: Indica el número de usuarios del sistema.
#espacio o 6: Total de espacio usado en todos mis directorios personales (en formato "humano": M, G, ...)
#Añade dos opciones más
#Para cualquier otro valor, mostrar mensaje de error diciendo que no es una opción válida
#
# Entradas: distintas opciones
# Salidas: resultados de la opción elegida
#
#Historial:
#   2024-22-01: versión 1
#
############################################

echo "*********************"
echo "*******Menú**********"
echo "*********************"
echo ""

echo "1) porlibre o 1: Indica el espacio libre de la partición raíz (en porcentaje)."
echo "2) tamlibre o 2: Indica el espacio libre de la partición raíz (en tamaño)."
echo "3) usuario o 3: Indica el usuario actual."
echo "4) maquina o 4: Indica el nombre de la máquina."
echo "5) usuarios o 5: Indica el número de usuarios del sistema."
echo "6) espacio o 6: Total de espacio usado en todos mis directorios personales (en formato "humano": M, G, ...)"
echo "7) permisos o 7: Mostrar permisos"
echo "8) salir o 8: Salir"
read -p "Introduzca su opción: " opcion

case "$opcion" in
    "porlibre" | 1)
        porcentaje_espacio=$(df -h | cut -f5)
        echo "El espacio libre de la partición raíz en porcentaje es $porcentaje_espacio"
        ;;
    "tamlibre" | 2)
        tamanyo_libre=$(df -h | cut -f3)
         echo "El espacio libre de la partición raíz es $tamanyo_libre"
        ;;
    usuario | 3) 
        user_nombre=$(whoami)
        echo " El usuario tiene como nombre $user_nombre"
        ;;
    maquina | 4)
        nombre_maquina=$(hostname) 
        echo "El nombre de la máquina es $nombre_maquina"
        ;;
    usuarios | 5) 
        cantidad_usuarios = $(who | cut -d " " -f 1 | sort -u | wc -l)
        echo "Los usuarios son $cantidad_usuarios"
        ;;
    espacio | 6)
        espacio_directorios=$(du -sh /home/* | cut -f1) 
        echo "El total de espacio usado en directorios personales es de $espacio_directorios"
        ;;
    permisos | 7)
        datos_permisos=$(ls -ld ~)
        echo "Sus permisos son "
        ;;
    salir | 8)
        echo "Saliendo del menú"
        exit
        ;;
    *)  ECHO "Error: '$opcion' no es una opción correcta"
    ;;
