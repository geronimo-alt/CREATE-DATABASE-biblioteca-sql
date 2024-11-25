CREATE DATABASE biblioteca ;
Show DATABASES;
USE biblioteca;

CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    creado_el TIMESTAMP DEFAULT NOW(),
    actualizado_el TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    estado TINYINT DEFAULT 1
);

CREATE TABLE Generos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_libro VARCHAR(100) NOT NULL,
    autor VARCHAR(100),
    fecha_lanzamiento DATE,
    id_genero INT,
    creado_el TIMESTAMP DEFAULT NOW(),
    actualizado_el TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    estado TINYINT DEFAULT 1,
    CONSTRAINT fk_libros_genero FOREIGN KEY (id_genero) REFERENCES Generos(id)
);
CREATE TABLE Prestamos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    libro_id INT,
    fecha_prestamo TIMESTAMP DEFAULT NOW(),
    fecha_devolucion_estimada TIMESTAMP,
    fecha_devolucion_real TIMESTAMP,
    CONSTRAINT fk_prestamos_usuario FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    CONSTRAINT fk_prestamos_libro FOREIGN KEY (libro_id) REFERENCES Libros(id)
);
