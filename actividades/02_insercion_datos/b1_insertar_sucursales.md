# 2.b.1 — Insertar valores en la tabla SUCURSALES

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para insertar valores a la tabla SUCURSALES» → «Ejecuten el query y muestren los datos ingresados en la tabla SUCURSALES».

Se inserta la primera sucursal **indicando las columnas**:

```sql
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0001', 'AREQUIPA')
```

Al escribir la lista de columnas `(NSUC, CIUDAD)` solo hace falta dar esos dos
valores, en ese orden. Es la forma recomendada porque el query no depende del
orden físico de las columnas de la tabla.

La verificación `SELECT * FROM SUCURSALES` muestra el dato ingresado.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0001', 'AREQUIPA');

-- ============================================
-- Verificación: mostrar los datos ingresados en SUCURSALES
-- ============================================
SELECT * FROM SUCURSALES;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0001', 'AREQUIPA')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM SUCURSALES`**

| NSUC | CIUDAD |
|---|---|
| 0001 | AREQUIPA |

*1 fila(s)*

*Script: `b1_insertar_sucursales.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
