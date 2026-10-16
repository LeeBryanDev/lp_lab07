# Ejercicio 10 — 5 eliminaciones de datos con filtro (respetando las referencias)

**Guía (Sesión 07 — Lenguajes de Programación):** «Realicen al menos 5 eliminaciones de datos con filtros definidos por ustedes y considerando las referencias establecidas en las tablas».

## Qué se hizo

Se realizaron **5 eliminaciones** con `DELETE ... WHERE`. El **orden importa**:
una fila no se puede eliminar mientras otra tabla la referencie (integridad
referencial con `PRAGMA foreign_keys = ON`).

| # | Eliminación | Filtro | Filas borradas | Por qué este orden |
|---|---|---|---|---|
| 1 | Notas de práctica reprobadas | `tipo_evaluacion = 'Practica' AND nota < 10` | 2 | Libera las matrículas retiradas de sus últimas notas |
| 2 | Matrículas retiradas | `estado = 'Retirada'` | 3 | Ya no tienen notas que las referencien |
| 3 | Notas del estudiante 10 (baja) | `id_matricula IN (… WHERE id_estudiante = 10)` | 2 | Antes de borrar sus matrículas |
| 4 | Matrículas del estudiante 10 | `id_estudiante = 10` | 1 | Antes de borrar al estudiante |
| 5 | Estudiante 10 | `id_estudiante = 10` | 1 | Baja definitiva del estudiante |

Ejemplos del efecto de las referencias:

- Si se intentara `DELETE FROM estudiante WHERE id_estudiante = 10` sin antes
  borrar sus matrículas, SQLite responde `FOREIGN KEY constraint failed`.
- Si se intentara `DELETE FROM matricula WHERE id_matricula = 1` con sus notas
  todavía registradas, ocurre lo mismo: primero las `nota`, luego la
  `matricula`.
- La cuenta `usuario` del estudiante 10 no se borra porque ninguna tabla la
  referencia a ella (la FK vive en `estudiante`); en un sistema real se daría
  de baja la cuenta en un paso aparte.

Después de cada eliminación se muestra una consulta de verificación con el
estado real de la tabla.

## Query(s) del script

```sql
-- ============================================================
-- Laboratorio 07 - Ejercicios: 5 eliminaciones con filtro
-- El orden respeta las referencias entre tablas
-- ============================================================
PRAGMA foreign_keys = ON;

-- 1) Borrar las notas de practica reprobadas
DELETE FROM nota WHERE tipo_evaluacion = 'Practica' AND nota < 10;
SELECT * FROM nota;

-- 2) Borrar las matriculas retiradas (ya no tienen notas)
DELETE FROM matricula WHERE estado = 'Retirada';
SELECT * FROM matricula;

-- 3) Baja del estudiante 10: primero sus notas
DELETE FROM nota WHERE id_matricula IN
    (SELECT id_matricula FROM matricula WHERE id_estudiante = 10);
SELECT * FROM nota;

-- 4) Luego sus matriculas
DELETE FROM matricula WHERE id_estudiante = 10;
SELECT * FROM matricula;

-- 5) Finalmente el estudiante
DELETE FROM estudiante WHERE id_estudiante = 10;
SELECT * FROM estudiante;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`DELETE FROM nota WHERE tipo_evaluacion = 'Practica' AND nota < 10`**

Ejecutado correctamente — *2 fila(s) afectada(s)*

---

**`SELECT * FROM nota`**

| id_nota | id_matricula | tipo_evaluacion | nota | fecha_registro |
|---|---|---|---|---|
| 1 | 1 | Parcial 1 | 14.0 | 2026-04-05 |
| 2 | 1 | Parcial 2 | 16.0 | 2026-05-10 |
| 3 | 2 | Parcial 1 | 10.5 | 2026-04-05 |
| 4 | 3 | Parcial 1 | 11.5 | 2026-04-06 |
| 5 | 3 | Final | 12.0 | 2026-06-01 |
| 6 | 4 | Practica | 15.0 | 2026-04-20 |
| 7 | 5 | Parcial 1 | 18.0 | 2026-04-07 |
| 8 | 9 | Parcial 1 | 11.0 | 2026-04-08 |
| 9 | 9 | Parcial 2 | 13.5 | 2026-05-12 |
| 12 | 6 | Final | 9.5 | 2026-06-02 |

*10 fila(s)*

---

**`DELETE FROM matricula WHERE estado = 'Retirada'`**

Ejecutado correctamente — *3 fila(s) afectada(s)*

---

**`SELECT * FROM matricula`**

| id_matricula | id_estudiante | id_seccion | estado |
|---|---|---|---|
| 1 | 1 | 1 | Activa |
| 2 | 2 | 1 | Activa |
| 3 | 3 | 2 | Activa |
| 4 | 4 | 3 | Culminada |
| 5 | 5 | 4 | Activa |
| 6 | 6 | 5 | Culminada |
| 7 | 7 | 6 | Activa |
| 9 | 10 | 9 | Activa |
| 12 | 9 | 8 | Activa |

*9 fila(s)*

---

**`DELETE FROM nota WHERE id_matricula IN (SELECT id_matricula FROM matricula WHERE id_est...`**

Ejecutado correctamente — *2 fila(s) afectada(s)*

---

**`SELECT * FROM nota`**

| id_nota | id_matricula | tipo_evaluacion | nota | fecha_registro |
|---|---|---|---|---|
| 1 | 1 | Parcial 1 | 14.0 | 2026-04-05 |
| 2 | 1 | Parcial 2 | 16.0 | 2026-05-10 |
| 3 | 2 | Parcial 1 | 10.5 | 2026-04-05 |
| 4 | 3 | Parcial 1 | 11.5 | 2026-04-06 |
| 5 | 3 | Final | 12.0 | 2026-06-01 |
| 6 | 4 | Practica | 15.0 | 2026-04-20 |
| 7 | 5 | Parcial 1 | 18.0 | 2026-04-07 |
| 12 | 6 | Final | 9.5 | 2026-06-02 |

*8 fila(s)*

---

**`DELETE FROM matricula WHERE id_estudiante = 10`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM matricula`**

| id_matricula | id_estudiante | id_seccion | estado |
|---|---|---|---|
| 1 | 1 | 1 | Activa |
| 2 | 2 | 1 | Activa |
| 3 | 3 | 2 | Activa |
| 4 | 4 | 3 | Culminada |
| 5 | 5 | 4 | Activa |
| 6 | 6 | 5 | Culminada |
| 7 | 7 | 6 | Activa |
| 12 | 9 | 8 | Activa |

*8 fila(s)*

---

**`DELETE FROM estudiante WHERE id_estudiante = 10`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM estudiante`**

| id_estudiante | id_usuario | dni | nombre | apellido | correo | telefono |
|---|---|---|---|---|---|---|
| 1 | 1 | 70100001 | Ana | Quispe | est01@ucsm.edu.pe | 987111001 |
| 2 | 2 | 70100002 | Bruno | Mamani | est02@ucsm.edu.pe | 987222002 |
| 3 | 3 | 70100003 | Carla | Condori | est03@ucsm.edu.pe | 987333003 |
| 4 | 4 | 70100004 | Diego | Paredes | est04@ucsm.edu.pe | 987444004 |
| 5 | 5 | 70100005 | Elena | Soto | est05@ucsm.edu.pe | 987000111 |
| 6 | 6 | 70100006 | Fabio | Ramos | est06@ucsm.edu.pe | 987666006 |
| 7 | 7 | 70100007 | Gabriela | Flores | est07@ucsm.edu.pe | 987777007 |
| 8 | 8 | 70100008 | Hugo | Salas | est08@ucsm.edu.pe | 987888008 |
| 9 | 9 | 70100009 | Irene | Torres | est09@ucsm.edu.pe | 987999009 |

*9 fila(s)*

*Script: `09_eliminaciones.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
