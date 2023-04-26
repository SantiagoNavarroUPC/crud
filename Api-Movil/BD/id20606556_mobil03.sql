-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-04-2023 a las 17:34:14
-- Versión del servidor: 10.5.16-MariaDB
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id20606556_mobil03`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` float NOT NULL,
  `foto` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `descripcion`, `precio`, `foto`) VALUES
(1, 'Helados', 'Helado de 1 bola y cono de galleta', 5000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGl_iPrKhdmaNgQXLSicSkkvOPwMlr2Yb72jGMPypjgg-aq6Ax'),
(2, 'Paleta', 'Sabor a fresa', 9000, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR2mBa4PHk6qBgDrHgLa8Tv19J6huk3358BD2fRngEL4AseOGja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `apellido` text COLLATE utf8_unicode_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `foto` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `edad`, `estado`, `foto`) VALUES
(1, 'Santiago', 'Navarro', 19, 1, 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR8CCHjltAbE0Y6Aey5WjXDA3mGngyI4pv9yOQB52ewZw_CYxI2'),
(2, 'Maria', 'Juarez', 25, 0, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRU-htIS-IO4NCLNnnIUOUuFoO343XEzkU04d64_sRHIOBfchN6\r\n\r\n\r\n '),
(3, 'Fernando', 'Vanegas', 53, 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRM4v5Cc-iaBvF95EDKpOSqR7F476ae_spgaqcN-qGu9leuruE'),
(4, 'Uriel', 'Sierra', 30, 1, 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS81E3NjO1VsPnxpkQ-qmrIx4A48VPETVm0kxngEaF_2exCmUAc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `foto` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `raza` text COLLATE utf8_unicode_ci NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`id`, `foto`, `nombre`, `raza`, `iduser`) VALUES
(8, 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSDT9rmgOmuzZdG9FEsui3Zg1yWCvRU45xECN00End3lja_ZCywieTDOxSIydSaRB7aJmA', 'Roque ', 'Golden Retriever ', 12),
(12, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWVsy_Occ19FEulgYEMtbPtxMh9t9a0uCN_gPto61ZX3qu5tFXvmemxKoUQvFMM0f1FlQ&usqp=CAU', 'Gaston', 'Gato Negro', 14),
(14, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTkECM0g2aCjtZ3yAHRuD5InBRi9Umw_FRRfKONSeuu6C6_LH_-rzLDgIM6RlZJWZ4ROSE', 'Camilo', 'Pit bull terrier americano', 12),
(16, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoESZk62fsav0Ky-XthYHPzUPBQlFMTng7Mfg_ioidZsgF8AKI', 'Tommy', 'Gato Ginger ', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `pass` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `email`, `pass`) VALUES
(12, 'Santiago ', 'santi@gmail.com', '1234'),
(14, 'Santiago', 'santiago12@gmail.com', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pets_users` (`iduser`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `fk_pets_users` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
