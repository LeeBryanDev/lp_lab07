# Ejercicio 7 — 5 consultas intermedias (dos o más tablas, con condicionales)

**Guía (Sesión 07 — Lenguajes de Programación):** «Creen al menos 5 consultas intermedias donde intervengan al menos dos tablas como mínimo con condicionales».

## Qué se hizo

Se crearon **5 consultas** que unen **dos tablas** con `INNER JOIN ... ON` y
siempre incluyen condición (`WHERE` / `HAVING`):

1. **Estudiantes con su cuenta** — une `estudiante` y `usuario`
   (`WHERE u.rol = 'estudiante'`): relación 1:1, quién tiene cada cuenta.
2. **Secciones del periodo con su curso** — une `seccion` y `curso`
   (`WHERE s.periodo = '2026-1' AND c.creditos >= 4`): oferta de secciones de
   cursos pesados.
3. **Matrículas activas con el nombre del estudiante** — une `matricula` y
   `estudiante` (`WHERE m.estado = 'Activa'`): listado de estudiantes
   matriculados.
4. **Notas aprobadas con su matrícula** — une `nota` y `matricula`
   (`WHERE n.nota >= 10.5`) con `ORDER BY`: rendimiento por matrícula.
5. **Secciones dictadas por profesor** — une `profesor` y `seccion`
   (`WHERE s.periodo = '2026-1'`) agrupando con `GROUP BY` +
   `HAVING COUNT(...) >= 1`: carga docente por profesor.

En todas se califican las columnas con el alias de la tabla (`e.nombre`,
`s.turno`) para evitar ambigüedades, como indica la guía.

## Query(s) del script

```sql
-- ============================================================
-- Laboratorio 07 - Ejercicios: 5 consultas intermedias (>= 2 tablas + condicional)
-- ============================================================

-- 1) Estudiantes con su cuenta de usuario (relacion 1:1)
SELECT e.dni, e.apellido, e.nombre, u.username
FROM estudiante e
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
WHERE u.rol = 'estudiante';

-- 2) Secciones del periodo 2026-1 con cursos de 4 o mas creditos
SELECT s.nombre_seccion, s.turno, c.nombre AS curso, c.creditos
FROM seccion s
INNER JOIN curso c ON s.id_curso = c.id_curso
WHERE s.periodo = '2026-1' AND c.creditos >= 4;

-- 3) Matriculas activas con el nombre del estudiante
SELECT m.id_matricula, e.apellido, e.nombre, m.estado
FROM matricula m
INNER JOIN estudiante e ON m.id_estudiante = e.id_estudiante
WHERE m.estado = 'Activa';

-- 4) Notas aprobadas (>= 10.5) con su matricula
SELECT m.id_matricula, n.tipo_evaluacion, n.nota
FROM nota n
INNER JOIN matricula m ON n.id_matricula = m.id_matricula
WHERE n.nota >= 10.5
ORDER BY n.nota DESC;

-- 5) Cantidad de secciones por profesor en 2026-1
SELECT p.apellido, p.nombre, COUNT(s.id_seccion) AS secciones
FROM profesor p
INNER JOIN seccion s ON p.id_profesor = s.id_profesor
WHERE s.periodo = '2026-1'
GROUP BY p.id_profesor
HAVING COUNT(s.id_seccion) >= 1;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT e.dni, e.apellido, e.nombre, u.username FROM estudiante e INNER JOIN usuario u O...`**

| dni | apellido | nombre | username |
|---|---|---|---|
| 70100001 | Quispe | Ana | est01 |
| 70100002 | Mamani | Bruno | est02 |
| 70100003 | Condori | Carla | est03 |
| 70100004 | Paredes | Diego | est04 |
| 70100005 | Soto | Elena | est05 |
| 70100006 | Ramos | Fabio | est06 |
| 70100007 | Flores | Gabriela | est07 |
| 70100008 | Salas | Hugo | est08 |
| 70100009 | Torres | Irene | est09 |
| 70100010 | Medina | Jorge | est10 |

*10 fila(s)*

---

**`SELECT s.nombre_seccion, s.turno, c.nombre AS curso, c.creditos FROM seccion s INNER JO...`**

| nombre_seccion | turno | curso | creditos |
|---|---|---|---|
| A | Manana | Lenguajes de Programacion I | 4 |
| B | Tarde | Lenguajes de Programacion I | 4 |
| A | Manana | Lenguajes de Programacion II | 4 |
| A | Tarde | Bases de Datos | 4 |
| A | Manana | Estructuras Discretas | 4 |
| A | Tarde | Calculo I | 5 |
| A | Manana | Fisica I | 4 |
| A | Noche | Programacion Orientada a Objetos | 4 |
| A | Tarde | Algoritmos y Estructuras de Datos | 4 |

*9 fila(s)*

---

**`SELECT m.id_matricula, e.apellido, e.nombre, m.estado FROM matricula m INNER JOIN estud...`**

| id_matricula | apellido | nombre | estado |
|---|---|---|---|
| 1 | Quispe | Ana | Activa |
| 2 | Mamani | Bruno | Activa |
| 3 | Condori | Carla | Activa |
| 5 | Soto | Elena | Activa |
| 7 | Flores | Gabriela | Activa |
| 8 | Salas | Hugo | Activa |
| 9 | Medina | Jorge | Activa |
| 12 | Torres | Irene | Activa |

*8 fila(s)*

---

**`SELECT m.id_matricula, n.tipo_evaluacion, n.nota FROM nota n INNER JOIN matricula m ON ...`**

| id_matricula | tipo_evaluacion | nota |
|---|---|---|
| 5 | Parcial 1 | 18.0 |
| 1 | Parcial 2 | 16.0 |
| 4 | Practica | 15.0 |
| 1 | Parcial 1 | 14.0 |
| 9 | Parcial 2 | 13.5 |
| 3 | Final | 12.0 |
| 9 | Parcial 1 | 11.0 |
| 2 | Parcial 1 | 10.5 |

*8 fila(s)*

---

**`SELECT p.apellido, p.nombre, COUNT(s.id_seccion) AS secciones FROM profesor p INNER JOI...`**

| apellido | nombre | secciones |
|---|---|---|
| Chirinos | Luis | 2 |
| Rojas | Maria | 1 |
| Valdivia | Pedro | 1 |
| Nina | Rosa | 1 |
| Caceres | Jorge | 1 |
| Miranda | Lucia | 1 |
| Zapata | Carlos | 1 |
| Aliaga | Teresa | 1 |

*8 fila(s)*

*Script: `06_consultas_intermedias.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
