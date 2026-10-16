# Ejercicio 8 — 4 consultas avanzadas (tres o más tablas, con condicionales)

**Guía (Sesión 07 — Lenguajes de Programación):** «Creen al menos 4 avanzadas consultas donde intervengan al menos tres tablas como mínimo con condicionales».

## Qué se hizo

Se crearon **4 consultas avanzadas**, cada una uniendo **tres o más tablas** y
con condiciones (incluidas agregaciones con `HAVING`):

1. **Boleta de notas de un estudiante** — une `nota`, `matricula`, `estudiante`,
   `seccion` y `curso` (`WHERE e.dni = '70100001'`): reporte que recibe el
   estudiante con todas sus notas y el curso de cada una.
2. **Promedio de notas por curso** — une las mismas tablas
   (`WHERE s.periodo = '2026-1'`), promedia con `AVG` y filtra con
   `HAVING AVG(n.nota) >= 10.5`: qué cursos van aprobados en promedio.
3. **Estudiantes activos en cursos de 4+ créditos con su profesor** — une 5
   tablas (`matricula`, `estudiante`, `seccion`, `curso`, `profesor`;
   `WHERE c.creditos >= 4 AND m.estado = 'Activa'`): quiénes llevan carga
   pesada y quién los evalúa.
4. **Resumen de evaluaciones de la sección A de LP01** — une `nota`,
   `matricula`, `seccion` y `curso`
   (`WHERE s.nombre_seccion = 'A' AND c.codigo = 'LP01'`) agrupando por
   `tipo_evaluacion`: promedio por tipo de evaluación de esa sección.

La utilidad de cada consulta (según pide la guía) está descrita arriba: son
reportes que un sistema de notas usaría en su operación diaria.

## Query(s) del script

```sql
-- ============================================================
-- Laboratorio 07 - Ejercicios: 4 consultas avanzadas (>= 3 tablas + condicional)
-- ============================================================

-- 1) Boleta de notas del estudiante con DNI 70100001
SELECT e.apellido, e.nombre, c.nombre AS curso, s.periodo,
       n.tipo_evaluacion, n.nota
FROM nota n
INNER JOIN matricula m ON n.id_matricula = m.id_matricula
INNER JOIN estudiante e ON m.id_estudiante = e.id_estudiante
INNER JOIN seccion s ON m.id_seccion = s.id_seccion
INNER JOIN curso c ON s.id_curso = c.id_curso
WHERE e.dni = '70100001'
ORDER BY c.nombre, n.tipo_evaluacion;

-- 2) Promedio de notas por curso en 2026-1 (solo cursos con promedio aprobado)
SELECT c.nombre AS curso, ROUND(AVG(n.nota), 2) AS promedio, COUNT(n.id_nota) AS evaluaciones
FROM nota n
INNER JOIN matricula m ON n.id_matricula = m.id_matricula
INNER JOIN seccion s ON m.id_seccion = s.id_seccion
INNER JOIN curso c ON s.id_curso = c.id_curso
WHERE s.periodo = '2026-1'
GROUP BY c.id_curso
HAVING AVG(n.nota) >= 10.5;

-- 3) Estudiantes activos en cursos de 4 o mas creditos, con su profesor
SELECT e.apellido, e.nombre, c.nombre AS curso, p.apellido AS profesor
FROM matricula m
INNER JOIN estudiante e ON m.id_estudiante = e.id_estudiante
INNER JOIN seccion s ON m.id_seccion = s.id_seccion
INNER JOIN curso c ON s.id_curso = c.id_curso
INNER JOIN profesor p ON s.id_profesor = p.id_profesor
WHERE c.creditos >= 4 AND m.estado = 'Activa';

-- 4) Promedio por tipo de evaluacion en la seccion A de LP01
SELECT s.nombre_seccion, c.codigo, n.tipo_evaluacion,
       ROUND(AVG(n.nota), 2) AS promedio
FROM nota n
INNER JOIN matricula m ON n.id_matricula = m.id_matricula
INNER JOIN seccion s ON m.id_seccion = s.id_seccion
INNER JOIN curso c ON s.id_curso = c.id_curso
WHERE s.nombre_seccion = 'A' AND c.codigo = 'LP01'
GROUP BY n.tipo_evaluacion;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT e.apellido, e.nombre, c.nombre AS curso, s.periodo, n.tipo_evaluacion, n.nota FR...`**

| apellido | nombre | curso | periodo | tipo_evaluacion | nota |
|---|---|---|---|---|---|
| Quispe | Ana | Lenguajes de Programacion I | 2026-1 | Parcial 1 | 14.0 |
| Quispe | Ana | Lenguajes de Programacion I | 2026-1 | Parcial 2 | 16.0 |

*2 fila(s)*

---

**`SELECT c.nombre AS curso, ROUND(AVG(n.nota), 2) AS promedio, COUNT(n.id_nota) AS evalua...`**

| curso | promedio | evaluaciones |
|---|---|---|
| Lenguajes de Programacion I | 12.2 | 5 |
| Lenguajes de Programacion II | 15.0 | 1 |
| Bases de Datos | 18.0 | 1 |
| Algoritmos y Estructuras de Datos | 12.25 | 2 |

*4 fila(s)*

---

**`SELECT e.apellido, e.nombre, c.nombre AS curso, p.apellido AS profesor FROM matricula m...`**

| apellido | nombre | curso | profesor |
|---|---|---|---|
| Quispe | Ana | Lenguajes de Programacion I | Chirinos |
| Mamani | Bruno | Lenguajes de Programacion I | Chirinos |
| Condori | Carla | Lenguajes de Programacion I | Rojas |
| Soto | Elena | Bases de Datos | Valdivia |
| Flores | Gabriela | Calculo I | Caceres |
| Salas | Hugo | Fisica I | Miranda |
| Medina | Jorge | Algoritmos y Estructuras de Datos | Aliaga |
| Torres | Irene | Programacion Orientada a Objetos | Zapata |

*8 fila(s)*

---

**`SELECT s.nombre_seccion, c.codigo, n.tipo_evaluacion, ROUND(AVG(n.nota), 2) AS promedio...`**

| nombre_seccion | codigo | tipo_evaluacion | promedio |
|---|---|---|---|
| A | LP01 | Parcial 1 | 12.25 |
| A | LP01 | Parcial 2 | 16.0 |

*2 fila(s)*

*Script: `07_consultas_avanzadas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
