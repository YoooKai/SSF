
############################################
#
# Autor: Kai Rodríguez García
#
# Nombre: ej20-calculadora_func.sh
#
# Objetivo:
# Crea un script llamado ej20-calculadora_func.sh que es igual al ejercicio ej11-calculadora.sh, 
# pero cada operación está implementada dentro de una función, de forma que en cada opción se llame a 
# la función que realiza el cálculo.
#
# Entradas: 2 valores
# Salidas: operaciones
#
# Historial:
#   2024-30-01: versión 1
#
############################################

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

exponenciar() {
    echo "El resultado de $a elevado a $b = $((a**b))"
}

resto() {
    echo "El resto de $a dividido entre $b = $((a%b))"
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

# operaciones llamando a las funciones
select option in "Sumar" "Restar" "Multiplicar" "Dividir" "Exponenciar" "Resto" "Salir"
do
    case $option in
        "Sumar") sumar ;;
        "Restar") restar ;;
        "Multiplicar") multiplicar ;;
        "Dividir") dividir ;;
        "Exponenciar") exponenciar ;;
        "Resto") resto ;;
        "Salir") break ;;  # finalizar el script
        *) echo "Error: Opción incorrecta." ;;
    esac
done