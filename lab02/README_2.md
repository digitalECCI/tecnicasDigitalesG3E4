# Lab 02: Sumador de 4 bits

## Integrantes

* **Wilmar Benavides**
* **Valentina Jimenez - 144353**

**Grupo:** G3E1
**Programa:** Ingeniería Electrónica
**Universidad:** Universidad ECCI


---
## Documentacion del diseño implementado

## 1.1. Sumador de 1 bit

El sumador de 1 bit constituye el módulo base utilizado para construir el sumador de 4 bits. Este circuito recibe dos entradas binarias, denominadas `A` y `B`, además de un acarreo de entrada `Ci`.

Como resultado, genera una salida de suma `SO` y un acarreo de salida `CO`.

Las expresiones booleanas utilizadas para el diseño son:

$$
SO = A \oplus B \oplus Ci
$$

$$
CO = (A \cdot B) + (Ci \cdot (A \oplus B))
$$

El módulo de 1 bit permite reutilizar un diseño previamente desarrollado para construir sistemas digitales de mayor tamaño.

![Simulación de compuertas lógicas](evidencias/Sumador%20de%201%20bit.jpeg)


## 1.2. Sumador de 4 bits

Un sumador de 4 bits permite realizar la suma de dos números binarios de cuatro bits:

* `A[3:0]`
* `B[3:0]`

El resultado está compuesto por:

* `So[3:0]`: resultado de la suma.
* `Co`: acarreo final.

Para construir este circuito se utilizan cuatro módulos sumadores de 1 bit conectados en cascada. Cada módulo procesa una posición de los números de entrada y transmite su acarreo de salida hacia el siguiente módulo.

De esta manera, el acarreo generado en una posición es utilizado como acarreo de entrada en la siguiente posición.

### Figura 1. Simulación del sumador de 4 bits

![Diagrama del sumador de 4 bits](evidencias/sumador_4bits.jpg)



## 1.3. Funcionamiento

El funcionamiento del circuito se basa en cuatro etapas conectadas de manera secuencial.

1. El primer sumador procesa `A[0]` y `B[0]`, junto con el acarreo inicial `Ci`.
2. El acarreo generado por la primera etapa se conecta al segundo sumador.
3. El segundo sumador procesa `A[1]` y `B[1]` y recibe el acarreo proveniente de la etapa anterior.
4. El proceso continúa hasta llegar al cuarto sumador.
5. El último módulo genera `So[3]` y el acarreo final `Co`.

Esta conexión permite realizar la suma completa de dos números binarios de cuatro bits.

Por ejemplo:

```text
     A = 0101
     B = 0011
     --------
   So  = 1000
```

Por lo tanto:

$$
0101_2 + 0011_2 = 1000_2
$$

En decimal:

$$
5 + 3 = 8
$$

---

# 2. Implementación en HDL

## 2.1. Instanciación de módulos

Para construir el sumador de 4 bits se reutilizó el módulo `sum1b`, desarrollado previamente en el laboratorio de sumador de 1 bit.

La instanciación permite utilizar varias copias de un módulo dentro de otro diseño.

La estructura general utilizada en Verilog es:

```verilog
nombre_modulo nombre_instancia (
    .puerto(señal)
);
```

En este caso, el módulo `sum1b` se instancia cuatro veces para construir el sumador de 4 bits.

---

# 3. Simulación

Antes de realizar la implementación física, el diseño fue sometido a un proceso de simulación para comprobar el comportamiento lógico del circuito.

La simulación permitió verificar diferentes combinaciones de las entradas `A`, `B` y `Ci`, observando que las salidas `So` y `Co` correspondieran al resultado esperado.

---
# 4. Implementación en FPGA mediante Quartus

Después de comprobar el funcionamiento del diseño mediante simulación, se realizó su implementación física en una tarjeta FPGA utilizando la herramienta **Quartus**.

El objetivo de esta etapa fue trasladar el diseño descrito en Verilog desde el entorno de simulación hacia el dispositivo programable.


## 4.1. Programación de la FPGA

Después de completar la compilación, se realizó la programación de la tarjeta FPGA utilizando el archivo generado por Quartus.

Una vez programada la tarjeta, se realizaron diferentes pruebas modificando las entradas mediante los interruptores.

Los LED permitieron visualizar el resultado producido por el sumador.

### Implementación física del sumador de 4 bits

https://youtube.com/shorts/553LpHqdT7s

---

# 5. Verificación experimental

Para verificar el funcionamiento del circuito implementado, se realizaron diferentes combinaciones de los valores de entrada.

La siguiente tabla presenta algunos casos de prueba:

| A    | B    | Ci | Resultado esperado | So   | Co |
| ---- | ---- | -- | ------------------ | ---- | -- |
| 0000 | 0000 | 0  | 0000               | 0000 | 0  |
| 0001 | 0001 | 0  | 0010               | 0010 | 0  |
| 0010 | 0011 | 0  | 0101               | 0101 | 0  |
| 0101 | 0011 | 0  | 1000               | 1000 | 0  |
| 1111 | 0001 | 0  | 10000              | 0000 | 1  |
| 1111 | 1111 | 0  | 11110              | 1110 | 1  |

En cada caso, el resultado observado mediante los LED correspondió al comportamiento esperado de la suma binaria.

---

# 6. Resultados

A partir de las pruebas realizadas se verificó el correcto funcionamiento del sumador de 4 bits.

La implementación permitió comprobar el comportamiento del diseño en tres etapas:

1. **Descripción HDL:** se construyó el sumador de 4 bits mediante la reutilización del módulo sumador de 1 bit.
2. **Simulación:** se verificó previamente el comportamiento lógico del circuito.
3. **Implementación física:** el diseño fue programado en la FPGA mediante Quartus y se comprobó su funcionamiento utilizando los interruptores y LED de la tarjeta.

La metodología permitió comprobar que un circuito digital puede construirse de manera modular mediante la reutilización de bloques previamente desarrollados.

---

# 7. Conclusiones

* Se logró implementar un sumador de 4 bits utilizando cuatro módulos sumadores de 1 bit conectados mediante una cadena de acarreo.
* La instanciación de módulos permitió reutilizar el diseño desarrollado previamente y facilitar la construcción de un sistema digital de mayor tamaño.
* La simulación permitió verificar el funcionamiento lógico del circuito antes de realizar su implementación física.
* La implementación mediante Quartus permitió trasladar el diseño HDL a la FPGA y comprobar experimentalmente su funcionamiento.
* El uso de los interruptores como entradas y los LED como salidas permitió visualizar de manera directa el resultado de las operaciones realizadas por el sumador.

---



---

# 8. Referencias

[1] Universidad ECCI, *Técnicas Digitales — Lab 02: Sumador de 4 bits*, 2026.

[2] Intel Corporation, *Quartus Prime Design Software*, Intel FPGA.
