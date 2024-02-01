############################################
#
# Autor: Kai Rodríguez García
#
# Nombre: ej19-calcula_cambio.sh
#
# Objetivo:
# Crea un script llamado ej19-calcula_cambio.sh al que se le pase como parámetro el precio de un artículo (argumento obligatorio),
# luego el script debe solicitar el dinero entregado por teclado, y calcular el cambio que debe darle al cliente
# teniendo en cuenta que dispone de todos los billetes de euro (de 500 a 5 euros) y, para simplificar,
# supondremos que también hay billetes de 2 y 1 euro. PISTA: es mucho más fácil si creas un array de billetes.
#
# Entradas: precio de artículo y dinero entregado
# Salidas: cambio a dar al cliente
#
# Historial:
#   2024-30-01: versión 1
#
############################################

# asegurarse de que se introduzca un argumento
if [ "$#" -ne 1 ]; then
    echo "ERROR: Debes escribir un valor (numérico), el precio del artículo!"
    exit
fi
#arg 1 es el precio del articulo
precio_arti=$1

# lista de billetes disponibles
billetes=(500 200 100 50 20 10 5 2 1)

# pedir el dinero que ha entregado
read -p "Indique el dinero pagado: " dinero_entregado

# calcular el cambio
cambio=$((dinero_entregado - precio_arti))

# mensaje informando del precio del artículo, el dinero entregado y el cambio a devolver
echo "Se ha comprado un artículo de $precio_arti euros y ha pagado $dinero_entregado euros."
echo "El cambio son $cambio euro(s), debe entregar:"

# bucle que va dividiendo el cambio con elementos de la lista y actualizando el cambio
for billete in "${billetes[@]}"; do
    num_billete=$((cambio / billete))
    if [ "$num_billete" -gt 0 ]; then
        echo "$num_billete billete(s) de $billete euro(s)"
        cambio=$((cambio - num_billete * billete))
    fi
done
