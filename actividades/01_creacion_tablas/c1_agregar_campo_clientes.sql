-- ============================================
-- Query de la guía (pág. 7)
-- ============================================
PRAGMA foreign_keys = ON;

ALTER TABLE CLIENTES ADD PAIS VARCHAR(10);

-- ============================================
-- Verificación: nueva estructura de la tabla CLIENTES
-- ============================================
PRAGMA table_info(CLIENTES);
