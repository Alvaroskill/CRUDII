-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2022 a las 17:55:14
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `codEquipo` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `liga` int(11) NOT NULL,
  `localidad` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CodUsu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`codEquipo`, `nombre`, `liga`, `localidad`, `CodUsu`) VALUES
(2, 'Barcelona', 2, 'Barcelona', 2),
(3, 'Betis', 2, 'Sevilla', 2),
(4, 'Real Madrid', 6, 'Madrid', 2),
(5, 'Real Madrid', 6, 'Madrid', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `numeroID` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codEquipo` int(11) NOT NULL,
  `CodUsu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`numeroID`, `nombre`, `codEquipo`, `CodUsu`) VALUES
(1, 'Pique', 2, 2),
(2, 'Diego Aguilera', 3, 2),
(3, 'Busquets', 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CodUsu` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CodUsu`, `nombre`, `contrasena`) VALUES
(2, 'Cristiano', '1234'),
(3, 'Daniel', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`codEquipo`),
  ADD KEY `fk_equipos_usuario_idx` (`CodUsu`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`numeroID`),
  ADD KEY `fk_jugadores_equipos1` (`codEquipo`),
  ADD KEY `fk_jugadores_usuario1` (`CodUsu`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CodUsu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `codEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `numeroID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CodUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `fk_equipos_usuario` FOREIGN KEY (`CodUsu`) REFERENCES `usuario` (`CodUsu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `fk_jugadores_equipos1` FOREIGN KEY (`codEquipo`) REFERENCES `equipos` (`codEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jugadores_usuario1` FOREIGN KEY (`CodUsu`) REFERENCES `usuario` (`CodUsu`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
