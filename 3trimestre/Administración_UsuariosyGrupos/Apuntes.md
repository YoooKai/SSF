# RESU Admin Usuarios

# Usuarios

Crear nuevo usuario

```bash
sudo useradd nuevousuario
esto crea un grupo llamado igual por defecto y un directorio /home/nuevousuario 
```

Añadir a un grupo

```bash
useradd nuevousuario -g grupoprincipal

# el grupo debe existir
# -g se usa para añadir al grupo principal
# -G agregar a grupo secundario(tantos como quiera)

#Ejemplo:
useradd nuevousuario -g grupoprincipal -G gruposecundario1,gruposecundario2
```

Especificar el directorio

```bash
useradd -d /home/otrodirectorio
```

Especificar nombre de usuario

```bash
useradd -c "Julia Schneider" julia
```

# Contraseñas

Tras crear usuario, se debe asignar contraseña.

```bash
sudo passwd julia

pasa asignar una contraseña al usuario julia
```

```bash
**bloquear o desbloquear** contraseña (poder o no cambiarla)
-l , --lock, desbloquearla, -u , --unlock

**establecer máximo de contraseña (hasta que expire)**
--maximum=DÍAS
passwd --maximum=90 julia
(así el usuario julia tendrá una contraseña que expire en 90 días)
```

## otras operaciones

### usermod

cambiar nombre de inicio de sesión de usuario

```markdown
usermod -l nombreantiguo nombrenuevo
```

cambiar el directorio de un usuario

```markdown
usermod -d /nuevo/directorio -m nombreususario
(-m es de move, -d de directorio)
```

agregar usuarios a grupos secundarios

```markdown
usermod -G grupo1,grupo2,grupo3
```

Ponerle fecha de expiración con formato AAAA-MM-DD

```markdown
usermod --expiredate 2024-05-02 nombredeusuario
```

bloquear contraseña de usuario

```markdown
usermod --lock nombreusuario
```

desbloquear contraseña de usuario

```markdown
usermod --unlock nombreusuario
```

BORRAR CUENTA (debes ser root)

```markdown
sudo userdel nombreusuario

--no borra los archivos
```

borrar cuenta y forzar borrar su directorio y archivos

```markdown
-forza a borrar direct y cuenta
sudo userdel -rf nombreusuario
```

ver grupos que pertenecen a usuario

```markdown
groups nombreusuario
```

## Comando chage

cambia número de días en los que se tiene que cambiar la contraseña

```markdown
--muestra info respecto a contraseña de usuario
chage --list nombredeusuario

```

establecer máximo días contraseña

```markdown
chage -M 90 nombredeusuario
```

establecer contraseña como expirada (pedirá una nueva al usuario)

```markdown
chage -d 0 username
```

# Archivos Importantes

## etc/ passwd

base de datos de usuarios del sistema

cada línea es un usuario, y la info de este se separa mediante :

```markdown
Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)
```

```markdown
julia:x:504:506:Julia Schneider:/home/julia:/bin/bash
```

Para ver el contenido del archivo:

```markdown
cat /etc/passwd
```

## etc/shadow

archivo que guarda las contraseñas de los usuarios en formato encriptado, además de info del usuario

```bash
julia:Z9B3Qve$f7tlKI8Shimc9ZDx.7KQGFBxFUrAX2xzMEOJVJ7YcEhePU5cR8Lo09V25aFbWe51eu3047K7kTlQJ3LG1K15y1:17043:0:90:7:::
```

# Administración de grupos

Conjunto de cuentas de usuarios que comparten permisos. A todos los usuarios se les asigna un identificador de usuario (uid) y de grupo (gid).

Ver los grupos disponibles con archivo:

### /etc/group

En cuanto a Usuarios:

El 0 es el root

luego reservados para el sistema hasta el 500

hasta el 999 para demonios o aplicaciones para el sistema

del 1000 hacia arriba son usuarios normales

## Crear un nuevo grupo

```bash
groupadd nombregrupo

groupadd -r nombregrupo
-- si queremos que sea un grupo que use el sistema
```

Modificar ajustes del grupo (groupmod)

Cambiar nombre del grupo:

```bash
groupmod -n gruponuevo grupoantiguo
```

agregar usuario a grupo con gpasswd

```bash
gpasswd -a nombredeusuario nombredegrupo
--a de add
```

eliminar usuario de grupo

```bash
gpasswd -d nombredeusuario nombredegrupo
-d de delete
```

Borrar grupo

```bash
groupdel nombredelgrupo
```

### Getent

es un comando para consultar las bases de datos del sistema de nombres, como **`/etc/passwd`**, **`/etc/group`**, **`/etc/hosts`**

Para cambiar de usuario:

```bash
su pepito
```

```bash
sudo useradd -d /home/kaiman -k /etc/skel/ -g pruebas -G lpadmin -m -s /bin/bash kaiman
```

Este comando crea un nuevo usuario llamado "kaiman" con un directorio de inicio en **`/home/kaiman`**, usando la configuración de **`/etc/skel/`** como base, asignándolo al grupo primario "pruebas" y al grupo secundario "lpadmin", asignándole **`/bin/bash`** como su shell predeterminado.

Para cambiar de usuario:

```bash
su nombreusuario
```

Para añadir darle a usuario permiso de administrador:

```bash
sudo usermod -G sudo nombreusuario
```

**Dónde está la info de cada resumen:**

Usuario: /etc/passwd

Contraseña de bloqueo: /etc/shadow

Grupo: /etc/group

contraseña grupo: /etc/gshadow

# WINDOWS

`

net user: Muestra la lista de usuarios en el sistema.

net user ssf: Muestra información detallada del usuario "ssf", incluyendo su nombre completo, si tiene una contraseña asignada, y su configuración de cuenta.

net user prb1 /add: Agrega un nuevo usuario llamado "prb1" al sistema. Por defecto, este usuario tendrá una configuración mínima.

net localgroup: Permite visualizar los grupos locales disponibles en el sistema.

Crear grupo:
net localgroup Impresora /add: Crea un nuevo grupo local llamado "Impresora".

Añadir a un grupo:
net localgroup Impresora /add prb1: Agrega al usuario "prb1" al grupo "Impresora".

Borrar de un grupo:
net localgroup Impresora /del prb1: Elimina al usuario "prb1" del grupo "Impresora".

net user prb2 */add: Crea un nuevo usuario llamado "prb2" y solicita una contraseña al momento de crearlo.

net user prb2 */add /active:no /expires:10/10/2024 /times:L-V,14:00-21:00 /fullname:"Jesusito" /passwordreq:yes:

- Crea un nuevo usuario llamado "prb2".
- Desactiva la cuenta hasta que se active manualmente.
- Establece la fecha de vencimiento de la cuenta para el 10 de octubre de 2024.
- Define un horario de inicio de sesión válido solo de lunes a viernes, de 14:00 a 21:00.
- Establece el nombre completo del usuario como "Jesusito".
- Requiere que se establezca una contraseña para el usuario.

Añadir a administrador (y quitar de usuarios):
net localgroup Administradores /add prb2: Agrega al usuario "prb2" al grupo de administradores y lo elimina del grupo de usuarios estándar.

Activar cuenta:
net user prb2 /active:yes: Activa la cuenta del usuario "prb2".

Cambiar las horas de inicio de sesión:
net user prb2 /times: Permite modificar el horario de inicio de sesión del usuario "prb2".

net accounts: Muestra información global de la configuración de cuentas del sistema, incluyendo la longitud mínima de la contraseña, la duración de la contraseña y otras políticas de seguridad.

Configuración de la contraseña:

net accounts /minpwlen:12 /minpwage:7 /maxpwage:30 /uniquepw:3: 

Establece las siguientes políticas de contraseña:

- Longitud mínima de la contraseña: 12 caracteres.
- Edad mínima de la contraseña: 7 días.
- Edad máxima de la contraseña: 30 días.
- Número de contraseñas únicas requeridas: 3.
