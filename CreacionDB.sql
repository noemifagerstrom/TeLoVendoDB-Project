-- Crear la base de datos
CREATE DATABASE TeLoVendoDB;
USE TeLoVendoDB;

-- Crear tabla de proveedores
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_representante VARCHAR(100),
    nombre_corporativo VARCHAR(100),
    telefono1 VARCHAR(15),
    contacto1 VARCHAR(100),
    telefono2 VARCHAR(15),
    contacto2 VARCHAR(100),
    categoria VARCHAR(50),
    email_factura VARCHAR(100)
);

-- Crear tabla de clientes
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    direccion VARCHAR(200)
);

-- Crear tabla de productos
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10, 2),
    categoria VARCHAR(50),
    color VARCHAR(30),
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Crear tabla de stock
CREATE TABLE Stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);
-- Insertar proveedores
INSERT INTO Proveedor (nombre_representante, nombre_corporativo, telefono1, contacto1, telefono2, contacto2, categoria, email_factura) VALUES
('Juan Perez', 'Electronica SA', '123456789', 'Ana Gomez', '987654321', 'Carlos Ruiz', 'Electronica', 'facturacion@electronicasa.com'),
('Maria Martinez', 'CompuTech Ltd.', '234567890', 'Josefa Lopez', '876543210', 'Miguel Silva', 'Computacion', 'facturacion@computech.com'),
('Pedro Fernandez', 'Hogar y Más', '345678901', 'Luis Torres', '765432109', 'Clara Mendoza', 'Hogar', 'facturacion@hogarymas.com'),
('Luisa Gonzalez', 'Tienda del Juguete', '456789012', 'Patricia Vega', '654321098', 'Diana Suarez', 'Juguetes', 'facturacion@tiendadeljuguete.com'),
('Ricardo Gomez', 'Electro Mundo', '567890123', 'Ramiro Quintero', '543210987', 'Monica Paredes', 'Electronica', 'facturacion@electromundo.com');

-- Insertar clientes
INSERT INTO Cliente (nombre, apellido, direccion) VALUES
('Jose', 'Dominguez', 'Av. Siempre Viva 123'),
('Ana', 'Gutierrez', 'Calle Falsa 456'),
('Carlos', 'Ramirez', 'Paseo del Prado 789'),
('Luisa', 'Martinez', 'Av. Las Palmas 101'),
('Miguel', 'Sanchez', 'Camino Real 202');

-- Insertar productos
INSERT INTO Producto (nombre_producto, precio, categoria, color, id_proveedor) VALUES
('Laptop', 800.00, 'Electronica', 'Negro', 1),
('Tablet', 300.00, 'Computacion', 'Blanco', 2),
('Telefono Inteligente', 500.00, 'Electronica', 'Azul', 1),
('Aspiradora', 150.00, 'Hogar', 'Rojo', 3),
('Batidora', 80.00, 'Hogar', 'Blanco', 3),
('Juguete Educativo', 40.00, 'Juguetes', 'Multicolor', 4),
('Dron', 200.00, 'Electronica', 'Negro', 5),
('Consola de Videojuegos', 400.00, 'Electronica', 'Negro', 1),
('Impresora 3D', 600.00, 'Computacion', 'Blanco', 2),
('Auriculares Bluetooth', 50.00, 'Electronica', 'Negro', 5);

-- Insertar stock
INSERT INTO Stock (id_producto, cantidad) VALUES
(1, 50),
(2, 30),
(3, 60),
(4, 20),
(5, 100),
(6, 70),
(7, 10),
(8, 15),
(9, 5),
(10, 90);

-- Cambiar la categoría de productos más popular por 'Electrónica y computación':
UPDATE Producto
SET categoria = 'Electrónica y computación'
WHERE categoria = (
    SELECT categoria
    FROM (
        SELECT categoria, COUNT(*) AS total
        FROM Producto
        GROUP BY categoria
        ORDER BY total DESC
        LIMIT 1
    ) AS subquery
);
