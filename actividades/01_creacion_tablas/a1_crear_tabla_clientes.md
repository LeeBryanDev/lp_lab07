# 1.a.1 — Crear la tabla CLIENTES

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para crear una tabla CLIENTES» → «Ejecuten el query y muestren que se ha creado la tabla CLIENTES».

Se crea la primera tabla de la base de datos, **CLIENTES**, con tres campos:

| Campo | Tipo | Restricción | Significado |
|---|---|---|---|
| `DNI` | `VARCHAR(9)` | `NOT NULL`, `PRIMARY KEY` | Identifica al cliente (hasta 9 caracteres) |
| `NOMBRE` | `VARCHAR(20)` | — | Nombre del cliente |
| `DIR` | `VARCHAR(30)` | — | Dirección del cliente |

La `PRIMARY KEY (DNI)` garantiza que no existan dos clientes con el mismo DNI y,
al mismo tiempo, impide valores nulos en esa columna.

**Decisión:** se usa exactamente la sintaxis de la guía (`VARCHAR(n)`). En SQLite
los tipos son solo una *afinidad*: `VARCHAR(9)` se comporta como texto, `INT`
como entero y `SALDO INT DEFAULT 0` acepta el valor por defecto 0.

Para «muestren que se ha creado la tabla» se agrega al final del script una
consulta de verificación (`PRAGMA table_info`) que muestra la estructura creada.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 6)
-- ============================================
PRAGMA foreign_keys = ON;  -- necesario en SQLite para respetar las FOREIGN KEY

CREATE TABLE CLIENTES (
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(20),
    DIR VARCHAR(30),
    PRIMARY KEY (DNI)
);

-- ============================================
-- Verificación: mostrar que se creó la tabla CLIENTES
-- ============================================
PRAGMA table_info(CLIENTES);
SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'CLIENTES';
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`CREATE TABLE CLIENTES ( DNI VARCHAR(9) NOT NULL, NOMBRE VARCHAR(20), DIR VARCHAR(30), P...`**

Ejecutado correctamente

---

**`PRAGMA table_info(CLIENTES)`**

| cid | name | type | notnull | dflt_value | pk |
|---|---|---|---|---|---|
| 0 | DNI | VARCHAR(9) | 1 | NULL | 1 |
| 1 | NOMBRE | VARCHAR(20) | 0 | NULL | 0 |
| 2 | DIR | VARCHAR(30) | 0 | NULL | 0 |

*3 fila(s)*

---

**`SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'CLIENTES'`**

| name | sql |
|---|---|
| CLIENTES | CREATE TABLE CLIENTES (
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(20),
    DIR VARCHAR(30),
    PRIMARY KEY (DNI)
) |

*1 fila(s)*

*Script: `a1_crear_tabla_clientes.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
