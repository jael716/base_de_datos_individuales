CREATE USER 'explorador'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON world.* TO 'explorador'@'localhost';
use world;
SHOW TABLES;
SELECT TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'world';
-- parte 4
CREATE DATABASE individual1;

-- Usar la base de datos
USE individual1;

-- Crear tabla OPERADORES
CREATE TABLE OPERADORES (
  run VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  direccion VARCHAR(100),
  correo_electronico VARCHAR(100)
);

-- Insertar registros en la tabla OPERADORES
INSERT INTO OPERADORES (run, nombre, apellido, direccion, correo_electronico)
VALUES
  ('55555555-5', 'Matt', 'Ishida', 'Izumi Street', 'matt@example.com'),
  ('66666666-6', 'Sora', 'Takenouchi', 'Yagami Avenue', 'sora@example.com'),
  ('77777777-7', 'Tai', 'Kamiya', 'Higashi Street', 'tai@example.com'),
  ('88888888-8', 'Mimi', 'Tachikawa', 'Takenouchi Lane', 'mimi@example.com'),
  ('99999999-9', 'Izzy', 'Izumi', 'Ishida Road', 'izzy@example.com');

-- Crear tabla USUARIOS
CREATE TABLE USUARIOS (
  id_coder INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  correo_electronico VARCHAR(100),
  telefono VARCHAR(20)
);

-- Insertar registros en la tabla USUARIOS
INSERT INTO USUARIOS (id_coder, nombre, apellido, correo_electronico, telefono)
VALUES
	(3, 'Ash', 'Ketchum', 'ash@example.com', '555123456'),
	(4, 'Misty', 'Waterflower', 'misty@example.com', '555987654'),
	(5, 'Brock', 'Slate', 'brock@example.com', '555654321'),
	(6, 'Gary', 'Oak', 'gary@example.com', '555789123'),
	(7, 'May', 'Maple', 'may@example.com', '555456789');

-- Crear tabla CAPACITACION
CREATE TABLE CAPACITACION (
  codigo_curso INT PRIMARY KEY,
  nombre VARCHAR(100),
  horario VARCHAR(50)
);

-- Insertar registros en la tabla CAPACITACION
INSERT INTO CAPACITACION (codigo_curso, nombre, horario)
VALUES
  (3, 'Capacitación de Ninjutsu', 'Lunes 6:00 PM - 8:00 PM'),
  (4, 'Taller de Alquimia', 'Miércoles 2:00 PM - 4:00 PM'),
  (5, 'Curso de Magia Elemental', 'Viernes 10:00 AM - 12:00 PM'),
  (6, 'Entrenamiento de Quirks', 'Martes 3:00 PM - 5:00 PM'),
  (7, 'Clases de Duelo de Cartas', 'Jueves 6:00 PM - 8:00 PM');

