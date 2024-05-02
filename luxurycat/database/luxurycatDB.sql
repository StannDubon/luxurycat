DROP DATABASE if EXISTS luxury_cat_db
CREATE DATABASE luxury_cat_db;
USE luxury_cat_db;

/*

Creación de usuario administrador para la base de datos luxury_cat_db

mysql -u root -p
CREATE USER 'PurrCatmin'@'localhost' IDENTIFIED BY '$$$$MoneyMoneyMoney';
GRANT ALL PRIVILEGES ON luxury_cat_db.* TO 'PurrCatmin'@'localhost';
FLUSH PRIVILEGES;
EXIT;

*/

SELECT * FROM tb_tipos_admin
SELECT * FROM tb_administrador
SELECT * FROM tb_usuarios
SELECT * FROM tb_pedidos
SELECT * FROM tb_categorias
SELECT * FROM tb_marca
SELECT * FROM tb_productos
SELECT * FROM tb_detalles_pedidos
SELECT * FROM tb_comentarios


-- Creamos las tablas 
 
CREATE TABLE tb_tipos_admin(
tipo_admin_id INT PRIMARY KEY AUTO_INCREMENT,
tipo_admin_nombre VARCHAR(100) NOT NULL 
);

CREATE TABLE tb_administrador(
admin_id INT PRIMARY KEY AUTO_INCREMENT,
admin_nombre VARCHAR(100) NOT NULL,
admin_apellido VARCHAR(100) NOT NULL,
admin_usuario VARCHAR(100) NOT NULL,
admin_cotraseña VARCHAR(100) NOT NULL, 
admin_correo VARCHAR(100) NOT NULL, 
admin_estado VARCHAR(100) NOT NULL,
tipo_admin_id INT,
imagen_administrador VARCHAR(25)
);

CREATE TABLE tb_usuarios(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_nombre VARCHAR(100) NOT NULL,
usuario_apellido VARCHAR(100) NOT NULL,
usuario_usuario VARCHAR(100) NOT NULL,
usuario_contraseña VARCHAR(100) NOT NULL,
usuario_correo VARCHAR(100) NOT NULL,
usuario_estado boolean NOT NULL DEFAULT 1,
usuario_imagen VARCHAR (25) 
);

CREATE TABLE tb_pedidos(
pedido_id INT PRIMARY KEY AUTO_INCREMENT, 
usuario_id INT NOT NULL,
pedido_fechaEntrega DATE DEFAULT NOW() NOT NULL,
pedido_fechaSolicitud DATE DEFAULT NOW() NOT NULL,
pedido_direccion VARCHAR(200) NOT NULL,
pedido_estado BOOLEAN DEFAULT 1
);

CREATE TABLE tb_categorias(
categoria_id INT PRIMARY KEY AUTO_INCREMENT, 
categoria_nombre VARCHAR(200) NOT NULL,
categoria_descripcion VARCHAR(200) NOT NULL,
categoria_imagen VARCHAR(200) NOT NULL,
categoria_estado BOOLEAN DEFAULT 1
);

CREATE TABLE tb_marca(
marca_id INT PRIMARY KEY AUTO_INCREMENT, 
marca_nombre VARCHAR(200) NOT NULL,
marca_estado BOOLEAN DEFAULT 1
);

CREATE TABLE tb_productos(
producto_id INT PRIMARY KEY AUTO_INCREMENT, 
categoria_id INT NOT NULL,
marca_id INT NOT NULL,
producto_descripcion VARCHAR(200) NOT NULL,
producto_nombre VARCHAR(100) NOT NULL,
producto_precio NUMERIC(5, 2) CHECK (producto_precio >= 0),
producto_imagen VARCHAR(100),
producto_cantidad INT NOT NULL CHECK (producto_cantidad >= 0),
producto_estado BOOLEAN DEFAULT 1
);

CREATE TABLE tb_detalles_pedidos (
detalle_pedido_id INT PRIMARY KEY AUTO_INCREMENT,
producto_id INT NOT NULL,
pedido_id INT NOT NULL,
detalle_precio NUMERIC(5, 2) NOT NULL CHECK (detalle_precio >= 0), 
detalle_cantidad INT NOT NULL CHECK (detalle_cantidad >= 0)
);

CREATE TABLE tb_comentarios (
comentario_id INT PRIMARY KEY AUTO_INCREMENT,
detalle_pedido_id INT NOT NULL,
comentario_fecha DATE DEFAULT NOW() NOT NULL,
comentario_texto VARCHAR (250) NOT NULL,
comentario_estado boolean NOT NULL DEFAULT 0,
usuario_id INT
);

-- Creamos las restrincciones 
ALTER TABLE tb_administrador 
ADD CONSTRAINT admin_usuario UNIQUE (admin_usuario);

ALTER TABLE tb_administrador
ADD CONSTRAINT admin_correo UNIQUE(admin_correo);

ALTER TABLE tb_usuarios 
ADD CONSTRAINT usuario_correo UNIQUE (usuario_correo);

ALTER TABLE tb_usuarios
ADD CONSTRAINT usuario_usuario UNIQUE(usuario_usuario);



-- Creamos las llaves foraneas
ALTER TABLE tb_administrador 
ADD CONSTRAINT fk_admin_tipo 
FOREIGN KEY (tipo_admin_id) REFERENCES tb_tipos_admin (tipo_admin_id);

ALTER TABLE tb_pedidos 
ADD CONSTRAINT fk_usuario_pedidos 
FOREIGN KEY (usuario_id) REFERENCES tb_usuarios (usuario_id);

ALTER TABLE tb_productos 
ADD CONSTRAINT fk_producto_categoria 
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(categoria_id);

ALTER TABLE tb_productos 
ADD CONSTRAINT fk_producto_marca 
FOREIGN KEY (marca_id) REFERENCES tb_marca(marca_id);

ALTER TABLE tb_detalles_pedidos 
ADD CONSTRAINT fk_detalle_producto 
FOREIGN KEY (producto_id) REFERENCES tb_productos(producto_id);

ALTER TABLE tb_detalles_pedidos 
ADD CONSTRAINT fk_detalle_pedido 
FOREIGN KEY (pedido_id) REFERENCES tb_pedidos(pedido_id);

ALTER TABLE tb_comentarios 
ADD CONSTRAINT fk_comentario_detalle 
FOREIGN KEY (detalle_pedido_id) REFERENCES tb_detalles_pedidos(detalle_pedido_id);

ALTER TABLE tb_comentarios 
ADD CONSTRAINT fk_comentarios_usuarios 
FOREIGN KEY (usuario_id) REFERENCES tb_usuarios(usuario_id);