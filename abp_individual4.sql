CREATE DATABASE mi_aplicacion;
CREATE USER 'nuevo_usuario'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON mi_aplicacion.* TO 'nuevo_usuario'@'localhost';
FLUSH PRIVILEGES;

USE mi_aplicacion;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    contraseña VARCHAR(100),
    zona_horaria INT DEFAULT -3,
    genero CHAR(1),
    telefono VARCHAR(20)
);

CREATE TABLE Ingresos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Visitas (
    id_usuario INT,
    numero_visitas INT
);

INSERT INTO Usuarios (nombre, apellido, contraseña, genero, telefono) 
VALUES ('Juan', 'Pérez', 'pass1', 'M', '8564567890'),
    ('Ana', 'García', 'pass2', 'F', '8533647891'),
    ('Pedro', 'López', 'pass3', 'M', '3894567892'),
    ('María', 'González', 'pass4', 'F', '3634567893'),
    ('Carlos', 'Rodríguez', 'pass5', 'M', '8534567894'),
    ('Laura', 'Martínez', 'pass6', 'F', '6945567895'),
    ('Javier', 'Fernández', 'pass7', 'M', '52334567896'),
    ('Carmen', 'Hernández', 'pass8', 'F', '1234567897'),
    ('Miguel', 'Torres', 'pass9', 'M', '2534567898'),
    ('Sofía', 'Ramírez', 'pass10', 'F', '5238567899');
;
INSERT INTO Ingresos (id_usuario, fecha_hora_ingreso) VALUES
(1, NOW()),
(2, NOW()),
(3, NOW()),
(4, NOW()),
(5, NOW()),
(6, NOW()),
(7, NOW()),
(8, NOW());

INSERT INTO Visitas (id_usuario, visitas) VALUES
(1, 5),
(2, 12),
(3, 8),
(4, 15),
(5, 9),
(6, 7),
(7, 13),
(8, 11);


DROP TABLE Visitas;
