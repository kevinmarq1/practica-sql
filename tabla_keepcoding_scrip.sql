-- Crear tabla Alumnos
CREATE TABLE Alumnos (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);

-- Crear tabla Bootcamps
CREATE TABLE Bootcamps (
    id_bootcamp SERIAL PRIMARY KEY,
    nombre_bootcamp VARCHAR(100) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    precio DECIMAL(10, 2)
);

-- Crear tabla Módulos
CREATE TABLE Modulos (
    id_modulo SERIAL PRIMARY KEY,
    nombre_modulo VARCHAR(100) NOT NULL,
    id_bootcamp INT NOT NULL,
    id_profesor INT NOT NULL,
    duracion INT,
    FOREIGN KEY (id_bootcamp) REFERENCES Bootcamps(id_bootcamp),
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor)
);

-- Crear tabla Profesores
CREATE TABLE Profesores (
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    especialidad VARCHAR(100)
);

-- Crear tabla Inscripciones
CREATE TABLE Inscripciones (
    id_alumno INT NOT NULL,
    id_bootcamp INT NOT NULL,
    fecha_inscripcion DATE,
    PRIMARY KEY (id_alumno, id_bootcamp),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_bootcamp) REFERENCES Bootcamps(id_bootcamp)
);
