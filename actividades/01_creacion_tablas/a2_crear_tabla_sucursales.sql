-- ============================================
-- Query de la guía (pág. 6)
-- ============================================
PRAGMA foreign_keys = ON;

CREATE TABLE SUCURSALES (
    NSUC VARCHAR(4) NOT NULL,
    CIUDAD VARCHAR(30),
    PRIMARY KEY (NSUC)
);

-- ============================================
-- Verificación: mostrar que se creó la tabla SUCURSALES
-- ============================================
PRAGMA table_info(SUCURSALES);
SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'SUCURSALES';
