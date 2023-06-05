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
    fecha_creacion DATETIME
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
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW()),
('12345678-9', 'Juan', 'Perez', 'Calle Falsa 123', 'juan.perez@example.com', NOW());
SELECT SUM(costo) AS Costo_Total FROM CAPACITACION;
SELECT * FROM OPERADORES ORDER BY fecha_creacion DESC LIMIT 5;
SELECT * FROM USUARIOS ORDER BY fecha_creacion DESC LIMIT 5;
SELECT RUN, DATEDIFF(NOW(), fecha_creacion) AS Dias_Desde_Registro FROM OPERADORES;
SELECT id, DATEDIFF(NOW(), fecha_creacion) AS Dias_Desde_Registro FROM USUARIOS;
SELECT DATEDIFF(NOW(), MAX(fecha_realizacion)) AS Dias_Desde_Ultima



