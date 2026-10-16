# Ejercicio 9 — 5 actualizaciones de datos con filtro

**Guía (Sesión 07 — Lenguajes de Programación):** «Realicen al menos 5 actualizaciones de datos con un filtro establecido por ustedes».

## Qué se hizo

Se realizaron **5 actualizaciones**, cada una con su `WHERE` (filtro propio):

1. **Estudiante que se retira del curso** — `UPDATE matricula SET estado =
   'Retirada' WHERE id_matricula = 8 AND estado = 'Activa'` (se filtra además
   por el estado previo para no tocar matrículas ya cerradas).
2. **Corrección de una nota mal capturada** — `UPDATE nota SET nota = 11.5
   WHERE id_nota = 4 AND nota = 8.5` (se filtra por el valor anterior, así
   solo se corrige ese registro).
3. **Cambio de turno de una sección** — `UPDATE seccion SET turno = 'Noche'
   WHERE id_seccion = 3 AND periodo = '2026-1'`.
4. **Actualización del teléfono de un estudiante** — `UPDATE estudiante SET
   telefono = '987000111' WHERE dni = '70100005'`.
5. **Reset de contraseña de un profesor** — `UPDATE usuario SET
   password_hash = 'hash_nuevo_demo_2026' WHERE username = 'prof01'`
   (en un sistema real se guardaría el hash de la nueva contraseña, nunca la
   contraseña en texto).

Después de cada actualización se ejecuta una consulta de verificación para
mostrar el efecto real. Sin el `WHERE`, el `UPDATE` afectaría a TODAS las
filas de la tabla, por eso siempre se filtra.

## Query(s) del script

```sql
-- ============================================================
-- Laboratorio 07 - Ejercicios: 5 actualizaciones con filtro
-- ============================================================
PRAGMA foreign_keys = ON;

-- 1) El estudiante de la matricula 8 se retira del curso
UPDATE matricula SET estado = 'Retirada' WHERE id_matricula = 8 AND estado = 'Activa';
SELECT * FROM matricula WHERE id_matricula = 8;

-- 2) Correccion de la nota 4 (estaba mal capturada)
UPDATE nota SET nota = 11.5 WHERE id_nota = 4 AND nota = 8.5;
SELECT * FROM nota WHERE id_nota = 4;

-- 3) La seccion 3 pasa al turno noche
UPDATE seccion SET turno = 'Noche' WHERE id_seccion = 3 AND periodo = '2026-1';
SELECT * FROM seccion WHERE id_seccion = 3;

-- 4) Actualizar el telefono del estudiante con DNI 70100005
UPDATE estudiante SET telefono = '987000111' WHERE dni = '70100005';
SELECT * FROM estudiante WHERE dni = '70100005';

-- 5) Reset del password del usuario prof01
UPDATE usuario SET password_hash = 'hash_nuevo_demo_2026' WHERE username = 'prof01';
SELECT id_usuario, username, password_hash, rol FROM usuario WHERE username = 'prof01';
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`UPDATE matricula SET estado = 'Retirada' WHERE id_matricula = 8 AND estado = 'Activa'`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM matricula WHERE id_matricula = 8`**

| id_matricula | id_estudiante | id_seccion | estado |
|---|---|---|---|
| 8 | 8 | 7 | Retirada |

*1 fila(s)*

---

**`UPDATE nota SET nota = 11.5 WHERE id_nota = 4 AND nota = 8.5`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM nota WHERE id_nota = 4`**

| id_nota | id_matricula | tipo_evaluacion | nota | fecha_registro |
|---|---|---|---|---|
| 4 | 3 | Parcial 1 | 11.5 | 2026-04-06 |

*1 fila(s)*

---

**`UPDATE seccion SET turno = 'Noche' WHERE id_seccion = 3 AND periodo = '2026-1'`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM seccion WHERE id_seccion = 3`**

| id_seccion | id_curso | id_profesor | nombre_seccion | turno | periodo |
|---|---|---|---|---|---|
| 3 | 2 | 1 | A | Noche | 2026-1 |

*1 fila(s)*

---

**`UPDATE estudiante SET telefono = '987000111' WHERE dni = '70100005'`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT * FROM estudiante WHERE dni = '70100005'`**

| id_estudiante | id_usuario | dni | nombre | apellido | correo | telefono |
|---|---|---|---|---|---|---|
| 5 | 5 | 70100005 | Elena | Soto | est05@ucsm.edu.pe | 987000111 |

*1 fila(s)*

---

**`UPDATE usuario SET password_hash = 'hash_nuevo_demo_2026' WHERE username = 'prof01'`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT id_usuario, username, password_hash, rol FROM usuario WHERE username = 'prof01'`**

| id_usuario | username | password_hash | rol |
|---|---|---|---|
| 11 | prof01 | hash_nuevo_demo_2026 | profesor |

*1 fila(s)*

*Script: `08_actualizaciones.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
