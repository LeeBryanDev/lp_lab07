# 4.b.1 — Eliminar datos de la tabla CUENTAS

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para modificar los datos de la tabla CUENTAS» (en realidad, para ELIMINAR) → «Ejecuten el query y muestren los resultados obtenidos luego de eliminar los datos y realizar una consulta de la tabla».

El comando `DELETE FROM` elimina filas de una tabla. El query de la guía elimina
la cuenta cuyo código es `'0001'`:

```sql
DELETE FROM CUENTAS WHERE COD = '0001';
SELECT * FROM CUENTAS;
```

- El `WHERE` es **crítico**: sin él, `DELETE FROM CUENTAS` borraría TODAS las
  cuentas de la tabla.
- Se elimina la cuenta `'0001'` (la de Mario, saldo 105 tras el paso anterior).
  No hay problemas de referencias porque ninguna otra tabla apunta a CUENTAS.
- El `SELECT * FROM CUENTAS` final comprueba que la fila desapareció: quedan
  5 cuentas.

**Nota:** la guía dice «modificar los datos» en el paso 1, pero por el contexto
(eliminación) y el query mostrado, la operación correcta es `DELETE`.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 9) + consulta de verificación
-- ============================================
PRAGMA foreign_keys = ON;

DELETE FROM CUENTAS WHERE COD = '0001';
SELECT * FROM CUENTAS;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`DELETE FROM CUENTAS WHERE COD = '0001'`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM CUENTAS`**

| COD | DNI | NSUCURS | SALDO |
|---|---|---|---|
| 0002 | 23456789 | 0002 | 2625 |
| 0003 | 34567890 | 0003 | 1890 |
| 0004 | 45678901 | 0001 | 735 |
| 0005 | 56789012 | 0004 | 3360 |
| 0006 | 67890123 | 0005 | 52.5 |

*5 fila(s)*

*Script: `b1_eliminar_cuenta.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
