-- Función para devolver todos los pedidos hechos por un usuario
DELIMITER //

CREATE FUNCTION totalPedidosUsuario(usuario_id_param INT)
RETURNS INT
BEGIN
    DECLARE total_pedidos INT;
    
    SELECT COUNT(*) INTO total_pedidos
    FROM tb_pedidos
    WHERE usuario_id = usuario_id_param;
    
    RETURN total_pedidos;
END //

DELIMITER ;


-- Función para calcular el dinero invertido de un usuario en la página
DELIMITER //

CREATE FUNCTION totalComprasUsuario(usuario_id_param INT)
RETURNS NUMERIC(10, 2)
BEGIN
    DECLARE total_compras NUMERIC(10, 2);
    
    SELECT SUM(dp.detalle_precio * dp.detalle_cantidad) INTO total_compras
    FROM tb_pedidos p
    JOIN tb_detalles_pedidos dp ON p.pedido_id = dp.pedido_id
    WHERE p.usuario_id = usuario_id_param;
    
    RETURN total_compras;
END //

DELIMITER ;

-- Trigger para agregar la fecha de solicitud automáticamente
DELIMITER //

CREATE TRIGGER actualizaFechaSolicitud
BEFORE INSERT ON tb_pedidos
FOR EACH ROW
BEGIN
    SET NEW.pedido_fechaSolicitud = NOW();
END //

DELIMITER ;

-- Procedimiento para establecer un pedido como entregado cuando se reciba
DELIMITER //

CREATE PROCEDURE marcarPedidoEntregado(pedido_id_param INT)
BEGIN
    UPDATE tb_pedidos
    SET pedido_fechaEntrega = NOW()
    WHERE pedido_id = pedido_id_param;
END //

DELIMITER ;

-- Procedimiento para actualizar inventario de productos
DELIMITER //

CREATE PROCEDURE actualizarStockProducto(IN producto_id_param INT, IN cantidad_param INT)
BEGIN
    UPDATE tb_productos
    SET producto_cantidad = producto_cantidad - cantidad_param
    WHERE producto_id = producto_id_param;
END //

DELIMITER ;


-- FUNCIONES PARA LA INSERCIÓN

-- Función para insertar datos en tb_tipos_admin
DELIMITER //

CREATE PROCEDURE InsertarTipoAdmin(nombre_tipo VARCHAR(100))
BEGIN
    INSERT INTO tb_tipos_admin (tipo_admin_nombre) VALUES (nombre_tipo);
END //

DELIMITER ;


-- Función para insertar datos en tb_administrador
DELIMITER //
CREATE PROCEDURE InsertarAdministrador(nombre VARCHAR(100), apellido VARCHAR(100), usuario VARCHAR(100), contraseña VARCHAR(100), correo VARCHAR(100), estado VARCHAR(100), tipo_admin_id INT, imagen_administrador VARCHAR(25))
BEGIN
    INSERT INTO tb_administrador(admin_nombre, admin_apellido, admin_usuario, admin_cotraseña, admin_correo, admin_estado, tipo_admin_id, imagen_administrador)
    VALUES (nombre, apellido, usuario, contraseña, correo, estado, tipo_admin_id, imagen_administrador);
END //
DELIMITER ;


-- Función para insertar datos en tb_usuarios
DELIMITER //

CREATE PROCEDURE InsertarUsuario(nombre VARCHAR(100), apellido VARCHAR(100), usuario VARCHAR(100), contraseña VARCHAR(100), correo VARCHAR(100), estado BOOLEAN, imagen VARCHAR(25))
BEGIN
    INSERT INTO tb_usuarios (usuario_nombre, usuario_apellido, usuario_usuario, usuario_contraseña, usuario_correo, usuario_estado, usuario_imagen)
    VALUES (nombre, apellido, usuario, contraseña, correo, estado, imagen);
END //

DELIMITER ;


-- Función para insertar datos en tb_pedidos
DELIMITER //

CREATE PROCEDURE InsertarPedido(usuario_id INT, fecha_entrega DATE, fecha_solicitud DATE, direccion VARCHAR(200), estado BOOLEAN)
BEGIN
    INSERT INTO tb_pedidos (usuario_id, pedido_fechaEntrega, pedido_fechaSolicitud, pedido_direccion, pedido_estado)
    VALUES (usuario_id, fecha_entrega, fecha_solicitud, direccion, estado);
END //

DELIMITER ;


-- Función para insertar datos en tb_categorias
DELIMITER //

CREATE PROCEDURE InsertarCategoria(nombre VARCHAR(200), descripcion VARCHAR(200), imagen VARCHAR(200), estado BOOLEAN)
BEGIN
    INSERT INTO tb_categorias (categoria_nombre, categoria_descripcion, categoria_imagen, categoria_estado)
    VALUES (nombre, descripcion, imagen, estado);
END //

DELIMITER ;


-- Función para insertar datos en tb_marca
DELIMITER //

CREATE PROCEDURE InsertarMarca(nombre VARCHAR(200), estado BOOLEAN)
BEGIN
    INSERT INTO tb_marca (marca_nombre, marca_estado)
    VALUES (nombre, estado);
END //

DELIMITER ;


-- Función para insertar datos en tb_productos
DELIMITER //

CREATE PROCEDURE InsertarProducto(categoria_id INT, marca_id INT, descripcion VARCHAR(200), nombre VARCHAR(100), precio NUMERIC(5, 2), imagen VARCHAR(100), cantidad INT, estado BOOLEAN)
BEGIN
    INSERT INTO tb_productos (categoria_id, marca_id, producto_descripcion, producto_nombre, producto_precio, producto_imagen, producto_cantidad, producto_estado)
    VALUES (categoria_id, marca_id, descripcion, nombre, precio, imagen, cantidad, estado);
END //

DELIMITER ;


-- Función para insertar datos en tb_detalles_pedidos
DELIMITER //

CREATE PROCEDURE InsertarDetallePedido(producto_id INT, pedido_id INT, precio NUMERIC(5, 2), cantidad INT)
BEGIN
    INSERT INTO tb_detalles_pedidos (producto_id, pedido_id, detalle_precio, detalle_cantidad)
    VALUES (producto_id, pedido_id, precio, cantidad);
END //

DELIMITER ;


-- Función para insertar datos en tb_comentarios
DELIMITER //

CREATE PROCEDURE InsertarComentario(detalle_pedido_id INT, fecha DATE, texto VARCHAR(250), estado BOOLEAN, usuario_id INT)
BEGIN
    INSERT INTO tb_comentarios (detalle_pedido_id, comentario_fecha, comentario_texto, comentario_estado, usuario_id)
    VALUES (detalle_pedido_id, fecha, texto, estado, usuario_id);
END //

DELIMITER ;