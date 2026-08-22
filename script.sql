CREATE DATABASE IF NOT EXISTS MiniMercadoDB;
USE MiniMercadoDB;
CREATE TABLE Productos(
	id_Producto int AUTO_INCREMENT PRIMARY KEY,
    codigo_barras varchar(100) UNIQUE NOT NULL,
    nombre varchar(100) NOT NULL,
    precio_unitario decimal(10,2) CHECK (precio_unitario >= 0),
    stock int CHECK (stock >= 0),
    categoria varchar(100)
);
CREATE TABLE Ventas(
	id_Venta int AUTO_INCREMENT PRIMARY KEY,
    fecha_hora datetime DEFAULT CURRENT_TIMESTAMP,
    subtotal decimal(10,2) NOT NULL,
    iva decimal(10,2) NOT NULL,
    total decimal(10,2) NOT NULL
);
CREATE TABLE DetalleVentas(
	id_Detalle int AUTO_INCREMENT PRIMARY KEY,
    id_Venta int NOT NULL,
    id_Producto int NOT NULL,
    cantidad int CHECK (cantidad > 0),
    precio_unitario decimal(10,2) CHECK (precio_unitario >= 0),
    subtotal_linea decimal(10,2) NOT NULL,
    FOREIGN KEY(id_Venta) REFERENCES Ventas(id_Venta),
    FOREIGN KEY(id_Producto) REFERENCES Productos(id_Producto)
);
INSERT INTO Productos(codigo_barras, nombre, precio_unitario, stock, categoria)VALUES
	('186543', 'Huevo', 500.50, 20, 'Huevos Frescos'),
    ('132345', 'Carne', 4000.00, 12, 'Carnes'),
    ('159546', 'Pescado', 8000.00, 8, 'Carnes'),
    ('122543', 'Leche', 3000.00, 20, 'Lacteos'),
    ('106573', 'Arroz', 6500.00, 15, 'Granos');
SELECT * FROM Productos;    