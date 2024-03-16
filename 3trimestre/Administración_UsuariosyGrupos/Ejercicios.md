# ADMINISTRACIÓN DE USUARIOS Y GRUPOS

## GNU/Linux 
Resuelve los siguientes apartados en la máquina virtual de GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

1- Muestra todos los usuarios de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus usuarios y cómo se organizan?
Para mostrar todos los usuarios de la máquina ejecuto el comando:

cat /etc/passwd
En este archivo se encuentra toda la información de los usuarios.  Cada línea es un usuario, y en esta línea se encuentra la siguiente información:
Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)

2- ¿Por qué hay tantos usuarios? De todos ellos, ¿cuáles realmente pueden abrir una consola de comandos? ¿cuáles podrían inciar una sesión con una contraseña válida? ¿Cómo sabes estos datos? ¿Por qué crees que es así?

Hay usuarios en el sistema por defecto para diferentes propósitos y servicios. Aquellos usuarios que tienen una shell asignada (como /bin/bash) pueden abrir una consola de comandos. Los usuarios que tienen una contraseña válida podrían iniciar sesión con ella.
Puedes identificar qué usuarios pueden abrir una consola de comandos observando si tienen una shell asignada en el archivo /etc/passwd. Para saber cuáles pueden iniciar sesión con una contraseña válida, puedes verificar si tienen una contraseña configurada utilizando el comando passwd -S.


3- Fíjate en el UID de los usuarios. ¿Ves alguna diferencia entre los usuarios con UID < 1000 y los que tiene un UID >= 1000? ¿Por qué es así?

Sí, generalmente los usuarios con UID < 1000 son usuarios del sistema, mientras que los usuarios con UID >= 1000 son usuarios normales creados por el administrador. Esta convención se sigue para evitar conflictos con los UIDs reservados para usuarios del sistema. Para ser más concretos con los ID de los usuarios, el 0 es el root, hasta el 500 son reservados para el sistema, y desde ahí hasta el 999 son para demonios o servicios del sistema. Desde el 1000 en adelante son usuarios normales, creados por el administrador.


4- Muestra todos los grupos de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus grupos y cómo se organizan?

La información de los grupos se encuentra en el archivo /etc/group. Cada línea en este archivo representa a un grupo y contiene información como el nombre del grupo, GID y los usuarios que pertenecen a ese grupo.

Se puede ver los grupos que hay con:
cat etc/group

5. ¿Por qué hay tantos grupos? Intenta buscar información sobre qué funciones tienen los diferentes grupos de tu sistema, en los apuntes hay un enlace con algo de información.

Existen tantos grupos porque cada uno cumple distintas funciones y se utilizan para dar a un usuario permisos de utilizar tales funciones.
Algunos de ellos son:
root: Este grupo otorga acceso pleno al sistema y normalmente solo el usuario root debería pertenecer a este grupo. Es fundamental para la administración del sistema y tiene privilegios elevados.


adm: Utilizado para el monitoreo de tareas del sistema, lo que permite a los usuarios pertenecientes a este grupo utilizar herramientas de monitoreo como xconsole y leer archivos de registro en /var/log sin necesidad de utilizar comandos su o sudo. Es esencial para los administradores del sistema.


backup: Este grupo permite a los usuarios realizar copias de seguridad y restauraciones sin necesidad de otorgarles permisos de root. Es importante para garantizar la integridad y disponibilidad de los datos mediante la realización de copias de seguridad regulares.


sudo: Los miembros de este grupo no necesitan escribir sus contraseñas al utilizar sudo. Proporciona a los usuarios privilegios elevados para ejecutar comandos administrativos sin necesidad de iniciar sesión como root.


shadow: Permite la lectura de /etc/shadow. Utilizado por algunos programas que necesitan acceder a este archivo.

6. ¿Cómo comprobarías si un usuario existe ya en el sistema? ¿Y un grupo?

para un usuario: id nombreusuario
para un grupo: getent group nombregrupo

7. Crea el usuario "test01" de forma que su home sea /home/test01 (se deben copiar la configuración básica de /etc/skel) y su shell sea /bin/bash.

sudo useradd -d /home/test01 -k /etc/skel/ -m -s /bin/bash test01

8. Intenta abrir una sesión como "test01" una vez creado ¿puedes acceder? ¿Por qué? ¿Cómo lo arreglarías?

No se puede porque no se le ha asignado una contraseña. Para ello se usa el comando:
sudo passwd test01



9. El usuario "test01", ¿qué grupo principal tiene? Cámbialo para que sea su grupo principal sea "tests".
Su grupo principal tiene el mismo nombre que el del usuario, ya que se crea automáticamente así. Se puede comprobar con id test01. Para cambiarlo:

sudo usermod -g tests test01


10. Borra el grupo principal antiguo de test01, ¿puedes eliminarlo? ¿Por qué?
sudo groupdel test01
Sí se puede, porque se permite eliminar si el grupo no está siendo utilizado por ningún usuario como grupo principal o secundario. 

11. Borra el grupo "tests", ¿puedes eliminarlo? ¿Por qué?
No, porque test01 está usando ese grupo.

12. Asigna algunos grupos secundarios a "test01". Indica para qué sirve cada uno de los grupos creados.

Para agregar a grupos secundarios se usa el comando usermod:
sudo usermod -G grupo1,grupo2 test01
Estos grupos son creados con:
sudo groupadd group1

En caso de querer añadir a alguno existente, se puede por ejemplo colocar en el grupo de video, disk o audio, que permite acceso a los dispositivos con estos nombres.
Otros:
https://blog.desdelinux.net/significado-de-los-grupos-y-usuarios-en-debian-gnulinux/

13. Asigna algunos grupos más secundarios a "test01", SIN borrar los que ya tenía
sudo usermod -aG nuevogrupo1 test01
Se usa la -a para no eliminar los que ya tenía.


14. Elimina algunos grupos secundarios del usuario test01

sudo gpasswd -d test01 grupoaeliminar


15. Bloquea al usuario test01. Luego intenta abrir una sesión... ¿puedes? ¿Por qué?

sudo passwd -l test01

Con este comando hace que se caduque la contraseña.

16. Desbloquea al usuario test01. ¿Se ha perdido algo de su información?

sudo passwd -u test01

No debería haber perdido información.?

17. Cambia la información de test01 indicando su nombre completo, oficina, teléfono, etc.

sudo chfn test01

Este comando te da opciones de escribir o modificar  todos esos datos.


18. Cambia la shell de test01 a una que no permita ejecutar comandos.

sudo chsh -s /bin/false test01


19. Vuelve a dejarle a test01 su shell original

sudo chsh -s /bin/bash test01


20. Añade restricciones al usuario test01 de forma que tenga que cambiar la contraseña cada 15 días y que le avisen 3 días antes, dándole 2 días de margen para poder cambiar una contraseña caducada sin que se bloquee su cuenta. Además, la cuenta quedará deshabilitada el 30 de junio.

sudo chage -M 15 -W 3 -I 2 -E 2023-06-30 test01

chage: Es el comando utilizado para modificar la configuración de la contraseña de un usuario.
-M 15: Establece el máximo número de días antes de que la contraseña del usuario expire. En este caso, se establece en 15 días, lo que significa que el usuario "test01" tendrá que cambiar su contraseña cada 15 días.
-W 3: Establece el número de días de advertencia antes de que la contraseña expire. En este caso, se establece en 3 días, lo que significa que el usuario "test01" recibirá una advertencia 3 días antes de que su contraseña expire.
-I 2: Establece el número de días de inactividad antes de que la cuenta del usuario se desactive automáticamente. En este caso, se establece en 2 días, lo que significa que si el usuario "test01" no inicia sesión durante 2 días, su cuenta se desactivará automáticamente.
-E 2023-06-30: Establece la fecha de caducidad para la cuenta del usuario. En este caso, se establece en el 30 de junio de 2023, lo que significa que la cuenta del usuario "test01" se desactivará automáticamente en esa fecha.


21. Elimina el usuario test01 con todo el contenido en su espacio personal. Ten en cuenta que test01 podría seguir conectado.

sudo userdel -rf test01

22. ¿Qué pasaría si test01 siguiera conectado en el momento que se elimina su cuenta? ¿Podría seguir usando el equipo con normalidad? ¿Cómo harías para cerrar inmediatamente todos sus procesos que estuvieran aún en ejecución?

sudo pkill -u test01 -9


