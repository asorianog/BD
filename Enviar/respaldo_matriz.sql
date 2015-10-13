-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: matriz
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `Id_Depart` int(11) NOT NULL DEFAULT '0',
  `nombre_Depart` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`Id_Depart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Operadores'),(2,'Administrativos'),(3,'Ayudante General'),(4,'Recursos Humanos');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `Id_Inv` int(11) NOT NULL DEFAULT '0',
  `Id_Suc` int(11) NOT NULL DEFAULT '0',
  `compras` varchar(40) DEFAULT NULL,
  `ventas` varchar(40) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Inv`,`Id_Suc`),
  KEY `Id_Suc` (`Id_Suc`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Id_Suc`) REFERENCES `sucursal` (`Id_Suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `Id_Suc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_Suc` varchar(35) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Suc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Principal','Priv. 17 A sur 3528 Col: Reforma Agua Azul'),(2,'La paz','Chipilo 302 Col: La paz'),(3,'La noria','19 sur 3504 Col: La noria'),(4,'Centro Sur','11 sur 131 poniente Plaza Centro Sur');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajadores` (
  `Id_Tra` int(11) NOT NULL DEFAULT '0',
  `Id_Suc` int(11) NOT NULL DEFAULT '0',
  `Id_Depart` int(11) NOT NULL DEFAULT '0',
  `nombre_Tra` varchar(35) DEFAULT NULL,
  `puesto` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`Id_Tra`,`Id_Suc`,`Id_Depart`),
  KEY `Id_Suc` (`Id_Suc`),
  KEY `Id_Depart` (`Id_Depart`),
  CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`Id_Suc`) REFERENCES `sucursal` (`Id_Suc`),
  CONSTRAINT `trabajadores_ibfk_2` FOREIGN KEY (`Id_Depart`) REFERENCES `departamento` (`Id_Depart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (211,1,2,'Acevedo Manríquez María Mireya','Operador\r'),(212,2,3,'Acevedo Mejía Enrique','Oficinista\r'),(213,3,1,'Aldrete Vargas Adolfo','Oficinista\r'),(214,4,4,'Bacab Pech Guillermo','Operador\r'),(215,1,1,'Báez Chávez Ángel Salvador','Materiales\r'),(216,2,2,'Balderas Flores Luis Alberto','Materiales\r'),(217,3,3,'Ballesteros González Francisco','Supervisor\r'),(218,4,4,'Camacho Pérez Jorge Alberto','Operador\r'),(219,1,1,'Cámara Contreras César Armando','Asesor de ventas\r'),(220,2,2,'Camarillo Palafox Dante Adrián','Supervisor\r'),(221,3,3,'Campos Saito Jorge Alonso','Asesor\r'),(222,4,4,'Dávila Montero Claudia Valeria','Operador\r'),(223,1,1,'De La Fuente Guerra Roberto','Jefe de ventas\r'),(224,2,2,'Elizalde Herrera Jorge Armando','Supervisor\r'),(225,3,3,'Escamilla Vásquez César','Gerente\r'),(226,4,4,'Escartín Morales Rogelio Samuel','Jefe de ventas\r'),(227,1,1,'Escobar Beltrán Francisco Enrique','Operador\r'),(228,2,2,'Ferreira Centeno Ángel Virgilio','Gerente\r'),(229,3,3,'Ferrer Chávez María Manuela','Operador\r'),(230,4,4,'Galaviz Ramírez Alba Lorenia','Gerente\r'),(231,1,1,'Galdámez Blanco Arturo','Contador\r'),(232,2,2,'Galindo Andrade Carlos','Contador\r');
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-21 11:54:54
