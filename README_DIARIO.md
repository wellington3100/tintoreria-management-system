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

-------------------------------------------------------

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

-------------------------------------------------------

##  Día 4 – Modelado Relacional en Microsoft Access

###  Objetivo
Diseñar, corregir y validar el modelo relacional de la base de datos del sistema de la tintorería utilizando Microsoft Access, asegurando integridad referencial, consistencia de datos y una base sólida para la lógica del sistema.

### Actividades Realizadas

- Creación de la base de datos:
  - `tintoreria.accdb`

- Definición de las tablas definitivas del sistema:
  - `cliente`
  - `orden`
  - `prenda`
  - `gancho`
  - `orden_gancho`

- Configuración de claves primarias:
  - Uso de `AutoNumber` en entidades principales.
  - Implementación de clave primaria compuesta (`id_orden`, `id_gancho`) en la tabla `orden_gancho`.

- Corrección de tipos de datos:
  - Claves primarias: `AutoNumber`.
  - Claves foráneas: `Number (Long Integer)` para compatibilidad relacional.

- Eliminación de relaciones incorrectas y recreación desde cero para resolver conflictos de tipos de datos.

- Creación de relaciones definitivas con **Enforce Referential Integrity** activado:
  - `cliente (1) → orden (∞)`
  - `orden (1) → prenda (∞)`
  - `orden (1) → orden_gancho (∞)`
  - `gancho (1) → orden_gancho (∞)`

- Verificación visual:
  - Cardinalidades correctas (1 — ∞).
  - Líneas sólidas.
  - Sin uso de `Cascade Delete`.

- Confirmación de que la tabla `orden` funciona como núcleo central del sistema.

### Resultado
El modelo de base de datos quedó **correctamente normalizado**, estable, sin errores de integridad referencial y preparado para avanzar a la capa de consultas, formularios y lógica de negocio.

-------------------------------------------------------

## Día 5 – Formularios y persistencia de datos

### Objetivo del día
Comenzar la capa de interfaz del sistema y verificar que la información ingresada se guarde correctamente en la base de datos.

### Trabajo realizado
- Se creó y configuró el formulario principal `frm_orden`.
- Se creó el subformulario `sub_prendas` vinculado a la orden mediante `id_orden`.
- Se verificó la relación correcta entre formulario principal y subformulario.
- Se confirmó que Access guarda los datos automáticamente al cambiar de campo o registro.
- Se realizó una prueba completa:
  - Crear una orden
  - Agregar prendas desde el subformulario
  - Cerrar y volver a abrir el formulario
  - Confirmar que la información persiste en la base de datos

### Aprendizajes clave
- Microsoft Access no requiere botón de “Guardar”; el guardado es automático.
- La persistencia de datos confirma que la estructura de tablas y formularios está correctamente configurada.
- El subformulario funciona correctamente dentro del flujo Orden → Prendas.

### Estado del proyecto
- Formularios funcionales
- Datos persistentes
- Relación Orden–Prenda operativa
- Base sólida para continuar con lógica de negocio y experiencia de usuario

-------------------------------------------------------

## Día 6 – Seguridad y usabilidad en formularios

### Objetivo del día
Mejorar la interfaz del sistema ocultando campos técnicos y protegiendo información sensible para evitar errores por parte del operador.

###Trabajo realizado
- Se identificaron los campos técnicos que no deben ser visibles ni editables por el operador.
- Se ocultó el campo id_orden en el formulario principal frm_orden.
- Se ocultaron los campos id_prenda e id_orden en el subformulario sub_prendas.
- Se mantuvieron los campos ocultos dentro del formulario para conservar la relación y el funcionamiento interno.
- Se bloqueó el campo total para evitar edición manual.
- Se verificó que:
-La creación de órdenes sigue funcionando correctamente.
-La carga de prendas en el subformulario no se ve afectada.
-Las relaciones entre formularios permanecen intactas.

## Aprendizajes clave
- Los IDs técnicos deben existir en los formularios, pero no ser visibles al usuario.
- Ocultar campos mejora la seguridad y reduce errores operativos.
- Access permite separar claramente la lógica interna de la experiencia del operador.
- Estado del proyecto
- Formularios más limpios y profesionales
- Interfaz segura para el operador
- Menor riesgo de corrupción de datos
- Base lista para agregar reglas de negocio y control de estados

-------------------------------------------------------

## Día 7 – Subformularios, eliminación de registros y estados

### Objetivo del día
Validar completamente el funcionamiento del subformulario de prendas, asegurando que las operaciones básicas (crear, editar y eliminar) impacten correctamente en la base de datos y reforzar el uso de estados controlados mediante ComboBox.

### Trabajo realizado
- Se confirmó que el subformulario `sub_prendas` guarda correctamente los datos en la tabla `prenda`.
- Se verificó la relación funcional entre `frm_orden` y `sub_prendas`.
- Se probó la persistencia de datos:
  - Crear prendas
  - Cerrar el formulario
  - Volver a abrir y confirmar que los registros siguen presentes
- Se validó la eliminación de prendas desde el subformulario:
  - Selección de registro
  - Eliminación con tecla Delete
  - Confirmación de borrado real en la tabla
- Se convirtió el campo de estado en un ComboBox para evitar texto libre y errores del operador.
- Se comprobó el flujo completo CRUD:
  - Crear
  - Leer
  - Editar
  - Eliminar

### Aprendizajes clave
- Access maneja automáticamente el guardado de datos al cambiar de campo o registro.
- Los subformularios permiten gestionar relaciones uno-a-muchos de forma directa y segura.
- El uso de ComboBox en campos de estado evita inconsistencias y errores humanos.
- La eliminación desde subformularios borra registros reales de la tabla, no solo visuales.

### Estado del proyecto
- Relación Orden–Prenda completamente funcional
- Subformulario operativo con CRUD completo
- Estados controlados y listos para estandarización
- Base sólida para avanzar a reglas de negocio y automatizaciones

-------------------------------------------------------

## Día 8 – Lógica de cantidad de prendas y diseño de flujo real
## Objetivo del día
Mejorar el flujo real de captura de prendas por orden, evitando duplicar datos manualmente y preparando el sistema para manejar múltiples prendas iguales dentro de una misma orden.

###Trabajo realizado
- Se replanteó el modelo de ingreso de prendas para una orden:
- Una orden puede contener múltiples prendas.
- No es necesario crear una orden por cada prenda.
- Se definió una estrategia de UX más eficiente:
- Capturar los datos de la prenda una sola vez (color, material, servicio, estado).
- Usar un contador de cantidad para representar prendas iguales.
- Confirmar el alta de prendas solo cuando el operador lo decida.
- Se creó un textbox de cantidad no ligado a la base de datos (unbound control):
- Funciona como contador visual.
- No altera directamente la tabla prenda.
- Se separó correctamente la lógica:
- UI (formularios) → manejo de cantidad y experiencia de usuario.
- Base de datos → inserción real de registros solo al confirmar.

### Se comenzó la implementación de botones:
- Botón para sumar cantidad (contador).
- Botón de confirmación para insertar múltiples registros (pendiente de finalizar).

## Estado del proyecto
- Modelo de órdenes y prendas correctamente definido.
- Flujo de negocio claro y alineado con una tintorería real.
- Lógica de cantidad de prendas diseñada (implementación parcial).
- Sistema listo para completar la acción de confirmación y cálculo automático de totales.
