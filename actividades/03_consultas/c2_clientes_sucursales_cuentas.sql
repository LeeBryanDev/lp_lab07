-- ============================================
-- Query modificado de la guía (pág. 8): ahora con las 3 tablas
-- ============================================
SELECT CLIENTES.DNI, CLIENTES.NOMBRE, SUCURSALES.CIUDAD, CUENTAS.COD, CUENTAS.SALDO
FROM CUENTAS
INNER JOIN CLIENTES ON CLIENTES.DNI = CUENTAS.DNI
INNER JOIN SUCURSALES ON SUCURSALES.NSUC = CUENTAS.NSUCURS;
