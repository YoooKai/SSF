############################################
#
# Autor: Kai Rodríguez García
#
# Nombre: ej09-info_ruta.sh
#
# Objetivo: Crear un script llamado ej09-info_ruta.sh para mostrar información de los ficheros, directorios, etc. 
# Recibe un argumento y se debe indicar la siguiente información:
#
# Entradas: un argumento, que es una ruta a un archivo o directorio
# Salidas: mostrar info de ficheros y directorios
#
# Historial:
#   2024-22-01: versión 1
#
############################################

# Verificar si hay un argumento
if [ "$#" -eq 0 ] 
then
    echo "ERROR: Debe indicar un argumento."
    exit 
fi

# Comprobar que la ruta exista
ruta=$1
if [ ! -e "$ruta" ] 
then
    echo "ERROR: La ruta $ruta no existe en el disco."
    exit 
fi

# Comprobar el tipo de fichero
# Si es fichero
if [ -f "$ruta" ] 
then
    echo "$ruta es un fichero"
# Si es directorio
elif [ -d "$ruta" ] 
then
    echo "$ruta es un directorio"
# Si es enlace simbólico
elif [ -L "$ruta" ]
then
    echo "$ruta es un enlace"
else
    echo "$ruta es otra cosa"
fi

# Permisos
# Permiso de escritura
if [ -w "$ruta" ] 
then
    echo "$ruta tiene permiso de escritura"
else
    echo "$ruta NO tiene permiso de escritura"
fi
# Permiso de lectura
if [ -r "$ruta" ]
then
    echo "$ruta tiene permiso de lectura"
else
    echo "$ruta NO tiene permiso de lectura"
fi
# Permiso de ejecución
if [ -x "$ruta" ]
then
    echo "$ruta tiene permiso de ejecución"
else
    echo "$ruta NO tiene permiso de ejecución"
fi

# Verificación de archivo vacío o no
if [ -s "$ruta" ]
then
    echo "$ruta no está vacío"
else
    echo "$ruta está vacío"
fi
