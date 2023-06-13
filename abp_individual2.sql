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
  ('Clases de Programación', 'Lunes 9:00 AM - 11:00 AM', 200.00, '2023-01-02'),
  ('Taller de Diseño Web', 'Martes 1:00 PM - 3:00 PM', 150.00, '2023-01-03'),
  ('Curso de Redes', 'Miércoles 10:00 AM - 12:00 PM', 175.00, '2023-01-04'),
  ('Entrenamiento de Seguridad Informática', 'Jueves 2:00 PM - 4:00 PM', 220.00, '2023-01-05'),
  ('Clases de Inteligencia Artificial', 'Viernes 9:00 AM - 11:00 AM', 300.00, '2023-01-06'),
  ('Taller de Bases de Datos', 'Lunes 1:00 PM - 3:00 PM', 250.00, '2023-01-09'),
  ('Curso de Desarrollo de Videojuegos', 'Martes 10:00 AM - 12:00 PM', 350.00, '2023-01-10'),
  ('Entrenamiento de Cloud Computing', 'Miércoles 2:00 PM - 4:00 PM', 275.00, '2023-01-11'),
  ('Clases de Desarrollo Móvil', 'Jueves 9:00 AM - 11:00 AM', 225.00, '2023-01-12'),
  ('Taller de UX/UI', 'Viernes 1:00 PM - 3:00 PM', 200.00, '2023-01-13');


SELECT SUM(costo) AS Costo_Total FROM CAPACITACION;
SELECT * FROM OPERADORES ORDER BY fecha_creacion DESC LIMIT 5;
SELECT * FROM USUARIOS ORDER BY fecha_creacion DESC LIMIT 5;
SELECT RUN, DATEDIFF(NOW(), fecha_creacion) AS Dias_Desde_Registro FROM OPERADORES;
SELECT id, DATEDIFF(NOW(), fecha_creacion) AS Dias_Desde_Registro FROM USUARIOS;
SELECT DATEDIFF(NOW(), MAX(fecha_realizacion)) AS Dias_Desde_Ultima;
SELECT * FROM CAPACITACION ORDER BY costo DESC LIMIT 1;
SELECT * FROM CAPACITACION ORDER BY costo ASC LIMIT 1;



