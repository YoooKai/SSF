###########################################
#
#Autor:
# Kai Rodríguez García
#
#Nombre: archivo.sh
#
#Objetivo: Crear un script llamado ej02-crea_usuario.sh al que se le pasan tres parámetros (1: nombre, 2: apellidos, 3: usuario). 
# El script imprimirá el siguiente mensaje en pantalla:
#Bienvenido, {nombre}
#Tus datos son: {nombre} {apellidos}
#Vamos a crear tu usuario: {usuario}
#Tu nueva ID es {aleatorio}
#
# Entradas:  (1: nombre, 2: apellidos, 3: usuario)
# Salidas: datos del usuario
#
# Historial:
#   2023-12-18: versión 1
#
############################################

nombre=$1
apellidos=$2
usuario=$3

echo "Bienvenido, $nombre"
echo "Tus datos son: $nombre $apellidos"
echo "Vamos a crear tu usuario: $usuario"
echo "Tu nueva ID es $RANDOM"