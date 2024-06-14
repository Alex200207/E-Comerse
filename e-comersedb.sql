-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         11.3.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para e-comersedb
CREATE DATABASE IF NOT EXISTS `e-comersedb` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `e-comersedb`;

-- Volcando estructura para tabla e-comersedb.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla e-comersedb.categoria: ~3 rows (aproximadamente)
DELETE FROM `categoria`;
INSERT INTO `categoria` (`ID_Categoria`, `Nombre`) VALUES
	(1, 'Ropa'),
	(2, 'Electrodomesticos'),
	(3, 'Informatica');

-- Volcando estructura para tabla e-comersedb.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int(11) NOT NULL,
  `Fecha_Pedido` datetime NOT NULL,
  `Total` decimal(12,2) NOT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `FK__usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla e-comersedb.pedido: ~0 rows (aproximadamente)
DELETE FROM `pedido`;

-- Volcando estructura para tabla e-comersedb.pedido_detalle
CREATE TABLE IF NOT EXISTS `pedido_detalle` (
  `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  KEY `ID_Pedido` (`ID_Pedido`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `FK__pedido` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla e-comersedb.pedido_detalle: ~0 rows (aproximadamente)
DELETE FROM `pedido_detalle`;

-- Volcando estructura para tabla e-comersedb.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `ID_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `FK__categoria` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla e-comersedb.producto: ~12 rows (aproximadamente)
DELETE FROM `producto`;
INSERT INTO `producto` (`ID_Producto`, `Nombre`, `Descripcion`, `Precio`, `ID_Categoria`, `Stock`) VALUES
	(1, 't-shirt', 'linda camisaeta', 30.00, 1, 50),
	(2, 'pantalon', 'rojo', 50.00, 1, 50),
	(3, 'gorra', 'azul', 50.00, 1, 60),
	(4, 'zapatos', 'negros', 250.00, 1, 52),
	(5, 'licuadora', 'para el uso en su hogar', 550.00, 2, 58),
	(6, 'mini-refrijerador', 'esta vaina te trae la hera de hielo', 2626.00, 2, 565),
	(7, 'ventilador', 'sankey', 256.00, 2, 66),
	(8, 'triturador', 'tene cuidado', 56.00, 2, 474),
	(9, 'gigabyte', 'Poderosa gigabyte con rtx 4070 64ram 2tb rom intel core i9', 50000.00, 3, 3),
	(10, 'maus', 'asus', 5600.00, 3, 6),
	(11, 'tarjeta grafica', 'gtx16650ti 6vram', 15636.00, 3, 78),
	(12, 'monitor', 'asus 220hz  nvidia vsing', 15000.00, 3, 6);

-- Volcando estructura para tabla e-comersedb.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla e-comersedb.usuario: ~1 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`ID_Usuario`, `Nombre`, `Email`, `Clave`) VALUES
	(1, 'eddy talavera', 'eddy@gmail.com', '2233');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
