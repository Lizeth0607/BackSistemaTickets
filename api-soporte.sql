-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2021 a las 17:38:21
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api-soporte`
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
(1, 'SAP', '1.1', '2021-11-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `link`, `descripcion`) VALUES
(1, 'Politicas', 'https://www.google.com', 'Politicas del area de TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `puesto` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `equipo_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellidos`, `puesto`, `area`, `equipo_id`) VALUES
(1, 'Martin', 'Juarez', 'Network Administrator', 'TI', NULL);

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
(6, 'Monterrey'),
(18, 'NuevaEmpresa'),
(3, 'Queretaro'),
(2, 'Saltillo'),
(17, 'test');

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
(5, 1, 'test', '2021-11-24', 0, 8, NULL),
(90, 11, 'testEspecifi', '2021-11-12', 1, 16, NULL);

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
(2, 'Soporte tecnico nivel 3', 'soporte tecnico 3');

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
  `fecha_inicio` date NOT NULL DEFAULT current_timestamp(),
  `fecha_termino` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `indicador_equipo`
--

INSERT INTO `indicador_equipo` (`id`, `equipo_id`, `indicador_id`, `problema`, `acciones`, `estado`, `fecha_inicio`, `fecha_termino`) VALUES
(18, 90, 1, 'test', 'test', 'Alto', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `report_total_services`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `report_total_services` (
`servicio` varchar(45)
,`total` bigint(21)
);

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
(16, ''),
(8, 'Camara'),
(15, 'impresora'),
(13, 'Scanner'),
(9, 'Servidor'),
(12, 'w');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_asignacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_asignacion` (
`Empleado` varchar(91)
,`Asignado` varchar(29)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `report_total_services`
--
DROP TABLE IF EXISTS `report_total_services`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_total_services`  AS SELECT `indicadores`.`nombre` AS `servicio`, count(0) AS `total` FROM (`indicador_equipo` join `indicadores` on(`indicador_equipo`.`indicador_id` = `indicadores`.`id`)) GROUP BY `indicadores`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_asignacion`
--
DROP TABLE IF EXISTS `view_asignacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_asignacion`  AS SELECT concat(`empleados`.`nombre`,' ',`empleados`.`apellidos`) AS `Empleado`, ifnull(concat('Estacion ',`empleados`.`equipo_id`),'Sin Asignar') AS `Asignado` FROM (`empleados` left join `equipos` on(`empleados`.`equipo_id` = `equipos`.`num_serie`)) ;

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
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `equipo_id_2` (`equipo_id`),
  ADD KEY `equipo_id` (`equipo_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70035;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `num_serie` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234567900;

--
-- AUTO_INCREMENT de la tabla `equipo_aplicacion`
--
ALTER TABLE `equipo_aplicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `indicador_equipo`
--
ALTER TABLE `indicador_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `equipo_id_ifbk` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`num_serie`) ON DELETE SET NULL ON UPDATE CASCADE;

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
