-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-06-2023 a las 15:35:36
-- Versión del servidor: 5.7.40
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ms365_usuario`
--
CREATE DATABASE IF NOT EXISTS `ms365_usuario` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `ms365_usuario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_servicio`
--

DROP TABLE IF EXISTS `auth_servicio`;
CREATE TABLE IF NOT EXISTS `auth_servicio` (
  `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `method` varchar(10) NOT NULL DEFAULT '',
  `orden` int(9) NOT NULL,
  `url` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `auth_servicio`
--

INSERT INTO `auth_servicio` (`id`, `method`, `orden`, `url`) VALUES
(100, 'POST', 1, '/login/**'),
(200, 'GET', 1, '/api/usuario/list'),
(201, 'GET', 2, '/api/usuario/page/**'),
(202, 'GET', 3, '/api/usuario/findbyid/**'),
(203, 'GET', 4, '/api/usuario/findByUserName/**'),
(220, 'POST', 2, '/api/usuario'),
(240, 'PUT', 1, '/api/usuario'),
(260, 'DELETE', 1, '/api/usuario/**'),
(300, 'GET', 5, '/api/proyecto/**'),
(320, 'POST', 4, '/api/proyecto'),
(340, 'PUT', 3, '/api/proyecto'),
(360, 'DELETE', 3, '/api/proyecto/**'),
(400, 'GET', 4, '/api/proyecto/archivo/**'),
(420, 'POST', 3, '/api/proyecto/archivo/**'),
(440, 'PUT', 2, '/api/proyecto/archivo/**'),
(460, 'DELETE', 2, '/api/proyecto/archivo/**');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_servicio_role`
--

DROP TABLE IF EXISTS `auth_servicio_role`;
CREATE TABLE IF NOT EXISTS `auth_servicio_role` (
  `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `servicio_id` int(9) UNSIGNED NOT NULL,
  `role_id` int(9) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `servicio_id` (`servicio_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `auth_servicio_role`
--

INSERT INTO `auth_servicio_role` (`id`, `servicio_id`, `role_id`) VALUES
(1, 100, NULL),
(2, 200, 1),
(3, 201, 1),
(4, 202, 1),
(5, 220, 1),
(6, 240, 1),
(7, 260, 1),
(8, 200, 2),
(9, 201, 2),
(10, 202, 2),
(11, 220, 2),
(12, 240, 2),
(13, 260, 2),
(14, 300, 1),
(15, 320, 1),
(16, 340, 1),
(17, 360, 1),
(18, 300, 2),
(19, 320, 2),
(20, 340, 2),
(21, 360, 2),
(22, 400, 1),
(23, 420, 1),
(24, 440, 1),
(25, 460, 1),
(26, 400, 2),
(27, 420, 2),
(28, 440, 2),
(29, 460, 2),
(30, 203, 1),
(31, 203, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `auth` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `created_at`, `updated_at`, `auth`) VALUES
(1, 'ADMIN', '2020-03-04', '2020-03-04', 'ROLE_ADMIN'),
(2, 'USER', '2020-03-04', '2020-03-04', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `rol_id` int(9) UNSIGNED NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rol_id` (`rol_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `estado`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 'mportilla', '1234', 1, 1, '2022-08-28', NULL),
(2, 'equenhua', '1234', 1, 1, '2022-08-28', '2022-08-18'),
(4, 'copeinca2022', '1234', 1, 2, '2022-08-28', NULL),
(5, 'jpsima2022', '1234', 1, 2, '2022-08-29', NULL),
(6, 'mqtasa2022', '1234', 1, 2, '2022-08-30', NULL),
(7, 'comet2022', '1234', 1, 2, '2022-08-31', NULL),
(8, 'cfginv2022', '12234', 1, 2, '2022-08-31', NULL),
(9, 'exalmar2022', '1234', 1, 2, '2022-09-03', NULL),
(10, 'pcentinela2022', '1234', 1, 2, '2022-09-03', NULL),
(11, 'pgomez2022', '1234', 1, 2, '2022-09-04', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_servicio_role`
--
ALTER TABLE `auth_servicio_role`
  ADD CONSTRAINT `auth_servicio_role_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `auth_servicio` (`id`),
  ADD CONSTRAINT `auth_servicio_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
