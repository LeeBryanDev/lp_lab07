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
