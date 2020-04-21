-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-04-2020 a las 19:03:51
-- Versión del servidor: 5.7.28-0ubuntu0.18.04.4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `nombre`, `descripcion`, `precio`, `estado`, `status`, `fecha_creacion`) VALUES
(1, 'lentes', 'lentes oftagmologicos', 100, 'buen estado', 'A', '2020-04-21 02:15:37'),
(2, 'gafas', 'material acetato', 189, 'buen estado', 'A', '2020-04-21 02:23:19'),
(3, 'Marcador', 'hecho de acetato', 10, 'buen estado', 'A', '2020-04-21 20:00:04'),
(4, 'pelota', 'hecha de aucho', 5, 'buen estado', 'A', '2020-04-21 22:51:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `establecimiento` varchar(3) NOT NULL,
  `punto_emision` varchar(3) NOT NULL,
  `secuencial` varchar(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `total` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `establecimiento`, `punto_emision`, `secuencial`, `fecha_emision`, `total`, `usuario_id`, `status`, `fecha_creacion`) VALUES
(1, '001', '001', '1', '2020-04-21', 100, 1, 'A', '2020-04-21 22:27:39'),
(2, '001', '001', '1', '2020-04-21', 100, 1, 'A', '2020-04-21 22:28:49'),
(3, '002', '002', '2', '2020-03-20', 500, 2, 'A', '2020-04-21 22:38:33'),
(4, '002', '002', '2', '2020-03-20', 500, 2, 'A', '2020-04-21 22:42:03'),
(5, '002', '002', '2', '2020-03-20', 500, 2, 'A', '2020-04-21 22:53:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE `factura_detalle` (
  `id` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `articulo_id` int(10) UNSIGNED NOT NULL,
  `factura_id` int(10) UNSIGNED NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura_detalle`
--

INSERT INTO `factura_detalle` (`id`, `cantidad`, `precio`, `total`, `articulo_id`, `factura_id`, `status`, `fecha_creacion`) VALUES
(1, 10, 0, 800, 3, 2, 'A', '2020-04-21 22:28:50'),
(2, 12, 0, 1800, 1, 2, 'A', '2020-04-21 22:28:50'),
(3, 3, 0, 24, 3, 2, 'A', '2020-04-21 22:28:50'),
(4, 10, 0, 800, 3, 2, 'A', '2020-04-21 22:28:50'),
(5, 3, 12, 24, 2, 4, 'A', '2020-04-21 22:42:03'),
(6, 3, 2, 6, 1, 4, 'A', '2020-04-21 22:42:03'),
(7, 3, 12, 24, 2, 5, 'A', '2020-04-21 22:53:01'),
(8, 3, 2, 6, 1, 5, 'A', '2020-04-21 22:53:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `precio_total` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha_pedido`, `fecha_entrega`, `precio_total`, `usuario_id`, `status`, `fecha_creacion`) VALUES
(1, '2020-02-10', '2020-03-10', 2600, 1, 'A', '2020-04-21 21:39:39'),
(2, '2020-02-10', '2020-03-10', 2600, 2, 'A', '2020-04-21 21:45:59'),
(3, '2020-02-10', '2020-03-10', 2600, 2, 'A', '2020-04-21 21:46:17'),
(4, '2020-02-10', '2020-03-10', 2600, 1, 'A', '2020-04-21 21:46:47'),
(5, '2020-02-10', '2020-03-10', 2600, 1, 'A', '2020-04-21 21:48:19'),
(6, '2020-03-20', '2020-03-30', 2600, 1, 'A', '2020-04-21 22:52:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `articulo_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`id`, `cantidad`, `precio`, `total`, `articulo_id`, `pedido_id`, `status`, `fecha_creacion`) VALUES
(1, 10, 80, 800, 3, 1, 'A', '2020-04-21 21:39:39'),
(2, 12, 150, 1800, 1, 1, 'A', '2020-04-21 21:39:39'),
(3, 3, 8, 24, 3, 1, 'A', '2020-04-21 21:39:39'),
(4, 10, 80, 800, 3, 3, 'A', '2020-04-21 21:46:17'),
(5, 10, 80, 800, 3, 4, 'A', '2020-04-21 21:46:47'),
(6, 12, 150, 1800, 1, 4, 'A', '2020-04-21 21:46:47'),
(7, 3, 8, 24, 3, 4, 'A', '2020-04-21 21:46:47'),
(8, 10, 80, 800, 3, 5, 'A', '2020-04-21 21:48:19'),
(9, 12, 150, 1800, 1, 5, 'A', '2020-04-21 21:48:19'),
(10, 3, 8, 24, 3, 5, 'A', '2020-04-21 21:48:19'),
(11, 10, 80, 800, 3, 6, 'A', '2020-04-21 22:52:04'),
(12, 12, 150, 1800, 1, 6, 'A', '2020-04-21 22:52:04'),
(13, 3, 8, 24, 3, 6, 'A', '2020-04-21 22:52:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `status`, `fecha_creacion`) VALUES
(1, 'Rodolfo', 'rolfo@gmail.com', 'A', '2020-04-21 01:35:23'),
(2, 'Angelo', 'angelo_s@gmail.com', 'A', '2020-04-21 01:45:53'),
(3, 'daya', 'dcarmo@hotmail.com', 'A', '2020-04-21 01:46:09'),
(4, 'Donya', 'dcarmo@hotmail.com', 'A', '2020-04-21 02:00:07'),
(5, 'Marcelo', 'mperez@hotmail.com', 'A', '2020-04-21 02:00:31'),
(6, 'Josue', 'jalcivar@hotmail.com', 'A', '2020-04-21 02:00:49'),
(7, 'Gariela', 'd_rodriguez1999@hotmail.com', 'A', '2020-04-21 02:01:14'),
(8, 'Hernan', 'Her_velez@hotmail.com', 'A', '2020-04-21 22:49:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura_id` (`factura_id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulo_id` (`articulo_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD CONSTRAINT `factura_detalle_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `factura_detalle_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`),
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
