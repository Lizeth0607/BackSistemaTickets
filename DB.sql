-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 09:05:13
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aplicacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

CREATE TABLE `aplicaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `version` varchar(10) NOT NULL,
  `fecha_compra` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aplicaciones`
--

INSERT INTO `aplicaciones` (`id`, `nombre`, `version`, `fecha_compra`) VALUES
(1, 'SAP', '1.0.0', '2021-11-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`) VALUES
(12, 'EUA'),
(5, 'Jalisco'),
(6, 'Monterrey'),
(14, 'New York 3'),
(3, 'Queretaro'),
(2, 'Saltillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `num_serie` bigint(20) UNSIGNED NOT NULL,
  `estacion` smallint(3) NOT NULL,
  `detalles` longtext NOT NULL,
  `compra` date NOT NULL DEFAULT current_timestamp(),
  `can_install` tinyint(1) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`num_serie`, `estacion`, `detalles`, `compra`, `can_install`, `tipo_id`, `empresa_id`) VALUES
(5, 1, 'test', '2021-11-24', 0, 8, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_aplicacion`
--

CREATE TABLE `equipo_aplicacion` (
  `id` int(11) NOT NULL,
  `equipo_id` bigint(20) UNSIGNED NOT NULL,
  `aplicacion_id` int(11) NOT NULL,
  `fecha_instalacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo_aplicacion`
--

INSERT INTO `equipo_aplicacion` (`id`, `equipo_id`, `aplicacion_id`, `fecha_instalacion`) VALUES
(3, 5, 1, '2021-10-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores`
--

CREATE TABLE `indicadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `indicadores`
--

INSERT INTO `indicadores` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Soporte Tecnico', 'test'),
(2, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador_equipo`
--

CREATE TABLE `indicador_equipo` (
  `id` int(11) NOT NULL,
  `equipo_id` bigint(20) UNSIGNED NOT NULL,
  `indicador_id` int(11) NOT NULL,
  `problema` text NOT NULL,
  `acciones` text DEFAULT NULL,
  `estado` set('Alto','Bajo','Cerrado') NOT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_termino` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `indicador_equipo`
--

INSERT INTO `indicador_equipo` (`id`, `equipo_id`, `indicador_id`, `problema`, `acciones`, `estado`, `fecha_inicio`, `fecha_termino`) VALUES
(1, 5, 1, 'test', 'test', 'Alto', '2021-11-25 01:21:34', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`) VALUES
(8, 'Camara'),
(9, 'Servidor'),
(7, 'Switch');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_empresa` (`nombre`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD UNIQUE KEY `num_serie` (`num_serie`),
  ADD UNIQUE KEY `estacion` (`estacion`),
  ADD KEY `tipo_id` (`tipo_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `equipo_aplicacion`
--
ALTER TABLE `equipo_aplicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aplicacion_id` (`aplicacion_id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `indicador_equipo`
--
ALTER TABLE `indicador_equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `indicador_id` (`indicador_id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `num_serie` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `equipo_aplicacion`
--
ALTER TABLE `equipo_aplicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `indicador_equipo`
--
ALTER TABLE `indicador_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `equipos_tipos_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo_aplicacion`
--
ALTER TABLE `equipo_aplicacion`
  ADD CONSTRAINT `aplicacion_id_ifbk` FOREIGN KEY (`aplicacion_id`) REFERENCES `aplicaciones` (`id`),
  ADD CONSTRAINT `equipos_ibfk` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`num_serie`);

--
-- Filtros para la tabla `indicador_equipo`
--
ALTER TABLE `indicador_equipo`
  ADD CONSTRAINT `equipos__id_ibfk` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`num_serie`),
  ADD CONSTRAINT `indicador_id_ifbk` FOREIGN KEY (`indicador_id`) REFERENCES `indicadores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
