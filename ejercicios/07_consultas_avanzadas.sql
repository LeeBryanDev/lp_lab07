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
