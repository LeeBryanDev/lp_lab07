# Ejercicios 3-4 — Crear la base de datos y las tablas con FOREIGN KEY

**Guía (Sesión 07 — Lenguajes de Programación):** «Usando el programa SQLite Database Browser, creen la base de datos según el modelo de entidad relación creado» y «Crear tablas para cada entidad, definiendo las relaciones adecuadas entre ellas, se debe establecer referencias entre las tablas con el uso de FOREIGN KEY según el modelo de entidad relación creado».

## Qué se hizo

Se creó la base de datos `sistema_notas.db` con las **7 tablas del modelo ER**,
cada atributo convertido en columna y cada relación en una `FOREIGN KEY`:

1. `usuario` — cuentas de acceso (rol: estudiante o profesor).
2. `estudiante` — datos personales; `id_usuario` es `UNIQUE` + `FOREIGN KEY`
   (relación **1:1** con usuario).
3. `profesor` — igual que estudiante: **1:1** con usuario.
4. `curso` — catálogo de cursos (código único, créditos).
5. `seccion` — sección de un curso dictada por un profesor en un periodo
   (**1:N** desde curso y desde profesor).
6. `matricula` — matrícula de un estudiante en una sección (**1:N** desde
   estudiante y sección; resuelve el **N:M** estudiante-curso).
7. `nota` — evaluaciones de una matrícula (**1:N** desde matrícula).

`PRAGMA foreign_keys = ON;` es necesario en SQLite para que las `FOREIGN KEY`
se controlen realmente. La verificación al final muestra todas las tablas
creadas (`sqlite_master`).

## Query(s) del script

```sql
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
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`CREATE TABLE usuario ( id_usuario INTEGER PRIMARY KEY, username TEXT UNIQUE NOT NULL, p...`**

Ejecutado correctamente

---

**`CREATE TABLE estudiante ( id_estudiante INTEGER PRIMARY KEY, id_usuario INTEGER UNIQUE ...`**

Ejecutado correctamente

---

**`CREATE TABLE profesor ( id_profesor INTEGER PRIMARY KEY, id_usuario INTEGER UNIQUE NOT ...`**

Ejecutado correctamente

---

**`CREATE TABLE curso ( id_curso INTEGER PRIMARY KEY, codigo TEXT UNIQUE NOT NULL, nombre ...`**

Ejecutado correctamente

---

**`CREATE TABLE seccion ( id_seccion INTEGER PRIMARY KEY, id_curso INTEGER NOT NULL, id_pr...`**

Ejecutado correctamente

---

**`CREATE TABLE matricula ( id_matricula INTEGER PRIMARY KEY, id_estudiante INTEGER NOT NU...`**

Ejecutado correctamente

---

**`CREATE TABLE nota ( id_nota INTEGER PRIMARY KEY, id_matricula INTEGER NOT NULL, tipo_ev...`**

Ejecutado correctamente

---

**`SELECT name, sql FROM sqlite_master WHERE type = 'table' ORDER BY name`**

| name | sql |
|---|---|
| curso | CREATE TABLE curso (
    id_curso INTEGER PRIMARY KEY,
    codigo TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    creditos INTEGER NOT NULL
) |
| estudiante | CREATE TABLE estudiante (
    id_estudiante INTEGER PRIMARY KEY,
    id_usuario INTEGER UNIQUE NOT NULL,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    correo TEXT UNIQUE NOT NULL,
    telefono TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
) |
| matricula | CREATE TABLE matricula (
    id_matricula INTEGER PRIMARY KEY,
    id_estudiante INTEGER NOT NULL,
    id_seccion INTEGER NOT NULL,
    estado TEXT NOT NULL CHECK (estado IN ('Activa','Retirada','Culminada')),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante (id_estudiante),
    FOREIGN KEY (id_seccion) REFERENCES seccion (id_seccion)
) |
| nota | CREATE TABLE nota (
    id_nota INTEGER PRIMARY KEY,
    id_matricula INTEGER NOT NULL,
    tipo_evaluacion TEXT NOT NULL,
    nota REAL NOT NULL CHECK (nota >= 0 AND nota <= 20),
    fecha_registro TEXT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES matricula (id_matricula)
) |
| profesor | CREATE TABLE profesor (
    id_profesor INTEGER PRIMARY KEY,
    id_usuario INTEGER UNIQUE NOT NULL,
    dni TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    correo TEXT UNIQUE NOT NULL,
    telefono TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
) |
| seccion | CREATE TABLE seccion (
    id_seccion INTEGER PRIMARY KEY,
    id_curso INTEGER NOT NULL,
    id_profesor INTEGER NOT NULL,
    nombre_seccion TEXT NOT NULL,
    turno TEXT NOT NULL,
    periodo TEXT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
    FOREIGN KEY (id_profesor) REFERENCES profesor (id_profesor)
) |
| usuario | CREATE TABLE usuario (
    id_usuario INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    rol TEXT NOT NULL CHECK (rol IN ('estudiante','profesor'))
) |

*7 fila(s)*

*Script: `03_creacion_bd.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
