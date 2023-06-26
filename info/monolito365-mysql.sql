-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-06-2023 a las 21:22:39
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `monolito365`
--
CREATE DATABASE IF NOT EXISTS `monolito365` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `monolito365`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_proyectos`
--

DROP TABLE IF EXISTS `archivos_proyectos`;
CREATE TABLE IF NOT EXISTS `archivos_proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ruta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyecto_id` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `archivos_proyectos`
--

INSERT INTO `archivos_proyectos` (`id`, `nombre`, `ruta`, `proyecto_id`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Auditoria de Sistema de Gestion SST.pdf', 'C:/365EyC/proyectos/Auditoria de Sistema de Gestion SST.pdf', 1, '2022-08-21', NULL),
(2, 'Higiene Industrial.pdf', 'C:/365EyC/proyectos/Higiene Industrial.pdf', 2, '2022-08-21', NULL),
(3, 'Monitoreo de Agentes Ocupacionales.pdf', 'C:/365EyC/proyectos/Monitoreo de Agentes Ocupacionales.pdf', 3, '2022-08-21', NULL),
(4, 'Plan COVID-19.pdf', 'C:/365EyC/proyectos/Plan COVID-19.pdf', 4, '2022-08-21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono1` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `telefono2` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `pagina_web` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `numero_doc` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_documento_id` (`tipo_documento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `direccion`, `telefono1`, `telefono2`, `email`, `pagina_web`, `usuario_id`, `tipo_documento_id`, `numero_doc`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Servi Vega E.I.R.L.', '', 'Mz H Lt 9 Pj 2 De Junio', '043343714', '043316589', 'servivega2002@gmail.com', 'http://www.servivegaeirl.com', 1, 2, '20100003351', '2020-03-04', '2021-12-20'),
(2, 'Metal Mecanica Mariategui S.A.C.', '', 'Jr Moquegua Nro 482 Zi Miraflores', '043352099', '', 'metalmariategui@hotmail.com', '', NULL, 2, '20100003352', '2020-03-04', '2021-09-21'),
(3, 'Comet S.R.L', NULL, 'Av. Brasil A-30 Urb. Los Álamos Nuevo Chimbote - Ancash - Perú', '043318308', NULL, 'info@comet.com.pe', 'http://www.comet.com.pe', 6, 2, '20100003353', '2020-03-04', '2020-03-04'),
(4, 'Ingeniería, Fabricación y Montaje SAC', '', 'Calle Chiclayo N° 157 Dpto. 401, Miraflores-Chimbote', '043316688', '', 'informes@ifm.com.pe', 'http://www.ifm.com.pe', 8, 2, '20100003354', '2020-03-04', '2020-06-15'),
(5, 'TASA', NULL, 'Av. Los Pescadores s/n, Zona Industrial 27 de Octubre, Chimbote.', '043352160', '016111400', 'comunicaciones@tasa.com.pe', 'https://www.tasa.com.pe', 4, 2, '20100003355', '2020-03-04', '2020-03-04'),
(6, 'Corporación Pesquera Inca S.A.C.', '', 'Av. Industrial 1240, Chimbote', '043365878', '012134000', 'sales@copeinca.com.pe', 'http://www.copeinca.com', 1, 2, '20100003356', '2020-04-06', '2020-04-06'),
(7, 'Bodega DANIEL', '', 'jr huanuco 230', '316589', '253689', 'dhuamanr24@gmail.com', 'google.com', 1, 2, '10724839237', '2020-04-06', '2020-04-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `proyecto`, `descripcion`, `estado`, `usuario_id`, `fecha_expiracion`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Auditoria de Sistema de Gestion SST', 'Auditoria de Sistema de Gestion SSTT ', 0, 2, '2022-09-02', '2022-04-02', '2022-09-25'),
(2, 'Higiene Industrial.', 'Higiene Industrial. 2022', 0, 3, '2022-10-13', '2022-04-13', '2022-09-25'),
(3, 'Monitoreo de Agentes Ocupacionales.', 'Monitoreo de Agentes Ocupacionales.', 1, 3, '2022-11-10', '2022-05-10', NULL),
(4, 'Plan COVID-19', 'Desinfeccion Ambiental contra el COVID-19', 1, 4, '2022-10-12', '2022-05-12', NULL),
(5, 'Sistema de alarma contra incendios.', 'Sistema de alarma contra incendios. Centralizado.', 1, 4, '2022-10-17', '2022-05-17', NULL),
(6, 'Señalizacion Industrial', 'Señalizacion Industriall', 1, 2, '2022-11-25', '2022-08-25', '2022-08-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'ADMIN', '2020-03-04', '2020-03-04'),
(2, 'USER', '2020-03-04', '2020-03-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

DROP TABLE IF EXISTS `tipo_documentos`;
CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id`, `descripcion`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'DNI', '2020-03-04', '2020-03-04'),
(2, 'RUC', '2020-03-04', '2020-03-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `estado`, `rol_id`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'mportilla', '1234', 1, 1, '2022-05-20', '2022-07-23'),
(2, 'copeinca2022', '1234', 1, 2, '2022-07-10', NULL),
(3, 'jpsima2022', '1234', 1, 2, '2022-07-10', '2022-08-06'),
(4, 'mqtasa2022', '1234', 1, 2, '2022-07-10', '2022-07-30'),
(6, 'comet2022', '1234', 0, 2, '2022-07-10', '2022-08-02'),
(7, 'cfginv2022', '1234', 1, 2, '2022-07-13', NULL),
(8, 'exalmar2022', '1234', 1, 2, '2022-07-14', NULL),
(9, 'equenhua', '12345', 1, 1, '2022-07-19', NULL),
(10, 'pcentinela2022', '1234', 1, 2, '2022-07-25', NULL),
(11, 'pgomez2022', '123456', 1, 2, '2022-08-02', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos_proyectos`
--
ALTER TABLE `archivos_proyectos`
  ADD CONSTRAINT `archivos_proyectos_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documentos` (`id`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

DELIMITER $$
--
-- Eventos
--
DROP EVENT `ACTUALIZAR_ESTADO`$$
CREATE DEFINER=`root`@`localhost` EVENT `ACTUALIZAR_ESTADO` ON SCHEDULE EVERY 1 HOUR STARTS '2021-07-20 00:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Actualiza el estado del Proyecto a cada hora.' DO BEGIN
  UPDATE proyectos SET estado = 0 WHERE fecha_expiracion < NOW();
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
