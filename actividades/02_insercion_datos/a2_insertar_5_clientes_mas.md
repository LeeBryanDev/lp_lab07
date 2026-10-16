# 2.a.2 — Agregar 5 nuevos valores en la tabla CLIENTES

**Guía (Sesión 07 — Lenguajes de Programación):** «Modifique el query para agregar 5 nuevos valores en la tabla CLIENTES (Si desean ejecutar múltiples sentencias en un solo query deben utilizar ; (punto y coma) al final de cada sentencia)» → «Ejecuten el query y muestren los datos ingresados en la tabla CLIENTES».

Se modifica el query anterior para agregar **5 clientes más**. Siguiendo la
recomendación de la guía, se ejecutan múltiples sentencias en un solo query
usando `;` al final de cada una:

```sql
INSERT INTO CLIENTES VALUES (23456789,'Lucía','Perú');
INSERT INTO CLIENTES VALUES (34567890,'Carlos','Perú');
...
```

Otra forma válida habría sido agregar 5 tuplas a la misma sentencia:

```sql
INSERT INTO CLIENTES VALUES
  (23456789,'Lucía','Perú'), (34567890,'Carlos','Perú'), ...;
```

Al final CLIENTES queda con **6 registros** (Mario + los 5 nuevos) y
`SELECT * FROM CLIENTES` los muestra todos.

## Query(s) del script

```sql
-- ============================================
-- Query modificado de la guía (pág. 7): 5 nuevos valores
-- Múltiples sentencias separadas por punto y coma
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CLIENTES VALUES (23456789,'Lucía','Perú');
INSERT INTO CLIENTES VALUES (34567890,'Carlos','Perú');
INSERT INTO CLIENTES VALUES (45678901,'Rosa','Bolivia');
INSERT INTO CLIENTES VALUES (56789012,'Jorge','Perú');
INSERT INTO CLIENTES VALUES (67890123,'Elena','Chile');

-- ============================================
-- Verificación: mostrar los datos ingresados en CLIENTES
-- ============================================
SELECT * FROM CLIENTES;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO CLIENTES VALUES (23456789,'Lucía','Perú')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CLIENTES VALUES (34567890,'Carlos','Perú')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CLIENTES VALUES (45678901,'Rosa','Bolivia')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CLIENTES VALUES (56789012,'Jorge','Perú')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO CLIENTES VALUES (67890123,'Elena','Chile')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM CLIENTES`**

| DNI | NOMBRE | PAIS |
|---|---|---|
| 12345678 | Mario | Perú |
| 23456789 | Lucía | Perú |
| 34567890 | Carlos | Perú |
| 45678901 | Rosa | Bolivia |
| 56789012 | Jorge | Perú |
| 67890123 | Elena | Chile |

*6 fila(s)*

*Script: `a2_insertar_5_clientes_mas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
