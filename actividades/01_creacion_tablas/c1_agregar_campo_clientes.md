# 1.c.1 — Agregar un campo a la tabla CLIENTES

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para agregar un campo a la tabla CLIENTES» → «Ejecuten el query y muestren la nueva estructura de la tabla CLIENTES».

Se modifica la estructura de una tabla ya creada con `ALTER TABLE ... ADD`.
El nuevo campo `PAIS` (`VARCHAR(10)`) queda al final de la tabla y, como no se
indica restricción, admite valores nulos.

Ejemplo de uso posterior: `INSERT INTO CLIENTES VALUES (12345678,'Mario','Perú')`
— el tercer valor corresponde justamente al nuevo campo `PAIS` (la columna `DIR`
ya no existirá en el paso siguiente).

La verificación con `PRAGMA table_info(CLIENTES)` muestra la nueva estructura,
como pide la guía.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

ALTER TABLE CLIENTES ADD PAIS VARCHAR(10);

-- ============================================
-- Verificación: nueva estructura de la tabla CLIENTES
-- ============================================
PRAGMA table_info(CLIENTES);
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`ALTER TABLE CLIENTES ADD PAIS VARCHAR(10)`**

Ejecutado correctamente

---

**`PRAGMA table_info(CLIENTES)`**

| cid | name | type | notnull | dflt_value | pk |
|---|---|---|---|---|---|
| 0 | DNI | VARCHAR(9) | 1 | NULL | 1 |
| 1 | NOMBRE | VARCHAR(20) | 0 | NULL | 0 |
| 2 | DIR | VARCHAR(30) | 0 | NULL | 0 |
| 3 | PAIS | VARCHAR(10) | 0 | NULL | 0 |

*4 fila(s)*

*Script: `c1_agregar_campo_clientes.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
