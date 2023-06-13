CREATE DATABASE musica;
CREATE USER 'nuevo1'@'localhost' IDENTIFIED BY 'crt';
GRANT ALL PRIVILEGES ON mi_aplicacion.* TO 'nuevo1'@'localhost';
FLUSH PRIVILEGES;

USE musica;


-- Tabla Época
CREATE TABLE Epoca (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  caracteristicas VARCHAR(255),
  anio_inicio INT,
  anio_final INT
);

-- Tabla Género
CREATE TABLE Genero (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  caracteristicas VARCHAR(255),
  origenes VARCHAR(255),
  epoca_id INT,
  FOREIGN KEY (epoca_id) REFERENCES Epoca(id)
);

-- Tabla Artista
CREATE TABLE Artista (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  fecha_nacimiento DATE,
  fecha_muerte DATE,
  historia_vida TEXT,
  genero_id INT,
  FOREIGN KEY (genero_id) REFERENCES Genero(id)
);

-- Tabla Estilo
CREATE TABLE Estilo (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

-- Tabla Técnica
CREATE TABLE Tecnica (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

-- Tabla Estilo_Tecnica (Tabla intermedia para la relación N:M entre Estilo y Técnica)
CREATE TABLE Estilo_Tecnica (
  estilo_id INT,
  tecnica_id INT,
  PRIMARY KEY (estilo_id, tecnica_id),
  FOREIGN KEY (estilo_id) REFERENCES Estilo(id),
  FOREIGN KEY (tecnica_id) REFERENCES Tecnica(id)
);

-- Tabla ObraFamosa
CREATE TABLE ObraFamosa (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  anio INT,
  estilo_id INT,
  artista_id INT,
  FOREIGN KEY (estilo_id) REFERENCES Estilo(id),
  FOREIGN KEY (artista_id) REFERENCES Artista(id)
);
