# 2.c.1 — Insertar valores en la tabla CUENTAS (tabla con referencia)

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para insertar valores a la tabla CUENTAS» → «Ejecuten el query y muestren los datos ingresados en la tabla CUENTAS».

Se inserta la primera cuenta:

```sql
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0001', 12345678,'0001',100)
```

Este INSERT funciona **porque las referencias ya existen**:

- `DNI = 12345678` está registrado en CLIENTES (insertado en 2.a.1).
- `NSUCURS = '0001'` está registrado en SUCURSALES (insertado en 2.b.1).

Si alguna de las dos referencias no existiera y `PRAGMA foreign_keys` estuviera
activado, SQLite rechazaría el INSERT con un error de integridad referencial
(`FOREIGN KEY constraint failed`). Ese es justamente el objetivo de usar
`FOREIGN KEY`.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0001', 12345678,'0001',100);

-- ============================================
-- Verificación: mostrar los datos ingresados en CUENTAS
-- ============================================
SELECT * FROM CUENTAS;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0001', 12345678,'0001',100)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM CUENTAS`**

| COD | DNI | NSUCURS | SALDO |
|---|---|---|---|
| 0001 | 12345678 | 0001 | 100 |

*1 fila(s)*

*Script: `c1_insertar_cuentas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
