-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

ALTER TABLE CLIENTES DROP DIR;

-- ============================================
-- Verificación: nueva estructura de la tabla CLIENTES
-- ============================================
PRAGMA table_info(CLIENTES);
