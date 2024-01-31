###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej13-rutas.sh
#
#Objetivo: 
#En el ejercicio 9 hicimos un script llamado ej09-info_ruta.sh que daba información de una ruta que se le indicaba por argumento.
# Desarrolla un script llamado ej13-rutas.sh que ejecute el script ej09-info_ruta.sh para cada elemento del 
#directorio actual que tenga más de 4 caracteres.
#
# Entradas: elementos de¡l directorio con 4 caracteres o más
# Salidas: información de dicha ruta (según ejer 9)
#
#Historial:
#   2024-22-01: versión 1
#
############################################

elementos=$(find . -type d -name '????*')

for elemento in $elementos; do
    ./ej09-info_ruta.sh "$elemento"
done