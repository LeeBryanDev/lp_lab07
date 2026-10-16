-- ============================================
-- Query modificado de la guía (pág. 7): 5 nuevos valores
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0002', 'MOLLENDO');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0003', 'LIMA');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0004', 'TACNA');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0005', 'CUSCO');
INSERT INTO SUCURSALES (NSUC, CIUDAD) VALUES ('0006', 'AREQUIPA');

-- ============================================
-- Verificación: mostrar los datos ingresados en SUCURSALES
-- ============================================
SELECT * FROM SUCURSALES;
