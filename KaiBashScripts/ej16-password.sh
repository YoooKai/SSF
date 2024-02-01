###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: ej16-password.sh
#
#Objetivo: 
#Haz un script llamado ej16-password.sh que pida por teclado una contraseña al usuario
 #(NO se usarán argumentos, sino que se pedirá que el usuario escribirá la contraseña en el teclado haciendo que
 # esta contraseña NO se muestre en pantalla). Una vez que hayamos obtenido la contraseña, le volveremos a preguntar 
 # al usuario que la vuelva a añadir por teclado (sin mostrarla). Si el usuario indica la contraseña correcta, mostraremos 
 # un mensaje diciendo que ha acertado y el script finalizará. Si el usuario no acierta la contraseña, le indicaremos que 
 # la contraseña es incorrecta y le volveremos a pedir que la introduzca otra vez, y repetiremos esta pregunta hasta que 
 # el usuario la acierte.
#
# Entradas: contrasdeña y confirmación de contraseña
# Salidas: muestra en pantalla la contraseña si son iguales
#
#Historial:
#   2024-28-01: versión 1
#
############################################

read -s -p "Escriba la contraseña que quiera utilizar: " contrasenya
read -s -p "Confirme la contraseña: " contrasenya_confirm

while [ "$contrasenya" != "$contrasenya_confirm" ]
do
    echo "Contraseña no coincide"
    read -s -p "Introduzca de nuevo la contraseña: " contrasenya_confirm
done

echo "Correcto, su contraseña es $contrasenya"
