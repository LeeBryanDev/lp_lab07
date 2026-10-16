# 1.b.1 — Crear la tabla CUENTAS (con referencias)

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para crear una tercera tabla CUENTAS que utilice como referencia las claves primarias de CLIENTES y SUCURSALES» → «Ejecuten el query y muestren que se ha creado la tabla CUENTAS».

Se crea la tabla **CUENTAS**, que representa la relación entre un cliente y una
sucursal: una cuenta pertenece a un cliente y fue abierta en una sucursal.

| Campo | Tipo | Restricción | Significado |
|---|---|---|---|
| `COD` | `VARCHAR(4)` | `NOT NULL`, parte de la PK | Código de la cuenta |
| `DNI` | `VARCHAR(9)` | `NOT NULL`, parte de la PK, FK → `CLIENTES(DNI)` | Cliente dueño de la cuenta |
| `NSUCURS` | `VARCHAR(4)` | `NOT NULL`, parte de la PK, FK → `SUCURSALES(NSUC)` | Sucursal donde se abrió |
| `SALDO` | `INT DEFAULT 0` | — | Saldo de la cuenta (0 por defecto) |

Dos detalles importantes:

1. **Clave primaria compuesta** `PRIMARY KEY (COD, DNI, NSUCURS)`: la
   combinación de los tres campos identifica la cuenta.
2. **Claves foráneas (FOREIGN KEY)**: `DNI` referencia a `CLIENTES(DNI)` y
   `NSUCURS` referencia a `SUCURSALES(NSUC)`. Esto obliga a que toda cuenta
   tenga un cliente y una sucursal ya registrados (integridad referencial).

Ejemplo: `INSERT INTO CUENTAS ... VALUES ('0001', 12345678, '0001', 100)`
funciona solo si ya existe el cliente `12345678` y la sucursal `'0001'`.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 6)
-- ============================================
PRAGMA foreign_keys = ON;

CREATE TABLE CUENTAS (
    COD VARCHAR(4) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    NSUCURS VARCHAR(4) NOT NULL,
    SALDO INT DEFAULT 0,
    PRIMARY KEY (COD, DNI, NSUCURS),
    FOREIGN KEY (DNI) REFERENCES CLIENTES (DNI),
    FOREIGN KEY (NSUCURS) REFERENCES SUCURSALES (NSUC)
);

-- ============================================
-- Verificación: mostrar que se creó la tabla CUENTAS
-- ============================================
PRAGMA table_info(CUENTAS);
SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'CUENTAS';
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`CREATE TABLE CUENTAS ( COD VARCHAR(4) NOT NULL, DNI VARCHAR(9) NOT NULL, NSUCURS VARCHA...`**

Ejecutado correctamente

---

**`PRAGMA table_info(CUENTAS)`**

| cid | name | type | notnull | dflt_value | pk |
|---|---|---|---|---|---|
| 0 | COD | VARCHAR(4) | 1 | NULL | 1 |
| 1 | DNI | VARCHAR(9) | 1 | NULL | 2 |
| 2 | NSUCURS | VARCHAR(4) | 1 | NULL | 3 |
| 3 | SALDO | INT | 0 | 0 | 0 |

*4 fila(s)*

---

**`SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'CUENTAS'`**

| name | sql |
|---|---|
| CUENTAS | CREATE TABLE CUENTAS (
    COD VARCHAR(4) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    NSUCURS VARCHAR(4) NOT NULL,
    SALDO INT DEFAULT 0,
    PRIMARY KEY (COD, DNI, NSUCURS),
    FOREIGN KEY (DNI) REFERENCES CLIENTES (DNI),
    FOREIGN KEY (NSUCURS) REFERENCES SUCURSALES (NSUC)
) |

*1 fila(s)*

*Script: `b1_crear_tabla_cuentas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
