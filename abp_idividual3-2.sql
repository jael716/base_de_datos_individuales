CREATE DATABASE mi_aplicacion;
CREATE USER 'nuevo_usuario'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON mi_aplicacion.* TO 'nuevo_usuario'@'localhost';
FLUSH PRIVILEGES;

USE mi_aplicacion;

CREATE TABLE Usuarios_Inactivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20),
    genero CHAR(1)
);

CREATE TABLE Usuarios_Activos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20),
    genero CHAR(1)
);

INSERT INTO Usuarios_Inactivos (nombre, apellido, correo_electronico, telefono, genero)
VALUES 
('Maria', 'Toro', 'mtoro@gmail.com', '3234564390', 'M'),
('Jose', 'Diaz', 'jdias@gmail.com', '23456712331', 'F'),
('David', 'Farias', 'david@gmail.com', '3366789012', 'M'),
('Dolores', 'Santi', 'dolores@gmail.com', '4567890123', 'F'),
('Sergio', 'Collet', 'ser@gmail.com', '5378501234', 'M');

INSERT INTO Usuarios_Activos SELECT * FROM Usuarios_Inactivos WHERE id IN (1, 2, 3);
DELETE FROM Usuarios_Inactivos WHERE id IN (1, 2, 3);

INSERT INTO Usuarios_Inactivos SELECT * FROM Usuarios_Activos WHERE id = 3;
DELETE FROM Usuarios_Activos WHERE id = 3;
