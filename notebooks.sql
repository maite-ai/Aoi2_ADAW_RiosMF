-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2020 a las 23:39:35
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notebooks`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `dni` int(11) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `email` varchar(45) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `apellido`, `nombre`, `dni`, `direccion`, `email`, `usuario`) VALUES
(1, 'RIVERA', 'PAMELA', 548746, 'Franklin 592', 'rivpame@gmail.com', 3),
(2, 'RODRIGUEZ', 'ARIEL', 98766, 'Av.Carabobo 1375', 'arielito@gmail.com', 7),
(3, 'TORREZ', 'JUAN', 488322, 'Av. La Plata 3250', 'jtorrez@aol.com', 6),
(4, 'VELAZCO', 'MATIAS', 300213, 'Inclán 4503', 'mativelazco@live.com', 4),
(5, 'PARED', 'GABRIELA', 678702, 'Rojas 498', 'gabriela@gmail.com', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nroFactura` int(11) NOT NULL,
  `total` double(8,2) NOT NULL,
  `cliente` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` varchar(15) NOT NULL,
  `codImagen` varchar(80) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `modelo` varchar(25) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `precio` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `codImagen`, `marca`, `modelo`, `descripcion`, `precio`) VALUES
('dei15s3000', '', 'Dell', 'Inspiron 15 serie 3000', 'Intel Core I3-8 GB RAM-Pantalla Táctil 15.6 LED HD 1366x768-Windows 10 Home 64bits', 1728.49),
('dexps73902en1', '', 'Dell', 'XPS 13pulg. 7390 2 en 1', 'Intel Core I7-16Gb RAM-Pantalla táctil 13.4 WLED UHD+ 3840x2400-Windows10 Pro x64', 4684.33),
('hp14cd0005la', '', 'HP', 'Pavilion x360 Conv 14-CD0', 'Intel Core I5-12Gb RAM-Pantalla táctil 15.6 FHD SDA 1366x768-Windows 10 Home x64', 1337.36),
('hp15ra008nia', '', 'HP', '15-RA008NIA', 'Intel Celeron N3060-4 GB RAM-Pantalla 15.6 HD SVA WLED 1366x768-FreeDOS 32bits', 895.86),
('humatebook13', '', 'Huawei', 'Matebook 13', 'Intel Core I5-8 GB RAM-Pantalla 13 IPS 2k 2160x1440-Windows 10 Home 64bits', 1885.69),
('humatebookd15', '', 'Huawei', 'Matebook D15', 'AMD Ryzen 5-8 GB RAM-Pantalla 15.6 IPS 1920x1080-Windows 10 Home 64bits', 1604.83),
('letpx1carbon', '', 'Lenovo', 'ThinkPad x1 Carbon 7ma Ge', 'Intel Core i7-16 GB RAM-Pantalla Multitouch 13,3 FHD IPS 1920x1080-Windows 10 Pro 64bits', 2347.07),
('letpx390yoga', '', 'Lenovo', 'ThinkPad x390 Yoga', 'Intel Core i7-8 GB RAM-Pantalla Multitouch 14 FHD IPS 1920x1080-Windows 10 64bits', 2562.39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `nick` varchar(10) NOT NULL,
  `passw` varchar(14) NOT NULL,
  `acceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUser`, `nick`, `passw`, `acceso`) VALUES
(2, 'admin', 'toor', 1),
(3, 'peiriv54', 'abc123', 2),
(4, 'mati698', 'abc123', 2),
(5, 'gabi33', 'abc123', 2),
(6, 'juan22', 'abc123', 2),
(7, 'ariel69', 'abc123', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `idCliente_UNIQUE` (`idCliente`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nroFactura`),
  ADD UNIQUE KEY `idFactura_UNIQUE` (`nroFactura`),
  ADD KEY `fact_cliente_idx` (`cliente`),
  ADD KEY `fact_pedido_idx` (`pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD UNIQUE KEY `idPedido_UNIQUE` (`idPedido`),
  ADD UNIQUE KEY `producto_UNIQUE` (`producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `idProductos_UNIQUE` (`codigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  ADD UNIQUE KEY `nick_UNIQUE` (`nick`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `nroFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `usuario_cliente` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUser`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fact_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fact_pedido` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`idPedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `producto_pedido` FOREIGN KEY (`producto`) REFERENCES `producto` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
