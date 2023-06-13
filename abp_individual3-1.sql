CREATE USER 'nuevo_usuario'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON *.* TO 'nuevo_usuario'@'localhost';
FLUSH PRIVILEGES;
CREATE DATABASE tu_proyecto;
USE tu_proyecto;

CREATE TABLE OPERADORES (
    RUN VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    direccion VARCHAR(100),
    correo_electronico VARCHAR(100),
    fecha_creacion DATETIME
);

CREATE TABLE USUARIOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(15),
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CAPACITACION (
    codigo_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    horario TIME,
    costo DECIMAL(10, 2),
    fecha_realizacion DATETIME
);
INSERT INTO OPERADORES (RUN, nombre, apellido, direccion, correo_electronico, fecha_creacion)
VALUES
('98765432-1', 'María', 'López', 'Avenida Principal 456', 'maria.lopez@example.com', NOW()),
('55555555-5', 'Pedro', 'González', 'Ruta 66', 'pedro.gonzalez@example.com', NOW()),
('11111111-1', 'Laura', 'Rodríguez', 'Calle del Sol 789', 'laura.rodriguez@example.com', NOW()),
('99999999-9', 'Roberto', 'Sánchez', 'Avenida Central 321', 'roberto.sanchez@example.com', NOW()),
('77777777-7', 'Carolina', 'Torres', 'Paseo de la Montaña 987', 'carolina.torres@example.com', NOW()),
('44444444-4', 'Luis', 'Martínez', 'Boulevard Norte 654', 'luis.martinez@example.com', NOW()),
('22222222-2', 'Ana', 'Hernández', 'Calle Este 852', 'ana.hernandez@example.com', NOW()),
('88888888-8', 'Sofía', 'Gómez', 'Avenida Oeste 741', 'sofia.gomez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW());

INSERT INTO USUARIOS (nombre, apellido, correo_electronico, telefono)
VALUES
  ('James', 'Bond', 'james.bond@example.com', '1234567890'),
  ('Lara', 'Croft', 'lara.croft@example.com', '0987654321'),
  ('Harry', 'Potter', 'harry.potter@example.com', '1122334455'),
  ('Hermione', 'Granger', 'hermione.granger@example.com', '9988776655'),
  ('Ron', 'Weasley', 'ron.weasley@example.com', '6677889900'),
  ('Luke', 'Skywalker', 'luke.skywalker@example.com', '4433221100'),
  ('Leia', 'Organa', 'leia.organa@example.com', '7766554433'),
  ('Han', 'Solo', 'han.solo@example.com', '1123581321'),
  ('Chew', 'Bacca', 'chew.bacca@example.com', '2357111317'),
  ('Darth', 'Vader', 'darth.vader@example.com', '9998887776');

INSERT INTO CAPACITACION (nombre, horario, costo, fecha_realizacion)
VALUES
  ('Clases de Programación', 'Lunes 9:00 AM - 11:00 AM', 200000, '2023-01-02'),
  ('Taller de Diseño Web', 'Martes 1:00 PM - 3:00 PM', 150000, '2023-01-03'),
  ('Curso de Redes', 'Miércoles 10:00 AM - 12:00 PM', 170000, '2023-01-04'),
  ('Entrenamiento de Seguridad Informática', 'Jueves 2:00 PM - 4:00 PM', 220000, '2023-01-05'),
  ('Clases de Inteligencia Artificial', 'Viernes 9:00 AM - 11:00 AM', 300000, '2023-01-06'),
  ('Taller de Bases de Datos', 'Lunes 1:00 PM - 3:00 PM', 250000, '2023-01-09'),
  ('Curso de Desarrollo de Videojuegos', 'Martes 10:00 AM - 12:00 PM', 350000, '2023-01-10'),
  ('Entrenamiento de Cloud Computing', 'Miércoles 2:00 PM - 4:00 PM', 275000, '2023-01-11'),
  ('Clases de Desarrollo Móvil', 'Jueves 9:00 AM - 11:00 AM', 225000, '2023-01-12'),
  ('Taller de UX/UI', 'Viernes 1:00 PM - 3:00 PM', 200000, '2023-01-13');



INSERT INTO CAPACITACION (nombre, horario, costo, fecha_realizacion)
VALUES
  ('Curso de Realidad Virtual', 'Lunes 2:00 PM - 4:00 PM', 400.00, '2023-01-16'),
  ('Taller de Machine Learning', 'Martes 3:00 PM - 5:00 PM', 375.00, '2023-01-17'),
  ('Entrenamiento de Big Data', 'Miércoles 1:00 PM - 3:00 PM', 350.00, '2023-01-18');

CREATE TABLE PROFESORES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    salario_por_hora DECIMAL(10, 2)
);

INSERT INTO PROFESORES (nombre, apellido, salario_por_hora)
VALUES
  ('Bruce', 'Wayne', 500000),
  ('Peter', 'Parker', 400000),
  ('Tony', 'Stark', 600000);

-- curso mas costoso y profesor salario mas bajo *
SELECT * FROM CAPACITACION ORDER BY costo DESC LIMIT 1;
SELECT * FROM PROFESORES ORDER BY salario_por_hora ASC LIMIT 1;

--curso mas costoso
SELECT * FROM CAPACITACION WHERE costo > (SELECT AVG(costo) FROM CAPACITACION);

--tabla con el curso más económico
CREATE TABLE Cursos_economicos AS
SELECT * FROM CAPACITACION WHERE costo < (SELECT AVG(costo) FROM CAPACITACION);


--agregando 2 campos a cursos económicos
ALTER TABLE Cursos_economicos ADD COLUMN `Cantidad_minima_estudiantes` INT;
ALTER TABLE Cursos_economicos ADD COLUMN `Aportes_estado` DECIMAL(10,2);

-- renombrar costo a costo efectivo
ALTER TABLE Cursos_economicos CHANGE costo `Costo_efectivo` DECIMAL(10, 2);
UPDATE Cursos_economicos SET `Costo_efectivo` = `Costo_efectivo` - `Aportes_publicos`;

--actualizacion datos curso profesores

UPDATE CAPACITACION SET costo = 225000 WHERE nombre = 'Curso de Desarrollo de Videojuegos';
UPDATE CAPACITACION SET costo = 250000 WHERE nombre = 'Taller de Diseño Web';
UPDATE CAPACITACION SET costo = 200000 WHERE nombre = 'Clases de Programación';
UPDATE CAPACITACION SET costo = 175000 WHERE nombre = 'Curso de Redes';
UPDATE CAPACITACION SET costo = 300000 WHERE nombre = 'Entrenamiento de Seguridad Informática';

UPDATE PROFESORES SET salario_por_hora = 55000 WHERE nombre = 'Bruce' AND apellido = 'Wayne';
UPDATE PROFESORES SET salario_por_hora = 45000 WHERE nombre = 'Peter' AND apellido = 'Parker';
UPDATE PROFESORES SET salario_por_hora = 65000 WHERE nombre = 'Tony' AND apellido = 'Stark';




