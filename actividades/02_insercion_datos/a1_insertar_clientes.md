# 2.a.1 — Insertar valores en la tabla CLIENTES

**Guía (Sesión 07 — Lenguajes de Programación):** «Escriban el siguiente query para insertar valores a la tabla CLIENTES» → «Ejecuten el query y muestren los datos ingresados en la tabla CLIENTES».

Se inserta el primer registro en CLIENTES:

```sql
INSERT INTO CLIENTES VALUES (12345678,'Mario','Perú');
```

Como el `INSERT` **no lista las columnas**, los valores se asignan en el orden en
que se definieron los campos: `DNI=12345678`, `NOMBRE='Mario'`, `PAIS='Perú'`.
Tras el paso 1.c la tabla CLIENTES tiene exactamente 3 columnas
(`DNI`, `NOMBRE`, `PAIS`), por eso la lista de valores tiene 3 elementos.

Consejo: listar las columnas (como en los INSERT de SUCURSALES y CUENTAS) evita
errores si luego se agrega o elimina un campo.

La verificación `SELECT * FROM CLIENTES` muestra el dato ingresado.

## Query(s) del script

```sql
-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CLIENTES VALUES (12345678,'Mario','Perú');

-- ============================================
-- Verificación: mostrar los datos ingresados en CLIENTES
-- ============================================
SELECT * FROM CLIENTES;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO CLIENTES VALUES (12345678,'Mario','Perú')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM CLIENTES`**

| DNI | NOMBRE | PAIS |
|---|---|---|
| 12345678 | Mario | Perú |

*1 fila(s)*

*Script: `a1_insertar_clientes.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
