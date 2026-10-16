# 3.a.1 — Consulta de datos de una tabla (SUCURSALES)

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para mostrar todos los datos de la tabla SUCURSALES» → «Ejecuten el query y muestren los resultados de la búsqueda de datos».

El comando `SELECT` sirve para consultar (leer) datos sin modificarlos. El
asterisco `*` significa «todas las columnas»:

```sql
SELECT * FROM SUCURSALES
```

Esta consulta devuelve las 2 columnas (`NSUC`, `CIUDAD`) y las 6 filas de la
tabla. Noten que **no se escriben los datos de salida**: la base de datos los
calcula y devuelve cada vez que se ejecuta el query.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 8)
-- ============================================
SELECT * FROM SUCURSALES;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT * FROM SUCURSALES`**

| NSUC | CIUDAD |
|---|---|
| 0001 | AREQUIPA |
| 0002 | MOLLENDO |
| 0003 | LIMA |
| 0004 | TACNA |
| 0005 | CUSCO |
| 0006 | AREQUIPA |

*6 fila(s)*

*Script: `a1_todos_datos_sucursales.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
