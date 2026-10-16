# 4.a.1 — Modificar los datos de la tabla CUENTAS

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para modificar los datos de la tabla CUENTAS» → «Ejecuten el query y muestren los resultados obtenidos luego de modificar los datos y realizar una consulta de la tabla».

El comando `UPDATE` cambia valores de filas ya existentes. El query de la guía
aplica un **incremento del 5%** a todos los saldos:

```sql
UPDATE CUENTAS SET SALDO = SALDO * 1.05;
SELECT * FROM CUENTAS;
```

- `SET SALDO = SALDO * 1.05` reemplaza cada saldo por el saldo multiplicado por
  1.05 (por ejemplo `100 → 105`).
- Como **no tiene `WHERE`**, la modificación afecta a TODAS las filas de CUENTAS.
  Si solo se quisiera modificar una cuenta, habría que filtrar:
  `UPDATE CUENTAS SET SALDO = SALDO * 1.05 WHERE COD = '0001';`
- El segundo query (`SELECT * FROM CUENTAS`) es la consulta de verificación que
  pide la guía: muestra los saldos ya actualizados.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 8) + consulta de verificación
-- ============================================
PRAGMA foreign_keys = ON;

UPDATE CUENTAS SET SALDO = SALDO * 1.05;
SELECT * FROM CUENTAS;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`UPDATE CUENTAS SET SALDO = SALDO * 1.05`**

Ejecutado correctamente — *6 fila(s) afectada(s)*

---

**`SELECT * FROM CUENTAS`**

| COD | DNI | NSUCURS | SALDO |
|---|---|---|---|
| 0001 | 12345678 | 0001 | 105 |
| 0002 | 23456789 | 0002 | 2625 |
| 0003 | 34567890 | 0003 | 1890 |
| 0004 | 45678901 | 0001 | 735 |
| 0005 | 56789012 | 0004 | 3360 |
| 0006 | 67890123 | 0005 | 52.5 |

*6 fila(s)*

*Script: `a1_modificar_saldos_cuentas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
