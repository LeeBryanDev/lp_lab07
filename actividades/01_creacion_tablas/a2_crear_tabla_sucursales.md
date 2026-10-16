# 1.a.2 — Crear la tabla SUCURSALES

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para crear una segunda tabla SUCURSALES» → «Ejecuten el query y muestren que se ha creado la tabla SUCURSALES».

Se crea la segunda tabla, **SUCURSALES**, con dos campos:

| Campo | Tipo | Restricción | Significado |
|---|---|---|---|
| `NSUC` | `VARCHAR(4)` | `NOT NULL`, `PRIMARY KEY` | Código de la sucursal (4 caracteres) |
| `CIUDAD` | `VARCHAR(30)` | — | Ciudad donde está la sucursal |

Al igual que en CLIENTES, `PRIMARY KEY (NSUC)` identifica de forma única a cada
sucursal. Noten que el campo clave se llama `NSUC` (no `NSUCURS`): en la tabla
CUENTAS el campo se llamará `NSUCURS` y hará referencia justamente a `NSUC`.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 6)
-- ============================================
PRAGMA foreign_keys = ON;

CREATE TABLE SUCURSALES (
    NSUC VARCHAR(4) NOT NULL,
    CIUDAD VARCHAR(30),
    PRIMARY KEY (NSUC)
);

-- ============================================
-- Verificación: mostrar que se creó la tabla SUCURSALES
-- ============================================
PRAGMA table_info(SUCURSALES);
SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'SUCURSALES';
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`CREATE TABLE SUCURSALES ( NSUC VARCHAR(4) NOT NULL, CIUDAD VARCHAR(30), PRIMARY KEY (NS...`**

Ejecutado correctamente

---

**`PRAGMA table_info(SUCURSALES)`**

| cid | name | type | notnull | dflt_value | pk |
|---|---|---|---|---|---|
| 0 | NSUC | VARCHAR(4) | 1 | NULL | 1 |
| 1 | CIUDAD | VARCHAR(30) | 0 | NULL | 0 |

*2 fila(s)*

---

**`SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'SUCURSALES'`**

| name | sql |
|---|---|
| SUCURSALES | CREATE TABLE SUCURSALES (
    NSUC VARCHAR(4) NOT NULL,
    CIUDAD VARCHAR(30),
    PRIMARY KEY (NSUC)
) |

*1 fila(s)*

*Script: `a2_crear_tabla_sucursales.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
