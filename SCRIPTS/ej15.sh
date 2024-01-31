#15) Desarrolla un script llamado ej15-rectangulo.sh que "pinte" un rectángulo usando símbolos y además indique su área. 
# El usuario debe indicar dos argumentos: una base y una altura, siendo los valores por defecto: base=7 y altura=4. Es decir:
# Si el usuario no indica ningún argumento, usaremos base=7, altura=4
# Si el usuario indica un solo argumento, entonces la base será ese argumento y la altura=4
# Si el usuario indica dos o más argumentos, el primero será la base y el segundo la altura.

if [ "$#" -eq 0 ]; then
    base=7
    altura=4
elif [ "$#" -eq 1 ]; then
    base=$1
    altura=4
else
    base=$1
    altura=$2
fi

area=$((base * altura))

for (( i=1; i<=altura; i++ )); do
    for (( j=1; j<=base; j++ )); do
        echo -n "*"
    done
    echo    # salto de línea
done

echo "El área del rectángulo es $area"
