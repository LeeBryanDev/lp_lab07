-- ============================================
-- Query de la guía (pág. 8)
-- ============================================
SELECT CLIENTES.DNI, NOMBRE, SALDO FROM CLIENTES, CUENTAS WHERE CLIENTES.DNI = CUENTAS.DNI;
