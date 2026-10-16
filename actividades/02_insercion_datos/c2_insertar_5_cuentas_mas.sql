-- ============================================
-- Query modificado de la guía (pág. 7): 5 nuevos valores
-- DNI y NSUCURS corresponden a registros ya ingresados
-- ============================================
PRAGMA foreign_keys = ON;

INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0002', 23456789,'0002',2500);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0003', 34567890,'0003',1800);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0004', 45678901,'0001',700);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0005', 56789012,'0004',3200);
INSERT INTO CUENTAS (COD, DNI, NSUCURS, SALDO) VALUES ('0006', 67890123,'0005',50);

-- ============================================
-- Verificación: mostrar los datos ingresados en CUENTAS
-- ============================================
SELECT * FROM CUENTAS;
