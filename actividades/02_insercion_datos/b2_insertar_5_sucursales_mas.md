# 2.b.2 — Agregar 5 nuevos valores en la tabla SUCURSALES

**Guía (Sesión 07 — Lenguajes de Programación):** «Modifique el query para agregar 5 nuevos valores en la tabla SUCURSALES» → «Ejecuten el query y muestren los datos ingresados en la tabla SUCURSALES».

Se modifica el query anterior para agregar **5 sucursales más**, manteniendo la
lista de columnas `(NSUC, CIUDAD)` y usando `;` para ejecutar varias sentencias
en un solo query. Los códigos `'0002'` a `'0006'` son nuevos (el `PRIMARY KEY`
no admite repetidos).

Al final SUCURSALES queda con **6 registros**. Estas sucursales se usarán
después como referencia (`NSUCURS`) al insertar cuentas.

## Query(s) del script

```sql
-- ============================================
-- Query modificado de la guía (pág. 7): 5 nuevos valores
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0002', 'MOLLENDO');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0003', 'LIMA');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0004', 'TACNA');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0005', 'CUSCO');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0006', 'AREQUIPA');

-- ============================================
-- Verificación: mostrar los datos ingresados en SUCURSALES
-- ============================================
SELECT * FROM SUCURSALES;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0002', 'MOLLENDO')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0003', 'LIMA')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0004', 'TACNA')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0005', 'CUSCO')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0006', 'AREQUIPA')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM SUCURSALES`**

| NSUC | CIUDAD |
|---|---|
| 0001 | AREQUIPA |
| 0002 | MOLLENDO |
| 0003 | LIMA |
| 0004 | TACNA |
| 0005 | CUSCO |
| 0006 | AREQUIPA |

*6 fila(s)*

*Script: `b2_insertar_5_sucursales_mas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
