###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej18-arrays.sh
#
#Objetivo: 
#Realiza un script llamado ej18-arrays.sh que reciba números enteros como argumentos (cualquier cantidad de argumentos).
# A partir de estos argumentos, el script generará un nuevo array llamado datos donde almacenará cada número,
#  que se irá colocando al principio del array si es par, o al final si es impar. Si hubiera algún número negativo, 
#  se descartaría.#
# Una vez que se haya completado el array de datos, se mostrará su contenido y número de elementos. 
# Luego usaremos ese array para calcular la media de todos sus valores, así como el valor mínimo y el máximo.
#
# Entradas: cualquier cantidad de nums como argumento
# Salidas: contenido de array, num de elementos, min y máx, media
#
#Historial:
#   2024-29-01: versión 1
#
############################################

# paRA comprobar que haya un valor
if [ "$#" -eq 0 ]; then
    echo "ERROR: ESCRIBE AL MENOS UN VALOR"
    exit
fi

#crear array vacíos para datos y para valores negativos
negativos=()
datos=()

# si valor es menos a 0, va para el grupo de negativos, es decir, se descartan
#si no es negativo:
#si el resto de la división entre 2 es 0, va a datos y se inserta por el principio ${datos[@]}
#si no es 0 el resto, es impar y se incerta al final datos+=("$valor")

for valor in "$@"
do
    if [ "$valor" -lt 0 ]
    then
        negativos+=("$valor")
    else
        if [ "$((valor % 2))" -eq 0 ]
        then
            datos=("$valor" "${datos[@]}") 
            echo "$valor se inserta por el PRINCIPIO porque es PAR"
        else
            datos+=("$valor")
            echo "$valor se inserta por el FINAL porque es IMPAR"
        fi
    fi
done

#mensake del array contando elementos ej: Array construido (6 elementos): 28 54 34 45 23 67
echo "Array construido (${#datos[@]} elementos): ${datos[@]}"

# tomando primer elemento como referencia de mayor y menor
minimo=${datos[0]}
maximo=${datos[0]}

#si es menor, se sustituye el mínimo, si es mayor, se sustituye el máximo, hasta que recorre todo
for num in "${datos[@]}"; do
    if [ "$num" -lt "$minimo" ]; then
        minimo=$num
    elif [ "$num" -gt "$maximo" ]; then
        maximo=$num
    fi
done

echo "El máximo es $maximo"
echo "El mínimo es $minimo"

# se crea variable suma que va sumando los elementos de datos
suma=0

for num in "${datos[@]}"; do
    suma=$((suma + num))
done

#se divide el total de la suma en los números de elementos para calcular la media

media=$((suma / ${#datos[@]}))
echo "La media es $media"