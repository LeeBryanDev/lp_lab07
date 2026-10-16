-- ============================================================
-- Laboratorio 07 - Ejercicios: creacion de la base de datos
-- Sistema de notas (7 tablas: 1:1, 1:N y N:M via matricula)
-- ============================================================
PRAGMA foreign_keys = ON;

-- Cuentas de acceso (rol: estudiante o profesor)
CREATE TABLE usuario (
    id_usuario INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    rol TEXT NOT NULL CHECK (rol IN ('estudiante','profesor'))
);

-- Relacion 1:1 con usuario (id_usuario UNIQUE = una sola cuenta por persona)
CREATE TABLE estudiante (
    id_estudiante INTEGER PRIMARY KEY,
    id_usuario INTEGER UNIQUE NOT NULL,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    correo TEXT UNIQUE NOT NULL,
    telefono TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

-- Relacion 1:1 con usuario
CREATE TABLE profesor (
    id_profesor INTEGER PRIMARY KEY,
    id_usuario INTEGER UNIQUE NOT NULL,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    correo TEXT UNIQUE NOT NULL,
    telefono TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE curso (
    id_curso INTEGER PRIMARY KEY,
    codigo TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    creditos INTEGER NOT NULL
);

-- Relacion 1:N: un curso tiene varias secciones y un profesor dicta varias
CREATE TABLE seccion (
    id_seccion INTEGER PRIMARY KEY,
    id_curso INTEGER NOT NULL,
    id_profesor INTEGER NOT NULL,
    nombre_seccion TEXT NOT NULL,
    turno TEXT NOT NULL,
    periodo TEXT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
    FOREIGN KEY (id_profesor) REFERENCES profesor (id_profesor)
);

-- Relacion 1:N con estudiante y seccion (resuelve el N:M estudiante-curso)
CREATE TABLE matricula (
    id_matricula INTEGER PRIMARY KEY,
    id_estudiante INTEGER NOT NULL,
    id_seccion INTEGER NOT NULL,
    estado TEXT NOT NULL CHECK (estado IN ('Activa','Retirada','Culminada')),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante (id_estudiante),
    FOREIGN KEY (id_seccion) REFERENCES seccion (id_seccion)
);

-- Relacion 1:N: una matricula acumula varias notas
CREATE TABLE nota (
    id_nota INTEGER PRIMARY KEY,
    id_matricula INTEGER NOT NULL,
    tipo_evaluacion TEXT NOT NULL,
    nota REAL NOT NULL CHECK (nota >= 0 AND nota <= 20),
    fecha_registro TEXT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES matricula (id_matricula)
);

-- ============================================
-- Verificacion: tablas creadas en la base de datos
-- ============================================
SELECT name, sql FROM sqlite_master WHERE type = 'table' ORDER BY name;
