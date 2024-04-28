-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: luxury_cat_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_administrador`
--

DROP TABLE IF EXISTS `tb_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_administrador` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_nombre` varchar(100) NOT NULL,
  `admin_apellido` varchar(100) NOT NULL,
  `admin_usuario` varchar(100) NOT NULL,
  `admin_cotraseña` varchar(100) NOT NULL,
  `admin_correo` varchar(100) NOT NULL,
  `admin_estado` varchar(100) NOT NULL,
  `tipo_admin_id` int(11) DEFAULT NULL,
  `imagen_administrador` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_usuario` (`admin_usuario`),
  UNIQUE KEY `admin_correo` (`admin_correo`),
  KEY `fk_admin_tipo` (`tipo_admin_id`),
  CONSTRAINT `fk_admin_tipo` FOREIGN KEY (`tipo_admin_id`) REFERENCES `tb_tipos_admin` (`tipo_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_administrador`
--

LOCK TABLES `tb_administrador` WRITE;
/*!40000 ALTER TABLE `tb_administrador` DISABLE KEYS */;
INSERT INTO `tb_administrador` VALUES (1,'Juan','Pérez','juan.admin','password123','juan@admin.com','activo',1,'juan.jpg'),(2,'Ana','Gómez','ana.admin','securepass','ana@admin.com','activo',2,'ana.jpg'),(3,'Carlos','Martínez','carlos.admin','password123','carlos@admin.com','activo',3,'carlos.jpg'),(4,'Sofía','Rodríguez','sofia.admin','securepass','sofia@admin.com','activo',4,'sofia.jpg'),(5,'María','López','maria.admin','password123','maria@admin.com','activo',5,'maria.jpg'),(6,'Pedro','González','pedro.admin','securepass','pedro@admin.com','activo',6,'pedro.jpg'),(7,'Laura','Díaz','laura.admin','password123','laura@admin.com','activo',7,'laura.jpg'),(8,'Javier','Hernández','javier.admin','securepass','javier@admin.com','activo',8,'javier.jpg'),(9,'Marta','Martínez','marta.admin','password123','marta@admin.com','activo',9,'marta.jpg'),(10,'David','Pérez','david.admin','securepass','david@admin.com','activo',10,'david.jpg'),(11,'Carmen','Gómez','carmen.admin','password123','carmen@admin.com','activo',11,'carmen.jpg'),(12,'Daniel','Rodríguez','daniel.admin','securepass','daniel@admin.com','activo',12,'daniel.jpg'),(13,'Ana','López','ana.l.admin','password123','anal@admin.com','activo',13,'ana-l.jpg'),(14,'Roberto','González','roberto.admin','securepass','roberto@admin.com','activo',14,'roberto.jpg'),(15,'Sara','Díaz','sara.admin','password123','sara@admin.com','activo',15,'sara.jpg'),(16,'Miguel','Hernández','miguel.admin','securepass','miguel@admin.com','activo',16,'miguel.jpg'),(17,'Natalia','Martínez','natalia.admin','password123','natalia@admin.com','activo',17,'natalia.jpg'),(18,'Eduardo','Pérez','eduardo.admin','securepass','eduardo@admin.com','activo',18,'eduardo.jpg'),(19,'Alicia','Gómez','alicia.admin','password123','alicia@admin.com','activo',19,'alicia.jpg'),(20,'Raúl','Rodríguez','raul.admin','securepass','raul@admin.com','activo',20,'raul.jpg'),(21,'Cristina','López','cristina.admin','password123','cristina@admin.com','activo',21,'cristina.jpg'),(22,'Jorge','González','jorge.admin','securepass','jorge@admin.com','activo',22,'jorge.jpg'),(23,'Patricia','Díaz','patricia.admin','password123','patricia@admin.com','activo',23,'patricia.jpg'),(24,'Pablo','Hernández','pablo.admin','securepass','pablo@admin.com','activo',24,'pablo.jpg'),(25,'María','Martínez','maria.m.admin','password123','maria-m@admin.com','activo',25,'maria-m.jpg');
/*!40000 ALTER TABLE `tb_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categorias`
--

DROP TABLE IF EXISTS `tb_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(200) NOT NULL,
  `categoria_descripcion` varchar(200) NOT NULL,
  `categoria_imagen` varchar(200) NOT NULL,
  `categoria_estado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categorias`
--

LOCK TABLES `tb_categorias` WRITE;
/*!40000 ALTER TABLE `tb_categorias` DISABLE KEYS */;
INSERT INTO `tb_categorias` VALUES (1,'Electrónica','Productos electrónicos','electronica.jpg',1),(2,'Ropa','Prendas de vestir','ropa.jpg',1),(3,'Hogar','Productos para el hogar','hogar.jpg',1),(4,'Deportes','Artículos deportivos','deportes.jpg',1),(5,'Alimentación','Productos alimenticios','alimentacion.jpg',1),(6,'Juguetes','Juguetes y juegos','juguetes.jpg',1),(7,'Belleza','Productos de belleza','belleza.jpg',1),(8,'Libros','Libros y literatura','libros.jpg',1),(9,'Electrodomésticos','Electrodomésticos para el hogar','electrodomesticos.jpg',1),(10,'Joyería','Joyas y accesorios','joyeria.jpg',1),(11,'Muebles','Muebles para el hogar','muebles.jpg',1),(12,'Salud','Productos de salud y cuidado personal','salud.jpg',1),(13,'Tecnología','Productos tecnológicos','tecnologia.jpg',1),(14,'Oficina','Suministros de oficina','oficina.jpg',1),(15,'Viajes','Artículos de viaje y equipaje','viajes.jpg',1),(16,'Instrumentos musicales','Instrumentos y equipo musical','musica.jpg',1),(17,'Automóviles','Accesorios y piezas para automóviles','automoviles.jpg',1),(18,'Arte','Obras de arte y suministros de arte','arte.jpg',1),(19,'Cine y TV','Películas y programas de televisión','cine.jpg',1),(20,'Decoración','Artículos de decoración para el hogar','decoracion.jpg',1),(21,'Mascotas','Suministros y accesorios para mascotas','mascotas.jpg',1),(22,'Software','Software y aplicaciones informáticas','software.jpg',1),(23,'Bebés','Productos para bebés y cuidado de niños pequeños','bebes.jpg',1),(24,'Plantas y jardinería','Plantas, semillas y suministros de jardinería','jardineria.jpg',1),(25,'Yanose quehacer cojnmivida','Niña pomponte, niña pomponte','pipipi.jpg',1);
/*!40000 ALTER TABLE `tb_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentarios` (
  `comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_pedido_id` int(11) NOT NULL,
  `comentario_fecha` date NOT NULL DEFAULT current_timestamp(),
  `comentario_texto` varchar(250) NOT NULL,
  `comentario_estado` tinyint(1) NOT NULL DEFAULT 0,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comentario_id`),
  KEY `fk_comentario_detalle` (`detalle_pedido_id`),
  KEY `fk_comentarios_usuarios` (`usuario_id`),
  CONSTRAINT `fk_comentario_detalle` FOREIGN KEY (`detalle_pedido_id`) REFERENCES `tb_detalles_pedidos` (`detalle_pedido_id`),
  CONSTRAINT `fk_comentarios_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuarios` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
INSERT INTO `tb_comentarios` VALUES (1,1,'2024-03-06','El producto llegó en perfectas condiciones',1,1),(2,2,'2024-03-07','Muy satisfecho con mi compra, gracias',1,2),(3,3,'2024-03-08','Excelente servicio al cliente',1,3),(4,4,'2024-03-09','Recomendaría esta tienda a mis amigos',1,4),(5,5,'2024-03-10','Entrega rápida y eficiente',1,5),(6,6,'2024-03-11','Producto de alta calidad',1,6),(7,7,'2024-03-12','Muy contento con mi compra',1,7),(8,8,'2024-03-13','Volveré a comprar aquí',1,8),(9,9,'2024-03-14','Producto tal como se describe',1,9),(10,10,'2024-03-15','Envío muy rápido',1,10),(11,11,'2024-03-16','Gran variedad de productos',1,11),(12,12,'2024-03-17','El mejor precio que encontré',1,12),(13,13,'2024-03-18','Atención al cliente excepcional',1,13),(14,14,'2024-03-19','Muy recomendado',1,14),(15,15,'2024-03-20','Producto llegó antes de lo esperado',1,15),(16,16,'2024-03-21','Fácil proceso de compra',1,16),(17,17,'2024-03-22','Muy feliz con mi compra',1,17),(18,18,'2024-03-23','Definitivamente compraré de nuevo',1,18),(19,19,'2024-03-24','¡Gracias por el excelente servicio!',1,19),(20,20,'2024-03-25','Muy buena calidad',1,20),(21,21,'2024-03-26','Proceso de pedido sencillo',1,21),(22,22,'2024-03-27','Producto exactamente como se muestra',1,22),(23,23,'2024-03-28','Entrega rápida y sin problemas',1,23),(24,24,'2024-03-29','Servicio al cliente atento',1,24),(25,25,'2024-03-30','Muy contento con la experiencia de compra',1,25);
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalles_pedidos`
--

DROP TABLE IF EXISTS `tb_detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalles_pedidos` (
  `detalle_pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `detalle_precio` decimal(5,2) NOT NULL CHECK (`detalle_precio` >= 0),
  `detalle_cantidad` int(11) NOT NULL CHECK (`detalle_cantidad` >= 0),
  PRIMARY KEY (`detalle_pedido_id`),
  KEY `fk_detalle_producto` (`producto_id`),
  KEY `fk_detalle_pedido` (`pedido_id`),
  CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `tb_pedidos` (`pedido_id`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `tb_productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalles_pedidos`
--

LOCK TABLES `tb_detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_detalles_pedidos` DISABLE KEYS */;
INSERT INTO `tb_detalles_pedidos` VALUES (1,1,1,299.99,1),(2,2,2,129.99,2),(3,3,3,599.99,1),(4,4,4,19.99,3),(5,5,5,499.99,1),(6,6,6,899.99,1),(7,7,7,199.99,2),(8,8,8,499.99,1),(9,9,9,999.99,1),(10,10,10,999.99,1),(11,11,11,89.99,2),(12,12,12,999.99,1),(13,13,13,999.99,1),(14,14,14,79.99,1),(15,15,15,799.99,1),(16,16,16,999.99,1),(17,17,17,999.99,1),(18,18,18,199.99,2),(19,19,19,249.99,1),(20,20,20,899.99,1),(21,21,21,999.99,1),(22,22,22,199.99,3),(23,23,23,999.99,1),(24,24,24,349.99,1),(25,25,25,499.99,1);
/*!40000 ALTER TABLE `tb_detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_marca`
--

DROP TABLE IF EXISTS `tb_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_marca` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(200) NOT NULL,
  `marca_estado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marca`
--

LOCK TABLES `tb_marca` WRITE;
/*!40000 ALTER TABLE `tb_marca` DISABLE KEYS */;
INSERT INTO `tb_marca` VALUES (1,'Sony',1),(2,'Nike',1),(3,'Samsung',1),(4,'Adidas',1),(5,'Apple',1),(6,'HP',1),(7,'Dell',1),(8,'Canon',1),(9,'Microsoft',1),(10,'LG',1),(11,'Puma',1),(12,'Lenovo',1),(13,'Asus',1),(14,'Philips',1),(15,'Panasonic',1),(16,'Fujitsu',1),(17,'Acer',1),(18,'Nokia',1),(19,'Motorola',1),(20,'Toshiba',1),(21,'Gucci',1),(22,'Chanel',1),(23,'Rolex',1),(24,'Bose',1),(25,'Sennheiser',1);
/*!40000 ALTER TABLE `tb_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedidos`
--

DROP TABLE IF EXISTS `tb_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedidos` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `pedido_fechaEntrega` date NOT NULL DEFAULT current_timestamp(),
  `pedido_fechaSolicitud` date NOT NULL DEFAULT current_timestamp(),
  `pedido_direccion` varchar(200) NOT NULL,
  `pedido_estado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`pedido_id`),
  KEY `fk_usuario_pedidos` (`usuario_id`),
  CONSTRAINT `fk_usuario_pedidos` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuarios` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedidos`
--

LOCK TABLES `tb_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_pedidos` DISABLE KEYS */;
INSERT INTO `tb_pedidos` VALUES (1,1,'2024-03-06','2024-03-06','Calle 123',1),(2,2,'2024-03-07','2024-03-06','Avenida 456',1),(3,3,'2024-03-08','2024-03-06','Rue 789',1),(4,4,'2024-03-09','2024-03-06','Street 101',1),(5,5,'2024-03-10','2024-03-06','Via 111',1),(6,6,'2024-03-11','2024-03-06','Strasse 222',1),(7,7,'2024-03-12','2024-03-06','Gasse 333',1),(8,8,'2024-03-13','2024-03-06','Boulevard 444',1),(9,9,'2024-03-14','2024-03-06','Plaza 555',1),(10,10,'2024-03-15','2024-03-06','Place 666',1),(11,11,'2024-03-16','2024-03-06','Piazza 777',1),(12,12,'2024-03-17','2024-03-06','Platz 888',1),(13,13,'2024-03-18','2024-03-06','Place 999',1),(14,14,'2024-03-19','2024-03-06','Place 1010',1),(15,15,'2024-03-20','2024-03-06','Place 1111',1),(16,16,'2024-03-21','2024-03-06','Place 1212',1),(17,17,'2024-03-22','2024-03-06','Place 1313',1),(18,18,'2024-03-23','2024-03-06','Place 1414',1),(19,19,'2024-03-24','2024-03-06','Place 1515',1),(20,20,'2024-03-25','2024-03-06','Place 1616',1),(21,21,'2024-03-26','2024-03-06','Place 1717',1),(22,22,'2024-03-27','2024-03-06','Place 1818',1),(23,23,'2024-03-28','2024-03-06','Place 1919',1),(24,24,'2024-03-29','2024-03-06','Place 2020',1),(25,25,'2024-03-30','2024-03-06','Place 2121',1);
/*!40000 ALTER TABLE `tb_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizaFechaSolicitud
BEFORE INSERT ON tb_pedidos
FOR EACH ROW
BEGIN
    SET NEW.pedido_fechaSolicitud = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_productos`
--

DROP TABLE IF EXISTS `tb_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productos` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `producto_descripcion` varchar(200) NOT NULL,
  `producto_nombre` varchar(100) NOT NULL,
  `producto_precio` decimal(5,2) DEFAULT NULL CHECK (`producto_precio` >= 0),
  `producto_imagen` varchar(100) DEFAULT NULL,
  `producto_cantidad` int(11) NOT NULL CHECK (`producto_cantidad` >= 0),
  `producto_estado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`producto_id`),
  KEY `fk_producto_categoria` (`categoria_id`),
  KEY `fk_producto_marca` (`marca_id`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `tb_categorias` (`categoria_id`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`marca_id`) REFERENCES `tb_marca` (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productos`
--

LOCK TABLES `tb_productos` WRITE;
/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
INSERT INTO `tb_productos` VALUES (1,1,1,'Smartphone de gama media','Xperia',299.99,'xperia.jpg',50,1),(2,2,2,'Zapatillas deportivas para correr','Air Max',129.99,'airmax.jpg',100,1),(3,3,3,'Televisor LED Full HD','Smart TV',599.99,'smarttv.jpg',30,1),(4,4,4,'Camiseta deportiva de algodón','Basic T-shirt',19.99,'tshirt.jpg',200,1),(5,5,5,'iPad Air','Tablet',499.99,'ipad.jpg',50,1),(6,6,6,'Portátil HP Pavilion','Laptop',899.99,'laptop.jpg',50,1),(7,7,7,'Monitor de 24 pulgadas','Full HD Monitor',199.99,'monitor.jpg',100,1),(8,8,8,'Cámara digital Canon','EOS Rebel',499.99,'camera.jpg',50,1),(9,9,9,'Microsoft Surface Pro','Tablet PC',999.99,'surface.jpg',30,1),(10,10,10,'Televisor OLED 4K','Smart TV',999.99,'oledtv.jpg',20,1),(11,11,11,'Zapatillas deportivas para correr','Speed IGNITE',89.99,'ignite.jpg',150,1),(12,12,12,'Portátil Lenovo ThinkPad','Business Laptop',999.99,'thinkpad.jpg',50,1),(13,13,13,'Portátil Asus ZenBook','Ultra-slim Laptop',999.99,'zenbook.jpg',50,1),(14,14,14,'Afeitadora Philips Norelco','Electric Shaver',79.99,'norelco.jpg',100,1),(15,15,15,'Cámara de video Panasonic','4K Camcorder',799.99,'camcorder.jpg',30,1),(16,16,16,'Portátil Fujitsu Lifebook','Business Laptop',999.99,'lifebook.jpg',50,1),(17,17,17,'Portátil Acer Predator','Gaming Laptop',999.99,'predator.jpg',30,1),(18,18,18,'Smartphone Nokia','Lumia',199.99,'lumia.jpg',100,1),(19,19,19,'Smartphone Motorola','Moto G',249.99,'motog.jpg',100,1),(20,20,20,'Portátil Toshiba Satellite','Multimedia Laptop',899.99,'satellite.jpg',50,1),(21,21,21,'Bolso de cuero Gucci','Leather Bag',999.99,'guccibag.jpg',50,1),(22,22,22,'Perfume Chanel No.5','Eau de Parfum',199.99,'chanel5.jpg',200,1),(23,23,23,'Reloj Rolex Submariner','Luxury Watch',999.99,'rolex.jpg',20,1),(24,24,24,'Auriculares inalámbricos Bose','Noise Cancelling Headphones',349.99,'bose.jpg',100,1),(25,25,25,'Auriculares Sennheiser HD 660S','Open-Back Headphones',499.99,'sennheiser.jpg',50,1);
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipos_admin`
--

DROP TABLE IF EXISTS `tb_tipos_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipos_admin` (
  `tipo_admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_admin_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`tipo_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipos_admin`
--

LOCK TABLES `tb_tipos_admin` WRITE;
/*!40000 ALTER TABLE `tb_tipos_admin` DISABLE KEYS */;
INSERT INTO `tb_tipos_admin` VALUES (1,'Administrador'),(2,'Supervisor'),(3,'Operador'),(4,'Soporte'),(5,'Analista'),(6,'Desarrollador'),(7,'Auditor'),(8,'Gerente'),(9,'Consultor'),(10,'Coordinador'),(11,'Técnico'),(12,'Investigador'),(13,'Diseñador'),(14,'Especialista'),(15,'Ingeniero'),(16,'Administrativo'),(17,'Arquitecto'),(18,'Analista de datos'),(19,'Supervisor de ventas'),(20,'Recursos humanos'),(21,'Contador'),(22,'Asistente'),(23,'Coordinador de proyectos'),(24,'Ejecutivo de cuentas'),(25,'Algomaspsquiensabe');
/*!40000 ALTER TABLE `tb_tipos_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(100) NOT NULL,
  `usuario_apellido` varchar(100) NOT NULL,
  `usuario_usuario` varchar(100) NOT NULL,
  `usuario_contraseña` varchar(100) NOT NULL,
  `usuario_correo` varchar(100) NOT NULL,
  `usuario_estado` tinyint(1) NOT NULL DEFAULT 1,
  `usuario_imagen` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_correo` (`usuario_correo`),
  UNIQUE KEY `usuario_usuario` (`usuario_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'Luis','Martínez','luis_user','mysecretpass','luis@example.com',1,'luis.jpg'),(2,'María','López','maria_user','maria123','maria@example.com',1,'maria.jpg'),(3,'Carlos','González','carlos_user','carlospass','carlos@example.com',1,'carlos.jpg'),(4,'Sofía','Rodríguez','sofia_user','sofiapass','sofia@example.com',1,'sofia.jpg'),(5,'Pedro','Martínez','pedro_user','pedropass','pedro@example.com',1,'pedro.jpg'),(6,'Laura','Gómez','laura_user','laurapass','laura@example.com',1,'laura.jpg'),(7,'Javier','Díaz','javier_user','javierpass','javier@example.com',1,'javier.jpg'),(8,'Marta','Hernández','marta_user','martapass','marta@example.com',1,'marta.jpg'),(9,'David','González','david_user','davidpass','david@example.com',1,'david.jpg'),(10,'Carmen','Martínez','carmen_user','carmenpass','carmen@example.com',1,'carmen.jpg'),(11,'Daniel','López','daniel_user','danielpass','daniel@example.com',1,'daniel.jpg'),(12,'Ana','Gómez','ana_user','anapass','ana@example.com',1,'ana.jpg'),(13,'Roberto','Martínez','roberto_user','robertopass','roberto@example.com',1,'roberto.jpg'),(14,'Sara','Hernández','sara_user','sarapass','sara@example.com',1,'sara.jpg'),(15,'Miguel','Gómez','miguel_user','miguelpass','miguel@example.com',1,'miguel.jpg'),(16,'Natalia','Martínez','natalia_user','nataliapass','natalia@example.com',1,'natalia.jpg'),(17,'Eduardo','López','eduardo_user','eduardopass','eduardo@example.com',1,'eduardo.jpg'),(18,'Alicia','Gómez','alicia_user','aliciapass','alicia@example.com',1,'alicia.jpg'),(19,'Raúl','Martínez','raul_user','raulpass','raul@example.com',1,'raul.jpg'),(20,'Cristina','Hernández','cristina_user','cristinapass','cristina@example.com',1,'cristina.jpg'),(21,'Jorge','Gómez','jorge_user','jorgepass','jorge@example.com',1,'jorge.jpg'),(22,'Patricia','Martínez','patricia_user','patriciapass','patricia@example.com',1,'patricia.jpg'),(23,'Pablo','López','pablo_user','pablopss','pablo@example.com',1,'pablo.jpg'),(24,'María','Gómez','maria_m_user','mariampass','maria-m@example.com',1,'maria-m.jpg'),(25,'sdasdasdía','asdasdómez','mariaasdasd_m_user','adsdasdasd','asdasd-m@example.com',1,'asdasd-m.jpg');
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 17:27:24
