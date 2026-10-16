-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0001', 12345678,'0001',100);

-- ============================================
-- Verificación: mostrar los datos ingresados en CUENTAS
-- ============================================
SELECT * FROM CUENTAS;
