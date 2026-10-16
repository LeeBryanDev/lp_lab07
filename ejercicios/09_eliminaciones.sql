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
