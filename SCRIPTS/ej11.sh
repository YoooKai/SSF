
if [ $# -ne 2 ]; then
    echo "Error: Debes proporcionar dos valores."
    echo "SINTAXIS: $0 <valor1> <valor2>"
    exit 1
fi

# Asignar valores a y b
a=$1
b=$2

select option in "Sumar" "Restar" "Multiplicar" "Dividir"
do
    case $option in
        "Sumar") echo "El resultado de $a + $b = $((a + b))" ;;
        "Restar") echo "El resultado de $a - $b = $((a - b))" ;;
        "Multiplicar") echo "El resultado de $a * $b = $((a * b))" ;;
        "Dividir") echo "El resultado de $a % $b = $(( a/b))" ;;
        *) echo "ERROR: Has indicado una opción incorrecta." ;;
    esac
    break
done
