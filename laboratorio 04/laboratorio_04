# Tecnicas Digitales D3E5# Tecnicas Digitales D3E5

# Descripción
 Este es el repositorio de la asignatura tecnicas digitales.

# Integrantes
* [Wilmar Fabian Benavides Rojas]
* [Valentina Jimenez Reyes]
  
# Informe

Indice:

1. [lab04_SIM](#laboratorio-04-SIM)
2. [Simulaciones](#simulaciones)
3. [Evidencias de implementación](#evidencias-de-implementación)
4. [Conclusiones](#conclusiones)

## Documentación del diseño implementado

## 1. lab04_SIM

#### 1.1 Descripción

El código mostrado corresponde a una señal de reloj ,Se utiliza para medir y mostrar el tiempo transcurrido en sistemas electrónicos embebidos. Al permitir cambiar el modo de operación, sirve tanto para mediciones gruesas (segundos completos) como para mediciones de alta precisión científica o deportiva (décimas, centésimas o milésimas de segundo).

El módulo principal que se está probando es lab04_SIM
   input CLK,
    input RESET,
    input [1:0] MODE,

    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3

El código de prueba (lab04_SIM) El circuito se divide en 3 bloques principales:

1. El Divisor de Frecuencia (El "Corazón" del Tiempo)

Las FPGAs funcionan con un reloj interno extremadamente rápido (en este caso, configurado a 50 MHz, lo que significa 50 millones de pulsos por segundo). Como los humanos no podemos ver algo cambiar a esa velocidad, este bloque cuenta los pulsos de la tarjeta.
• Si el usuario elige Segundos, el circuito espera a que pasen los 50 millones de pulsos para dar la orden de "avanzar 1 segundo".
• Si elige Milésimas, solo espera 50,000 pulsos.

2. Los Contadores en Cascada (Las Unidades, Decenas...)

Este bloque se compone de 4 registros (counter0 a counter3). Funcionan exactamente igual que el cuentakilómetros de un auto:
• Cuando las unidades (HEX0) llegan a 9, se reinician a 0 y le suman 1 a las decenas (HEX1).
• Cuando las decenas llegan a 9, le suman 1 a las centenas (HEX2), y así sucesivamente hasta el último dígito.

3. El Decodificador de  (La Pantalla)

Los contadores lab04_SIM guardan los números en binario (un lenguaje que la pantalla no entiende). Este bloque toma el número binario (por ejemplo, 4'd0) y lo traduce al código eléctrico necesario para encender los leds correctos en un display de 7 segmentos y formar físicamente el número 0 en la pantalla.

#### 1.2 Diagramas

![Diagrama 1]("C:\Users\ASUS\Downloads\WhatsApp Image 2026-10-05 at 15.16.06.jpeg")

## Simulaciones

### 1. Simulacion de Sumador de reloj

![Diagrama 2]("C:\Users\ASUS\Downloads\WhatsApp Image 2026-10-05 at 15.11.09.jpeg")

## Evidencias de implementación

[https://youtu.be/5Vqt8NWnJk8 ](https://youtu.be/5IMnQ26Sujs?si=jKdkKPnq_sba-bOQ)

## Conclusiones

El circuito desarrollado demuestra la versatilidad de la lógica digital y el lenguaje Verilog para diseñar sistemas de medición de tiempo precisos y adaptables en tecnologías FPGA. A través de la correcta implementación de un divisor de frecuencia dinámico controlado síncronamente y una estructura de contadores en cascada (BCD), se logró un diseño robusto que mitiga errores de temporización (glitches) al cambiar entre escalas de tiempo (segundos, décimas, centésimas y milésimas).
Asimismo, la optimización del módulo mediante el uso de funciones para la decodificación a 7 segmentos no solo redujo drásticamente las líneas de código redundantes, sino que optimizó el uso de recursos lógicos dentro del hardware, resultando en un sistema eficiente, escalable y listo para su implementación en entornos de control y automatización del mundo real.
