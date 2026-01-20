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
