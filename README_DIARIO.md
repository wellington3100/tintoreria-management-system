## Día 1 – Análisis del negocio y definición del proyecto

### Objetivo del día
Analizar el funcionamiento real de la tintorería y definir el alcance del sistema a desarrollar, asegurando que el proyecto responda a necesidades reales del negocio y no a un ejercicio académico.

### Actividades realizadas
- Análisis del proceso operativo de la tintorería:
  - Recepción de prendas.
  - Asignación de ganchos físicos.
  - Emisión de tickets con código de barras.
  - Entrega de prendas al cliente.
- Identificación de los principales problemas actuales del negocio:
  - Manejo manual de información.
  - Uso de datos innecesarios.
  - Dificultad para consultar información rápidamente.
- Definición de las entidades principales del sistema:
  - Cliente
  - Prenda
  - Servicio
  - Orden (ticket)
- Definición del flujo principal del sistema:
  - Recepción de prenda.
  - Registro de información relevante.
  - Asignación de gancho único.
  - Generación de ticket.
  - Entrega y liberación del gancho.
- Establecimiento de objetivos claros del proyecto:
  - Registro simple y rápido del trabajo diario.
  - Consulta eficiente por ticket o gancho.
  - Sistema diseñado para uso real en el local.
- Decisión de que el sistema será desarrollado de forma profesional, con posibilidad futura de generar un ejecutable para la computadora del negocio.

### Decisiones técnicas
- El proyecto será tratado como un sistema real de producción, no como práctica académica.
- Se priorizará simplicidad operativa sobre complejidad técnica innecesaria.
- El diseño se realizará de forma incremental, validando cada etapa antes de avanzar.

### Estado del proyecto
- Alcance del sistema definido.
- Flujo de negocio claro.
- Bases establecidas para iniciar el diseño técnico y la base de datos.


-------------------------------------------------------

## Día 2 – Diseño de base de datos y control de versiones

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

## Día 3 – Modelado del flujo del negocio 

### Objetivo del día
Definir correctamente el flujo real de trabajo de la tintorería antes de seguir implementando en la base de datos (evitar errores y retrabajo).

### Actividades realizadas
- Análisis detallado del **flujo de una orden** dentro de la tintorería.
- Definición clara de los **estados de una orden**:
  - RECIBIDA
  - EN_PROCESO
  - LISTA
  - ENTREGADA
- Definición de los **estados de una prenda**, alineados con la orden.
- Decisión clave: **no existen entregas parciales**; todas las prendas de una orden se entregan juntas.
- Definición de reglas de negocio:
  - La **orden manda** sobre las prendas.
  - Una orden puede usar **uno o varios ganchos**.
  - Los ganchos se **liberan únicamente** cuando la orden pasa a estado ENTREGADA.
  - No se pueden saltar estados.
- Identificación de escenarios especiales:
  - Órdenes con muchas prendas.
  - Uso de múltiples ganchos por orden.
  - Manejo de incidencias (prenda perdida → revisión del recorrido).

### Decisiones de diseño tomadas
- El estado se maneja tanto en **orden** como en **prenda**, pero el estado de la orden es el principal.
- El sistema debe reflejar fielmente el proceso real del negocio, no simplificaciones irreales.
- Antes de seguir creando tablas o formularios en Access, se prioriza tener claras las reglas del dominio.

### Resultado
Se dejó definida la **base conceptual y lógica** del sistema de tintorería, asegurando que la futura implementación en Access sea sólida, coherente y profesional.

📅 Día 4 — Modelado Relacional en Microsoft Access

Objetivo del día:
Diseñar, corregir y validar el modelo relacional de la base de datos del sistema de la tintorería utilizando Microsoft Access, asegurando integridad referencial y consistencia de datos.

Actividades realizadas:

Creación de la base de datos tintoreria.accdb.

Definición completa de las tablas definitivas del sistema:

cliente

orden

prenda

gancho

orden_gancho

Configuración correcta de claves primarias:

AutoNumber para entidades principales.

Clave primaria compuesta (id_orden, id_gancho) en orden_gancho.

Corrección de tipos de datos para compatibilidad relacional:

AutoNumber en claves primarias.

Number (Long Integer) en todas las claves foráneas.

Eliminación y recreación de relaciones para resolver conflictos de tipos de datos.

Creación de relaciones definitivas con Enforce Referential Integrity activado:

cliente (1) → orden (∞)

orden (1) → prenda (∞)

orden (1) → orden_gancho (∞)

gancho (1) → orden_gancho (∞)

Verificación visual de cardinalidades (1 — ∞) y líneas sólidas.

Confirmación de que la tabla orden actúa como núcleo del sistema.

Resultado:
El modelo de base de datos quedó correctamente normalizado, sin errores de integridad, con relaciones estables y listo para avanzar a la capa de consultas, formularios y lógica de negocio.

Estado del proyecto:
Estructura de base de datos finalizada y validada.

