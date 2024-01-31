
sumar() {
    echo "El resultado de $a + $b = $((a + b))"
}

restar() {
    echo "El resultado de $a - $b = $((a - b))"
}

multiplicar() {
    echo "El resultado de $a * $b = $((a * b))"
}

dividir() {
    echo "El resultado de $a / $b = $((a / b))"
    
}

# verificar si son 2 argumentos
if [ $# -ne 2 ]; then
    echo "Error: Debes proporcionar dos valores."
    echo "SINTAXIS: $0 <valor1> <valor2>"
    exit 1
fi

# asign valores
a=$1
b=$2

# operaciones
select option in "Sumar" "Restar" "Multiplicar" "Dividir" "Salir"
do
    case $option in
        "Sumar") sumar ;;
        "Restar") restar ;;
        "Multiplicar") multiplicar ;;
        "Dividir") dividir ;;
        *) echo "Error: Opción incorrecta. Inténtalo de nuevo." ;;
    esac
    break
done
