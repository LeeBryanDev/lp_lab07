# Laboratorio 07 resuelto — Base de datos SQLite

Actividades y ejercicios de la **Sesión 07: Base de Datos - SQLite** (Lenguajes de
Programación I). Cada query de la guía está en su propio script `.sql` — uno por
corte de la guía (cada bloque «Escriban el siguiente query… / Ejecuten el query») —
y cada script tiene su `.md` asignado con la explicación y el **resultado real de
la ejecución** (probado con SQLite, no copiado a mano).

## Bases de datos resultantes (2)

| Base de datos | Carpeta | Contenido |
|---|---|---|
| `Actividades/actividades.db` | `Actividades/` | Resultado de ejecutar en orden todos los scripts de las actividades |
| `Ejercicios/sistema_notas.db` | `Ejercicios/` | Sistema de notas (ejercicios, trabajo grupal) |

## Estructura y orden de ejecución

### Actividades (guía, sección IV) — ejecutar en orden alfabético dentro de cada carpeta

| Carpeta | Scripts | Contenido |
|---|---|---|
| `01_creacion_tablas/` | `a1_crear_tabla_clientes.sql` | CREATE TABLE CLIENTES |
| | `a2_crear_tabla_sucursales.sql` | CREATE TABLE SUCURSALES |
| | `b1_crear_tabla_cuentas.sql` | CREATE TABLE CUENTAS (con FOREIGN KEY) |
| | `c1_agregar_campo_clientes.sql` | ALTER TABLE … ADD PAIS |
| | `c2_eliminar_campo_clientes.sql` | ALTER TABLE … DROP DIR |
| `02_insercion_datos/` | `a1_insertar_clientes.sql` / `a2_insertar_5_clientes_mas.sql` | INSERT en CLIENTES (1 + 5) |
| | `b1_insertar_sucursales.sql` / `b2_insertar_5_sucursales_mas.sql` | INSERT en SUCURSALES (1 + 5) |
| | `c1_insertar_cuentas.sql` / `c2_insertar_5_cuentas_mas.sql` | INSERT en CUENTAS (1 + 5, con referencias válidas) |
| `03_consultas/` | `a1_todos_datos_sucursales.sql` | SELECT * FROM SUCURSALES |
| | `b1_columnas_clientes.sql` | SELECT DNI, NOMBRE FROM CLIENTES |
| | `c1_clientes_y_cuentas.sql` | CLIENTES + CUENTAS (JOIN clásico) |
| | `c2_clientes_sucursales_cuentas.sql` | CLIENTES + SUCURSALES + CUENTAS (INNER JOIN) |
| `04_modificacion_eliminacion/` | `a1_modificar_saldos_cuentas.sql` | UPDATE (saldos ×1.05) + verificación |
| | `b1_eliminar_cuenta.sql` | DELETE de la cuenta '0001' + verificación |

Los queries marcados «Query de la guía» son la **transcripción exacta** de las
capturas de la guía (páginas 6-9). Los pasos «Modifique el query…» (agregar 5
valores, incluir la 3.ª tabla) son scripts aparte porque producen un query
distinto al original.

### Ejercicios (guía, sección V — trabajo grupal) — un archivo por ejercicio

| Archivo | Ejercicio de la guía |
|---|---|
| `01_caso_estudio.md` | 1. Elección del caso (sistema de notas) |
| `02_modelo_er.md` | 2. Modelo entidad-relación (con `sistema_notas_er_v3.drawio` / `.png`) |
| `03_creacion_bd.sql` | 3-4. Crear la BD y las tablas con FOREIGN KEY |
| `04_insercion_datos.sql` | 5. Ingreso de datos (≥ 10 registros por tabla) |
| `05_consultas_basicas.sql` | 6. 5 consultas básicas (1 tabla + condicional) |
| `06_consultas_intermedias.sql` | 7. 5 consultas intermedias (≥ 2 tablas + condicional) |
| `07_consultas_avanzadas.sql` | 8. 4 consultas avanzadas (≥ 3 tablas + condicional) |
| `08_actualizaciones.sql` | 9. 5 actualizaciones con filtro |
| `09_eliminaciones.sql` | 10. 5 eliminaciones con filtro (respetando las referencias) |

Cada `.md` de ejercicios incluye **qué se hizo en ese ejercicio** (decisión de
diseño, tablas implicadas y por qué cada consulta es útil) más los resultados
reales.

## Cómo reproducir

1. Borrar las dos bases de datos (o apuntar a una ruta nueva).
2. Ejecutar los `.sql` de `Actividades/` en el orden de la tabla (a1 → a2 → b1 →
   c1 → c2, luego 02/…, etc.) sobre `actividades.db`.
3. Ejecutar los `.sql` de `Ejercicios/` en orden numérico sobre
   `sistema_notas.db`.

En SQLite Database Browser: pestaña «Ejecutar SQL» → abrir el archivo →
Ejecutar. Los resultados que aparecen en cada `.md` son exactamente los que
devuelve SQLite al ejecutarlos en ese orden.
