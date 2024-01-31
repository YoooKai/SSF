###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej14-pares.sh
#
#Objetivo: 
#Haz un script con nombre ej14-pares.sh que reciba dos números (si no los recibe, 
#los pedirá por teclado hasta que el usuario los introduzca). 
#El script devolverá los valores PARES situados entre esos dos números, y su CUADRADO. 
#El usuario puede indicar primero el valor más pequeño y luego el más grande (los resultados se mostrarán en orden ascendente)
# o primero el valor más grande y luego el más pequeño (resultados en orden descendente).
#
# Entradas: elementos de¡l directorio con 4 caracteres o más
# Salidas: información de dicha ruta (según ejer 9)
#
#Historial:
#   2024-22-01: versión 1
#
############################################

num1=$1
num2=$2

while [ -z "$num1" ] || [ -z "$num2" ]
do
    read -p "Escribe el primer valor: " num1
    read -p "Escribe el segundo valor: " num2
done

#ordena por tamaño
if [ "$num1" -gt "$num2" ]; then
    guardadovalor=$num1
    num1=$num2
    num2=$guardadovalor
fi


for num in $(seq $num1 $num2)
do
  if [ $((num%2)) -eq 0 ]
  then
    cuadrado=$((num * num))
    echo "El cuadrado del número $num es $cuadrado"
  fi
done