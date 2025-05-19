
# Informe Final – Prueba Analista de Datos

## ⚙️ Fase 2 – Análisis de Productividad

- Se analizaron registros diarios de captación por cargo.
- Se ponderó la productividad según la jornada:
  - 🟢 Tiempo completo: 100%
  - 🟡 Medio tiempo: 50%
  - 🔵 Fin de semana: 40%
- **Resultado**:
  - `EJECUTIVO COMERCIAL` (tiempo completo) fue el más eficiente con una productividad promedio diaria de **8.59**.
- 📌 **Recomendación**: Priorizar contrataciones en jornada completa para maximizar la captación.

## 📊 Fase 3 – Segmentación de Puntos de Venta

- Se aplicó un modelo de clustering `K-Means` con `k=3`.
- Se redujeron dimensiones con `PCA` para visualización.
- Se identificaron **3 segmentos distintos** de puntos de venta.
- 📌 **Recomendación**:
  - Analizar las características de cada cluster.
  - Priorizar talento comercial en los clusters con mayor potencial.

## 🧩 Integración de Resultados

- Asignar `Ejecutivos Comerciales Tiempo Completo` a puntos de alto volumen.
- Para puntos de menor demanda, usar `Medio Tiempo` o `Fines de Semana`.

## 🔜 Próximos Pasos

- Crear dashboards interactivos en Power BI o Tableau.
- Automatizar el análisis mensual.
- Agregar variables contextuales (competencia, ubicación, horario, etc.).
