############################################
#
# Autor: Kai Rodríguez García
#
# Nombre: ej11-calculadora.sh
#
# Objetivo: Crea un script llamado ej11-calculadora.sh que acepte dos números como argumento 
# (si no se introduce alguno de ellos, se pedirá por teclado) y que luego muestre un menú para realizar 6 operaciones 
# ("suma", "resta", "multiplica", "divide" y dos más que quieras añadir) entre estos dos números, mostrando el resultado
#  final tras elegir la operación. Si se indica una opción incorrecta, se mostrará un error.
#
# Entradas: dos valores
# Salidas: resultados de operaciones
#
# Historial:
#   2024-22-01: versión 1
#
############################################

#CALCULADORA

a=$1
b=$2

if [ $# -ne 2 ]
then    
    echo "Error, debe indicar valores"
    echo "SINTAXIS $0 <valor1><valor2>"
    exit
fi

select option in "Sumar" "Restar" "Multiplicar" "Dividir" "Exponenciar" "Resto"
do
    case $option in 
        "Sumar") echo "El resultado de $a + $b = $((a+b))" ;;
        "Restar") echo "El resultado de $a - $b = $((a-b))" ;;
        "Multiplicar") echo "El resultado de $a * $b = $((a*b))" ;;
        "Dividir") echo "El resultado de $a / $b = $((a/b))" ;;
        "Exponenciar") echo "El resultado de $a elevado a $b = $((a**b))" ;;
        "Resto") echo "El resto de $a dividido entre $b = $((a%b))" ;;
        *) echo "ERROR: has indicado una opción incorrecta" ;;
    esac
    break
done
