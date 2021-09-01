CREATE DATABASE  IF NOT EXISTS `dbveterinariaanimalia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbveterinariaanimalia`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dbveterinariaanimalia
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `c_animal_razas`
--

DROP TABLE IF EXISTS `c_animal_razas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_animal_razas` (
  `idRazaAnimal` int NOT NULL,
  `RazaAnimal` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idRazaAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_animal_razas`
--

LOCK TABLES `c_animal_razas` WRITE;
/*!40000 ALTER TABLE `c_animal_razas` DISABLE KEYS */;
INSERT INTO `c_animal_razas` VALUES (1,'Pastor Aleman','Perro',NULL,NULL),(2,'Bengala','Gato',NULL,NULL);
/*!40000 ALTER TABLE `c_animal_razas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_animals`
--

DROP TABLE IF EXISTS `c_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_animals` (
  `idAnimal` int NOT NULL,
  `NombreAnimal` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_animals`
--

LOCK TABLES `c_animals` WRITE;
/*!40000 ALTER TABLE `c_animals` DISABLE KEYS */;
INSERT INTO `c_animals` VALUES (1,'Perro',NULL,NULL,NULL),(2,'Gato',NULL,NULL,NULL);
/*!40000 ALTER TABLE `c_animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_estados`
--

DROP TABLE IF EXISTS `c_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_estados` (
  `idPais` int NOT NULL,
  `idEstado` int NOT NULL,
  `NombreEstado` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NombreEstadoAbreviado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`,`idEstado`),
  CONSTRAINT `c_estados_idpais_foreign` FOREIGN KEY (`idPais`) REFERENCES `c_pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_estados`
--

LOCK TABLES `c_estados` WRITE;
/*!40000 ALTER TABLE `c_estados` DISABLE KEYS */;
INSERT INTO `c_estados` VALUES (484,7,'Chiapas','CHS',NULL,NULL);
/*!40000 ALTER TABLE `c_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_localidads`
--

DROP TABLE IF EXISTS `c_localidads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_localidads` (
  `idPais` int NOT NULL,
  `idEstado` int NOT NULL,
  `idMunicipio` int NOT NULL,
  `idLocalidad` int NOT NULL,
  `NombreLocalidad` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodigoPostal` int NOT NULL,
  `AmbitoLocalidad` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`,`idEstado`,`idMunicipio`,`idLocalidad`),
  CONSTRAINT `c_localidads_idpais_idestado_idmunicipio_foreign` FOREIGN KEY (`idPais`, `idEstado`, `idMunicipio`) REFERENCES `c_municipios` (`idPais`, `idEstado`, `idMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_localidads`
--

LOCK TABLES `c_localidads` WRITE;
/*!40000 ALTER TABLE `c_localidads` DISABLE KEYS */;
INSERT INTO `c_localidads` VALUES (484,7,101,1,'Tuxtla Gutierrez',29000,'U',NULL,NULL);
/*!40000 ALTER TABLE `c_localidads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_municipios`
--

DROP TABLE IF EXISTS `c_municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_municipios` (
  `idPais` int NOT NULL,
  `idEstado` int NOT NULL,
  `idMunicipio` int NOT NULL,
  `NombreMunicipio` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CabeceraMunicipal` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`,`idEstado`,`idMunicipio`),
  CONSTRAINT `c_municipios_idpais_idestado_foreign` FOREIGN KEY (`idPais`, `idEstado`) REFERENCES `c_estados` (`idPais`, `idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_municipios`
--

LOCK TABLES `c_municipios` WRITE;
/*!40000 ALTER TABLE `c_municipios` DISABLE KEYS */;
INSERT INTO `c_municipios` VALUES (484,7,101,'Tuxtla Gutierrez','TGZ',NULL,NULL);
/*!40000 ALTER TABLE `c_municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_pais`
--

DROP TABLE IF EXISTS `c_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_pais` (
  `idPais` int NOT NULL,
  `CodigoAlfa2` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodigoAlfa3` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NombrePais` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NombreOficialPais` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_pais`
--

LOCK TABLES `c_pais` WRITE;
/*!40000 ALTER TABLE `c_pais` DISABLE KEYS */;
INSERT INTO `c_pais` VALUES (484,'MX','MEX','Mexico','Mexico',NULL,NULL);
/*!40000 ALTER TABLE `c_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_servicios`
--

DROP TABLE IF EXISTS `c_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_servicios` (
  `idServicio` int NOT NULL,
  `Servicio` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DescripcionServicio` text COLLATE utf8mb4_unicode_ci,
  `CostoServicio` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_servicios`
--

LOCK TABLES `c_servicios` WRITE;
/*!40000 ALTER TABLE `c_servicios` DISABLE KEYS */;
INSERT INTO `c_servicios` VALUES (1,'Vacunacion',NULL,50.00,NULL,NULL),(2,'Cirugia',NULL,3500.00,NULL,NULL);
/*!40000 ALTER TABLE `c_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `idCita` int NOT NULL,
  `idVeterinario` int NOT NULL,
  `idServicio` int NOT NULL,
  `idMascota` int NOT NULL,
  `FechaNCita` date NOT NULL,
  `Hora` time NOT NULL,
  `Descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCita`),
  KEY `citas_idveterinario_foreign` (`idVeterinario`),
  KEY `citas_idservicio_foreign` (`idServicio`),
  KEY `citas_idmascota_foreign` (`idMascota`),
  CONSTRAINT `citas_idmascota_foreign` FOREIGN KEY (`idMascota`) REFERENCES `mascotas` (`idMascota`),
  CONSTRAINT `citas_idservicio_foreign` FOREIGN KEY (`idServicio`) REFERENCES `c_servicios` (`idServicio`),
  CONSTRAINT `citas_idveterinario_foreign` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinarios` (`idVeterinario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,1,1,1,'2021-08-29','17:00:00','Primer vacuna DOG','2021-09-01 03:23:45','2021-09-01 09:24:43');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimerApellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SegundoApellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Genero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroTelefonico` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Correo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPais` int NOT NULL,
  `idEstado` int NOT NULL,
  `idMunicipio` int NOT NULL,
  `idLocalidad` int NOT NULL,
  `Calle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroExterior` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroInterior` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `clientes_idpais_idestado_idmunicipio_idlocalidad_foreign` (`idPais`,`idEstado`,`idMunicipio`,`idLocalidad`),
  CONSTRAINT `clientes_idpais_idestado_idmunicipio_idlocalidad_foreign` FOREIGN KEY (`idPais`, `idEstado`, `idMunicipio`, `idLocalidad`) REFERENCES `c_localidads` (`idPais`, `idEstado`, `idMunicipio`, `idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fatima Berenice','Lopez','Lopez','Masculino','9612000000','fatima@gmail.com',484,7,101,1,'1 Norte Poniente Teran','1200','SN','2021-09-01 01:39:17',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `idMascota` int NOT NULL,
  `idAnimal` int NOT NULL,
  `idRazaAnimal` int NOT NULL,
  `idCliente` int NOT NULL,
  `NumMascota` int NOT NULL,
  `Sexo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Altura` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idMascota`),
  KEY `mascotas_idanimal_foreign` (`idAnimal`),
  KEY `mascotas_idrazaanimal_foreign` (`idRazaAnimal`),
  KEY `mascotas_idcliente_foreign` (`idCliente`),
  CONSTRAINT `mascotas_idanimal_foreign` FOREIGN KEY (`idAnimal`) REFERENCES `c_animals` (`idAnimal`),
  CONSTRAINT `mascotas_idcliente_foreign` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `mascotas_idrazaanimal_foreign` FOREIGN KEY (`idRazaAnimal`) REFERENCES `c_animal_razas` (`idRazaAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,1,1,1,10,'Macho','2020-08-30',1.30,'2021-09-01 03:23:45','2021-09-01 09:24:43');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (18,'2014_10_12_000000_create_users_table',1),(19,'2014_10_12_100000_create_password_resets_table',1),(20,'2019_08_19_000000_create_failed_jobs_table',1),(21,'2019_12_14_000001_create_personal_access_tokens_table',1),(22,'2021_08_31_025931_create_c_pais_table',2),(23,'2021_08_31_030359_create_c_estados_table',3),(24,'2021_08_31_031729_create_c_municipios_table',4),(25,'2021_08_31_032232_create_c_localidads_table',5),(26,'2021_08_31_022833_create_veterinarios_table',6),(31,'2021_08_31_035813_create_c_animals_table',7),(32,'2021_08_31_035110_create_clientes_table',8),(33,'2021_08_31_040042_create_c_animal_razas_table',9),(34,'2021_08_31_040259_create_mascotas_table',10),(35,'2021_08_31_041740_create_c_servicios_table',11),(36,'2021_08_31_042053_create_citas_table',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `idVeterinario` int NOT NULL,
  `NumEmpleado` int NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimerApellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SegundoApellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Genero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroTelefonico` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Correo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPais` int NOT NULL,
  `idEstado` int NOT NULL,
  `idMunicipio` int NOT NULL,
  `idLocalidad` int NOT NULL,
  `Calle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroExterior` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroInterior` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idVeterinario`),
  KEY `veterinarios_idpais_idestado_idmunicipio_idlocalidad_foreign` (`idPais`,`idEstado`,`idMunicipio`,`idLocalidad`),
  CONSTRAINT `veterinarios_idpais_idestado_idmunicipio_idlocalidad_foreign` FOREIGN KEY (`idPais`, `idEstado`, `idMunicipio`, `idLocalidad`) REFERENCES `c_localidads` (`idPais`, `idEstado`, `idMunicipio`, `idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,1,'Horacio Humberto','Leon','de Paz','Masculino','9613029347','hhlp.epo@gmail.com',484,7,101,1,'Av. Mariano Garcia Sela','568','SN',NULL,NULL);
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbveterinariaanimalia'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_edit_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_cliente`(
IN idCliente_ INTEGER
)
BEGIN
    SELECT  clientes.idCliente, clientes.Nombre, clientes.PrimerApellido, clientes.SegundoApellido, clientes.Genero, clientes.NumeroTelefonico, 
            clientes.Correo, c_pais.NombreOficialPais, c_estados.NombreEstado, c_municipios.NombreMunicipio, c_localidads.NombreLocalidad, clientes.Calle, clientes.NumeroExterior, clientes.NumeroInterior
    FROM  c_estados INNER JOIN
            c_localidads ON c_estados.idPais = c_localidads.idPais INNER JOIN
            c_municipios ON c_estados.idPais = c_municipios.idPais AND c_estados.idEstado = c_municipios.idEstado AND c_localidads.idPais = c_municipios.idPais AND 
            c_localidads.idEstado = c_municipios.idEstado AND c_localidads.idMunicipio = c_municipios.idMunicipio INNER JOIN
            c_pais ON c_estados.idPais = c_pais.idPais INNER JOIN
            clientes ON c_localidads.idPais = clientes.idPais AND c_localidads.idEstado = clientes.idEstado AND c_localidads.idMunicipio = clientes.idMunicipio AND 
            c_localidads.idLocalidad = clientes.idLocalidad
    WHERE    clientes.idCliente = idCliente_;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_edit_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_mascota`(
IN idMascota_ INTEGER
)
BEGIN
SELECT mascotas.idMascota, mascotas.NumMascota, c_animals.NombreAnimal, c_animal_razas.RazaAnimal, mascotas.Sexo, mascotas.Altura, mascotas.FechaNacimiento, clientes.Nombre AS NombreCliente, clientes.PrimerApellido AS PrimerApellidoCliente, 
			clientes.SegundoApellido AS SegundoApellidoCliente, c_servicios.Servicio, citas.FechaNCita, citas.Hora, citas.Descripcion, veterinarios.Nombre AS NombreVeterinario, veterinarios.PrimerApellido AS PrimerApellidoVeterinario, veterinarios.SegundoApellido AS SegundoApellidoVeterinario, 
			c_servicios.CostoServicio
	FROM  clientes INNER JOIN
			citas INNER JOIN
			c_servicios ON citas.idServicio = c_servicios.idServicio INNER JOIN
			mascotas ON citas.idMascota = mascotas.idMascota INNER JOIN
			c_animals ON mascotas.idAnimal = c_animals.idAnimal INNER JOIN
			c_animal_razas ON mascotas.idRazaAnimal = c_animal_razas.idRazaAnimal ON clientes.idCliente = mascotas.idCliente INNER JOIN
			veterinarios ON citas.idveterinario = veterinarios.idveterinario
	WHERE mascotas.idMascota = idMascota_;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_edit_veterinario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_veterinario`(
IN NumEmpleado_ INTEGER
)
BEGIN
    SELECT  veterinarios.idveterinario, veterinarios.NumEmpleado, veterinarios.Nombre, veterinarios.PrimerApellido, veterinarios.SegundoApellido, veterinarios.Genero, veterinarios.NumeroTelefonico, 
            veterinarios.Correo, c_pais.NombreOficialPais, c_estados.NombreEstado, c_municipios.NombreMunicipio, c_localidads.NombreLocalidad, veterinarios.Calle, veterinarios.NumeroExterior, veterinarios.NumeroInterior
    FROM  c_estados INNER JOIN
            c_localidads ON c_estados.idPais = c_localidads.idPais INNER JOIN
            c_municipios ON c_estados.idPais = c_municipios.idPais AND c_estados.idEstado = c_municipios.idEstado AND c_localidads.idPais = c_municipios.idPais AND 
            c_localidads.idEstado = c_municipios.idEstado AND c_localidads.idMunicipio = c_municipios.idMunicipio INNER JOIN
            c_pais ON c_estados.idPais = c_pais.idPais INNER JOIN
            veterinarios ON c_localidads.idPais = veterinarios.idPais AND c_localidads.idEstado = veterinarios.idEstado AND c_localidads.idMunicipio = veterinarios.idMunicipio AND 
            c_localidads.idLocalidad = veterinarios.idLocalidad
    WHERE    veterinarios.NumEmpleado = NumEmpleado_;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente`(
IN Nombre_ VARCHAR(50),
IN PrimerApellido_ VARCHAR(50),
IN SegundoApellido_ VARCHAR(50),
IN Genero_ VARCHAR(10),
IN NumeroTelefonico_ VARCHAR(20),
IN Correo_ TEXT,
IN idPais_ INTEGER,
IN idEstado_ INTEGER,
IN idMunicipio_ INTEGER,
IN idLocalidad_ INTEGER,
IN Calle_ TEXT,
IN NumeroExterior_ VARCHAR(10),
IN NumeroInterior_ VARCHAR(10)
)
BEGIN
    DECLARE IDMax INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        SET IDMax = (SELECT max(idCliente) FROM clientes);
        
        IF IDMax IS NULL THEN
            SET IDMax = 1;
            INSERT INTO clientes VALUES (IDMax, Nombre_, PrimerApellido_, SegundoApellido_, Genero_,  NumeroTelefonico_, Correo_, idPais_, idEstado_, idMunicipio_, idLocalidad_, Calle_, NumeroExterior_, NumeroInterior_, NOW(), null);
        ELSE 
            SET IDMax = IDMax + 1;
            INSERT INTO clientes VALUES (IDMax, Nombre_, PrimerApellido_, SegundoApellido_, Genero_,  NumeroTelefonico_, Correo_, idPais_, idEstado_, idMunicipio_, idLocalidad_, Calle_, NumeroExterior_, NumeroInterior_, NOW(), null);
        END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_mascota`(
IN idAnimal_ INTEGER,
IN idRazaAnimal_ INTEGER,
IN idCliente_ INTEGER,
IN NumMascota_ INTEGER,
IN Sexo_ VARCHAR(8),
IN FechaNacimiento_ DATE,
IN Altura_ DECIMAL(8,2),
IN idVeterinario_ INTEGER,
IN idServicio_ INTEGER,
IN FechaNCita_ DATE,
IN Hora_ TIME,
IN Descripcion_ TEXT
)
BEGIN
	DECLARE IDMax INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		ROLLBACK;
	END;
    START TRANSACTION;
		SET IDMax = (SELECT max(idMascota) FROM mascotas);
        
		IF IDMax IS NULL THEN
			SET IDMax = 1;
			INSERT INTO mascotas VALUES (IDMax, idAnimal_, idRazaAnimal_, idCliente_, NumMascota_, Sexo_,  FechaNacimiento_, Altura_, NOW(), null);
            INSERT INTO citas VALUES (IDMax, idVeterinario_, idServicio_, IDMax, FechaNCita_, Hora_,  Descripcion_, NOW(), null);
        ELSE 
			SET IDMax = IDMax + 1;
            INSERT INTO mascotas VALUES (IDMax, idAnimal_, idRazaAnimal_, idCliente_, NumMascota_, Sexo_,  FechaNacimiento_, Altura_, NOW(), null);
            INSERT INTO citas VALUES (IDMax, idVeterinario_, idServicio_, IDMax, FechaNCita_, Hora_,  Descripcion_, NOW(), null);
		END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_veterinario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_veterinario`(
IN NumEmpleado_ INTEGER,
IN Nombre_ VARCHAR(50),
IN PrimerApellido_ VARCHAR(50),
IN SegundoApellido_ VARCHAR(50),
IN Genero_ VARCHAR(10),
IN NumeroTelefonico_ VARCHAR(20),
IN Correo_ TEXT,
IN idPais_ INTEGER,
IN idEstado_ INTEGER,
IN idMunicipio_ INTEGER,
IN idLocalidad_ INTEGER,
IN Calle_ TEXT,
IN NumeroExterior_ VARCHAR(10),
IN NumeroInterior_ VARCHAR(10)
)
BEGIN
	DECLARE IDMax INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		ROLLBACK;
	END;
    START TRANSACTION;
		SET IDMax = (SELECT max(idVeterinario) FROM veterinarios);
        
		IF IDMax IS NULL THEN
			SET IDMax = 1;
			INSERT INTO veterinarios VALUES (IDMax, NumEmpleado_, Nombre_, PrimerApellido_, SegundoApellido_, Genero_,  NumeroTelefonico_, Correo_, idPais_, idEstado_, idMunicipio_, idLocalidad_, Calle_, NumeroExterior_, NumeroInterior_, NOW(), null);
        ELSE 
			SET IDMax = IDMax + 1;
            INSERT INTO veterinarios VALUES (IDMax, NumEmpleado_, Nombre_, PrimerApellido_, SegundoApellido_, Genero_,  NumeroTelefonico_, Correo_, idPais_, idEstado_, idMunicipio_, idLocalidad_, Calle_, NumeroExterior_, NumeroInterior_, NOW(), null);
		END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_select_all_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_all_cliente`()
BEGIN
	SELECT  clientes.idCliente, clientes.Nombre, clientes.PrimerApellido, clientes.SegundoApellido, clientes.Genero, clientes.NumeroTelefonico, 
            clientes.Correo, c_pais.NombreOficialPais, c_estados.NombreEstado, c_municipios.NombreMunicipio, c_localidads.NombreLocalidad, clientes.Calle, clientes.NumeroExterior, clientes.NumeroInterior
    FROM  c_estados INNER JOIN
            c_localidads ON c_estados.idPais = c_localidads.idPais INNER JOIN
            c_municipios ON c_estados.idPais = c_municipios.idPais AND c_estados.idEstado = c_municipios.idEstado AND c_localidads.idPais = c_municipios.idPais AND 
            c_localidads.idEstado = c_municipios.idEstado AND c_localidads.idMunicipio = c_municipios.idMunicipio INNER JOIN
            c_pais ON c_estados.idPais = c_pais.idPais INNER JOIN
            clientes ON c_localidads.idPais = clientes.idPais AND c_localidads.idEstado = clientes.idEstado AND c_localidads.idMunicipio = clientes.idMunicipio AND 
            c_localidads.idLocalidad = clientes.idLocalidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_select_all_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_all_mascota`()
BEGIN
	SELECT mascotas.idMascota, mascotas.NumMascota, c_animals.NombreAnimal, c_animal_razas.RazaAnimal, mascotas.Sexo, mascotas.Altura, mascotas.FechaNacimiento, clientes.Nombre AS NombreCliente, clientes.PrimerApellido AS PrimerApellidoCliente, 
			clientes.SegundoApellido AS SegundoApellidoCliente, c_servicios.Servicio, citas.FechaNCita, citas.Hora, citas.Descripcion, veterinarios.Nombre AS NombreVeterinario, veterinarios.PrimerApellido AS PrimerApellidoVeterinario, veterinarios.SegundoApellido AS SegundoApellidoVeterinario, 
			c_servicios.CostoServicio
	FROM  clientes INNER JOIN
			citas INNER JOIN
			c_servicios ON citas.idServicio = c_servicios.idServicio INNER JOIN
			mascotas ON citas.idMascota = mascotas.idMascota INNER JOIN
			c_animals ON mascotas.idAnimal = c_animals.idAnimal INNER JOIN
			c_animal_razas ON mascotas.idRazaAnimal = c_animal_razas.idRazaAnimal ON clientes.idCliente = mascotas.idCliente INNER JOIN
			veterinarios ON citas.idveterinario = veterinarios.idveterinario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_select_all_veterinario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_all_veterinario`()
BEGIN
	SELECT  veterinarios.idveterinario, veterinarios.NumEmpleado, veterinarios.Nombre, veterinarios.PrimerApellido, veterinarios.SegundoApellido, veterinarios.Genero, veterinarios.NumeroTelefonico, 
			veterinarios.Correo, c_pais.NombreOficialPais, c_estados.NombreEstado, c_municipios.NombreMunicipio, c_localidads.NombreLocalidad, veterinarios.Calle, veterinarios.NumeroExterior, veterinarios.NumeroInterior
	FROM  c_estados INNER JOIN
			c_localidads ON c_estados.idPais = c_localidads.idPais INNER JOIN
			c_municipios ON c_estados.idPais = c_municipios.idPais AND c_estados.idEstado = c_municipios.idEstado AND c_localidads.idPais = c_municipios.idPais AND 
            c_localidads.idEstado = c_municipios.idEstado AND c_localidads.idMunicipio = c_municipios.idMunicipio INNER JOIN
            c_pais ON c_estados.idPais = c_pais.idPais INNER JOIN
            veterinarios ON c_localidads.idPais = veterinarios.idPais AND c_localidads.idEstado = veterinarios.idEstado AND c_localidads.idMunicipio = veterinarios.idMunicipio AND 
            c_localidads.idLocalidad = veterinarios.idLocalidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-01  1:22:24
