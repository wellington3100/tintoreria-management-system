# Bitácora de Desarrollo - Sistema de Tintorería

Este documento registra el avance diario del proyecto, describiendo las decisiones técnicas y de análisis tomadas durante el desarrollo.

---

## Día 1 – Análisis del negocio
**Duración:** 25 minutos

### Actividades realizadas
- Análisis del funcionamiento real de una tintorería
- Identificación de las entidades principales del sistema:
  - Cliente
  - Prenda
  - Servicio
  - Orden (Ticket)
- Detección de un elemento crítico del negocio: el sistema de ganchos (1–750)
- Definición del flujo real:
  - Recepción de prenda
  - Asignación de gancho
  - Generación de ticket
  - Entrega y liberación de gancho

### Decisiones importantes
- Las horas de entrada y salida pertenecen a la **orden**, no a la prenda
- El ticket es el identificador principal del proceso
- Se prioriza simplicidad sobre información innecesaria

### Aprendizajes
- Un buen sistema comienza entendiendo el negocio, no escribiendo código
- Evitar duplicación de datos desde la fase de diseño

---

## Próximo paso
- Transformar las entidades definidas en tablas SQL normalizadas


## (Primera fecha)
- Objetivo:
Registrar el trabajo diario de la tintorería de forma simple.

- Entidades principales:
- 1. Cliente
     
	-Nombre
  
	-id_cliente
  
	-Historial de entrega
  
2. Prenda
   
	-Color

	-Tipo de prenda

	-Material

	-Hora entrada

	-Hora salida

3. Servicio
   
	-Que servicio

	-Precio

	-Hora entrada

	-Hora salida

5. Orden (Ticket)
   
	-id_cliente

	-hora entrada

	-hora salida

	-estado

	-total

	-fecha

Problemas actuales del negocio:
- Muchas cosas innecesarias información extra
- #### (Pendiente)

Información que sería útil ver rápido:
- El cliente llega con su ticket lo escaneas con el lector de barras y te aparece el numero de ticket, en que gancho se guardo, la prenda que es con sus especificaciones
- #### (Pendiente)

Como es trabajar ahi:
Cada cliente tiene su id_cliente

De ahi tenemos 2 opciones como tintoreria:

1: Recibir su prenda
	-Se solicita id_cliente.
	-Nuestro trabajador revisa la prenda y pone las opciones de la prenda: material_prenda, color_prenda, y tipo_prenda.
	-Dependiendo de la prenda se le da el precio (recuerdando que hay promociones dependiendo el dia).
	-Se asigna fecha de entrega.
	-Recibimos prenda del cliente.
	-Se le asigna un único gancho del 1 al 750 (id_gancho) (Los clientes no pueden compartir el mismo numero de gancho).
	-Se imprime 2 tickets iguales.
		1.-Se le entrega al cliente con (id_gancho), debe entregar el ticket para escanear el código de barras y asi dar de alta del sistema su prenda para que se pueda liberar ese id_gancho para otro cliente.
		2.-Este se lo queda el operador, dependiendo la fecha de entrega a ese ticket se le marca con un marcador de color el id_cliente (dependiendo del dia es con el color que se escribe el id_cliente)
2: Entregar su prenda
  -Llega el cliente con su ticket en mano
  -Se escanea el codigo que indica en que id_gancho se encuentra
  -Se saca del gancho
  -Se elimina la prenda del gancho para dejar el id_gancho libre
  -Se cobra la prenda

-------------------------------------------------------
## Día 2 – Diseño inicial de tablas SQL
**Duración:** 25 minutos

### Actividades realizadas
- Creación de tablas núcleo: cliente, gancho y orden
- Definición de claves primarias y relaciones
- Identificación de la orden como eje del sistema

### Aprendizajes
- Diseñar bien tablas evita problemas operativos reales
## 2026-01-20
- Avance diario
