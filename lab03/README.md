# Lab 04: Contador Digital en Display de 7 Segmentos

## Integrantes

- **Wilmar Benavides - 142948**
- **Valentina Jimenez - 144353**

**Grupo:** G3E1  
**Programa:** Ingeniería Electrónica  
**Universidad:** Universidad ECCI  

---

## 1. Marco Teórico

### 1.1. Lógica Secuencial

La lógica secuencial es una rama de la electrónica digital que estudia sistemas cuyo comportamiento depende no solo de las entradas actuales, sino también del historial de estados anteriores. A diferencia de la lógica combinacional —donde la salida es función exclusiva de las entradas presentes— en los sistemas secuenciales la salida evoluciona según la secuencia de eventos pasados, lo que les permite recordar información y operar bajo la sincronización de un reloj (*clock*).

---

### 1.2. Componentes y Principios Fundamentales

#### Flip-Flops
Los flip-flops son los elementos de memoria básicos de la lógica secuencial. Cada uno almacena un bit de información y mantiene su estado hasta recibir una señal de activación proveniente del reloj del sistema. Los tipos más utilizados son:

- **Tipo D:** Captura el valor de la entrada en el flanco activo del reloj.
- **Tipo T:** Conmuta su estado (*toggle*) cada vez que la entrada está activa.
- **Tipo SR:** Permite Set y Reset independientes de su salida.
- **Tipo JK:** Generalización del SR que elimina el estado prohibido.

#### Registros
Un registro es un conjunto de flip-flops que opera de forma coordinada para almacenar múltiples bits de información. Los registros de desplazamiento permiten mover datos entre flip-flops adyacentes con cada pulso de reloj, siendo una operación fundamental en procesamiento digital.

#### Contadores
Los contadores son circuitos construidos a partir de flip-flops encadenados, diseñados para llevar la cuenta de pulsos de reloj. Según su configuración, pueden contar en secuencia binaria, BCD (Binary Coded Decimal), Gray u otras codificaciones.

#### Divisor de Frecuencia
Un divisor de frecuencia es un circuito cuya señal de salida tiene una frecuencia menor que la de entrada. Se implementa típicamente mediante un contador módulo $N$: la señal que se desea dividir alimenta la entrada de reloj del contador y, al alcanzar el estado $N-1$, se genera un pulso de salida. La frecuencia resultante es exactamente $N$ veces menor que la frecuencia de entrada.

| Señal | Descripción |
| :--- | :--- |
| `clk` | Reloj principal del sistema (50 MHz en la FPGA). |
| `rst` | Reset síncrono; inicializa todas las variables en cero. |
| `counter` | Contador interno que cicla de 0 a $N-1$ (en este caso, 0 a 49,999). |
| `tick_1ms` | Nueva señal de reloj o pulso con frecuencia $N$ veces menor que `clk`. |

---

## 2. Documentación del diseño implementado

### 2.1. Divisor de frecuencia (Frequency Divider)

La tarjeta FPGA trabaja con un reloj principal de alta frecuencia ($50\text{ MHz}$). Para lograr un conteo preciso de milésimas de segundo ($1\text{ ms}$ o $1000\text{ Hz}$), se diseña un divisor de frecuencia por contador Módulo-$N$.

El valor del módulo $N$ para obtener $1\text{ ms}$ a partir de $50\text{ MHz}$ se calcula mediante:

$$N = \frac{f_{\text{clk}}}{f_{\text{deseada}}} = \frac{50\,000\,000\text{ Hz}}{1000\text{ Hz}} = 50\,000$$

El contador interno incrementa en cada flanco de subida de `clk`. Al alcanzar el valor $N-1 = 49\,999$, genera un pulso de un ciclo de reloj denominado `tick_1ms` y reinicia la cuenta a cero.

---

### 2.2. Contador BCD de 4 dígitos (Cronómetro 0000 - 9999)

El cronómetro cuenta en formato BCD (Binary Coded Decimal) abarcando 4 dígitos decimales:
- **`mil_seg`**: Milésimas de segundo ($0 \text{ a } 9$).
- **`cent_seg`**: Centésimas de segundo ($0 \text{ a } 9$).
- **`dec_seg`**: Décimas de segundo ($0 \text{ a } 9$).
- **`seg`**: Segundos ($0 \text{ a } 9$).

Cada etapa opera en módulo 10: cuando un dígito alcanza el valor 9, se reinicia a 0 y genera un acarreo (*carry*) que habilita el incremento del siguiente dígito en la cadena.

  
## 4. Simulación

Antes de realizar la implementación física, el diseño fue sometido a simulación funcional para comprobar la correcta sincronización de los bloques de lógica secuencial.

La simulación permitió verificar:

1. Generación exacta del pulso `tick_1ms` cada 50,000 ciclos de `clk`.
2. Encadenamiento correcto de acarreos BCD al llegar al número 9 en cada registro.
3. Selección dinámica del dígito a enviar al decodificador según los estados del vector `SW[1:0]`.
4. Restablecimiento inmediato a `0000` al presionar la señal `rst`.

---

## 5. Implementación en FPGA mediante Quartus

Una vez verificado el comportamiento lógico mediante simulación, se trasladó el diseño descrito en Verilog hacia la FPGA mediante **Intel Quartus Prime**.

### 5.1. Asignación de Pines

| Señal Hardware | Componente FPGA | Descripción |
| :--- | :--- | :--- |
| `clk` | PIN_50MHz | Reloj principal del oscilador de la FPGA |
| `rst` | KEY0 / Push Button | Botón de reset activo |
| `SW[0]` | SW0 | Selector de modo (Bit 0) |
| `SW[1]` | SW1 | Selector de modo (Bit 1) |
| `HEX0[6:0]` | Display 7 Segmentos 0 | Salida decodificada hacia el display de la FPGA |

### 5.2. Programación de la FPGA

1. Síntesis y compilación completa del código Verilog en Quartus Prime.
2. Verificación de tiempos e integración física de bloques secuenciales.
3. Carga del archivo `.sof` mediante la herramienta **Programmer** a través de la interfaz USB-Blaster.

---

## 6. Verificación experimental

Para verificar el funcionamiento práctico sobre el hardware, se manipularon los interruptores de selección y el botón de reinicio.

### Tabla de prueba experimental

| `SW[1]` | `SW[0]` | Entrada `rst` | Comportamiento observado en el Display `HEX0` |
| :---: | :---: | :---: | :--- |
| `0` | `0` | `0` | Conteo dinámico continuo en **milésimas de segundo** (cambio ultra rápido). |
| `0` | `1` | `0` | Conteo dinámico continuo en **centésimas de segundo**. |
| `1` | `0` | `0` | Conteo dinámico continuo en **décimas de segundo**. |
| `1` | `1` | `0` | Conteo dinámico en **segundos** (1 incremento por segundo exacto). |
| `X` | `X` | `1` | **Reset síncrono:** el contador se reinicia a `0` y congela la cuenta hasta soltar el botón. |

### Video de evidencia en la FPGA

A continuación se adjunta la demostración del funcionamiento del cronómetro implementado sobre la FPGA:

https://www.youtube.com/watch?v=5IMnQ26Sujs

---

## 7. Resultados

A partir de las pruebas realizadas se comprobó el correcto funcionamiento del cronómetro digital:

1. **Lógica Secuencial y División de Frecuencia:** Se redujo exitosamente la señal de reloj de $50\text{ MHz}$ a una base de tiempo estable de $1\text{ ms}$.
2. **Encadenamiento BCD:** La transferencia de acarreo entre los contadores de milésimas, centésimas, décimas y segundos funcionó según lo esperado.
3. **Mux y Decodificación:** La conmutación mediante los switches `SW[1:0]` permitió visualizar individualmente cada escala de tiempo en el display de 7 segmentos en tiempo real.

---

## 8. Conclusiones

- Se logró implementar un cronómetro digital completo utilizando divisores de frecuencia y contadores BCD sincronizados por reloj en lógica secuencial.
- El uso de flip-flops y registros permitió retener la cuenta de eventos pas