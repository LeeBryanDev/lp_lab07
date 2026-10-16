# 3.b.1 — Consulta seleccionando columnas (CLIENTES)

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para mostrar algunas columnas de la tabla CLIENTES» → «Ejecuten el query y muestren los resultados de la búsqueda de datos».

Cuando solo interesan algunos campos, se escriben sus nombres después de
`SELECT` en lugar de usar `*`:

```sql
SELECT DNI, NOMBRE FROM CLIENTES
```

El resultado muestra únicamente las columnas `DNI` y `NOMBRE` (no `PAIS`) de las
6 filas de CLIENTES. Es útil cuando la tabla tiene muchas columnas o cuando se
quiere un reporte más corto.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 8)
-- ============================================
SELECT DNI, NOMBRE FROM CLIENTES;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT DNI, NOMBRE FROM CLIENTES`**

| DNI | NOMBRE |
|---|---|
| 12345678 | Mario |
| 23456789 | Lucía |
| 34567890 | Carlos |
| 45678901 | Rosa |
| 56789012 | Jorge |
| 67890123 | Elena |

*6 fila(s)*

*Script: `b1_columnas_clientes.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
