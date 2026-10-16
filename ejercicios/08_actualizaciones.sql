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
