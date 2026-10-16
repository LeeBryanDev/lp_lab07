# Ejercicio 5 — Ingresar información a la base de datos (mínimo 10 registros por tabla)

**Guía (Sesión 07 — Lenguajes de Programación):** «Ingrese información a la base de datos mediante el uso de query (mínimo 10 registros por tabla)».

## Qué se hizo

Se insertaron **10 o más registros en cada una de las 7 tablas** con `INSERT`
explícitos (una sentencia por fila, separadas por `;`):

| Tabla | Registros | Contenido |
|---|---|---|
| `usuario` | 20 | 10 cuentas de estudiantes + 10 de profesores |
| `estudiante` | 10 | estudiantes con DNI, correo y teléfono |
| `profesor` | 10 | profesores con DNI, correo y teléfono |
| `curso` | 10 | cursos de 3 a 5 créditos |
| `seccion` | 10 | secciones A/B en los turnos mañana, tarde y noche |
| `matricula` | 12 | matrículas activas, retiradas y culminadas |
| `nota` | 12 | Parcial 1, Parcial 2, Final y Práctica (escala 0–20) |

El **orden de inserción importa** por las `FOREIGN KEY`:

1. `usuario` (no depende de nadie).
2. `estudiante` y `profesor` (dependen de `usuario`; cada uno con su
   `id_usuario` distinto — 1–10 estudiantes, 11–20 profesores).
3. `curso`.
4. `seccion` (depende de `curso` y `profesor`).
5. `matricula` (depende de `estudiante` y `seccion`).
6. `nota` (depende de `matricula`).

Ejemplo de integridad referencial: `INSERT INTO nota ... (8, 9, ...)`
funciona solo porque existe la matrícula 9. La verificación muestra los
conteos por tabla (todas ≥ 10).

## Query(s) del script

```sql
-- ============================================================
-- Laboratorio 07 - Ejercicios: insercion de datos (>= 10 por tabla)
-- El orden importa: primero las tablas "padre", luego las que referencian
-- ============================================================
PRAGMA foreign_keys = ON;

-- 1) Cuentas: 10 estudiantes (1-10) y 10 profesores (11-20)
INSERT INTO usuario VALUES (1,'est01','hash_demo_est01','estudiante');
INSERT INTO usuario VALUES (2,'est02','hash_demo_est02','estudiante');
INSERT INTO usuario VALUES (3,'est03','hash_demo_est03','estudiante');
INSERT INTO usuario VALUES (4,'est04','hash_demo_est04','estudiante');
INSERT INTO usuario VALUES (5,'est05','hash_demo_est05','estudiante');
INSERT INTO usuario VALUES (6,'est06','hash_demo_est06','estudiante');
INSERT INTO usuario VALUES (7,'est07','hash_demo_est07','estudiante');
INSERT INTO usuario VALUES (8,'est08','hash_demo_est08','estudiante');
INSERT INTO usuario VALUES (9,'est09','hash_demo_est09','estudiante');
INSERT INTO usuario VALUES (10,'est10','hash_demo_est10','estudiante');
INSERT INTO usuario VALUES (11,'prof01','hash_demo_prof01','profesor');
INSERT INTO usuario VALUES (12,'prof02','hash_demo_prof02','profesor');
INSERT INTO usuario VALUES (13,'prof03','hash_demo_prof03','profesor');
INSERT INTO usuario VALUES (14,'prof04','hash_demo_prof04','profesor');
INSERT INTO usuario VALUES (15,'prof05','hash_demo_prof05','profesor');
INSERT INTO usuario VALUES (16,'prof06','hash_demo_prof06','profesor');
INSERT INTO usuario VALUES (17,'prof07','hash_demo_prof07','profesor');
INSERT INTO usuario VALUES (18,'prof08','hash_demo_prof08','profesor');
INSERT INTO usuario VALUES (19,'prof09','hash_demo_prof09','profesor');
INSERT INTO usuario VALUES (20,'prof10','hash_demo_prof10','profesor');

-- 2) Estudiantes (cada uno con su cuenta de usuario)
INSERT INTO estudiante VALUES (1,1,'70100001','Ana','Quispe','est01@ucsm.edu.pe','987111001');
INSERT INTO estudiante VALUES (2,2,'70100002','Bruno','Mamani','est02@ucsm.edu.pe','987222002');
INSERT INTO estudiante VALUES (3,3,'70100003','Carla','Condori','est03@ucsm.edu.pe','987333003');
INSERT INTO estudiante VALUES (4,4,'70100004','Diego','Paredes','est04@ucsm.edu.pe','987444004');
INSERT INTO estudiante VALUES (5,5,'70100005','Elena','Soto','est05@ucsm.edu.pe','987555005');
INSERT INTO estudiante VALUES (6,6,'70100006','Fabio','Ramos','est06@ucsm.edu.pe','987666006');
INSERT INTO estudiante VALUES (7,7,'70100007','Gabriela','Flores','est07@ucsm.edu.pe','987777007');
INSERT INTO estudiante VALUES (8,8,'70100008','Hugo','Salas','est08@ucsm.edu.pe','987888008');
INSERT INTO estudiante VALUES (9,9,'70100009','Irene','Torres','est09@ucsm.edu.pe','987999009');
INSERT INTO estudiante VALUES (10,10,'70100010','Jorge','Medina','est10@ucsm.edu.pe','987000010');

-- 3) Profesores (cada uno con su cuenta de usuario)
INSERT INTO profesor VALUES (1,11,'40100001','Luis','Chirinos','prof01@ucsm.edu.pe','981111001');
INSERT INTO profesor VALUES (2,12,'40100002','Maria','Rojas','prof02@ucsm.edu.pe','981222002');
INSERT INTO profesor VALUES (3,13,'40100003','Pedro','Valdivia','prof03@ucsm.edu.pe','981333003');
INSERT INTO profesor VALUES (4,14,'40100004','Rosa','Nina','prof04@ucsm.edu.pe','981444004');
INSERT INTO profesor VALUES (5,15,'40100005','Jorge','Caceres','prof05@ucsm.edu.pe','981555005');
INSERT INTO profesor VALUES (6,16,'40100006','Lucia','Miranda','prof06@ucsm.edu.pe','981666006');
INSERT INTO profesor VALUES (7,17,'40100007','Carlos','Zapata','prof07@ucsm.edu.pe','981777007');
INSERT INTO profesor VALUES (8,18,'40100008','Teresa','Aliaga','prof08@ucsm.edu.pe','981888008');
INSERT INTO profesor VALUES (9,19,'40100009','Miguel','Cornejo','prof09@ucsm.edu.pe','981999009');
INSERT INTO profesor VALUES (10,20,'40100010','Sofia','Paredes','prof10@ucsm.edu.pe','981000010');

-- 4) Cursos
INSERT INTO curso VALUES (1,'LP01','Lenguajes de Programacion I',4);
INSERT INTO curso VALUES (2,'LP02','Lenguajes de Programacion II',4);
INSERT INTO curso VALUES (3,'BD01','Bases de Datos',4);
INSERT INTO curso VALUES (4,'ED01','Estructuras Discretas',4);
INSERT INTO curso VALUES (5,'CAL1','Calculo I',5);
INSERT INTO curso VALUES (6,'FIS1','Fisica I',4);
INSERT INTO curso VALUES (7,'POO1','Programacion Orientada a Objetos',4);
INSERT INTO curso VALUES (8,'ALG1','Algoritmos y Estructuras de Datos',4);
INSERT INTO curso VALUES (9,'RED1','Redes de Computadoras',3);
INSERT INTO curso VALUES (10,'SIS1','Sistemas Operativos',4);

-- 5) Secciones (dependen de curso y profesor)
INSERT INTO seccion VALUES (1,1,1,'A','Manana','2026-1');
INSERT INTO seccion VALUES (2,1,2,'B','Tarde','2026-1');
INSERT INTO seccion VALUES (3,2,1,'A','Manana','2026-1');
INSERT INTO seccion VALUES (4,3,3,'A','Tarde','2026-1');
INSERT INTO seccion VALUES (5,4,4,'A','Manana','2026-1');
INSERT INTO seccion VALUES (6,5,5,'A','Tarde','2026-1');
INSERT INTO seccion VALUES (7,6,6,'A','Manana','2026-1');
INSERT INTO seccion VALUES (8,7,7,'A','Noche','2026-1');
INSERT INTO seccion VALUES (9,8,8,'A','Tarde','2026-1');
INSERT INTO seccion VALUES (10,9,9,'B','Noche','2026-2');

-- 6) Matriculas (dependen de estudiante y seccion)
INSERT INTO matricula VALUES (1,1,1,'Activa');
INSERT INTO matricula VALUES (2,2,1,'Activa');
INSERT INTO matricula VALUES (3,3,2,'Activa');
INSERT INTO matricula VALUES (4,4,3,'Culminada');
INSERT INTO matricula VALUES (5,5,4,'Activa');
INSERT INTO matricula VALUES (6,6,5,'Culminada');
INSERT INTO matricula VALUES (7,7,6,'Activa');
INSERT INTO matricula VALUES (8,8,7,'Activa');
INSERT INTO matricula VALUES (9,10,9,'Activa');
INSERT INTO matricula VALUES (10,3,5,'Retirada');
INSERT INTO matricula VALUES (11,4,6,'Retirada');
INSERT INTO matricula VALUES (12,9,8,'Activa');

-- 7) Notas (dependen de matricula; escala 0-20)
INSERT INTO nota VALUES (1,1,'Parcial 1',14.0,'2026-04-05');
INSERT INTO nota VALUES (2,1,'Parcial 2',16.0,'2026-05-10');
INSERT INTO nota VALUES (3,2,'Parcial 1',10.5,'2026-04-05');
INSERT INTO nota VALUES (4,3,'Parcial 1',8.5,'2026-04-06');
INSERT INTO nota VALUES (5,3,'Final',12.0,'2026-06-01');
INSERT INTO nota VALUES (6,4,'Practica',15.0,'2026-04-20');
INSERT INTO nota VALUES (7,5,'Parcial 1',18.0,'2026-04-07');
INSERT INTO nota VALUES (8,9,'Parcial 1',11.0,'2026-04-08');
INSERT INTO nota VALUES (9,9,'Parcial 2',13.5,'2026-05-12');
INSERT INTO nota VALUES (10,10,'Practica',7.5,'2026-03-10');
INSERT INTO nota VALUES (11,11,'Practica',8.0,'2026-03-12');
INSERT INTO nota VALUES (12,6,'Final',9.5,'2026-06-02');

-- ============================================
-- Verificacion: conteo de registros por tabla (minimo 10)
-- ============================================
SELECT 'usuario' AS tabla, COUNT(*) AS registros FROM usuario
UNION ALL SELECT 'estudiante', COUNT(*) FROM estudiante
UNION ALL SELECT 'profesor', COUNT(*) FROM profesor
UNION ALL SELECT 'curso', COUNT(*) FROM curso
UNION ALL SELECT 'seccion', COUNT(*) FROM seccion
UNION ALL SELECT 'matricula', COUNT(*) FROM matricula
UNION ALL SELECT 'nota', COUNT(*) FROM nota;
```

## Resultado de la ejecución (SQLite 3.50.4, ejecutado de verdad)

**`PRAGMA foreign_keys = ON`**

Ejecutado correctamente

---

**`INSERT INTO usuario VALUES (1,'est01','hash_demo_est01','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (2,'est02','hash_demo_est02','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (3,'est03','hash_demo_est03','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (4,'est04','hash_demo_est04','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (5,'est05','hash_demo_est05','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (6,'est06','hash_demo_est06','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (7,'est07','hash_demo_est07','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (8,'est08','hash_demo_est08','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (9,'est09','hash_demo_est09','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (10,'est10','hash_demo_est10','estudiante')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (11,'prof01','hash_demo_prof01','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (12,'prof02','hash_demo_prof02','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (13,'prof03','hash_demo_prof03','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (14,'prof04','hash_demo_prof04','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (15,'prof05','hash_demo_prof05','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (16,'prof06','hash_demo_prof06','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (17,'prof07','hash_demo_prof07','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (18,'prof08','hash_demo_prof08','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (19,'prof09','hash_demo_prof09','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO usuario VALUES (20,'prof10','hash_demo_prof10','profesor')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (1,1,'70100001','Ana','Quispe','est01@ucsm.edu.pe','98711...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (2,2,'70100002','Bruno','Mamani','est02@ucsm.edu.pe','987...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (3,3,'70100003','Carla','Condori','est03@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (4,4,'70100004','Diego','Paredes','est04@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (5,5,'70100005','Elena','Soto','est05@ucsm.edu.pe','98755...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (6,6,'70100006','Fabio','Ramos','est06@ucsm.edu.pe','9876...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (7,7,'70100007','Gabriela','Flores','est07@ucsm.edu.pe','...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (8,8,'70100008','Hugo','Salas','est08@ucsm.edu.pe','98788...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (9,9,'70100009','Irene','Torres','est09@ucsm.edu.pe','987...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO estudiante VALUES (10,10,'70100010','Jorge','Medina','est10@ucsm.edu.pe','9...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (1,11,'40100001','Luis','Chirinos','prof01@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (2,12,'40100002','Maria','Rojas','prof02@ucsm.edu.pe','9812...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (3,13,'40100003','Pedro','Valdivia','prof03@ucsm.edu.pe','9...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (4,14,'40100004','Rosa','Nina','prof04@ucsm.edu.pe','981444...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (5,15,'40100005','Jorge','Caceres','prof05@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (6,16,'40100006','Lucia','Miranda','prof06@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (7,17,'40100007','Carlos','Zapata','prof07@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (8,18,'40100008','Teresa','Aliaga','prof08@ucsm.edu.pe','98...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (9,19,'40100009','Miguel','Cornejo','prof09@ucsm.edu.pe','9...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO profesor VALUES (10,20,'40100010','Sofia','Paredes','prof10@ucsm.edu.pe','9...`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (1,'LP01','Lenguajes de Programacion I',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (2,'LP02','Lenguajes de Programacion II',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (3,'BD01','Bases de Datos',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (4,'ED01','Estructuras Discretas',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (5,'CAL1','Calculo I',5)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (6,'FIS1','Fisica I',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (7,'POO1','Programacion Orientada a Objetos',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (8,'ALG1','Algoritmos y Estructuras de Datos',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (9,'RED1','Redes de Computadoras',3)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO curso VALUES (10,'SIS1','Sistemas Operativos',4)`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (1,1,1,'A','Manana','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (2,1,2,'B','Tarde','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (3,2,1,'A','Manana','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (4,3,3,'A','Tarde','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (5,4,4,'A','Manana','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (6,5,5,'A','Tarde','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (7,6,6,'A','Manana','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (8,7,7,'A','Noche','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (9,8,8,'A','Tarde','2026-1')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO seccion VALUES (10,9,9,'B','Noche','2026-2')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (1,1,1,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (2,2,1,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (3,3,2,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (4,4,3,'Culminada')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (5,5,4,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (6,6,5,'Culminada')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (7,7,6,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (8,8,7,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (9,10,9,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (10,3,5,'Retirada')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (11,4,6,'Retirada')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO matricula VALUES (12,9,8,'Activa')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (1,1,'Parcial 1',14.0,'2026-04-05')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (2,1,'Parcial 2',16.0,'2026-05-10')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (3,2,'Parcial 1',10.5,'2026-04-05')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (4,3,'Parcial 1',8.5,'2026-04-06')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (5,3,'Final',12.0,'2026-06-01')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (6,4,'Practica',15.0,'2026-04-20')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (7,5,'Parcial 1',18.0,'2026-04-07')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (8,9,'Parcial 1',11.0,'2026-04-08')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (9,9,'Parcial 2',13.5,'2026-05-12')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (10,10,'Practica',7.5,'2026-03-10')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (11,11,'Practica',8.0,'2026-03-12')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`INSERT INTO nota VALUES (12,6,'Final',9.5,'2026-06-02')`**

Ejecutado correctamente — *1 fila(s) afectada(s)*

---

**`SELECT 'usuario' AS tabla, COUNT(*) AS registros FROM usuario UNION ALL SELECT 'estudia...`**

| tabla | registros |
|---|---|
| usuario | 20 |
| estudiante | 10 |
| profesor | 10 |
| curso | 10 |
| seccion | 10 |
| matricula | 12 |
| nota | 12 |

*7 fila(s)*

*Script: `04_insercion_datos.sql` — ejecutado en orden sobre la base de datos de esta carpeta.*
