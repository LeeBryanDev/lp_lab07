# 3.c.1 — Consulta de múltiples tablas (CLIENTES y CUENTAS)

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para mostrar datos de la tabla CLIENTES y CUENTAS» → «Ejecuten el query y muestren los resultados de la búsqueda de datos».

Para mostrar datos de dos tablas a la vez se las une (JOIN). La guía usa la
sintaxis clásica: las tablas se separan con `,` después de `FROM` y la condición
de unión se escribe en `WHERE`:

```sql
SELECT CLIENTES.DNI, NOMBRE, SALDO FROM CLIENTES, CUENTAS
WHERE CLIENTES.DNI = CUENTAS.DNI;
```

El `WHERE` indica que el `DNI` de CLIENTES debe ser igual al `DNI` de CUENTAS:
es la condición que relaciona cada cliente con sus cuentas. Por eso cada nombre
de columna va precedido de su tabla (`CLIENTES.DNI`) cuando existen en ambas
tablas y así evitar ambigüedades.

El resultado muestra, para cada cuenta, el cliente dueño y su saldo (6 filas).

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 8)
-- ============================================
SELECT CLIENTES.DNI, NOMBRE, SALDO FROM CLIENTES, CUENTAS WHERE CLIENTES.DNI = CUENTAS.DNI;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT CLIENTES.DNI, NOMBRE, SALDO FROM CLIENTES, CUENTAS WHERE CLIENTES.DNI = CUENTAS.DNI`**

| DNI | NOMBRE | SALDO |
|---|---|---|
| 12345678 | Mario | 100 |
| 23456789 | Lucía | 2500 |
| 34567890 | Carlos | 1800 |
| 45678901 | Rosa | 700 |
| 56789012 | Jorge | 3200 |
| 67890123 | Elena | 50 |

*6 fila(s)*

*Script: `c1_clientes_y_cuentas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
