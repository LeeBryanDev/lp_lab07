-- ============================================
-- Query de la guía (pág. 9) + consulta de verificación
-- ============================================
PRAGMA foreign_keys = ON;

DELETE FROM CUENTAS WHERE COD = '0001';
SELECT * FROM CUENTAS;
