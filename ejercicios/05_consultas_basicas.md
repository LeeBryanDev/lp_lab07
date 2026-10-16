# Ejercicio 6 — 5 consultas básicas (una sola tabla, con condicionales)

**Guía (Sesión 07 — Lenguajes de Programación):** «Creen al menos 5 consultas básicas con condicionales que utilicen al menos una sola tabla».

## Qué se hizo

Se crearon **5 consultas**, cada una sobre **una sola tabla** y todas con
condición en el `WHERE`:

1. **Cursos con carga alta** — `WHERE creditos >= 4`: lista los cursos de 4 o
   más créditos, útil para planificar la carga semestral (operador `>=`).
2. **Búsqueda de estudiantes por apellido** — `WHERE apellido LIKE 'C%'`:
   encuentro rápido de estudiantes por la inicial del apellido (operador
   `LIKE`).
3. **Cuentas de profesores** — `WHERE rol = 'profesor'`: lista los usuarios
   con rol docente (filtro por texto exacto).
4. **Secciones del turno mañana en el periodo 2026-1** —
   `WHERE turno = 'Manana' AND periodo = '2026-1'`: dos condiciones unidas con
   `AND`.
5. **Notas aprobadas** — `WHERE nota >= 10.5`, ordenadas de mayor a menor con
   `ORDER BY nota DESC` (escala UCSM: 10.5 aprueba).

Todas usan `SELECT` con lista de columnas y varias aprovechan `ORDER BY` para
presentar el resultado en un orden útil.

## Query(s) del script

```sql
-- ============================================================
-- Laboratorio 07 - Ejercicios: 5 consultas basicas (1 tabla + condicional)
-- ============================================================

-- 1) Cursos con 4 o mas creditos (carga alta)
SELECT id_curso, codigo, nombre, creditos
FROM curso
WHERE creditos >= 4
ORDER BY creditos DESC;

-- 2) Estudiantes cuyo apellido empieza con C
SELECT id_estudiante, apellido, nombre, correo
FROM estudiante
WHERE apellido LIKE 'C%';

-- 3) Cuentas de usuarios con rol profesor
SELECT id_usuario, username, rol
FROM usuario
WHERE rol = 'profesor';

-- 4) Secciones del turno manana en el periodo 2026-1
SELECT id_seccion, id_curso, nombre_seccion, turno
FROM seccion
WHERE turno = 'Manana' AND periodo = '2026-1';

-- 5) Notas aprobadas (>= 10.5), de mayor a menor
SELECT id_nota, id_matricula, tipo_evaluacion, nota
FROM nota
WHERE nota >= 10.5
ORDER BY nota DESC;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`SELECT id_curso, codigo, nombre, creditos FROM curso WHERE creditos >= 4 ORDER BY credi...`**

| id_curso | codigo | nombre | creditos |
|---|---|---|---|
| 5 | CAL1 | Calculo I | 5 |
| 1 | LP01 | Lenguajes de Programacion I | 4 |
| 2 | LP02 | Lenguajes de Programacion II | 4 |
| 3 | BD01 | Bases de Datos | 4 |
| 4 | ED01 | Estructuras Discretas | 4 |
| 6 | FIS1 | Fisica I | 4 |
| 7 | POO1 | Programacion Orientada a Objetos | 4 |
| 8 | ALG1 | Algoritmos y Estructuras de Datos | 4 |
| 10 | SIS1 | Sistemas Operativos | 4 |

*9 fila(s)*

---

**`SELECT id_estudiante, apellido, nombre, correo FROM estudiante WHERE apellido LIKE 'C%'`**

| id_estudiante | apellido | nombre | correo |
|---|---|---|---|
| 3 | Condori | Carla | est03@ucsm.edu.pe |

*1 fila(s)*

---

**`SELECT id_usuario, username, rol FROM usuario WHERE rol = 'profesor'`**

| id_usuario | username | rol |
|---|---|---|
| 11 | prof01 | profesor |
| 12 | prof02 | profesor |
| 13 | prof03 | profesor |
| 14 | prof04 | profesor |
| 15 | prof05 | profesor |
| 16 | prof06 | profesor |
| 17 | prof07 | profesor |
| 18 | prof08 | profesor |
| 19 | prof09 | profesor |
| 20 | prof10 | profesor |

*10 fila(s)*

---

**`SELECT id_seccion, id_curso, nombre_seccion, turno FROM seccion WHERE turno = 'Manana' ...`**

| id_seccion | id_curso | nombre_seccion | turno |
|---|---|---|---|
| 1 | 1 | A | Manana |
| 3 | 2 | A | Manana |
| 5 | 4 | A | Manana |
| 7 | 6 | A | Manana |

*4 fila(s)*

---

**`SELECT id_nota, id_matricula, tipo_evaluacion, nota FROM nota WHERE nota >= 10.5 ORDER ...`**

| id_nota | id_matricula | tipo_evaluacion | nota |
|---|---|---|---|
| 7 | 5 | Parcial 1 | 18.0 |
| 2 | 1 | Parcial 2 | 16.0 |
| 6 | 4 | Practica | 15.0 |
| 1 | 1 | Parcial 1 | 14.0 |
| 9 | 9 | Parcial 2 | 13.5 |
| 5 | 3 | Final | 12.0 |
| 8 | 9 | Parcial 1 | 11.0 |
| 3 | 2 | Parcial 1 | 10.5 |

*8 fila(s)*

*Script: `05_consultas_basicas.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
