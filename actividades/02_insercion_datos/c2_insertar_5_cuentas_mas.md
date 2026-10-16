# 2.c.2 — Agregar 5 nuevos valores en la tabla CUENTAS

**Guía (Sesión 07 — Lenguajes de Programación):** «Modifique el query para agregar 5 nuevos valores en la tabla CUENTAS; tomen en cuenta que tanto el campo DNI como NSUCURS debe corresponder a un campo ya ingresando previamente» → «Ejecuten el query y muestren los datos ingresados en la tabla CUENTAS».

Se agregan **5 cuentas más** verificando que cada `DNI` exista en CLIENTES y cada
`NSUCURS` exista en SUCURSALES:

| COD | DNI (existe en CLIENTES) | NSUCURS (existe en SUCURSALES) | SALDO |
|---|---|---|---|
| 0002 | 23456789 (Lucía) | 0002 (MOLLENDO) | 2500 |
| 0003 | 34567890 (Carlos) | 0003 (LIMA) | 1800 |
| 0004 | 45678901 (Rosa) | 0001 (AREQUIPA) | 700 |
| 0005 | 56789012 (Jorge) | 0004 (TACNA) | 3200 |
| 0006 | 67890123 (Elena) | 0005 (CUSCO) | 50 |

Si por ejemplo escribiéramos `NSUCURS='0099'`, el INSERT fallaría porque esa
sucursal no existe. Al final CUENTAS queda con **6 registros**.

## Query(s) del script

```sql
-- ============================================
-- Query modificado de la guía (pág. 7): 5 nuevos valores
-- DNI y NSUCURS corresponden a registros ya ingresados
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0002', 23456789,'0002',2500);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0003', 34567890,'0003',1800);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0004', 45678901,'0001',700);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0005', 56789012,'0004',3200);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0006', 67890123,'0005',50);

-- ============================================
-- Verificación: mostrar los datos ingresados en CUENTAS
-- ============================================
SELECT * FROM CUENTAS;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0002', 23456789,'0002',2500)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0003', 34567890,'0003',1800)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0004', 45678901,'0001',700)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0005', 56789012,'0004',3200)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0006', 67890123,'0005',50)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM CUENTAS`**

| COD | DNI | NSUCURS | SALDO |
|---|---|---|---|
| 0001 | 12345678 | 0001 | 100 |
| 0002 | 23456789 | 0002 | 2500 |
| 0003 | 34567890 | 0003 | 1800 |
| 0004 | 45678901 | 0001 | 700 |
| 0005 | 56789012 | 0004 | 3200 |
| 0006 | 67890123 | 0005 | 50 |

*6 fila(s)*

*Script: `c2_insertar_5_cuentas_mas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
