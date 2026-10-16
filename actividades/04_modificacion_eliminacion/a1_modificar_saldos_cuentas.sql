-- ============================================
-- Query de la guía (pág. 8) + consulta de verificación
-- ============================================
PRAGMA foreign_keys = ON;

UPDATE CUENTAS SET SALDO = SALDO * 1.05;
SELECT * FROM CUENTAS;
