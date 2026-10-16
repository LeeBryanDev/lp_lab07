# 1.c.2 — Eliminar un campo de la tabla CLIENTES

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para eliminar un campo a la tabla cliente» → «Ejecuten el query y muestren la nueva estructura de la tabla CLIENTES».

Se elimina la columna `DIR` de la tabla CLIENTES con `ALTER TABLE ... DROP`.
Después de este paso la tabla CLIENTES queda con las columnas
`DNI`, `NOMBRE` y `PAIS` (justamente 3 columnas, las que usa el INSERT de la
guía en la actividad 2.a).

**Nota técnica:** la forma estándar de SQL es `ALTER TABLE CLIENTES DROP COLUMN DIR`;
SQLite admite la variante corta de la guía (`DROP DIR`) a partir de la versión
3.35. En versiones anteriores de SQLite no se puede eliminar una columna con
`ALTER TABLE` y hay que reconstruir la tabla (crear una nueva sin la columna,
copiar los datos con `INSERT INTO ... SELECT` y renombrar).

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

ALTER TABLE CLIENTES DROP DIR;

-- ============================================
-- Verificación: nueva estructura de la tabla CLIENTES
-- ============================================
PRAGMA table_info(CLIENTES);
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`ALTER TABLE CLIENTES DROP DIR`**

Ejecutado correctamente

---

**`PRAGMA table_info(CLIENTES)`**

| cid | name | type | notnull | dflt_value | pk |
|---|---|---|---|---|---|
| 0 | DNI | VARCHAR(9) | 1 | NULL | 1 |
| 1 | NOMBRE | VARCHAR(20) | 0 | NULL | 0 |
| 2 | PAIS | VARCHAR(10) | 0 | NULL | 0 |

*3 fila(s)*

*Script: `c2_eliminar_campo_clientes.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
