/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.31-MariaDB : Database - store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `store`;

/*Table structure for table `administrador` */

DROP TABLE IF EXISTS `administrador`;

CREATE TABLE `administrador` (
  `Nombre` varchar(30) NOT NULL,
  `Clave` text NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `administrador` */

LOCK TABLES `administrador` WRITE;

insert  into `administrador`(`Nombre`,`Clave`) values ('admin','admin'),('Brandon','1234');

UNLOCK TABLES;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `CodigoCat` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`CodigoCat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categoria` */

LOCK TABLES `categoria` WRITE;

insert  into `categoria`(`CodigoCat`,`Nombre`,`Descripcion`) values ('C1','Camaras','Nikon 24 mpxls con autofoco'),('C2','Accesorios','Para camara'),('C3','Memorias','Memorias USB'),('C4','Memorias SD y Micro SD','Memories');

UNLOCK TABLES;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `NIT` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `NombreCompleto` varchar(70) NOT NULL,
  `Apellido` varchar(70) NOT NULL,
  `Clave` text NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

LOCK TABLES `cliente` WRITE;

insert  into `cliente`(`NIT`,`Nombre`,`NombreCompleto`,`Apellido`,`Clave`,`Direccion`,`Telefono`,`Email`) values ('1233-2133-213-1','Byron','Byron','dfgdfg','1234','El Refugio departamento de ahuachapan',79674911,'bayronmartinez9911@gmail.com'),('1234-2132-2134-12','Marcela','Marcela','Villalta','1234','Chalchuapa',12345678,'marcela@gmail.com'),('5486-1584-984-1','stiven','stiven alexis','martinez jimenez','yosoybobo123','El Refugio departamento de ahuachapan',79674911,'martinez_stiven05@gmail.com');

UNLOCK TABLES;

/*Table structure for table `detalle` */

DROP TABLE IF EXISTS `detalle`;

CREATE TABLE `detalle` (
  `NumPedido` int(20) NOT NULL,
  `CodigoProd` varchar(30) NOT NULL,
  `CantidadProductos` int(20) NOT NULL,
  KEY `NumPedido` (`NumPedido`),
  KEY `CodigoProd` (`CodigoProd`),
  CONSTRAINT `detalle_ibfk_8` FOREIGN KEY (`CodigoProd`) REFERENCES `producto` (`CodigoProd`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_ibfk_9` FOREIGN KEY (`NumPedido`) REFERENCES `venta` (`NumPedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalle` */

LOCK TABLES `detalle` WRITE;

insert  into `detalle`(`NumPedido`,`CodigoProd`,`CantidadProductos`) values (1,'10',1),(1,'12',1),(1,'4',1);

UNLOCK TABLES;

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `CodigoProd` varchar(30) NOT NULL,
  `NombreProd` varchar(30) NOT NULL,
  `CodigoCat` varchar(30) NOT NULL,
  `Precio` decimal(30,2) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Stock` int(20) NOT NULL,
  `Imagen` varchar(150) NOT NULL,
  PRIMARY KEY (`CodigoProd`),
  KEY `CodigoCat` (`CodigoCat`),
  CONSTRAINT `producto_ibfk_7` FOREIGN KEY (`CodigoCat`) REFERENCES `categoria` (`CodigoCat`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producto` */

LOCK TABLES `producto` WRITE;

insert  into `producto`(`CodigoProd`,`NombreProd`,`CodigoCat`,`Precio`,`Modelo`,`Marca`,`Stock`,`Imagen`) values ('10','Memorias micro SD','C4',12.00,'21 bt','Kingston',29,'M.8GB.1_414661639f54a3722a3a08252142925b.jpg'),('12','Camara Sony X','C1',670.00,'X 990','Sony',5,'camera.png'),('23','Camara nikon S','C1',230.00,'S','Nikon',4,'79066.gif'),('3','Camara Canon 3800','C1',900.00,'AX 3800','Canon',5,'77519-1200ftw.gif'),('34','Memorias Kingstong','C3',10.00,'Data Traveler','Kingston',30,'como-formatear-un-pendrive-dañado-memorias-usb-micro-sd.jpg'),('4','Adaptador','C3',3.00,'z12','Avantage',15,'6160+2ZFYSL._SY355_.jpg');

UNLOCK TABLES;

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `NumPedido` int(20) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(150) NOT NULL,
  `NIT` varchar(30) NOT NULL,
  `Descuento` int(20) NOT NULL,
  `TotalPagar` decimal(30,2) NOT NULL,
  `Estado` varchar(150) NOT NULL,
  PRIMARY KEY (`NumPedido`),
  KEY `NIT` (`NIT`),
  KEY `NIT_2` (`NIT`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`NIT`) REFERENCES `cliente` (`NIT`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `venta` */

LOCK TABLES `venta` WRITE;

insert  into `venta`(`NumPedido`,`Fecha`,`NIT`,`Descuento`,`TotalPagar`,`Estado`) values (1,'28-05-2018','1233-2133-213-1',0,685.00,'Entregado');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
