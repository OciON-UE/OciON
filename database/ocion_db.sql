-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 18-05-2026 a las 11:53:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ocion_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`usuario_id`, `nombre`) VALUES
(5, 'Administrador OciOn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad_fija`
--

CREATE TABLE `cantidad_fija` (
  `id_cupon` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cantidad_fija`
--

INSERT INTO `cantidad_fija` (`id_cupon`, `cantidad`) VALUES
(7, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(4, 'Restaurantes'),
(5, 'Cine'),
(6, 'Conciertos'),
(7, 'Viajes'),
(8, 'Deportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumidor`
--

CREATE TABLE `consumidor` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `id_suscripcion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consumidor`
--

INSERT INTO `consumidor` (`usuario_id`, `nombre`, `fecha_alta`, `telefono`, `calle`, `ciudad`, `provincia`, `id_suscripcion`) VALUES
(50, 'Mario García', '2026-05-10', '611111111', 'Calle Sol 10', 'Madrid', 'Madrid', NULL),
(51, 'Laura Pérez', '2026-05-10', '622222222', 'Avenida Centro 22', 'Barcelona', 'Barcelona', NULL),
(52, 'Carlos López', '2026-05-10', '633333333', 'Calle Mayor 5', 'Valencia', 'Valencia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupon`
--

CREATE TABLE `cupon` (
  `id_cupon` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `canjeado` tinyint(1) DEFAULT NULL,
  `id_oferta` int(11) NOT NULL,
  `usuario_id_consumidor` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaExpiracion` date DEFAULT NULL,
  `tipo` enum('DESCUENTO','CANTIDAD_FIJA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupon`
--

INSERT INTO `cupon` (`id_cupon`, `codigo`, `canjeado`, `id_oferta`, `usuario_id_consumidor`, `fechaCreacion`, `fechaExpiracion`, `tipo`) VALUES
(6, 'CUPON003', 1, 16, 52, NULL, NULL, 'DESCUENTO'),
(7, 'CUPON004', 1, 17, 50, NULL, NULL, 'CANTIDAD_FIJA'),
(8, 'CUPON005', 1, 18, 51, NULL, NULL, 'DESCUENTO'),
(9, 'CUPON1778845718794', 0, 22, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id_cupon` int(11) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`id_cupon`, `porcentaje`) VALUES
(6, 20.00),
(7, 10.00),
(8, 25.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `usuario_id` int(11) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `CIF` varchar(50) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`usuario_id`, `nombre_empresa`, `CIF`, `fecha_alta`, `telefono`, `calle`, `ciudad`, `provincia`) VALUES
(6, 'Cine OciON', 'B11111111', '2026-05-10', '600111111', 'Calle Gran Vía 10', 'Madrid', 'Madrid'),
(7, 'Restaurante FastFood', 'B22222222', '2026-05-10', '600222222', 'Calle Sol 22', 'Madrid', 'Madrid'),
(8, 'Conciertos Live', 'B33333333', '2026-05-10', '600333333', 'Calle Música 5', 'Madrid', 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `id_oferta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `duracion_activa` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_ofertas` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id_oferta`, `nombre`, `descripcion`, `duracion_activa`, `precio`, `cupo_ofertas`, `id_empresa`, `id_administrador`, `id_categoria`) VALUES
(16, 'Concierto Rock', 'Entradas VIP concierto internacional', 20, 99.99, 38, 8, 5, 6),
(17, 'Gym Premium', 'Suscripcion premium de gimnasio', 60, 29.99, 199, 6, 5, 8),
(18, 'Viaje a Paris', 'Oferta especial vuelo + hotel', 10, 599.99, 19, 7, 5, 7),
(19, 'Cena Italiana', 'Menu completo italiano para dos personas', 30, 49.99, 100, 7, 5, 4),
(22, 'Pizza Familiar', '2x1 en pizzas familiares a domicilio los fines de semana', 30, 19.99, 100, 6, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentaje`
--

CREATE TABLE `porcentaje` (
  `id_cupon` int(11) NOT NULL,
  `porcentaje` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `porcentaje`
--

INSERT INTO `porcentaje` (`id_cupon`, `porcentaje`) VALUES
(6, 20.00),
(8, 30.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `id_suscripcion` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `duracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`id_suscripcion`, `tipo`, `precio`, `duracion`) VALUES
(1, 'Premium', 19.99, 30),
(2, 'Basica', 9.99, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` enum('administrador','empresa','consumidor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `email`, `password`, `rol`) VALUES
(5, 'admin@ocion.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'administrador'),
(6, 'empresa@ocion.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'empresa'),
(7, 'user@ocion.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'consumidor'),
(8, 'empresa1@ocion.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'empresa'),
(9, 'empresa2@ocion.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'empresa'),
(10, 'empresa3@ocion.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'empresa'),
(50, 'mario@gmail.com', '1234', 'consumidor'),
(51, 'laura@gmail.com', '1234', 'consumidor'),
(52, 'carlos@gmail.com', '1234', 'consumidor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `cantidad_fija`
--
ALTER TABLE `cantidad_fija`
  ADD PRIMARY KEY (`id_cupon`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `consumidor`
--
ALTER TABLE `consumidor`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `id_suscripcion` (`id_suscripcion`);

--
-- Indices de la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`id_cupon`),
  ADD KEY `id_oferta` (`id_oferta`),
  ADD KEY `usuario_id_consumidor` (`usuario_id_consumidor`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id_cupon`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `CIF` (`CIF`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_oferta`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_administrador` (`id_administrador`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `porcentaje`
--
ALTER TABLE `porcentaje`
  ADD PRIMARY KEY (`id_cupon`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`id_suscripcion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cupon`
--
ALTER TABLE `cupon`
  MODIFY `id_cupon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `id_suscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);

--
-- Filtros para la tabla `cantidad_fija`
--
ALTER TABLE `cantidad_fija`
  ADD CONSTRAINT `cantidad_fija_ibfk_1` FOREIGN KEY (`id_cupon`) REFERENCES `cupon` (`id_cupon`);

--
-- Filtros para la tabla `consumidor`
--
ALTER TABLE `consumidor`
  ADD CONSTRAINT `consumidor_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `consumidor_ibfk_2` FOREIGN KEY (`id_suscripcion`) REFERENCES `suscripcion` (`id_suscripcion`);

--
-- Filtros para la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD CONSTRAINT `cupon_ibfk_1` FOREIGN KEY (`id_oferta`) REFERENCES `oferta` (`id_oferta`),
  ADD CONSTRAINT `cupon_ibfk_2` FOREIGN KEY (`usuario_id_consumidor`) REFERENCES `consumidor` (`usuario_id`);

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `descuento_ibfk_1` FOREIGN KEY (`id_cupon`) REFERENCES `cupon` (`id_cupon`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);

--
-- Filtros para la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD CONSTRAINT `oferta_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`usuario_id`),
  ADD CONSTRAINT `oferta_ibfk_2` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`usuario_id`),
  ADD CONSTRAINT `oferta_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `porcentaje`
--
ALTER TABLE `porcentaje`
  ADD CONSTRAINT `porcentaje_ibfk_1` FOREIGN KEY (`id_cupon`) REFERENCES `cupon` (`id_cupon`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
