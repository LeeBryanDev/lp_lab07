-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0001', 'AREQUIPA');

-- ============================================
-- Verificación: mostrar los datos ingresados en SUCURSALES
-- ============================================
SELECT * FROM SUCURSALES;
