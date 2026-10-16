# Ejercicio 1 — Elección del caso de estudio

**Guía (Sesión 07 — Lenguajes de Programación):** «En un foro se les presentará un conjunto de casos de estudio; deberán escoger uno y anotar el tema escogido, no se puede repetir temas y en base al mismo deberán crear una base de datos con al menos 5 tablas, consideren el uso de diferentes tipos de relaciones entre las tablas como uno a uno, uno a muchos y muchos a muchos».

## Qué se hizo

Se eligió el caso de estudio **«Sistema de gestión de notas»**: una plataforma
académica donde los usuarios (estudiantes y profesores) acceden con cuenta, los
profesores dictan secciones de cursos, los estudiantes se matriculan en ellas y
cada matrícula acumula las notas de las evaluaciones.

**Tema:** Base de datos de un sistema de notas (usuarios, estudiantes,
profesores, cursos, secciones, matrículas y notas).

## Por qué este caso

- Refleja un sistema real de la universidad (control de notas por sección).
- Usa **los tres tipos de relaciones** que pide la guía:
  - **Uno a uno (1:1):** cada `ESTUDIANTE` tiene una sola cuenta `USUARIO` y
    cada `PROFESOR` tiene una sola cuenta `USUARIO` (las FK vienen con
    `UNIQUE`).
  - **Uno a muchos (1:N):** un `CURSO` tiene varias `SECCION`es, un
    `PROFESOR` dicta varias secciones, una `SECCION` tiene varias
    `MATRICULA`s, un `ESTUDIANTE` tiene varias matrículas y una `MATRICULA`
    acumula varias `NOTA`s.
  - **Muchos a muchos (N:M):** un estudiante toma varios cursos y un curso
    tiene varios estudiantes; el N:M se resuelve con las tablas
    `MATRICULA` + `SECCION` (el estudiante se matrícula en una sección de un
    curso).
- La base final tiene **7 tablas** (la guía pide al menos 5).

## Resultado

Este ejercicio es de diseño: no ejecuta SQL. El modelo completo está en
`02_modelo_er.md` y la implementación en `03_creacion_bd.sql`.

