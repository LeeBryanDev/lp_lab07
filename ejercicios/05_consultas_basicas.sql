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
