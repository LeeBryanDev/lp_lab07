-- ============================================
-- Query de la guía (pág. 6)
-- ============================================
PRAGMA foreign_keys = ON;

CREATE TABLE CUENTAS (
    COD VARCHAR(4) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    NSUCURS VARCHAR(4) NOT NULL,
    SALDO INT DEFAULT 0,
    PRIMARY KEY (COD, DNI, NSUCURS),
    FOREIGN KEY (DNI) REFERENCES CLIENTES (DNI),
    FOREIGN KEY (NSUCURS) REFERENCES SUCURSALES (NSUC)
);

-- ============================================
-- Verificación: mostrar que se creó la tabla CUENTAS
-- ============================================
PRAGMA table_info(CUENTAS);
SELECT name, sql FROM sqlite_master WHERE type = 'table' AND name = 'CUENTAS';
