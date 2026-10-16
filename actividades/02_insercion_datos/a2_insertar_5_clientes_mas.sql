-- ============================================
-- Query modificado de la guía (pág. 7): 5 nuevos valores
-- Múltiples sentencias separadas por punto y coma
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CLIENTES VALUES (23456789,'Lucía','Perú');
INSERT INTO CLIENTES VALUES (34567890,'Carlos','Perú');
INSERT INTO CLIENTES VALUES (45678901,'Rosa','Bolivia');
INSERT INTO CLIENTES VALUES (56789012,'Jorge','Perú');
INSERT INTO CLIENTES VALUES (67890123,'Elena','Chile');

-- ============================================
-- Verificación: mostrar los datos ingresados en CLIENTES
-- ============================================
SELECT * FROM CLIENTES;
