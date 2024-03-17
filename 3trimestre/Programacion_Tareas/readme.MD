# Programación de Tareas

# Necesidad de programar tareas

Las tareas de administración, como copias de seguridad o migraciones, suelen **requerir tiempo y recursos**, y es preferible ejecutarlas durante periodos de baja actividad en el sistema, como altas horas de la madrugada. Para **evitar la necesidad de intervención manual** en estos momentos, se utilizan las tareas programadas. Estas **permiten preparar y ejecutar comandos automáticamente en el momento deseado, optimizando así la eficiencia y minimizando la interferencia con los usuarios y procesos del sistema.**

### Tipos de Tareas Programadas
- **Programación en Tiempo:**

    - Ejecución de acciones en un momento específico.
    - Permite planificar tareas para horas y fechas determinadas.
Ejemplo: copias de seguridad nocturnas.

- **Programación por Eventos:**

    - Acciones desencadenadas por sucesos en el sistema.
    - Reacciona a eventos específicos en lugar de a un horario predefinido.
Ejemplo: ejecutar un script al detectar un cambio en un archivo.

Estas tareas son llevadas a cabo por **servicios** que deben estar activos constantemente para monitorear el tiempo o los eventos que las disparan (trigger). Si el servicio no está activo en el momento programado, las tareas pueden retrasarse o incluso ser ignoradas, según la configuración.

Los servicios **no tienen interfaz ni comunicación directa con los usuarios.**
Reciben datos de las tareas a través de estrategias como programas clientes o escritura de datos en ficheros.

#### Ejecución en Terminal Virtual
- Los servicios ejecutan tareas en una especie de "terminal virtual".

- Los datos de salida (stdout) y errores (stderr) se pierden al finalizar la ejecución.

#### Directorio de Trabajo

- El directorio de trabajo puede ser diferente al esperado por el usuario.

- Es esencial especificar rutas absolutas para scripts, archivos de entrada/salida, etc.

#### Recomendaciones al Programar Tareas
- **Usar Rutas Absolutas:**
    - Especificar rutas completas para evitar problemas de ubicación de archivos.

- **Redireccionar Salida y Errores:**
    - Utilizar redirecciones para almacenar mensajes y datos de salida en archivos.
    - Redirigir stdin si es necesario para manejar entradas por teclado.

- **Evitar Dependencia de Configuraciones de Shell:**
    - No confiar en la carga de la configuración de la shell habitual.
    - No utilizar variables de entorno propias, alias u otras configuraciones que se ejecutan al iniciar la shell.


## GNU/LINUX

### Tareas por tiempo: Puntuales
- No suelen venir por defecto instaladas, pero la más importante es at ( apt install at).
- Indica fecha y hora a ejecutar. Permite varios formatos:
    - 12h con AM o PM
    - 24h
    - noon [12:00], midnight [0:00], teatime [16:00],
    -fechas formato americano MM/DD/[CC]YY, europeo DD.MM.[CC]YY o japonés[CC]YY-MM-DD.
    -también acepta: tomorrow, tuesday, next week, next month + 1 week, now + 10 minutes, now + 15min, now + 2 hours, next week - 2 days etc.
- Si es incorrecta la fecha, da error Garbled Time.
- Se abre un pequeño intérprete de comandos:
```bash
t 18:00 tomorrow
> who  >> ~/usuarios.txt 2>> ~/usuarios.err
> last >> ~/usuarios.txt 2>> ~/usuarios.err
Ctrl+D
```
Para programar la tarea en una línea se usa <<<. Por ejemplo:
```bash
at now + 10min <<< "uptime > ~/carga.txt 2> carga.err"
# para almacenar la carga del sistema dentro de 10 minutos
```
- Para ejecutar script en lugar de comando, se usa -f:
```bash
at next month + 1 day -f ~/scripts/copia_seguridad.sh >> ~/backup.txt 2>> ~/backup.err
```
- Si el demonio no está disponible al momento programado -> la tarea se ejecuta al encender el equipo o activar de nuevo el demonio atd.

### Algunas opciones útiles de at son:

- **Mostrar todas las tareas programadas:** atq     (o también: at -l)
- **Mostrar los detalles de la tarea con ID X:** at -c X (al principio se muestran todas las variables que se almacenan, y al final el comando a ejecutar)
- **Borrar una tarea con ID X:** atrm X          (o también: at -r X  o bien  at -d X)

### Tareas por tiempo: repetitivas

### Cron
- Es comúnmente instalado en distribuciones y utilizado para ejecutar tareas del sistema periódicamente.
- Existen diferentes versiones, como anacron, cronie, hcron, fcron, entre otras, con funcionalidades adicionales.

#### Programación de Tareas en cron
- Las tareas se programan en una tabla (crontab) con un formato específico.
- Se puede editar la tabla usando **crontab -e**.

#### La sintaxis de la tabla es: 

- m: Minutos (0-59)
- h: Hora (0-23)
- dom: Día del mes (1-31)
- mon: Mes (1-12)
- dow: Día de la semana (0-6, donde 0 es domingo)
- command: Comando o script a ejecutar

#### Símbolos y Formatos Especiales
- *: Cualquier valor.
- Rangos (-), Listas (,), Intervalos (/).
- También podemos realizar algunas combinaciones: 6-12/2 = 6,8,10,12

### Ejemplos
```bash
# Usar un script para borrar ficheros temporales todos los días a las 12:15
#m  h  dom mon dow  cmd
15  12  *   *   *   ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

# Guardar la carga cada 20 minutos de 8:00 a 19:40 de lunes a viernes
# durante los días impares de la primera quincena de los meses de febrero, mayo, junio y septiembre
# m    h      dom     mon    dow  cmd
*/20  8-19  1-15/2  2,5,6,9  1-5  uptime >> ~/carga.txt

# Ejecutar un script cada minuto
#m  h  dom mon dow  cmd
 *  *   *   *   *   ~/mi_script.sh >> ~/mi_script.out 2>> ~/mi_script.err
```

- Algunas versiones recientes de cron soportan formatos no estándar y atajos como: **@hourly, @daily, @weekly, @monthly, @yearly, @reboot.**

- Otra forma de **indicar las tareas es escribiéndolas en un fichero y luego instalar el fichero en el cron** (se perderán todas las tareas previas). Por ejemplo, si hemos escrito todas nuestras tareas en el fichero mis_tareas.txt, para instalarlo sólo tenemos que hacer crontab mis_tareas.txt.

-Las tareas se instalan a nivel de usuario.Las tareas del sistema se almacenan en la tabla de tareas del usuario root.

#### Otras operaciones:
- **Listar todas las tareas:** crontab -l
- **Borrar todas las tareas:** crontab -r
- **Borrar algunas tareas:** editar la tabla de tareas con **crontab -e** y borrar las líneas de las tareas a eliminar, o bien comentarlas con el caracter #, lo que nos permitirá recuperarlas en otro momento.

### Comando Watch

- permite ejecutar un comando de forma periódica y mostrar su salida en pantalla completa.
- Útil para tareas que requieren ejecución frecuente y visualización continua de resultados.
- Facilita la monitorización de procesos y resultados en tiempo real.

#### Opciones Útiles

- -n X (Intervalo de Tiempo):

Especifica el intervalo de tiempo en segundos para ejecutar el comando.
Ejemplo: -n 1 ejecuta el comando cada segundo.

- -d (Resaltar Diferencias):

Resalta las diferencias entre las salidas consecutivas del comando.
Útil para detectar cambios o actualizaciones en la salida.

Otras Opciones:

- -p: Aumenta la precisión en el cálculo de los intervalos de tiempo.
- -b: Emite un sonido si el comando produce un error (código de error distinto de cero).

#### Ejemplo de Uso

Simular el comportamiento de top ejecutando el comando ps cada segundo y mostrando las diferencias:

**watch -n 1 -d ps aux**

### Tareas por Eventos

#### Introducción
- Las tareas por eventos se ejecutan en respuesta a eventos específicos en el sistema.
- Requieren herramientas especializadas o la creación de scripts personalizados.

#### Ejemplos de Tareas por Eventos
1. **Tareas cuando el Sistema está "Ocioso"**:
   - El comando `batch` (dentro del paquete `at`) ejecuta tareas cuando la carga del sistema es baja.
   - Ideal para tareas de relleno cuando la carga es baja.
   - Por defecto, las tareas se ejecutan cuando la carga baja por debajo de 1.5.

2. **Tareas Relacionadas con el Sistema de Archivos**:
   - El paquete `incron` permite programar tareas en respuesta a eventos en el sistema de archivos.
   - Ejemplos incluyen ejecutar una tarea cuando se crea un nuevo archivo, se modifica o se elimina.

3. **Tareas durante el Arranque de la Máquina**:
   - Se pueden especificar con `cron` utilizando el atajo `@reboot`.
   - También se pueden configurar con `update-rd.d`, si está disponible en la distribución.
   - Ejemplo: `@reboot sleep 300 && ~/mi_script.sh` para ejecutar una tarea 5 minutos después de iniciar el sistema.

4. **Tareas cuando se Conecta algún Usuario**:
   - Se pueden escribir los comandos en `/etc/profile.d/` (varía según la distribución).
   - Estos comandos se ejecutan cada vez que se inicia sesión un usuario.

5. **Tareas cada vez que se Abre una Terminal**:
   - Depende de la configuración de la shell del usuario.
   - En bash, se ejecuta el archivo `~/.bashrc` cada vez que se abre una terminal.
   - Se pueden definir configuraciones, alias de comandos, variables globales, etc.
   - Se debe tener cuidado al editar estos archivos, ya que afectan al funcionamiento del sistema.

