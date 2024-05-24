-- Inserciones en tb_usuarios
USE luxury_cat_db
	
	INSERT INTO tb_usuarios (usuario_nombre, usuario_apellido, usuario_usuario, usuario_contraseña, usuario_correo, usuario_estado)
	VALUES 
	('Jose', 'Molina', 'jmolina', 'password1', 'jose.molina@example.com', 1),
	('Raquel', 'Nunez', 'rnunez', 'password2', 'raquel.nunez@example.com', 1),
	('Antonio', 'Gil', 'agil', 'password3', 'antonio.gil@example.com', 1),
	('Patricia', 'Ramos', 'pramos', 'password4', 'patricia.ramos@example.com', 1),
	('Francisco', 'Serrano', 'fserrano', 'password5', 'francisco.serrano@example.com', 1),
	('Veronica', 'Fuentes', 'vfuentes', 'password6', 'veronica.fuentes@example.com', 1),
	('Ricardo', 'Aguirre', 'raguirre', 'password7', 'ricardo.aguirre@example.com', 1),
	('Susana', 'Vega', 'svega', 'password8', 'susana.vega@example.com', 1),
	('Ramon', 'Carrillo', 'rcarrillo', 'password9', 'ramon.carrillo@example.com', 1),
	('Gabriela', 'Mendez', 'gmendez', 'password10', 'gabriela.mendez@example.com', 1),
	('Hugo', 'Cabrera', 'hcabrera', 'password11', 'hugo.cabrera@example.com', 1),
	('Adriana', 'Mora', 'amora', 'password12', 'adriana.mora@example.com', 1),
	('Eduardo', 'Paredes', 'eparedes', 'password13', 'eduardo.paredes@example.com', 1),
	('Carolina', 'Herrera', 'cherrera', 'password14', 'carolina.herrera@example.com', 1),
	('Mario', 'Lara', 'mlara', 'password15', 'mario.lara@example.com', 1),
	('Natalia', 'Rios', 'nrios', 'password16', 'natalia.rios@example.com', 1),
	('Alejandro', 'Navarro', 'anavarro', 'password17', 'alejandro.navarro@example.com', 1),
	('Marta', 'Leon', 'mleon', 'password18', 'marta.leon@example.com', 1),
	('Diego', 'Cortes', 'dcortes', 'password19', 'diego.cortes@example.com', 1),
	('Rosa', 'Guerrero', 'rguerrero', 'password20', 'rosa.guerrero@example.com', 1),
	('Jaime', 'Campos', 'jcampos', 'password21', 'jaime.campos@example.com', 1),
	('Silvia', 'Figueroa', 'sfigueroa', 'password22', 'silvia.figueroa@example.com', 1),
	('Victor', 'Peña', 'vpena', 'password23', 'victor.pena@example.com', 1),
	('Monica', 'Rojas', 'mrojas', 'password24', 'monica.rojas@example.com', 1),
	('Arturo', 'Ruiz', 'aruiz', 'password25', 'arturo.ruiz@example.com', 1);
	
	-- Inserciones en tb_pedidos
	INSERT INTO tb_pedidos (usuario_id, pedido_fechaEntrega, pedido_fechaSolicitud, pedido_direccion, pedido_estado)
	VALUES 
	(1, '2024-06-01', '2024-05-15', 'Calle 123, Ciudad', 1),
	(2, '2024-06-02', '2024-05-16', 'Avenida 456, Ciudad', 1),
	(3, '2024-06-03', '2024-05-17', 'Plaza 789, Ciudad', 1),
	(4, '2024-06-04', '2024-05-18', 'Calle 321, Ciudad', 1),
	(5, '2024-06-05', '2024-05-19', 'Avenida 654, Ciudad', 1),
	(6, '2024-06-06', '2024-05-20', 'Plaza 987, Ciudad', 1),
	(7, '2024-06-07', '2024-05-21', 'Calle 213, Ciudad', 1),
	(8, '2024-06-08', '2024-05-22', 'Avenida 546, Ciudad', 1),
	(9, '2024-06-09', '2024-05-23', 'Plaza 879, Ciudad', 1),
	(10, '2024-06-10', '2024-05-24', 'Calle 132, Ciudad', 1),
	(11, '2024-06-11', '2024-05-25', 'Avenida 465, Ciudad', 1),
	(12, '2024-06-12', '2024-05-26', 'Plaza 798, Ciudad', 1),
	(13, '2024-06-13', '2024-05-27', 'Calle 231, Ciudad', 1),
	(14, '2024-06-14', '2024-05-28', 'Avenida 564, Ciudad', 1),
	(15, '2024-06-15', '2024-05-29', 'Plaza 987, Ciudad', 1),
	(16, '2024-06-16', '2024-05-30', 'Calle 312, Ciudad', 1),
	(17, '2024-06-17', '2024-05-31', 'Avenida 645, Ciudad', 1),
	(18, '2024-06-18', '2024-06-01', 'Plaza 798, Ciudad', 1),
	(19, '2024-06-19', '2024-06-02', 'Calle 321, Ciudad', 1),
	(20, '2024-06-20', '2024-06-03', 'Avenida 654, Ciudad', 1),
	(21, '2024-06-21', '2024-06-04', 'Plaza 987, Ciudad', 1),
	(22, '2024-06-22', '2024-06-05', 'Calle 123, Ciudad', 1),
	(23, '2024-06-23', '2024-06-06', 'Avenida 456, Ciudad', 1),
	(24, '2024-06-24', '2024-06-07', 'Plaza 789, Ciudad', 1),
	(25, '2024-06-25', '2024-06-08', 'Calle 321, Ciudad', 1);
	
	-- Inserciones en tb_categorias
	INSERT INTO tb_categorias (categoria_nombre, categoria_descripcion, categoria_estado)
	VALUES 
	('Electrónica', 'Dispositivos electrónicos y gadgets', 1),
	('Ropa', 'Vestimenta y accesorios de moda', 1),
	('Hogar', 'Artículos para el hogar y decoración', 1),
	('Juguetes', 'Juguetes y juegos para niños', 1),
	('Deportes', 'Artículos deportivos y equipos', 1),
	('Libros', 'Libros y material de lectura', 1),
	('Música', 'Instrumentos musicales y accesorios', 1),
	('Joyería', 'Joyería y bisutería', 1),
	('Belleza', 'Productos de belleza y cuidado personal', 1),
	('Alimentos', 'Productos alimenticios y bebidas', 1),
	('Herramientas', 'Herramientas y equipo de trabajo', 1),
	('Mascotas', 'Artículos para mascotas', 1),
	('Salud', 'Productos de salud y bienestar', 1),
	('Jardinería', 'Artículos para jardín y exteriores', 1),
	('Automotriz', 'Productos y accesorios para automóviles', 1),
	('Papelería', 'Artículos de oficina y papelería', 1),
	('Videojuegos', 'Consolas y juegos de video', 1),
	('Electrodomésticos', 'Electrodomésticos y línea blanca', 1),
	('Oficina', 'Muebles y suministros de oficina', 1),
	('Fotografía', 'Cámaras y accesorios de fotografía', 1),
	('Computación', 'Equipos y accesorios de computación', 1),
	('Telefonía', 'Teléfonos y accesorios', 1),
	('Cine y TV', 'Películas y series de televisión', 1),
	('Viajes', 'Artículos para viajes y maletas', 1),
	('Relojes', 'Relojes y cronómetros', 1);
	
	-- Inserciones en tb_marcas
	INSERT INTO tb_marcas (marca_nombre, marca_estado)
	VALUES 
	('Sony', 1),
	('Samsung', 1),
	('Apple', 1),
	('LG', 1),
	('Dell', 1),
	('HP', 1),
	('Nike', 1),
	('Adidas', 1),
	('Puma', 1),
	('Under Armour', 1),
	('Bosch', 1),
	('DeWalt', 1),
	('Makita', 1),
	('Black & Decker', 1),
	('Casio', 1),
	('Seiko', 1),
	('Rolex', 1),
	('Omega', 1),
	('Fossil', 1),
	('Citizen', 1),
	('Ray-Ban', 1),
	('Oakley', 1),
	('Gucci', 1),
	('Prada', 1),
	('Chanel', 1);
	
	-- Inserciones en tb_productos
	INSERT INTO tb_productos (categoria_id, marca_id, producto_descripcion, producto_nombre, producto_precio, producto_imagen, producto_cantidad, producto_estado)
	VALUES 
	(1, 1, 'Televisor LED de 50 pulgadas', 'Televisor Sony', 499.99, 'tv_sony.jpg', 50, 1),
	(2, 2, 'Camiseta deportiva', 'Camiseta Adidas', 29.99, 'camiseta_adidas.jpg', 200, 1),
	(3, 3, 'Sofá de 3 plazas', 'Sofá', 599.99, 'sofa.jpg', 10, 1),
	(4, 4, 'Muñeca de trapo', 'Muñeca', 19.99, 'muneca.jpg', 100, 1),
	(5, 5, 'Balón de fútbol', 'Balón Nike', 24.99, 'balon_nike.jpg', 150, 1),
	(6, 6, 'Libro de ciencia ficción', 'Libro', 14.99, 'libro.jpg', 300, 1),
	(7, 7, 'Guitarra acústica', 'Guitarra', 129.99, 'guitarra.jpg', 30, 1),
	(8, 8, 'Anillo de plata', 'Anillo', 49.99, 'anillo.jpg', 60, 1),
	(9, 9, 'Crema hidratante', 'Crema', 19.99, 'crema.jpg', 100, 1),
	(10, 10, 'Caja de galletas', 'Galletas', 9.99, 'galletas.jpg', 500, 1),
	(11, 11, 'Taladro inalámbrico', 'Taladro', 79.99, 'taladro.jpg', 40, 1),
	(12, 12, 'Correa para perro', 'Correa', 14.99, 'correa.jpg', 120, 1),
	(13, 13, 'Suplemento vitamínico', 'Vitaminas', 24.99, 'vitaminas.jpg', 200, 1),
	(14, 14, 'Maceta decorativa', 'Maceta', 29.99, 'maceta.jpg', 70, 1),
	(15, 15, 'Aceite para motor', 'Aceite', 39.99, 'aceite.jpg', 90, 1),
	(16, 16, 'Cuaderno de notas', 'Cuaderno', 4.99, 'cuaderno.jpg', 600, 1),
	(17, 17, 'Videojuego de acción', 'Videojuego', 59.99, 'videojuego.jpg', 150, 1),
	(18, 18, 'Refrigerador', 'Refrigerador', 899.99, 'refrigerador.jpg', 20, 1),
	(19, 19, 'Escritorio de oficina', 'Escritorio', 199.99, 'escritorio.jpg', 30, 1),
	(20, 20, 'Cámara digital', 'Cámara', 349.99, 'camara.jpg', 50, 1),
	(21, 21, 'Laptop para juegos', 'Laptop', 199.99, 'laptop.jpg', 25, 1),
	(22, 22, 'Teléfono inteligente', 'Teléfono', 799.99, 'telefono.jpg', 40, 1),
	(23, 23, 'Blu-ray de película', 'Blu-ray', 19.99, 'bluray.jpg', 200, 1),
	(24, 24, 'Maleta de viaje', 'Maleta', 69.99, 'maleta.jpg', 100, 1),
	(25, 25, 'Reloj de pulsera', 'Reloj', 199.99, 'reloj.jpg', 80, 1);
	
	-- Inserciones en tb_detalles_pedidos
	INSERT INTO tb_detalles_pedidos (producto_id, pedido_id, detalle_precio, detalle_cantidad)
	VALUES 
	(1, 1, 499.99, 1),
	(2, 2, 29.99, 2),
	(3, 3, 599.99, 1),
	(4, 4, 19.99, 3),
	(5, 5, 24.99, 2),
	(6, 6, 14.99, 4),
	(7, 7, 129.99, 1),
	(8, 8, 49.99, 2),
	(9, 9, 19.99, 3),
	(10, 10, 9.99, 5),
	(11, 11, 79.99, 1),
	(12, 12, 14.99, 4),
	(13, 13, 24.99, 2),
	(14, 14, 29.99, 2),
	(15, 15, 39.99, 1),
	(16, 16, 4.99, 10),
	(17, 17, 59.99, 1),
	(18, 18, 899.99, 1),
	(19, 19, 199.99, 1),
	(20, 20, 349.99, 1),
	(21, 21, 199.99, 1),
	(22, 22, 799.99, 1),
	(23, 23, 19.99, 3),
	(24, 24, 69.99, 2),
	(25, 25, 199.99, 1);
	
	-- Inserciones en tb_comentarios
	INSERT INTO tb_comentarios (detalle_pedido_id, comentario_fecha, comentario_texto, comentario_estado, usuario_id)
	VALUES 
	(1, '2024-05-16', 'Producto excelente, muy recomendable.', 1, 1),
	(2, '2024-05-17', 'Llegó en buen estado y a tiempo.', 1, 2),
	(3, '2024-05-18', 'El sofá es muy cómodo, estoy satisfecho.', 1, 3),
	(4, '2024-05-19', 'La muñeca es bonita pero esperaba mejor calidad.', 0, 4),
	(5, '2024-05-20', 'Balón perfecto para jugar con amigos.', 1, 5),
	(6, '2024-05-21', 'Libro interesante, recomendado.', 1, 6),
	(7, '2024-05-22', 'Buena guitarra, sonido excelente.', 1, 7),
	(8, '2024-05-23', 'Anillo muy bonito, a mi pareja le encantó.', 1, 8),
	(9, '2024-05-24', 'Crema hidratante de buena calidad.', 1, 9),
	(10, '2024-05-25', 'Galletas deliciosas, me encantaron.', 1, 10),
	(11, '2024-05-26', 'El taladro es muy potente y útil.', 1, 11),
	(12, '2024-05-27', 'Correa de perro resistente y cómoda.', 1, 12),
	(13, '2024-05-28', 'Vitaminas efectivas, me siento mejor.', 1, 13),
	(14, '2024-05-29', 'Maceta decorativa muy bonita.', 1, 14),
	(15, '2024-05-30', 'Aceite de motor de buena calidad.', 1, 15),
	(16, '2024-05-31', 'Cuaderno de notas práctico.', 1, 16),
	(17, '2024-06-01', 'Videojuego emocionante, muy divertido.', 1, 17),
	(18, '2024-06-02', 'Refrigerador espacioso y eficiente.', 1, 18),
	(19, '2024-06-03', 'Escritorio cómodo y de buen diseño.', 1, 19),
	(20, '2024-06-04', 'Cámara digital con buena resolución.', 1, 20),
	(21, '2024-06-05', 'Laptop para juegos, muy potente.', 1, 21),
	(22, '2024-06-06', 'Teléfono inteligente rápido y eficiente.', 1, 22),
	(23, '2024-06-07', 'Blu-ray de película, buena calidad.', 1, 23),
	(24, '2024-06-08', 'Maleta de viaje espaciosa y resistente.', 1, 24),
	(25, '2024-06-09', 'Reloj de pulsera elegante y funcional.', 1, 25);
