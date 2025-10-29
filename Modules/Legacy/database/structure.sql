-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bd_datos
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0+deb11u1-log

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
-- Table structure for table `MensajesMora`
--

DROP TABLE IF EXISTS `MensajesMora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MensajesMora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rango_min` int(11) NOT NULL,
  `rango_max` int(11) NOT NULL,
  `mensaje` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `Vista_Bcra`
--

DROP TABLE IF EXISTS `Vista_Bcra`;
/*!50001 DROP VIEW IF EXISTS `Vista_Bcra`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Vista_Bcra` (
  `MaxDiasAtraso` tinyint NOT NULL,
  `capital` tinyint NOT NULL,
  `idcredito` tinyint NOT NULL,
  `idcliente` tinyint NOT NULL,
  `alta` tinyint NOT NULL,
  `saldo` tinyint NOT NULL,
  `cuit` tinyint NOT NULL,
  `producto_politica` tinyint NOT NULL,
  `dni` tinyint NOT NULL,
  `activo` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellido` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `ult_gestion` tinyint NOT NULL,
  `rotulo` tinyint NOT NULL,
  `gestiones` tinyint NOT NULL,
  `SaldoPendiente` tinyint NOT NULL,
  `CapitalPendiente` tinyint NOT NULL,
  `InteresPendiente` tinyint NOT NULL,
  `FechaPromesa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Vista_Contabilidad`
--

DROP TABLE IF EXISTS `Vista_Contabilidad`;
/*!50001 DROP VIEW IF EXISTS `Vista_Contabilidad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Vista_Contabilidad` (
  `MaxDiasAtraso` tinyint NOT NULL,
  `capital` tinyint NOT NULL,
  `idcredito` tinyint NOT NULL,
  `idcliente` tinyint NOT NULL,
  `alta` tinyint NOT NULL,
  `saldo` tinyint NOT NULL,
  `cuit` tinyint NOT NULL,
  `producto_politica` tinyint NOT NULL,
  `dni` tinyint NOT NULL,
  `activo` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellido` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `ult_gestion` tinyint NOT NULL,
  `rotulo` tinyint NOT NULL,
  `gestiones` tinyint NOT NULL,
  `SaldoPendiente` tinyint NOT NULL,
  `CapitalPendiente` tinyint NOT NULL,
  `InteresPendiente` tinyint NOT NULL,
  `CapitalCobrado` tinyint NOT NULL,
  `InteresCobrado` tinyint NOT NULL,
  `FechaPromesa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Vista_Morosos`
--

DROP TABLE IF EXISTS `Vista_Morosos`;
/*!50001 DROP VIEW IF EXISTS `Vista_Morosos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Vista_Morosos` (
  `MaxDiasAtraso` tinyint NOT NULL,
  `capital` tinyint NOT NULL,
  `idcredito` tinyint NOT NULL,
  `idcliente` tinyint NOT NULL,
  `alta` tinyint NOT NULL,
  `saldo` tinyint NOT NULL,
  `cuit` tinyint NOT NULL,
  `producto_politica` tinyint NOT NULL,
  `dni` tinyint NOT NULL,
  `activo` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellido` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `ult_gestion` tinyint NOT NULL,
  `rotulo` tinyint NOT NULL,
  `gestiones` tinyint NOT NULL,
  `SaldoPendiente` tinyint NOT NULL,
  `CapitalPendiente` tinyint NOT NULL,
  `InteresPendiente` tinyint NOT NULL,
  `FechaPromesa` tinyint NOT NULL,
  `score_nosis` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `abm_baja`
--

DROP TABLE IF EXISTS `abm_baja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_baja` (
  `id_baja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_banners`
--

DROP TABLE IF EXISTS `abm_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_banners` (
  `IdCliente` int(11) NOT NULL,
  `idbanner` int(11) NOT NULL,
  `url` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `campane` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  UNIQUE KEY `unico_idcliente` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_clientes_tel`
--

DROP TABLE IF EXISTS `abm_clientes_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_clientes_tel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtelecentro` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `paso` int(11) NOT NULL,
  `cuil` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TipoCliente` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrecliente` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipodecobro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `antiguedad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arpu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dni` (`dni`),
  KEY `idtelecentro` (`idtelecentro`)
) ENGINE=InnoDB AUTO_INCREMENT=1466266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_clientes_tel_bk`
--

DROP TABLE IF EXISTS `abm_clientes_tel_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_clientes_tel_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtelecentro` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `paso` int(11) NOT NULL,
  `cuil` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TipoCliente` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrecliente` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipodecobro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `antiguedad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arpu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dni` (`dni`),
  KEY `idtelecentro` (`idtelecentro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_clientes_tel_test`
--

DROP TABLE IF EXISTS `abm_clientes_tel_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_clientes_tel_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtelecentro` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `paso` int(11) NOT NULL,
  `cuil` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TipoCliente` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrecliente` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipodecobro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `antiguedad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arpu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dni` (`dni`),
  KEY `idtelecentro` (`idtelecentro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_procesar`
--

DROP TABLE IF EXISTS `abm_procesar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_procesar` (
  `dni_cliente` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `producto` varchar(5) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_productos`
--

DROP TABLE IF EXISTS `abm_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoCliente` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `CuotaMax` int(11) NOT NULL,
  `Tem` decimal(10,2) NOT NULL COMMENT 'Tem sin iva',
  `Tem_iva` decimal(10,2) NOT NULL COMMENT 'Tem con iva',
  `Tna` decimal(10,2) NOT NULL,
  `Tna_iva` decimal(10,2) NOT NULL,
  `MontoMaximo` int(11) NOT NULL,
  `vcuota` decimal(10,2) NOT NULL,
  `estado` int(2) NOT NULL COMMENT '0 activo, 1 desactivo',
  `TEA_SIva` decimal(10,2) NOT NULL,
  `TEA_CIva` decimal(10,2) NOT NULL,
  `TNM_SIva` decimal(10,2) NOT NULL,
  `TNM_CIva` decimal(10,2) NOT NULL,
  `TNA_SIva` decimal(10,2) NOT NULL,
  `TNA_CIva` decimal(10,2) NOT NULL,
  `CFT_TNA _Siva` decimal(10,2) NOT NULL,
  `CFT_TNA_Civa` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1886 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_productos_old`
--

DROP TABLE IF EXISTS `abm_productos_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_productos_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoCliente` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `CuotaMax` int(11) NOT NULL,
  `Tem` decimal(10,2) NOT NULL COMMENT 'Tem sin iva',
  `Tem_iva` decimal(10,2) NOT NULL COMMENT 'Tem con iva',
  `Tna` decimal(10,2) NOT NULL,
  `Tna_iva` decimal(10,2) NOT NULL,
  `MontoMaximo` int(11) NOT NULL,
  `vcuota` decimal(10,2) NOT NULL,
  `estado` int(2) NOT NULL,
  `TEA_SIva` decimal(10,2) NOT NULL,
  `TEA_CIva` decimal(10,2) NOT NULL,
  `TNM_SIva` decimal(10,2) NOT NULL,
  `TNM_CIva` decimal(10,2) NOT NULL,
  `TNA_SIva` decimal(10,2) NOT NULL,
  `TNA_CIva` decimal(10,2) NOT NULL,
  `CFT_TNA _Siva` decimal(10,2) NOT NULL,
  `CFT_TNA_Civa` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1496 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_productos_respaldo`
--

DROP TABLE IF EXISTS `abm_productos_respaldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_productos_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoCliente` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `CuotaMax` int(11) NOT NULL,
  `Tem` decimal(10,2) NOT NULL COMMENT 'Tem sin iva',
  `Tem_iva` decimal(10,2) NOT NULL COMMENT 'Tem con iva',
  `Tna` decimal(10,2) NOT NULL,
  `Tna_iva` decimal(10,2) NOT NULL,
  `MontoMaximo` int(11) NOT NULL,
  `vcuota` decimal(10,2) NOT NULL,
  `estado` int(2) NOT NULL,
  `TEA_SIva` decimal(10,2) NOT NULL,
  `TEA_CIva` decimal(10,2) NOT NULL,
  `TNM_SIva` decimal(10,2) NOT NULL,
  `TNM_CIva` decimal(10,2) NOT NULL,
  `TNA_SIva` decimal(10,2) NOT NULL,
  `TNA_CIva` decimal(10,2) NOT NULL,
  `CFT_TNA _Siva` decimal(10,2) NOT NULL,
  `CFT_TNA_Civa` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_telecentro`
--

DROP TABLE IF EXISTS `abm_telecentro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_telecentro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` int(11) NOT NULL,
  `CUIL` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEBEEQUIPO` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENTEID` int(11) NOT NULL,
  `NOMBRE` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIPOCLIENTE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOQUEO_FRAUDE` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOQUEO_MORA` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCORE` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ANTIGUEDAD_24MESES` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEBITO` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FL_PAGO_FUERA_TERMINO` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FACTURACION_MAYOR_2000` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FACTURACION_RANGO1` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FACTURACION_RANGO2` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FACTURACION_RANGO3` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abm_token`
--

DROP TABLE IF EXISTS `abm_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abm_token` (
  `id` int(11) NOT NULL,
  `Empresa` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiracion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditoria_firmas`
--

DROP TABLE IF EXISTS `auditoria_firmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_firmas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) NOT NULL,
  `fechafirma` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `inciales` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `licencia` int(2) NOT NULL,
  `automatico` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174838 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditoria_imputacionmanual`
--

DROP TABLE IF EXISTS `auditoria_imputacionmanual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_imputacionmanual` (
  `id` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(3) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bot_whatsapp`
--

DROP TABLE IF EXISTS `bot_whatsapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_whatsapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `numero` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `ultimomensaje` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fechagestion` date NOT NULL,
  `estado` bit(1) NOT NULL,
  `parametro` tinyint(2) NOT NULL,
  `creditoactivo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `idcredito` int(6) NOT NULL,
  `cuotaspendientes` int(3) NOT NULL,
  `dias_atraso` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=62320 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campanas_mkt`
--

DROP TABLE IF EXISTS `campanas_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campanas_mkt` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaenvio` date NOT NULL,
  `horaenvio` time NOT NULL,
  `envios` int(8) NOT NULL,
  `lecturas` int(8) NOT NULL,
  `utm_campaign` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_medium` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_source` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_id` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `plataforma` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `metodo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `iduser` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1149 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobranza_automatica`
--

DROP TABLE IF EXISTS `cobranza_automatica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobranza_automatica` (
  `idCredito` int(11) NOT NULL,
  `dni` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `diasMora` int(11) DEFAULT NULL,
  `saldoOriginal` decimal(10,2) DEFAULT NULL,
  `idTelecentro` int(11) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `saldoPendiente` decimal(10,2) DEFAULT NULL,
  `saldoTotal` decimal(10,2) DEFAULT NULL,
  `fecha_envio` date NOT NULL,
  PRIMARY KEY (`idCredito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobranza_cartera`
--

DROP TABLE IF EXISTS `cobranza_cartera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobranza_cartera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `creditos` int(11) NOT NULL,
  `fecha_desembolso` date NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `plazo` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `tna` decimal(10,2) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `capital_pagado` decimal(10,2) NOT NULL,
  `interes_pagado` decimal(10,2) NOT NULL,
  `capital_pendiente` decimal(10,2) NOT NULL,
  `interes_pendiente` decimal(10,2) NOT NULL,
  `cuotas_apagar` int(11) NOT NULL,
  `cuotas_mora` int(11) NOT NULL,
  `saldo_pendiente` decimal(10,2) NOT NULL,
  `saldo_pendientePuni` decimal(10,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `diasatraso` int(11) NOT NULL,
  `activo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_ult_gestion` date NOT NULL,
  `rotulo_gestion` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `gestiones` tinyint(4) NOT NULL,
  `FechaPromesa` date NOT NULL,
  `ApiDeuda` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Telecentro',
  `se_facturo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaactualizacion` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_credito_unico` (`idcredito`),
  UNIQUE KEY `unico` (`idcredito`)
) ENGINE=InnoDB AUTO_INCREMENT=38655 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobranza_cartera_dev`
--

DROP TABLE IF EXISTS `cobranza_cartera_dev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobranza_cartera_dev` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `creditos` int(11) NOT NULL,
  `fecha_desembolso` date NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `plazo` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `tna` decimal(10,2) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `capital_pagado` decimal(10,2) NOT NULL,
  `interes_pagado` decimal(10,2) NOT NULL,
  `capital_pendiente` decimal(10,2) NOT NULL,
  `interes_pendiente` decimal(10,2) NOT NULL,
  `cuotas_apagar` int(11) NOT NULL,
  `cuotas_mora` int(11) NOT NULL,
  `saldo_pendiente` decimal(10,2) NOT NULL,
  `saldo_pendientePuni` decimal(10,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `diasatraso` int(11) NOT NULL,
  `activo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_ult_gestion` date NOT NULL,
  `rotulo_gestion` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `gestiones` tinyint(4) NOT NULL,
  `FechaPromesa` date NOT NULL,
  `ApiDeuda` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Telecentro',
  `se_facturo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaactualizacion` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_credito_unico` (`idcredito`),
  UNIQUE KEY `unico` (`idcredito`)
) ENGINE=InnoDB AUTO_INCREMENT=7040 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobros_clientes`
--

DROP TABLE IF EXISTS `cobros_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) NOT NULL,
  `Clienteid` int(11) NOT NULL,
  `tipoRec` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroRec` int(11) NOT NULL,
  `montoRec` decimal(10,2) NOT NULL,
  `FechaRec` datetime NOT NULL,
  `FechaIngresoRec` datetime NOT NULL,
  `NroFactura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montoFact` decimal(10,2) NOT NULL,
  `montoFactTele` decimal(10,2) NOT NULL,
  `montoFactCuota` decimal(10,2) NOT NULL,
  `montoImputado` decimal(10,2) NOT NULL,
  `TipoRegistro` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Motivo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Id_baja` int(11) NOT NULL,
  `procesado` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respago` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carga` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `norepetir` (`id_operacion`),
  KEY `Clienteid` (`Clienteid`)
) ENGINE=InnoDB AUTO_INCREMENT=476562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobros_clientes_12122023`
--

DROP TABLE IF EXISTS `cobros_clientes_12122023`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros_clientes_12122023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) NOT NULL,
  `Clienteid` int(11) NOT NULL,
  `tipoRec` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroRec` int(11) NOT NULL,
  `montoRec` decimal(10,2) NOT NULL,
  `FechaRec` datetime NOT NULL,
  `FechaIngresoRec` datetime NOT NULL,
  `NroFactura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montoFact` decimal(10,2) NOT NULL,
  `montoFactTele` decimal(10,2) NOT NULL,
  `montoFactCuota` decimal(10,2) NOT NULL,
  `montoImputado` decimal(10,2) NOT NULL,
  `TipoRegistro` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Motivo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Id_baja` int(11) NOT NULL,
  `procesado` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respago` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carga` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `norepetir` (`id_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=101026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobros_clientes_back`
--

DROP TABLE IF EXISTS `cobros_clientes_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros_clientes_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) NOT NULL,
  `Clienteid` int(11) NOT NULL,
  `tipoRec` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroRec` int(11) NOT NULL,
  `montoRec` decimal(10,2) NOT NULL,
  `FechaRec` datetime NOT NULL,
  `FechaIngresoRec` datetime NOT NULL,
  `NroFactura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montoFact` decimal(10,2) NOT NULL,
  `montoFactTele` decimal(10,2) NOT NULL,
  `montoFactCuota` decimal(10,2) NOT NULL,
  `montoImputado` decimal(10,2) NOT NULL,
  `TipoRegistro` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Motivo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Id_baja` int(11) NOT NULL,
  `procesado` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respago` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carga` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobros_clientes_test`
--

DROP TABLE IF EXISTS `cobros_clientes_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros_clientes_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) NOT NULL,
  `Clienteid` int(11) NOT NULL,
  `tipoRec` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroRec` int(11) NOT NULL,
  `montoRec` decimal(10,2) NOT NULL,
  `FechaRec` datetime NOT NULL,
  `FechaIngresoRec` datetime NOT NULL,
  `NroFactura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montoFact` decimal(10,2) NOT NULL,
  `montoFactTele` decimal(10,2) NOT NULL,
  `montoFactCuota` decimal(10,2) NOT NULL,
  `montoImputado` decimal(10,2) NOT NULL,
  `TipoRegistro` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Motivo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Id_baja` int(11) NOT NULL,
  `procesado` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respago` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carga` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `norepetir` (`id_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=98506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobros_facilcred`
--

DROP TABLE IF EXISTS `cobros_facilcred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros_facilcred` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Clienteid` int(11) NOT NULL,
  `cuil` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `idcredito` int(11) NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `punitorios` date NOT NULL,
  `medio` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `medioprocesado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `comprobante` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `procesado` tinyint(2) NOT NULL,
  `fechaproceso` date NOT NULL,
  `iduser` int(4) NOT NULL,
  `iduser_imputado` int(4) NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `interes` decimal(10,2) NOT NULL,
  `facturado` tinyint(1) NOT NULL,
  `cae` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `notadecredito` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `urlimagen` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7444 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `marcatemporal` timestamp NOT NULL DEFAULT current_timestamp(),
  `paso` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `idTelecentroDef` int(11) NOT NULL,
  `nombrecliente` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `Existe_abm` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idunico` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `code_celular` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `code_email` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `plazo` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `tasa` decimal(3,2) NOT NULL,
  `cft` decimal(10,2) NOT NULL,
  `tna` decimal(10,2) NOT NULL,
  `tea` decimal(10,2) NOT NULL,
  `idplan` int(11) NOT NULL,
  `utm` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cbu` varchar(22) COLLATE utf8_spanish2_ci NOT NULL,
  `code_cbu` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `intentos_cbu` int(3) NOT NULL,
  `sms_enviado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `email_enviado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `cbu_respuesta` int(11) NOT NULL,
  `validacion_celular` int(11) NOT NULL,
  `celular_telecentro` int(2) NOT NULL,
  `validacion_email` int(11) NOT NULL,
  `score_pyp` int(11) NOT NULL,
  `score_nosis` int(11) NOT NULL,
  `score_siisa` int(11) NOT NULL,
  `score_veraz` int(11) NOT NULL,
  `cda` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoCliente` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `apiEstado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apiEstadoF` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Confirmación de estado',
  `cant_domicilios` int(3) NOT NULL,
  `bcra` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `bcra_deuda` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `pyp` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `siisa` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `nosis` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `cda_nosis` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `veraz` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `detalle_cda` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_campaign` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_medium` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_source` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_id` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idorden` int(11) NOT NULL,
  `nrotransaccion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `estadoD` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `anulacionManual` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apro_1` date NOT NULL,
  `apro_2` date NOT NULL,
  `apro_3` date NOT NULL,
  `apro_4` date NOT NULL,
  `apro_5` date NOT NULL,
  `apro_6` date NOT NULL,
  `apro_7` date NOT NULL,
  `CargadoEbs` tinyint(2) NOT NULL,
  `inhabilitar` int(2) NOT NULL COMMENT 'inabilitar consulta',
  `encartera` int(2) NOT NULL,
  `auditado` int(2) NOT NULL,
  `email_mkt` int(2) NOT NULL COMMENT 'email marketing',
  `sms_mkt` int(2) NOT NULL,
  `idventa` int(11) NOT NULL COMMENT 'id venta_producto',
  `fechacierre` timestamp NULL DEFAULT NULL,
  `CreditoSaldado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `EsRenovador` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `CantCreditos` int(3) NOT NULL,
  `promedio` decimal(10,2) DEFAULT 0.00,
  `compromiso_aplicado` int(11) DEFAULT 0,
  `rci` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`fecha`,`dni`),
  KEY `dni` (`dni`),
  KEY `dni_2` (`dni`),
  KEY `celular` (`celular`),
  KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=766211 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultas_bk`
--

DROP TABLE IF EXISTS `consultas_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `marcatemporal` timestamp NOT NULL DEFAULT current_timestamp(),
  `paso` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `idTelecentroDef` int(11) NOT NULL,
  `nombrecliente` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `Existe_abm` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idunico` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `code_celular` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `code_email` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `plazo` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `tasa` decimal(3,2) NOT NULL,
  `cft` decimal(10,2) NOT NULL,
  `tna` decimal(10,2) NOT NULL,
  `tea` decimal(10,2) NOT NULL,
  `idplan` int(11) NOT NULL,
  `utm` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cbu` varchar(22) COLLATE utf8_spanish2_ci NOT NULL,
  `code_cbu` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `intentos_cbu` int(3) NOT NULL,
  `sms_enviado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `email_enviado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `cbu_respuesta` int(11) NOT NULL,
  `validacion_celular` int(11) NOT NULL,
  `celular_telecentro` int(2) NOT NULL,
  `validacion_email` int(11) NOT NULL,
  `score_pyp` int(11) NOT NULL,
  `score_nosis` int(11) NOT NULL,
  `score_siisa` int(11) NOT NULL,
  `score_veraz` int(11) NOT NULL,
  `cda` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoCliente` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apiEstado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apiEstadoF` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Confirmación de estado',
  `cant_domicilios` int(3) NOT NULL,
  `bcra` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `bcra_deuda` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `pyp` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `siisa` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `nosis` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `cda_nosis` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `veraz` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `detalle_cda` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_campaign` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_medium` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_source` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_id` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idorden` int(11) NOT NULL,
  `nrotransaccion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `estadoD` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `anulacionManual` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apro_1` date NOT NULL,
  `apro_2` date NOT NULL,
  `apro_3` date NOT NULL,
  `apro_4` date NOT NULL,
  `apro_5` date NOT NULL,
  `apro_6` date NOT NULL,
  `apro_7` date NOT NULL,
  `CargadoEbs` tinyint(2) NOT NULL,
  `inhabilitar` int(2) NOT NULL COMMENT 'inabilitar consulta',
  `encartera` int(2) NOT NULL,
  `auditado` int(2) NOT NULL,
  `email_mkt` int(2) NOT NULL COMMENT 'email marketing',
  `sms_mkt` int(2) NOT NULL,
  `idventa` int(11) NOT NULL COMMENT 'id venta_producto',
  `fechacierre` timestamp NULL DEFAULT NULL,
  `CreditoSaldado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `EsRenovador` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `CantCreditos` int(3) NOT NULL,
  `promedio` decimal(10,2) DEFAULT 0.00,
  `compromiso_aplicado` int(11) DEFAULT 0,
  `rci` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`fecha`,`dni`),
  KEY `dni` (`dni`),
  KEY `dni_2` (`dni`),
  KEY `celular` (`celular`),
  KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=766044 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultas_error`
--

DROP TABLE IF EXISTS `consultas_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `paso` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `idTelecentroDef` int(11) NOT NULL COMMENT 'Id cliente Definitivo',
  `nombrecliente` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Existe_abm` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `celular` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idunico` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code_celular` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code_email` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `plazo` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `tasa` decimal(3,2) NOT NULL,
  `cft` decimal(10,2) NOT NULL,
  `tna` decimal(10,2) NOT NULL,
  `tea` decimal(10,2) NOT NULL,
  `idplan` int(11) NOT NULL,
  `utm` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cbu` varchar(22) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code_cbu` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `intentos_cbu` int(11) NOT NULL,
  `sms_enviado` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email_enviado` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cbu_respuesta` int(11) NOT NULL,
  `validacion_celular` int(11) NOT NULL,
  `validacion_email` int(11) NOT NULL,
  `cda` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TipoCliente` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apiEstado` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Estado en telecentro',
  `cant_domicilios` int(11) NOT NULL,
  `pyp` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siisa` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nosis` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `detalle_cda` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `utm_campaign` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `utm_medium` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `utm_source` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `utm_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idorden` int(11) NOT NULL COMMENT 'Id Orden de Desembolso',
  `nrotransaccion` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Desembolso',
  `estadoD` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Desembolso',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `evitar_duplicados` (`dni`,`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultas_respaldo`
--

DROP TABLE IF EXISTS `consultas_respaldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `marcatemporal` timestamp NOT NULL DEFAULT current_timestamp(),
  `paso` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `idTelecentroDef` int(11) NOT NULL,
  `nombrecliente` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `Existe_abm` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idunico` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `code_celular` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `code_email` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `plazo` int(11) NOT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `tasa` decimal(3,2) NOT NULL,
  `cft` decimal(10,2) NOT NULL,
  `tna` decimal(10,2) NOT NULL,
  `tea` decimal(10,2) NOT NULL,
  `idplan` int(11) NOT NULL,
  `utm` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cbu` varchar(22) COLLATE utf8_spanish2_ci NOT NULL,
  `code_cbu` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `intentos_cbu` int(3) NOT NULL,
  `sms_enviado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `email_enviado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `cbu_respuesta` int(11) NOT NULL,
  `validacion_celular` int(11) NOT NULL,
  `celular_telecentro` int(2) NOT NULL,
  `validacion_email` int(11) NOT NULL,
  `score_pyp` int(11) NOT NULL,
  `score_nosis` int(11) NOT NULL,
  `score_siisa` int(11) NOT NULL,
  `score_veraz` int(11) NOT NULL,
  `cda` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoCliente` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apiEstado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apiEstadoF` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Confirmación de estado',
  `cant_domicilios` int(3) NOT NULL,
  `bcra` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `bcra_deuda` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `pyp` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `siisa` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `nosis` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `cda_nosis` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `veraz` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `detalle_cda` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_campaign` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_medium` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_source` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `utm_id` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idorden` int(11) NOT NULL,
  `nrotransaccion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `estadoD` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `anulacionManual` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `apro_1` date NOT NULL,
  `apro_2` date NOT NULL,
  `apro_3` date NOT NULL,
  `apro_4` date NOT NULL,
  `apro_5` date NOT NULL,
  `apro_6` date NOT NULL,
  `apro_7` date NOT NULL,
  `CargadoEbs` tinyint(2) NOT NULL,
  `inhabilitar` int(2) NOT NULL COMMENT 'inabilitar consulta',
  `encartera` int(2) NOT NULL,
  `auditado` int(2) NOT NULL,
  `email_mkt` int(2) NOT NULL COMMENT 'email marketing',
  `sms_mkt` int(2) NOT NULL,
  `idventa` int(11) NOT NULL COMMENT 'id venta_producto',
  `fechacierre` timestamp NULL DEFAULT NULL,
  `CreditoSaldado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `EsRenovador` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `CantCreditos` int(3) NOT NULL,
  `promedio` decimal(10,2) DEFAULT 0.00,
  `compromiso_aplicado` int(11) DEFAULT 0,
  `rci` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`fecha`,`dni`),
  KEY `dni` (`dni`),
  KEY `dni_2` (`dni`),
  KEY `celular` (`celular`),
  KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399078 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consultas_what`
--

DROP TABLE IF EXISTS `consultas_what`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_what` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `numero_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fechaalta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha` date NOT NULL,
  `paso` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `cuil` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `TipoCliente` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cliente` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `duplicado` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `confirmacion` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `tipotrabajo` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `apiEstado` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cda` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `idconsulta` int(11) NOT NULL,
  `ult_mensaje` tinytext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_id` (`numero_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron`
--

DROP TABLE IF EXISTS `cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` timestamp NOT NULL DEFAULT current_timestamp(),
  `modulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `programado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalmes` int(11) NOT NULL,
  `estado` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cuenta_corriente_respaldo`
--

DROP TABLE IF EXISTS `cuenta_corriente_respaldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_corriente_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idplan` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `cuit` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `producto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `plazo` int(11) NOT NULL,
  `nrocuota` int(11) NOT NULL COMMENT 'Cuota',
  `tasa` int(11) NOT NULL COMMENT 'Interés',
  `vcuota` decimal(10,2) NOT NULL,
  `interes` decimal(10,2) NOT NULL,
  `aCapital` decimal(10,2) NOT NULL COMMENT 'Amortización Capital',
  `tAmortiz` decimal(10,2) NOT NULL COMMENT 'T. Amortizado',
  `CapPendiente` decimal(10,2) NOT NULL COMMENT 'CAPITAL peNDIENTE',
  `CuotaSiva` decimal(10,2) NOT NULL COMMENT 'Cuota Sin IVA',
  `iva` decimal(10,2) NOT NULL,
  `vto` date NOT NULL,
  `punitorios` decimal(10,2) NOT NULL,
  `dias_atraso` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fechaAlta` date NOT NULL,
  `enviado` int(2) NOT NULL,
  `fechapago` date NOT NULL,
  `pagado` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estadocuota` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `procesado` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`idcredito`,`nrocuota`),
  KEY `cuit` (`cuit`),
  KEY `idcredito` (`idcredito`)
) ENGINE=InnoDB AUTO_INCREMENT=292469 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cuenta_corriente_tmp`
--

DROP TABLE IF EXISTS `cuenta_corriente_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_corriente_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idplan` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `cuit` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `producto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `plazo` int(11) NOT NULL,
  `nrocuota` int(11) NOT NULL COMMENT 'Cuota',
  `tasa` int(11) NOT NULL COMMENT 'Interés',
  `vcuota` decimal(10,2) NOT NULL,
  `interes` decimal(10,2) NOT NULL,
  `aCapital` decimal(10,2) NOT NULL COMMENT 'Amortización Capital',
  `tAmortiz` decimal(10,2) NOT NULL COMMENT 'T. Amortizado',
  `CapPendiente` decimal(10,2) NOT NULL COMMENT 'CAPITAL peNDIENTE',
  `CuotaSiva` decimal(10,2) NOT NULL COMMENT 'Cuota Sin IVA',
  `iva` decimal(10,2) NOT NULL,
  `vto` date NOT NULL,
  `punitorios` decimal(10,2) NOT NULL,
  `dias_atraso` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fechaAlta` date NOT NULL,
  `enviado` int(2) NOT NULL,
  `fechapago` date NOT NULL,
  `pagado` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estadocuota` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `procesado` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`idcredito`,`nrocuota`),
  KEY `cuit` (`cuit`),
  KEY `idcredito` (`idcredito`)
) ENGINE=InnoDB AUTO_INCREMENT=292532 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cuenta_corriente_tmp_bk`
--

DROP TABLE IF EXISTS `cuenta_corriente_tmp_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_corriente_tmp_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idplan` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `cuit` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `producto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `plazo` int(11) NOT NULL,
  `nrocuota` int(11) NOT NULL COMMENT 'Cuota',
  `tasa` int(11) NOT NULL COMMENT 'Interés',
  `vcuota` decimal(10,2) NOT NULL,
  `interes` decimal(10,2) NOT NULL,
  `aCapital` decimal(10,2) NOT NULL COMMENT 'Amortización Capital',
  `tAmortiz` decimal(10,2) NOT NULL COMMENT 'T. Amortizado',
  `CapPendiente` decimal(10,2) NOT NULL COMMENT 'CAPITAL peNDIENTE',
  `CuotaSiva` decimal(10,2) NOT NULL COMMENT 'Cuota Sin IVA',
  `iva` decimal(10,2) NOT NULL,
  `vto` date NOT NULL,
  `punitorios` decimal(10,2) NOT NULL,
  `dias_atraso` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fechaAlta` date NOT NULL,
  `enviado` int(2) NOT NULL,
  `fechapago` date NOT NULL,
  `pagado` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estadocuota` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `procesado` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`idcredito`,`nrocuota`),
  KEY `cuit` (`cuit`),
  KEY `idcredito` (`idcredito`)
) ENGINE=InnoDB AUTO_INCREMENT=292532 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cuenta_corriente_tmp_test`
--

DROP TABLE IF EXISTS `cuenta_corriente_tmp_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_corriente_tmp_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idplan` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `cuit` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `producto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `plazo` int(11) NOT NULL,
  `nrocuota` int(11) NOT NULL COMMENT 'Cuota',
  `tasa` int(11) NOT NULL COMMENT 'Interés',
  `vcuota` decimal(10,2) NOT NULL,
  `interes` decimal(10,2) NOT NULL,
  `aCapital` decimal(10,2) NOT NULL COMMENT 'Amortización Capital',
  `tAmortiz` decimal(10,2) NOT NULL COMMENT 'T. Amortizado',
  `CapPendiente` decimal(10,2) NOT NULL COMMENT 'CAPITAL peNDIENTE',
  `CuotaSiva` decimal(10,2) NOT NULL COMMENT 'Cuota Sin IVA',
  `iva` decimal(10,2) NOT NULL,
  `vto` date NOT NULL,
  `punitorios` decimal(10,2) NOT NULL,
  `dias_atraso` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fechaAlta` date NOT NULL,
  `enviado` int(2) NOT NULL,
  `fechapago` date NOT NULL,
  `pagado` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estadocuota` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `procesado` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evitar_duplicados` (`idcredito`,`nrocuota`),
  KEY `cuit` (`cuit`),
  KEY `idcredito` (`idcredito`)
) ENGINE=InnoDB AUTO_INCREMENT=80583 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_escaneados`
--

DROP TABLE IF EXISTS `datos_escaneados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_escaneados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `id_android` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ok_verificacion` tinyint(1) NOT NULL,
  `fecha_verificacion` datetime NOT NULL,
  `token` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unico` (`id_android`),
  KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=30239 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desembolso`
--

DROP TABLE IF EXISTS `desembolso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desembolso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdCredito` int(11) NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `cuit` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cbu` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fechaSolicitud` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrotransaccion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcionerror` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaEnvio` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaPut` datetime NOT NULL DEFAULT current_timestamp(),
  `invoiceId` int(11) NOT NULL,
  `mensaje` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdCredito` (`IdCredito`),
  KEY `IdCredito_2` (`IdCredito`),
  KEY `fechaEnvio` (`fechaEnvio`)
) ENGINE=InnoDB AUTO_INCREMENT=39929 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `desembolso_bk`
--

DROP TABLE IF EXISTS `desembolso_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desembolso_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdCredito` int(11) NOT NULL,
  `idTelecentro` int(11) NOT NULL,
  `cuit` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cbu` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fechaSolicitud` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrotransaccion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcionerror` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaEnvio` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaPut` datetime NOT NULL DEFAULT current_timestamp(),
  `invoiceId` int(11) NOT NULL,
  `mensaje` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdCredito` (`IdCredito`),
  KEY `IdCredito_2` (`IdCredito`),
  KEY `fechaEnvio` (`fechaEnvio`)
) ENGINE=InnoDB AUTO_INCREMENT=22132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_deudores`
--

DROP TABLE IF EXISTS `email_deudores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_deudores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `emails` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `enviado` int(2) NOT NULL,
  `barrido` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_mkt`
--

DROP TABLE IF EXISTS `email_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_mkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capital` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `clienteid` int(11) NOT NULL,
  `email` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `enviado` int(2) NOT NULL,
  `barrido` int(2) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteid` (`clienteid`)
) ENGINE=InnoDB AUTO_INCREMENT=1566208 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enviossms`
--

DROP TABLE IF EXISTS `enviossms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enviossms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_consulta` int(11) NOT NULL,
  `celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resultado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codesms` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31038 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facturacion_clientes`
--

DROP TABLE IF EXISTS `facturacion_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacion_clientes` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `clienteid` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `tipodato` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `importeCo` decimal(10,2) NOT NULL,
  `texto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechafactura` date NOT NULL,
  `nrofactura` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_envio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechavto` date NOT NULL,
  `fecha_envio` date NOT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=433799 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facturacion_clientes_respaldo`
--

DROP TABLE IF EXISTS `facturacion_clientes_respaldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacion_clientes_respaldo` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `clienteid` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `tipodato` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `importeCo` decimal(10,2) NOT NULL,
  `texto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechafactura` date NOT NULL,
  `nrofactura` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_envio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechavto` date NOT NULL,
  `fecha_envio` date NOT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=344217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facturacion_clientes_test`
--

DROP TABLE IF EXISTS `facturacion_clientes_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacion_clientes_test` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `clienteid` int(11) NOT NULL,
  `idcredito` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `tipodato` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `importeCo` decimal(10,2) NOT NULL,
  `texto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechafactura` date NOT NULL,
  `nrofactura` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_envio` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechavto` date NOT NULL,
  `fecha_envio` date NOT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=7219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gestiones_creditos`
--

DROP TABLE IF EXISTS `gestiones_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestiones_creditos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuil` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `idcredito` int(11) NOT NULL,
  `texto` tinytext COLLATE utf8_spanish2_ci NOT NULL,
  `rotulo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `iduser` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48657 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guardar_gestion_cobranza`
--

DROP TABLE IF EXISTS `guardar_gestion_cobranza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardar_gestion_cobranza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuil` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `idcredito` int(11) NOT NULL,
  `texto` tinytext COLLATE utf8_spanish2_ci NOT NULL,
  `rotulo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `iduser` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `medio` tinyint(5) NOT NULL,
  `FechaPromesa` date NOT NULL,
  `HoraPromesa` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25885 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagenes_creditos`
--

DROP TABLE IF EXISTS `imagenes_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes_creditos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) NOT NULL,
  `url` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(2) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22506 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nosis_data`
--

DROP TABLE IF EXISTS `nosis_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nosis_data` (
  `auto` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(8) NOT NULL,
  `cuil` varchar(200) NOT NULL,
  `cuil_propio` varchar(12) NOT NULL COMMENT 'cuil que obtenemos de nosis',
  `cda` varchar(30) NOT NULL,
  `morosidad` varchar(20) NOT NULL,
  `morosidadFecha` varchar(10) NOT NULL,
  `morosidadNombre` varchar(40) NOT NULL,
  `morosidadTel` varchar(30) NOT NULL,
  `dni` varchar(12) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `edad` int(11) NOT NULL,
  `antiguedad` int(11) NOT NULL,
  `fecnac` varchar(8) NOT NULL,
  `razonsocial` varchar(30) NOT NULL,
  `cuit` varchar(14) NOT NULL,
  `fecing` varchar(30) NOT NULL,
  `bancarizado` varchar(10) NOT NULL,
  `score` int(11) NOT NULL,
  `compromisos` int(11) NOT NULL,
  `fechaingreso` date NOT NULL,
  `fechabaja` date NOT NULL,
  `ingreso` int(11) NOT NULL,
  `nse` varchar(10) NOT NULL,
  `situaciones_negativas` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `codpostal` varchar(10) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `RelDependencia` varchar(10) NOT NULL,
  `Aut_Monotributo` varchar(10) NOT NULL,
  `SinActividad` varchar(10) NOT NULL,
  `Titular_Condicion` varchar(30) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `idsiisa` int(11) NOT NULL,
  UNIQUE KEY `id` (`auto`),
  KEY `cuil` (`cuil`),
  KEY `idconsulta` (`idconsulta`)
) ENGINE=MyISAM AUTO_INCREMENT=306324 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagos_manuales`
--

DROP TABLE IF EXISTS `pagos_manuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos_manuales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permisos1`
--

DROP TABLE IF EXISTS `permisos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `navegador` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `principal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `alternativo` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'modulo alternativo',
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip permitida',
  `celular` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `claveprivada` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Loc_acargo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mod_prospectos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_ventas`
--

DROP TABLE IF EXISTS `plan_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `obj_solicitudes` int(11) NOT NULL,
  `obj_ventas` int(11) NOT NULL,
  `ventas_pesos` decimal(10,2) NOT NULL,
  `tna` decimal(5,2) NOT NULL,
  `costo_diario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fecha` (`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=899 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `politicas`
--

DROP TABLE IF EXISTS `politicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `politicas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pyp`
--

DROP TABLE IF EXISTS `pyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pyp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `cuil` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actividad_empleador` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posee_automotor` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` int(11) NOT NULL,
  `sexo` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apenom` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacionalidad` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `fecha_fallecido` date DEFAULT NULL,
  `calle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `altura` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dpto` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `cant_empleadores` int(11) NOT NULL,
  `ocupacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacion_au` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacion_mn` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacion_jb` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacion_rd` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacion_ed` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pi21` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pi47` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imp_ganancias` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imp_iva` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monotributo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrante_soc` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empleador` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuit_empleador` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social_empleador` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_empleador` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moras_vigentes` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cant_mora_vigente` int(11) NOT NULL,
  `mora_fecha_morosidad` date DEFAULT NULL,
  `mora_fecha_pago` date DEFAULT NULL,
  `mora_entidad` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entidad_bcra_vig` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `situacion_max_vig` int(11) NOT NULL,
  `deuda_max_vig` decimal(10,2) NOT NULL,
  `cant_ban_oper` int(11) NOT NULL,
  `st_ult_6m_bcra` int(11) NOT NULL,
  `mo_st_ult_6m_bcra` int(11) NOT NULL,
  `st_ult_7_12_bcra` int(11) NOT NULL,
  `mo_st_ult_7_12_bcra` int(11) NOT NULL,
  `st_12_24m_bcra` int(11) NOT NULL,
  `mo_st_12_24m_bcra` int(11) NOT NULL,
  `cheques_rechazados` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_cheques_rechazados` int(11) NOT NULL,
  `monto_cheques_rechazados` int(11) NOT NULL,
  `auh` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_provincia` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodo_alta_ult_trabajo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `incice_cuil` (`cuil`)
) ENGINE=InnoDB AUTO_INCREMENT=255705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rapipago_transacciones`
--

DROP TABLE IF EXISTS `rapipago_transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rapipago_transacciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_numero` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cod_trx` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cod_trx_confirmacion` varchar(22) COLLATE utf8_spanish2_ci NOT NULL,
  `canal` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `barra` varchar(90) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_hora_operacion` datetime DEFAULT NULL,
  `reverso` bit(1) NOT NULL,
  `cofirmado` bit(1) NOT NULL DEFAULT b'0',
  `procesado` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dato_duplicados` (`cod_trx`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `siisa_data`
--

DROP TABLE IF EXISTS `siisa_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siisa_data` (
  `auto` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL COMMENT 'id de la consulta\r\nId de la consulta',
  `paso` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cuil` varchar(200) NOT NULL,
  `respuestasiisa` varchar(1000) NOT NULL,
  `morosidad` varchar(1500) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `edad` int(11) NOT NULL,
  `antiguedad` int(11) NOT NULL,
  `fecnac` date NOT NULL,
  `razonsocial` varchar(30) NOT NULL,
  `sector` varchar(30) NOT NULL,
  `cuit` varchar(14) NOT NULL,
  `fecing` date NOT NULL,
  `TRABACTIVOS` int(11) NOT NULL,
  `m_entidad` varchar(100) NOT NULL,
  `m_identidad` int(11) NOT NULL,
  `m_periodo` varchar(20) NOT NULL,
  `mh_entidad` varchar(30) NOT NULL,
  `mh_periodo` varchar(20) NOT NULL,
  `mh_entidad2` varchar(30) NOT NULL,
  `mh_periodo2` varchar(20) NOT NULL,
  `consulta` varchar(20) NOT NULL,
  `CDIA` int(11) NOT NULL,
  `CSEMANA` int(11) NOT NULL,
  `CMES` int(11) NOT NULL,
  `CULT3` int(11) NOT NULL,
  `CULT6` int(11) NOT NULL,
  `CULTANO` int(11) NOT NULL,
  `CULT2ANO` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `modeloscore` varchar(20) NOT NULL,
  `FECHAINGRESO` varchar(30) NOT NULL,
  `FECHABAJA` date NOT NULL,
  `INGRESO` int(11) NOT NULL,
  `DIRECCIONPADRON` varchar(150) NOT NULL,
  `LOCALIDADOPADRON` varchar(50) NOT NULL,
  `PROVINCIAPADRON` varchar(50) NOT NULL,
  `telprefijo` varchar(10) NOT NULL,
  `telnumero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `iduser` int(11) NOT NULL,
  `idsuc_consulta` int(11) NOT NULL,
  `nombreusuario` varchar(100) NOT NULL,
  `importepedido` int(11) NOT NULL,
  `celularcliente` varchar(30) NOT NULL,
  `tipoempleo` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `IngresoDeclarado` int(11) NOT NULL,
  `AntiguedadDeclarada` varchar(80) NOT NULL,
  `ultimagestion` varchar(50) NOT NULL,
  `local` varchar(20) NOT NULL,
  `capital_elegido` int(11) NOT NULL,
  `cuotas_elegido` int(11) NOT NULL,
  `vcuota_elegido` int(11) NOT NULL,
  `RciImporte` int(11) NOT NULL,
  `sit_negativas` int(11) NOT NULL,
  PRIMARY KEY (`auto`),
  KEY `dni` (`dni`),
  KEY `auto` (`auto`),
  KEY `fecha` (`fecha`)
) ENGINE=MyISAM AUTO_INCREMENT=188431 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `siisa_domicilios`
--

DROP TABLE IF EXISTS `siisa_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siisa_domicilios` (
  `auto` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL COMMENT 'ultimo id insertado en abm cliente',
  `dni` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `cuil` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `Direccion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Localidad` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NombreProvincia` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`auto`)
) ENGINE=MyISAM AUTO_INCREMENT=316885 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `siisa_laborales`
--

DROP TABLE IF EXISTS `siisa_laborales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siisa_laborales` (
  `auto` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL COMMENT 'id solicitud',
  `dni` int(11) NOT NULL COMMENT 'id relacionado al la consulta de siisa',
  `cuil` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuit` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razonsocial` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `antiguedad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sector` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actividad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anterior` int(11) NOT NULL,
  `FechaIngreso` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Irregularidades` int(11) NOT NULL,
  PRIMARY KEY (`auto`),
  UNIQUE KEY `dni` (`dni`,`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=367230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `token_link`
--

DROP TABLE IF EXISTS `token_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `token_veraz`
--

DROP TABLE IF EXISTS `token_veraz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_veraz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` text COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `social_id` varchar(100) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `created` datetime NOT NULL,
  `modulo` varchar(30) NOT NULL,
  `rol` int(11) NOT NULL,
  `inicio` varchar(30) NOT NULL,
  `menu` varchar(30) NOT NULL,
  `autorizado` int(11) NOT NULL,
  `iniciales` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `emaui_unico` (`email`),
  KEY `login` (`password`),
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `veraz`
--

DROP TABLE IF EXISTS `veraz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veraz` (
  `auto` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(10) NOT NULL,
  `Documento` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefonos` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_monotributo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cuit_empleador` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_empleador` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `explicacion` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_Ingreso` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(11) NOT NULL,
  `Domicilios` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `peor_status_bcra_12m` int(2) NOT NULL,
  PRIMARY KEY (`auto`)
) ENGINE=InnoDB AUTO_INCREMENT=57575 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `vista_renovadores`
--

DROP TABLE IF EXISTS `vista_renovadores`;
/*!50001 DROP VIEW IF EXISTS `vista_renovadores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_renovadores` (
  `id` tinyint NOT NULL,
  `idplan` tinyint NOT NULL,
  `idcredito` tinyint NOT NULL,
  `idcliente` tinyint NOT NULL,
  `cuit` tinyint NOT NULL,
  `capital` tinyint NOT NULL,
  `producto` tinyint NOT NULL,
  `plazo` tinyint NOT NULL,
  `nrocuota` tinyint NOT NULL,
  `tasa` tinyint NOT NULL,
  `vcuota` tinyint NOT NULL,
  `interes` tinyint NOT NULL,
  `aCapital` tinyint NOT NULL,
  `tAmortiz` tinyint NOT NULL,
  `CapPendiente` tinyint NOT NULL,
  `CuotaSiva` tinyint NOT NULL,
  `iva` tinyint NOT NULL,
  `vto` tinyint NOT NULL,
  `punitorios` tinyint NOT NULL,
  `dias_atraso` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `fechaAlta` tinyint NOT NULL,
  `enviado` tinyint NOT NULL,
  `fechapago` tinyint NOT NULL,
  `pagado` tinyint NOT NULL,
  `saldo` tinyint NOT NULL,
  `estadocuota` tinyint NOT NULL,
  `procesado` tinyint NOT NULL,
  `cantidad_creditos` tinyint NOT NULL,
  `ultimo_estado` tinyint NOT NULL,
  `ultimo_idcredito` tinyint NOT NULL,
  `Ultimo_vto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vistas`
--

DROP TABLE IF EXISTS `vistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'bd_datos'
--

--
-- Final view structure for view `Vista_Bcra`
--

/*!50001 DROP TABLE IF EXISTS `Vista_Bcra`*/;
/*!50001 DROP VIEW IF EXISTS `Vista_Bcra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`telecentro`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vista_Bcra` AS select max(`cc`.`dias_atraso`) AS `MaxDiasAtraso`,`cc`.`capital` AS `capital`,`cc`.`idcredito` AS `idcredito`,`cc`.`idcliente` AS `idcliente`,`cc`.`fechaAlta` AS `alta`,sum(`cc`.`saldo`) AS `saldo`,`cc`.`cuit` AS `cuit`,`cc`.`producto` AS `producto_politica`,`con`.`dni` AS `dni`,`co`.`activo` AS `activo`,`con`.`nombre` AS `nombre`,`con`.`apellido` AS `apellido`,`con`.`email` AS `email`,`con`.`celular` AS `telefono`,`co`.`fecha_ult_gestion` AS `ult_gestion`,`co`.`rotulo_gestion` AS `rotulo`,`co`.`gestiones` AS `gestiones`,`co`.`saldo_pendiente` AS `SaldoPendiente`,sum(`cc`.`CapPendiente`) AS `CapitalPendiente`,sum(`cc`.`interes`) AS `InteresPendiente`,`co`.`FechaPromesa` AS `FechaPromesa` from ((`cuenta_corriente_tmp` `cc` join `cobranza_cartera` `co` on(`cc`.`idcredito` = `co`.`idcredito`)) join `consultas` `con` on(`con`.`id` = `co`.`idcredito`)) where `cc`.`saldo` > 0 group by `cc`.`idcredito` order by max(`cc`.`dias_atraso`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vista_Contabilidad`
--

/*!50001 DROP TABLE IF EXISTS `Vista_Contabilidad`*/;
/*!50001 DROP VIEW IF EXISTS `Vista_Contabilidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vista_Contabilidad` AS select max(`cc`.`dias_atraso`) AS `MaxDiasAtraso`,`cc`.`capital` AS `capital`,`cc`.`idcredito` AS `idcredito`,`cc`.`idcliente` AS `idcliente`,`cc`.`fechaAlta` AS `alta`,sum(`cc`.`saldo`) AS `saldo`,`cc`.`cuit` AS `cuit`,`cc`.`producto` AS `producto_politica`,`con`.`dni` AS `dni`,`co`.`activo` AS `activo`,`con`.`nombre` AS `nombre`,`con`.`apellido` AS `apellido`,`con`.`email` AS `email`,`con`.`celular` AS `telefono`,`co`.`fecha_ult_gestion` AS `ult_gestion`,`co`.`rotulo_gestion` AS `rotulo`,`co`.`gestiones` AS `gestiones`,`co`.`saldo_pendiente` AS `SaldoPendiente`,sum(case when `cc`.`saldo` > 0 then `cc`.`aCapital` else 0 end) AS `CapitalPendiente`,sum(case when `cc`.`saldo` > 0 then `cc`.`interes` else 0 end) AS `InteresPendiente`,sum(case when `cc`.`saldo` = 0 then `cc`.`aCapital` else 0 end) AS `CapitalCobrado`,sum(case when `cc`.`saldo` = 0 then `cc`.`interes` else 0 end) AS `InteresCobrado`,`co`.`FechaPromesa` AS `FechaPromesa` from ((`cuenta_corriente_tmp` `cc` join `cobranza_cartera` `co` on(`cc`.`idcredito` = `co`.`idcredito`)) join `consultas` `con` on(`con`.`id` = `co`.`idcredito`)) group by `cc`.`idcredito` order by max(`cc`.`dias_atraso`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vista_Morosos`
--

/*!50001 DROP TABLE IF EXISTS `Vista_Morosos`*/;
/*!50001 DROP VIEW IF EXISTS `Vista_Morosos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`telecentro`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vista_Morosos` AS select max(`cc`.`dias_atraso`) AS `MaxDiasAtraso`,`cc`.`capital` AS `capital`,`cc`.`idcredito` AS `idcredito`,`cc`.`idcliente` AS `idcliente`,`cc`.`fechaAlta` AS `alta`,sum(`cc`.`saldo`) AS `saldo`,`cc`.`cuit` AS `cuit`,`cc`.`producto` AS `producto_politica`,`con`.`dni` AS `dni`,`co`.`activo` AS `activo`,`con`.`nombre` AS `nombre`,`con`.`apellido` AS `apellido`,`con`.`email` AS `email`,`con`.`celular` AS `telefono`,`co`.`fecha_ult_gestion` AS `ult_gestion`,`co`.`rotulo_gestion` AS `rotulo`,`co`.`gestiones` AS `gestiones`,`co`.`saldo_pendiente` AS `SaldoPendiente`,sum(`cc`.`CapPendiente`) AS `CapitalPendiente`,sum(`cc`.`interes`) AS `InteresPendiente`,`co`.`FechaPromesa` AS `FechaPromesa`,`con`.`score_nosis` AS `score_nosis` from ((`cuenta_corriente_tmp` `cc` join `cobranza_cartera` `co` on(`cc`.`idcredito` = `co`.`idcredito`)) join `consultas` `con` on(`con`.`id` = `co`.`idcredito`)) where `cc`.`saldo` > 0 and `cc`.`dias_atraso` > 0 group by `cc`.`idcredito` order by max(`cc`.`dias_atraso`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_renovadores`
--

/*!50001 DROP TABLE IF EXISTS `vista_renovadores`*/;
/*!50001 DROP VIEW IF EXISTS `vista_renovadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_renovadores` AS select `cc_final`.`id` AS `id`,`cc_final`.`idplan` AS `idplan`,`cc_final`.`idcredito` AS `idcredito`,`cc_final`.`idcliente` AS `idcliente`,`cc_final`.`cuit` AS `cuit`,`cc_final`.`capital` AS `capital`,`cc_final`.`producto` AS `producto`,`cc_final`.`plazo` AS `plazo`,`cc_final`.`nrocuota` AS `nrocuota`,`cc_final`.`tasa` AS `tasa`,`cc_final`.`vcuota` AS `vcuota`,`cc_final`.`interes` AS `interes`,`cc_final`.`aCapital` AS `aCapital`,`cc_final`.`tAmortiz` AS `tAmortiz`,`cc_final`.`CapPendiente` AS `CapPendiente`,`cc_final`.`CuotaSiva` AS `CuotaSiva`,`cc_final`.`iva` AS `iva`,`cc_final`.`vto` AS `vto`,`cc_final`.`punitorios` AS `punitorios`,`cc_final`.`dias_atraso` AS `dias_atraso`,`cc_final`.`estado` AS `estado`,`cc_final`.`fechaAlta` AS `fechaAlta`,`cc_final`.`enviado` AS `enviado`,`cc_final`.`fechapago` AS `fechapago`,`cc_final`.`pagado` AS `pagado`,`cc_final`.`saldo` AS `saldo`,`cc_final`.`estadocuota` AS `estadocuota`,`cc_final`.`procesado` AS `procesado`,`ccc`.`cantidad_creditos` AS `cantidad_creditos`,`cct_last`.`estadocuota` AS `ultimo_estado`,`cct_last`.`idcredito` AS `ultimo_idcredito`,`cct_last`.`vto` AS `Ultimo_vto` from (((((select `cc1`.`cuit` AS `cuit`,`cc1`.`idcredito` AS `idcredito`,max(`cc1`.`nrocuota`) AS `last_nrocuota` from `bd_datos`.`cuenta_corriente_tmp` `cc1` where `cc1`.`idcredito` in (select `bd_datos`.`desembolso`.`IdCredito` from `bd_datos`.`desembolso` where `bd_datos`.`desembolso`.`estado` = 'A') group by `cc1`.`cuit`,`cc1`.`idcredito`) `cc_last_cuota` join (select `bd_datos`.`cuenta_corriente_tmp`.`cuit` AS `cuit`,max(`bd_datos`.`cuenta_corriente_tmp`.`idcredito`) AS `last_idcredito` from `bd_datos`.`cuenta_corriente_tmp` where `bd_datos`.`cuenta_corriente_tmp`.`idcredito` in (select `bd_datos`.`desembolso`.`IdCredito` from `bd_datos`.`desembolso` where `bd_datos`.`desembolso`.`estado` = 'A') group by `bd_datos`.`cuenta_corriente_tmp`.`cuit`) `cc_last_idcredito` on(`cc_last_cuota`.`cuit` = `cc_last_idcredito`.`cuit` and `cc_last_cuota`.`idcredito` = `cc_last_idcredito`.`last_idcredito`)) join `bd_datos`.`cuenta_corriente_tmp` `cc_final` on(`cc_last_cuota`.`cuit` = `cc_final`.`cuit` and `cc_last_cuota`.`idcredito` = `cc_final`.`idcredito` and `cc_last_cuota`.`last_nrocuota` = `cc_final`.`nrocuota`)) join (select `bd_datos`.`cuenta_corriente_tmp`.`cuit` AS `cuit`,count(distinct `bd_datos`.`cuenta_corriente_tmp`.`idcredito`) AS `cantidad_creditos` from `bd_datos`.`cuenta_corriente_tmp` where `bd_datos`.`cuenta_corriente_tmp`.`idcredito` in (select `bd_datos`.`desembolso`.`IdCredito` from `bd_datos`.`desembolso` where `bd_datos`.`desembolso`.`estado` = 'A') group by `bd_datos`.`cuenta_corriente_tmp`.`cuit`) `ccc` on(`cc_final`.`cuit` = `ccc`.`cuit`)) left join `bd_datos`.`cuenta_corriente_tmp` `cct_last` on(`cc_last_cuota`.`cuit` = `cct_last`.`cuit` and `cc_last_cuota`.`idcredito` = `cct_last`.`idcredito` and `cc_last_cuota`.`last_nrocuota` = `cct_last`.`nrocuota`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28  9:24:39
