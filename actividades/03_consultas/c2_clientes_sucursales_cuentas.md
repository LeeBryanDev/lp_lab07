# 3.c.2 — Consulta con CLIENTES, SUCURSALES y CUENTAS (query modificado)

**Guía (Sesión 07 — Lenguajes de Programación):** «Modifique el query para realizar una consulta que incluya las tablas CLIENTES, SUCURSALES y CUENTAS» → «Ejecuten el query y muestren los resultados de la búsqueda de datos».

Se modifica el query anterior para incluir la tercera tabla. La guía no muestra
el query modificado, así que se escribió usando el `INNER JOIN` visto en el
marco teórico:

```sql
SELECT CLIENTES.DNI, CLIENTES.NOMBRE, SUCURSALES.CIUDAD, CUENTAS.COD, CUENTAS.SALDO
FROM CUENTAS
INNER JOIN CLIENTES ON CLIENTES.DNI = CUENTAS.DNI
INNER JOIN SUCURSALES ON SUCURSALES.NSUC = CUENTAS.NSUCURS;
```

- `INNER JOIN ... ON` une CUENTAS con CLIENTES por el `DNI` y con SUCURSALES por
  `NSUCURS = NSUC`.
- Cada columna se escribe con su tabla para evitar confusiones.
- El resultado es un reporte completo: cliente, ciudad de la sucursal, código de
  cuenta y saldo (6 filas).

Es equivalente a la sintaxis clásica
`FROM CLIENTES, CUENTAS, SUCURSALES WHERE CLIENTES.DNI=CUENTAS.DNI AND CUENTAS.NSUCURS=SUCURSALES.NSUC`.

## Query(s) del script

```sql
-- ============================================
-- Query modificado de la guía (pág. 8): ahora con las 3 tablas
-- ============================================
SELECT CLIENTES.DNI, CLIENTES.NOMBRE, SUCURSALES.CIUDAD, CUENTAS.COD, CUENTAS.SALDO
FROM CUENTAS
INNER JOIN CLIENTES ON CLIENTES.DNI = CUENTAS.DNI
INNER JOIN SUCURSALES ON SUCURSALES.NSUC = CUENTAS.NSUCURS;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT CLIENTES.DNI, CLIENTES.NOMBRE, SUCURSALES.CIUDAD, CUENTAS.COD, CUENTAS.SALDO FRO...`**

| DNI | NOMBRE | CIUDAD | COD | SALDO |
|---|---|---|---|---|
| 12345678 | Mario | AREQUIPA | 0001 | 100 |
| 23456789 | Lucía | MOLLENDO | 0002 | 2500 |
| 34567890 | Carlos | LIMA | 0003 | 1800 |
| 45678901 | Rosa | AREQUIPA | 0004 | 700 |
| 56789012 | Jorge | TACNA | 0005 | 3200 |
| 67890123 | Elena | CUSCO | 0006 | 50 |

*6 fila(s)*

*Script: `c2_clientes_sucursales_cuentas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
