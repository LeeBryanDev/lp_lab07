-- ============================================
-- Query de la guía (pág. 6)
-- ============================================
PRAGMA foreign_keys = ON;  -- necesario en SQLite para respetar las FOREIGN KEY

CREATE TABLE CLIENTES (
    DNI VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(20),
    DIR VARCHAR(30),
    PRIMARY KEY (DNI)
);

-- ============================================
-- Verificación: mostrar que se creó la tabla CLIENTES
-- ============================================
PRAGMA table_info(CLIENTES);
SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'CLIENTES';
