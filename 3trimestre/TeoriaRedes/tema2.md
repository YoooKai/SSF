# TEMA 2: Normalización en las redes locales

## Normas en las Comunicaciones

### 1.1: Procedimientos y normas en el proceso de comunicación

En los procesos de comunicación, existen diversos procedimientos y normas que emisor y receptor deben seguir:

- Identificación de dispositivos: Cómo se identifican los dispositivos en la red.

- Transmisión de datos: Cómo se determina quién puede transmitir para evitar que las señales se mezclen en el canal.

- Inicio y fin de transmisión: Cómo identifica el receptor cuándo empieza y cuándo termina una transmisión.

- Representación y transmisión de datos: Qué código se utiliza para representar los datos en bits y cómo se transforman en señales adecuadas para el canal.

- Información adicional: Qué información adicional se debe añadir para regular la comunicación.

- Enrutamiento: Cómo los dispositivos intermedios determinan el camino que debe seguir un mensaje para llegar a su destino.

- Control de errores: Si hay o no control de errores y cómo se lleva a cabo.



## Protocolos y estándares

- Protocolos de comunicaciones: Conjunto de normas y procedimientos que los diseñadores de una red establecen para que los distintos componentes de la red los utilicen.

- Estándares de red: Modelo o patrón para que distintos fabricantes fabriquen componentes compatibles entre sí.

Tipos de estándares:

- De facto: Proceden de iniciativas propias de empresas.
- De iure: Proceden de organismos oficiales.

## Organismos Reguladores

### Internacionales:
- ITU: Unión Internacional de Telecomunicaciones.
- ISO/IEC: Organización Internacional para la Estandarización y Comisión Electrotécnica Internacional.
- IEEE: Instituto de Ingenieros Eléctricos y Electrónicos.
### Estados Unidos:
. ANSI: Instituto Americano de Normas Nacionales.
### Europa:
- CEN: Comité Europeo de Normalización.
- CENELEC: Comité Europeo de Normalización Electrotécnica.
- ETSI: Instituto Europeo de Estándares de Telecomunicaciones.
### España:
- CTN: Comités Técnicos de Normalización.
- AENOR: Asociación Española de Normalización y Certificación.

# Arquitecturas de red basadas en capas

## Modelo OSI

- Intento de unificar esfuerzos y conocimientos, aunque resultó complejo y difícil de implementar.
- Permite describir y comprender la base conceptual de otras arquitecturas de red.

## Modelo TCP/IP

- Más sencillo y práctico, ganó popularidad.
- Evolucionó de ARPANET en los 70s, convirtiéndose en el estándar de facto.

# La pila de protocolos OSI

Dividida en siete capas (desde la más física hacia la más cercana al usuario):

- Capa física: Utilización del medio físico para la transmisión.

- Capa de enlace de datos: Establecimiento de un enlace lógico fiable entre dispositivos.

- Capa de red: Establecimiento de enlaces lógicos entre dispositivos en redes distintas.
- Capa de transporte: Regula el flujo de información de manera sincronizada y precisa.

- Capa de sesión: Establecimiento, mantenimiento y finalización de sesiones de usuario.

- Capa de presentación: Representación de datos para su transmisión.-
- Capa de aplicación: Interactúa con el usuario final, proporcionando servicios de red.
- 
(Yo me lo aprendí formando una frase con Feos Elefantes Rojos Toman Siestas Para Alimentarse, pues la inicial de cada pertenece a una capa, en orden, y así me acuerdo de esta vaina.)

# Comunicación entre dos máquinas

En el modelo OSI, la información viaja desde la capa de aplicación de la máquina emisora hasta la capa de aplicación de la máquina receptora, pasando por todas las capas en cada máquina. Las capas homólogas establecen enlaces virtuales, y solo en la capa física se establecen enlaces físicos. La información de cada capa se añade a los datos mediante cabeceras y colas, un proceso llamado encapsulación.

# Capa Física del Modelo OSI

### Especificaciones de los medios de transmisión

- Descripción: Define cómo deben ser los medios físicos que se utilizan para transmitir datos, como cables de cobre, fibra óptica o el aire para las transmisiones inalámbricas.
- Ejemplo: Un cable Ethernet (de cobre) que conecta tu computadora al router.

### Tipos y estructuración del cableado, especificaciones físicas y conectores

- Descripción: Describe cómo deben ser los cables y sus conectores, así como cómo deben instalarse y estructurarse.
- Ejemplo: El conector RJ45 que se usa para conectar un cable Ethernet a tu computadora o router.

### Distribución y regulación del espectro electromagnético para transmisiones inalámbricas
- Descripción: Define cómo se utilizan las diferentes partes del espectro electromagnético para las transmisiones inalámbricas, evitando interferencias.
- Ejemplo: La señal Wi-Fi de tu hogar utiliza una parte específica del espectro electromagnético, como la banda de 2.4 GHz o 5 GHz.

### Multiplexación de señales en un mismo canal
- Descripción: Técnica que permite transmitir múltiples señales a través de un solo canal físico.
- Ejemplo: En una red telefónica, varias llamadas pueden compartirse a través de la misma línea gracias a la multiplexación.

### Especificaciones de dispositivos y adaptadores de red y su interacción con el medio
- Descripción: Define cómo deben ser los dispositivos de red (como tarjetas de red) y cómo deben interactuar con el medio físico de transmisión.
- Ejemplo: Una tarjeta de red en tu computadora que convierte los datos en señales eléctricas que se pueden enviar a través de un cable Ethernet.

### Procesos de codificación y decodificación de señales
- Descripción: Describe cómo los datos se convierten en señales (codificación) para ser transmitidos y luego se convierten de nuevo en datos legibles (decodificación) en el destino.
- Ejemplo: Al enviar un correo electrónico, los datos se codifican en señales eléctricas para viajar a través de un cable Ethernet y luego se decodifican de vuelta en datos en el servidor de correo.

### Conectividad entre antenas
- Descripción: Define cómo deben conectarse y comunicarse las antenas para asegurar una transmisión efectiva de datos.
- Ejemplo: Las antenas de una estación base de telefonía móvil que deben estar correctamente alineadas y sincronizadas para proporcionar servicio a los teléfonos móviles en su área.


### Estos son algunos protocolos y estándares que establecen reglas y normas para diferentes aspectos de la capa física de las redes:

- ANSI/TIA/EIA 568 B: Es un estándar que define cómo deben ser los cables y conectores de una red, incluyendo cómo deben ser instalados y organizados en una red cableada.

- ISO/IEC 11801: Otro estándar que establece requisitos para el diseño y la instalación de infraestructuras de cableado estructurado, como los utilizados en redes de área local (LAN).

- Protocolos Ethernet y estándar IEEE 802.3: Estos son conjuntos de reglas y normas que definen cómo se comunican los dispositivos en una red Ethernet. Esto incluye aspectos como cómo se transmiten los datos, cómo se accede al medio de transmisión y cómo se gestionan los errores.


# La capa 2, conocida como la capa de enlace de datos

Se encarga de dos tareas principales para facilitar la comunicación entre dispositivos conectados en una red:

### Garantizar la fiabilidad de la transmisión a través de un enlace físico determinado: Esto implica asegurarse de que los datos se transmitan correctamente entre los dispositivos. Algunos aspectos clave son:

- Sincronización entre emisor y receptor: Asegura que ambos dispositivos estén coordinados en el envío y recepción de datos.
- Estructuración de los datos en tramas: Los datos se organizan en bloques llamados tramas para su transmisión eficiente.
- Control de errores: Detecta y corrige posibles errores que puedan ocurrir durante la transmisión.
- Control de flujo: Regula la velocidad de transmisión para evitar el desbordamiento de datos.
- Establecimiento de un tamaño mínimo y máximo para la trama: Define los límites de tamaño para las tramas de datos.

### Permitir el establecimiento de un enlace lógico entre dispositivos conectados a un mismo medio de transmisión: Esto involucra la creación de un canal de comunicación confiable entre los dispositivos. Algunos aspectos incluyen:

- Identificación única de los dispositivos conectados al medio o direccionamiento físico: Cada dispositivo tiene una dirección única para identificarlo en la red.
- Mecanismo de establecimiento de los enlaces lógicos: Define cómo se inicia y se mantiene la comunicación entre dispositivos.
- Gestión del control de acceso al medio: Regula cómo los dispositivos acceden al medio de transmisión para evitar colisiones de datos.
- Identificación del destino de las tramas y su tratamiento: Determina qué hacer con las tramas recibidas, como aceptarlas, descartarlas o enviarlas a otro destino.
- Esta capa se divide en dos subniveles: el subnivel MAC (Control de Acceso al Medio) y el subnivel LLC (Control de Enlace Lógico), cada uno con responsabilidades específicas.

Algunos protocolos y estándares importantes que regulan aspectos de la capa de enlace de datos son parte de las especificaciones de Ethernet, IEEE 802.3 (que es el estándar de Ethernet), IEEE 802.11 (para redes inalámbricas) y protocolos como PPP (Point-to-Point Protocol) utilizado en conexiones WAN (Wide Area Network).


## Capa 3: Capa de Red

La capa 3, también conocida como la capa de red, se centra en establecer conexiones lógicas entre dispositivos que están en redes diferentes. Aquí tienes una explicación más detallada:

1. **Tipos de enlaces**:
   - **Modo datagrama**: Cada paquete de datos sigue su propio camino independiente a través de la red.
   - **Modo circuitos virtuales**: Antes de enviar la información, se establece una ruta predeterminada para que sigan los paquetes (llamado circuito virtual).

2. **Aspectos regulados por la capa de red**:
   - **Direccionamiento lógico**: Es la identificación de cada dispositivo en una red, comúnmente utilizando direcciones IP.
   - **Tamaños de los paquetes**: Se especifican los límites máximos y mínimos para los bloques de datos, que en esta capa se llaman paquetes de red.
   - **Tipos de enlace**: Se decide si la comunicación se realizará en modo datagrama o circuitos virtuales.
   - **Enrutamiento**: Los dispositivos llamados enrutadores o routers deciden la mejor ruta para enviar los datos a través de la red.
   - **Funcionalidades adicionales**: La capa de red puede proporcionar control de errores, control de flujo y congestión, priorización de datos, garantías de calidad de servicio, entre otras funciones.

3. **Algunos protocolos y estándares**:
   - Protocolo de Internet (IP): Utilizado para direccionamiento y enrutamiento en Internet.
   - Internetwork Package Exchange (IPX): Utilizado en redes Novell NetWare.
   - NetBEUI: Protocolo utilizado en redes de Microsoft.
   - Appletalk: Protocolo utilizado en redes de Apple.

Estos protocolos y estándares definen cómo se lleva a cabo el direccionamiento, enrutamiento y la comunicación entre dispositivos en la capa de red.



## Capa 4: Capa de Transporte

La Capa 4, también conocida como la capa de transporte, es crucial en la transmisión de datos, ya que se encarga de regular el flujo de información desde el origen hasta el destino de manera precisa y sincronizada, garantizando calidad en el servicio. Aquí tienes un resumen de sus principales funciones y características:

1. **División de datos**: Esta capa recibe el mensaje de las capas superiores y lo divide en partes más pequeñas llamadas segmentos. Estos segmentos se envían de forma sincronizada y con control de flujo a la capa de transporte del destinatario, que los recompondrá para recuperar el mensaje original.

2. **Servicios ofrecidos**: La Capa 4 proporciona dos niveles de servicio: orientado a la conexión y no orientado a la conexión. En el servicio orientado a la conexión, se establece un circuito virtual que pasa por tres fases: establecimiento, transferencia de datos y liberación. Este circuito virtual garantiza la confiabilidad de los datos, el control de flujo, la sincronización y el control de errores.

3. **Funciones principales**:
   - Ofrecer servicios a la capa de sesión.
   - Permitir la interconexión de aplicaciones entre dispositivos distintos.
   - Identificar todas las aplicaciones en cada dispositivo de la red.
   - Establecer, mantener y terminar circuitos virtuales para la transmisión de datos.

4. **Funcionalidades adicionales**:
   - Reconstrucción de datos a partir de fragmentos en el destino.
   - Control de errores de extremo a extremo.
   - Control de flujo.

5. **Protocolos importantes**:
   - **Transmission Control Protocol (TCP)**: Es el protocolo más usado en Internet y es orientado a la conexión.
   - **User Datagram Protocol (UDP)**: Es no orientado a la conexión y se emplea en comunicaciones sencillas entre máquinas.

6. **Puertos**: En esta capa se definen los puertos mediante números que identifican las aplicaciones en cada host. Estos números permiten dirigir los mensajes a la aplicación correspondiente en el host destino.

En resumen, la Capa 4 asegura una transmisión fiable y controlada de datos entre dispositivos, ofreciendo diferentes niveles de servicio y utilizando protocolos como TCP y UDP para facilitar la comunicación entre aplicaciones. Los puertos se utilizan para dirigir los mensajes a las aplicaciones específicas en los hosts.

## Capa 5: Capa de Sesión

La Capa 5, conocida como la capa de sesión, se encarga de establecer, mantener y finalizar las sesiones de usuario entre dos ordenadores que se están comunicando. Aquí tienes una explicación más clara:

- **Función principal**: Proporciona servicios a la capa de presentación y controla el diálogo entre las dos máquinas conectadas, ya sea como cliente o servidor.
  
- **Ejemplo**: Imagina que un usuario consulta una página web. Aunque el usuario no se autentifique explícitamente en el servidor, el navegador solicita la página web identificándose como usuario anónimo. El servidor decide si permite o no al usuario anónimo acceder a la página, todo esto sin que el usuario lo note.

- **Otras funciones**:
  - Ofrece un sistema de puntos de restauración para restaurar sesiones en caso de fallos sin pérdida de datos.
  - Permite a usuarios de distintos ordenadores establecer sesiones entre sí.

- **Protocolos importantes**:
  - Llamada de Procedimiento Remoto (RPC): Permite a un programador ejecutar su código en una máquina remota sin preocuparse de la implementación de la red.
  - Lenguaje de Consulta Estructurado (SQL): Permite manipular y administrar bases de datos locales y en red.

## Capa 6: Capa de Presentación

La Capa 6, llamada capa de presentación, se encarga de representar los datos que deben ser enviados a través de la red. Aquí tienes una explicación más clara:

- **Funciones principales**:
  - Formateo, cifrado y compresión de datos.
  
- **Ejemplos de funciones**:
  - En un correo electrónico, los datos como el destinatario, el remitente, el asunto y el contenido deben ser ordenados y formateados de manera específica.
  
- **Ejemplos de protocolos**:
  - Lenguajes de marcas como HTML, XML.
  - Formatos de imagen como JPEG, PNG.
  - Formatos de audio como MIDI, MP3.
  - Formatos de texto como ASCII.
  - Formatos de video como MPEG, AVI.

## Capa 7: Capa de Aplicación

La Capa 7, la capa de aplicación, es donde los protocolos existentes están en constante crecimiento debido a las diversas aplicaciones que pueden tener sus propios protocolos. Aquí tienes una explicación más clara:

- **Funciones principales**:
  - Transferencia de ficheros, correo electrónico, navegación web, acceso a bases de datos, entre otros.
  
- **Ejemplos de protocolos**:
  - Protocolos web como HTTP, HTTPS.
  - Protocolos de transferencia de ficheros como FTP.
  - Protocolos de correo electrónico como SMTP, POP3, IMAP.
  - Protocolos de nombres de dominio como DNS.


## Encapsulación de los Datos (Capa 5)

La encapsulación de los datos es un proceso fundamental en el modelo OSI que implica el uso de Protocol Data Units (PDU), que son unidades de datos del protocolo. Aquí tienes una explicación más detallada:

- **Protocol Data Unit (PDU)**:
  - Son unidades de datos del protocolo, utilizadas para establecer la comunicación entre capas homólogas del modelo OSI.
  - Cada capa del modelo OSI tiene su propia PDU.
  - La comunicación entre capas se realiza de forma par a par.
  
- **Proceso de Encapsulación**:
  - Cuando un ordenador intenta enviar datos, estos pasan por la capa de transporte, donde se dividen en segmentos, que son una forma de PDU.
  - Luego, los segmentos pasan a la capa de red, donde se fragmentan en paquetes.
  - Estos paquetes, a su vez, se convierten en tramas en la capa de enlace.
  - Finalmente, las tramas se envían en forma de bits a través de la capa física del modelo OSI.
  - Este proceso de sucesivas divisiones de los datos para su transmisión se llama encapsulación.
  
- **Ejemplo**:
  - Cuando consultamos una página web o descargamos un archivo, la información llega a nuestra computadora dividida en pequeñas cápsulas (PDU), que luego se decodifican y unen para mostrarnos los datos en pantalla.
  
- **Desencapsulación**:
  - Es el proceso contrario a la encapsulación, realizado por el ordenador de destino para obtener los datos originales y presentarlos al usuario.