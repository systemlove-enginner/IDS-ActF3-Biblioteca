-- 1. Selección de base de datos
USE biblioteca;

-- 2. Borrar tablas existentes para aplicar los nuevos cambios (ELIMINAR EN ESTE ORDEN)
DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS revistas;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS alumnos;

-- 3. Crear Tabla Alumnos
CREATE TABLE alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

-- 4. Crear Tabla Libros
CREATE TABLE libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    prestado BOOLEAN DEFAULT FALSE
);

-- 5. Crear Tabla Revistas (Aquí ya se incluirá mes_publicacion)
CREATE TABLE revistas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    numero_edicion INT,
    mes_publicacion VARCHAR(20),
    prestado BOOLEAN DEFAULT FALSE
);

-- 6. Crear Tabla Préstamos (Relacionada con los nuevos IDs)
CREATE TABLE prestamos (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    id_libro INT NULL,
    id_revista INT NULL,
    fecha_prestamo DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_revista) REFERENCES revistas(id)
);

-- 7. Insertar datos de prueba
INSERT INTO alumnos (nombre) VALUES ('Jael Perales'), ('Ana Bajo'), ('Luis Castro');
INSERT INTO libros (titulo, autor) VALUES ('Java a Fondo', 'Pablo Sznajdleder');
INSERT INTO revistas (titulo, numero_edicion, mes_publicacion) VALUES ('National Geographic', 254, 'Marzo');

-- 8. Ver resultados
SELECT * FROM alumnos;
SELECT * FROM revistas;
SHOW TABLES;