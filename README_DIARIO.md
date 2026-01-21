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
 1. Cliente
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
	-Hora salida (Creo que iría aca y no en prenda pero igual lo mantengo en ambos para que resuelvas mi duda)
4. Orden (Ticket)
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

## 📅 Día 2 – Diseño de base de datos y control de versiones

### Objetivo del día
Iniciar el desarrollo técnico del sistema mediante la creación del modelo inicial de la base de datos y establecer un flujo correcto de control de versiones usando Git y GitHub.

### Actividades realizadas
- Diseño y creación del esquema inicial de la base de datos utilizando SQLite.
- Definición de las tablas principales del sistema:
  - **cliente**: datos básicos del cliente, teléfono y estado activo.
  - **gancho**: representación del sistema físico de ganchos únicos de la tintorería.
  - **orden**: entidad central que relaciona cliente, gancho, fechas y total.
- Implementación de claves primarias y foráneas para mantener integridad referencial.
- Definición de restricción de unicidad para el código de barras de la orden.
- Creación de un índice por teléfono del cliente para optimizar búsquedas frecuentes.
- Análisis de feedback externo sobre validaciones de datos y buenas prácticas.
- Creación y configuración del repositorio en GitHub.
- Manejo de ramas (`master` y `main`), resolución de conflictos y merge.
- Documentación del proyecto mediante archivos README.

### Decisiones técnicas
- El sistema está pensado para uso real en la computadora del negocio, con base de datos local.
- No toda validación se resolvió en SQL; algunas reglas se delegarán al backend.
- Se priorizó un diseño simple y escalable, evitando sobreingeniería en esta etapa.

### Estado del proyecto
- Esquema inicial de base de datos definido y versionado.
- Repositorio sincronizado correctamente con GitHub.
- Proyecto preparado para avanzar hacia la definición del flujo de negocio y lógica de estados.
