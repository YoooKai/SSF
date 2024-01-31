
# Verificar si se proporcionan argumentos
if [ "$#" -eq 0 ]; then
    echo "ERROR: ESCRIBE AL MENOS UN VALOR"
    exit 1
fi

#DATOS
negativos=()
datos=()

for valor in "$@"; do
    if [ "$valor" -lt 0 ]; then
        negativos+=("$valor")
    else
        if [ "$((valor % 2))" -eq 0 ]; then
            datos=("$valor" "${datos[@]}") 
            echo "$valor se inserta por el PRINCIPIO porque es PAR"
        else
            datos+=("$valor")
            echo "$valor se inserta por el FINAL porque es IMPAR"
        fi
    fi
done

echo "Array construido (${#datos[@]} elementos): ${datos[@]}"

# Encontrar el mínimo y el máximo
minimo=${datos[0]}
maximo=${datos[0]}

for num in "${datos[@]}"; do
    if [ "$num" -lt "$minimo" ]; then
        minimo=$num
    elif [ "$num" -gt "$maximo" ]; then
        maximo=$num
    fi
done

echo "El máximo es $maximo"
echo "El mínimo es $minimo"

# Calcular la media
suma=0

for num in "${datos[@]}"; do
    suma=$((suma + num))
done

media=$((suma / ${#datos[@]}))
echo "La media es $media"
