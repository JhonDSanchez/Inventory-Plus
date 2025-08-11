-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2025 a las 03:19:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_movimiento`
--

CREATE TABLE `detalles_movimiento` (
  `id` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo_movimiento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_movimiento`
--

INSERT INTO `detalles_movimiento` (`id`, `id_movimiento`, `id_articulo`, `cantidad`, `tipo_movimiento`) VALUES
(5, 5, 205, 4, 'Salida'),
(6, 6, 205, 9, 'Ingreso'),
(7, 7, 207, 4, 'Salida'),
(8, 8, 207, 6, 'Ingreso'),
(9, 9, 216, 10, 'Salida'),
(10, 10, 210, 11, 'Salida'),
(11, 11, 209, 483, 'Ingreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `co` int(11) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `nombre_equipo` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `asignado_a` varchar(100) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `tipo_computador` varchar(50) NOT NULL,
  `marca_procesador` varchar(100) NOT NULL,
  `generacion_procesador` varchar(100) NOT NULL,
  `velocidad_procesador` varchar(50) NOT NULL,
  `ram` int(11) NOT NULL,
  `tipo_disco` varchar(50) NOT NULL,
  `windows` varchar(50) NOT NULL,
  `dispositivos_wifi` varchar(10) NOT NULL,
  `propietario` varchar(100) NOT NULL,
  `placa_proveedor` varchar(50) NOT NULL,
  `serial` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `estado`, `empresa`, `co`, `ciudad`, `area`, `nombre_equipo`, `usuario`, `asignado_a`, `fabricante`, `tipo_computador`, `marca_procesador`, `generacion_procesador`, `velocidad_procesador`, `ram`, `tipo_disco`, `windows`, `dispositivos_wifi`, `propietario`, `placa_proveedor`, `serial`) VALUES
(1, 'Asignado', 'MaxiCassa', 99, 'Bogota', 'Sistemas', 'MAXTI0012', 'jperez', 'Juan Perez Manolin', 'HP', 'Laptop', 'AMD', 'I5-10400U', '2.30GHz', 16, 'SSD', 'Windows 10 Pro', 'SI', 'Makrosoft', '1234', 'ABC1234'),
(2, 'Disponible', 'InnovaPack', 150, 'Medellin', 'Ventas', 'INPK002', 'mgomez', 'Maria Gomez', 'Lenovo', 'Portátil', 'AMD', 'Ryzen 5 3500U', '2.10GHz', 8, 'HDD', 'Windows 11 Home', 'SI', 'Propio', 'PROP', 'X9F8B7'),
(3, 'Asignado', 'PegoMax', 300, 'Cali', 'Logística', 'PGMX003', 'cruiz', 'Carlos Ruiz', 'Dell', 'Laptop', 'Intel', 'I7-1165G7', '2.80GHz', 16, 'SSD', 'Windows 10 Pro', 'SI', 'Compurent', '56789', 'JKL8765'),
(4, 'Mantenimiento', 'MaxContrucciones', 450, 'Barranquilla', 'Obras', 'MAXC004', 'lsalazar', 'Lucia Salazar', 'HP', 'Laptop', 'Intel', 'I3-8130U', '2.20GHz', 4, 'HDD', 'Windows 10 Home', 'NO', 'Makrosoft', '3456', 'MNB6543'),
(5, 'Disponible', 'MaxiCassa', 200, 'Bogota', 'Sistemas', 'MAXTI005', 'pmartinez', 'Pedro Martinez', 'Lenovo', 'Laptop', 'AMD', 'Ryzen 7 4700U', '2.00GHz', 8, 'SSD', 'Windows 11 Pro', 'SI', 'Propio', 'PROP', 'QWERTY9'),
(6, 'Asignado', 'InnovaPack', 520, 'Cali', 'Diseño', 'INPK006', 'srojas', 'Sofia Rojas', 'Dell', 'Laptop', 'Intel', 'I5-10210U', '2.10GHz', 16, 'SSD', 'Windows 10 Pro', 'SI', 'Compurent', '6789', 'ZXC7890'),
(7, 'Asignado', 'PegoMax', 600, 'Bogota', 'Operaciones', 'PGMX007', 'mtorres', 'Miguel Torres', 'HP', 'Laptop', 'Intel', 'I5-1135G7', '2.40GHz', 16, 'HDD', 'Windows 11 Home', 'SI', 'Makrosoft', '2345', 'PLM3210'),
(8, 'Mantenimiento', 'MaxContrucciones', 700, 'Medellin', 'Sistemas', 'MAXC008', 'adiaz', 'Andrea Diaz', 'Lenovo', 'Portátil', 'AMD', 'Ryzen 3 3200U', '2.60GHz', 8, 'HDD', 'Windows 10 Home', 'NO', 'Propio', 'PROP', 'RTY5678'),
(9, 'Disponible', 'MaxiCassa', 800, 'Cali', 'Logística', 'MAXTI009', 'cherrera', 'Camilo Herrera', 'Dell', 'Laptop', 'Intel', 'I7-10510U', '2.50GHz', 16, 'SSD', 'Windows 11 Pro', 'SI', 'Compurent', '7890', 'GFD9087'),
(10, 'Asignado', 'InnovaPack', 650, 'Bogota', 'Ventas', 'INPK010', 'lruiz', 'Laura Ruiz', 'HP', 'Laptop', 'Intel', 'I5-1035G1', '1.80GHz', 8, 'SSD', 'Windows 10 Pro', 'SI', 'Makrosoft', '4567', 'LKJ4567'),
(11, 'Asignado', 'PegoMax', 220, 'Medellin', 'Logística', 'PGMX011', 'dramirez', 'David Ramirez', 'Lenovo', 'Laptop', 'AMD', 'Ryzen 5 4500U', '2.30GHz', 16, 'SSD', 'Windows 11 Home', 'SI', 'Propio', 'PROP', 'ASD4321'),
(12, 'Mantenimiento', 'MaxContrucciones', 340, 'Bogota', 'Obras', 'MAXC012', 'lcardenas', 'Luisa Cardenas', 'Dell', 'Laptop', 'Intel', 'I3-8145U', '2.10GHz', 4, 'HDD', 'Windows 10 Home', 'NO', 'Compurent', '67890', 'QAZ8765'),
(13, 'Disponible', 'MaxiCassa', 110, 'Bogota', 'Sistemas', 'MAXTI013', 'dmoreno', 'Daniel Moreno', 'HP', 'Laptop', 'Intel', 'I5-8265U', '1.60GHz', 8, 'SSD', 'Windows 10 Pro', 'SI', 'Makrosoft', '12345', 'BVC2345'),
(14, 'Asignado', 'InnovaPack', 450, 'Cali', 'Ventas', 'INPK014', 'avillalba', 'Ana Villalba', 'Lenovo', 'Portátil', 'AMD', 'Ryzen 3 3250U', '2.60GHz', 8, 'HDD', 'Windows 11 Home', 'SI', 'Propio', 'PROP', 'MKO5678'),
(15, 'Asignado', 'PegoMax', 500, 'Medellin', 'Operaciones', 'PGMX015', 'omejia', 'Oscar Mejia', 'Dell', 'Laptop', 'Intel', 'I7-10750H', '2.60GHz', 16, 'SSD', 'Windows 11 Pro', 'SI', 'Compurent', '56789', 'EDC8901'),
(16, 'Disponible', 'MaxContrucciones', 710, 'Barranquilla', 'Obras', 'MAXC016', 'vsalas', 'Veronica Salas', 'HP', 'Laptop', 'Intel', 'I3-1005G1', '1.20GHz', 4, 'HDD', 'Windows 10 Home', 'NO', 'Makrosoft', '3456', 'TGB6543'),
(17, 'Mantenimiento', 'MaxiCassa', 250, 'Cali', 'Sistemas', 'MAXTI017', 'flozano', 'Felipe Lozano', 'Lenovo', 'Laptop', 'AMD', 'Ryzen 5 5500U', '2.10GHz', 8, 'SSD', 'Windows 10 Pro', 'SI', 'Propio', 'PROP', 'YHN7890'),
(18, 'Asignado', 'InnovaPack', 370, 'Bogota', 'Logística', 'INPK018', 'nrios', 'Natalia Rios', 'Dell', 'Laptop', 'Intel', 'I5-10310U', '1.70GHz', 16, 'SSD', 'Windows 11 Home', 'SI', 'Compurent', '23456', 'UJM4321'),
(19, 'Disponible', 'PegoMax', 310, 'Medellin', 'Ventas', 'PGMX019', 'jbernal', 'Julian Bernal', 'HP', 'Laptop', 'Intel', 'I5-10210U', '2.10GHz', 8, 'HDD', 'Windows 10 Pro', 'SI', 'Makrosoft', '4567', 'IKM5678'),
(20, 'Asignado', 'MaxContrucciones', 430, 'Bogota', 'Sistemas', 'MAXC020', 'dtorres', 'Diana Torres', 'Lenovo', 'Portátil', 'AMD', 'Ryzen 7 5700U', '1.80GHz', 16, 'SSD', 'Windows 11 Pro', 'SI', 'Propio', 'PROP', 'OLP7890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `accion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `fecha`, `hora`, `usuario`, `accion`) VALUES
(5, '2025-05-29', '01:44:05', 'Jhojan', 'Salida'),
(6, '2025-05-29', '01:44:54', 'Nilson', 'Ingreso'),
(7, '2025-05-29', '01:58:20', 'Sebastian', 'Salida'),
(8, '2025-05-29', '01:58:25', 'Sebastian', 'Ingreso'),
(9, '2025-05-29', '01:58:30', 'Sebastian', 'Salida'),
(10, '2025-05-29', '01:58:39', 'Sebastian', 'Salida'),
(11, '2025-05-29', '01:58:50', 'Sebastian', 'Ingreso'),
(12, '2025-08-05', '06:31:38', 'Geidy', 'Ingreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(201, 'Ryzen 5 5600G', 'Procesador AMD con gráficos integrados', 580000.00, 8, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(202, 'Core i5 12400F', 'Procesador Intel de 6 núcleos sin gráficos integrados', 720000.00, 5, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(203, 'RTX 3060 Ti', 'Tarjeta gráfica Nvidia 8GB GDDR6', 1650000.00, 3, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(204, 'SSD Kingston 480GB', 'Unidad de estado sólido SATA', 140000.00, 12, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(205, 'Fuente EVGA 600W 80+', 'Fuente de poder certificada', 210000.00, 15, '2025-05-25 17:33:35', '2025-05-28 18:44:54'),
(206, 'Corsair Vengeance 16GB DDR4', 'Memoria RAM 3200MHz', 230000.00, 7, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(207, 'Gabinete Redragon', 'Gabinete gamer con ventiladores RGB', 270000.00, 8, '2025-05-25 17:33:35', '2025-05-28 18:58:25'),
(208, 'Placa Asus B550M', 'Board micro ATX para Ryzen', 480000.00, 4, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(209, 'Cooler Master Hyper 212', 'Disipador por aire para CPU', 160000.00, 499, '2025-05-25 17:33:35', '2025-05-28 18:58:50'),
(210, 'SSD M.2 1TB PNY', 'Almacenamiento NVMe Gen3', 280000.00, 4, '2025-05-25 17:33:35', '2025-05-28 18:58:39'),
(211, 'Teclado Redragon Kumara', 'Teclado mecánico retroiluminado', 150000.00, 10, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(212, 'Mouse Logitech G203', 'Mouse gamer con RGB', 100000.00, 14, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(213, 'Monitor AOC 24\"', 'Monitor Full HD 75Hz', 550000.00, 6, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(214, 'Silla Gamer Cougar', 'Silla ergonómica para largas sesiones', 750000.00, 2, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(215, 'Hub USB 3.0', 'Extensor de puertos con alimentación externa', 45000.00, 20, '2025-05-25 17:33:35', '2025-05-25 17:33:35'),
(216, 'Intel Core i5-12400F', 'Procesador de 6 núcleos eficiente para gamers y creadores', 629000.00, 2, '2025-05-25 12:42:19', '2025-05-28 18:58:30'),
(217, 'Kingston Fury Beast 16GB DDR4', 'Memoria RAM DDR4 de 3200MHz, ideal para setups gamers', 159000.00, 20, '2025-05-25 12:42:19', '2025-05-25 12:42:19'),
(218, 'SSD NVMe WD Black 1TB', 'Unidad SSD M.2 de alta velocidad para juegos y cargas pesadas', 369000.00, 15, '2025-05-25 12:42:19', '2025-05-25 12:42:19'),
(219, 'GeForce RTX 3060 Ti', 'Tarjeta gráfica NVIDIA con excelente rendimiento en juegos', 1599000.00, 5, '2025-05-25 12:42:19', '2025-05-25 12:42:19'),
(220, 'Corsair RM750x', 'Fuente de poder 750W 80 Plus Gold totalmente modular', 459000.00, 10, '2025-05-25 12:42:19', '2025-05-25 20:01:45'),
(221, 'chicles', 'goma de mascar', 2.00, 400, '2025-05-28 19:01:08', '2025-08-08 20:30:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `CC` bigint(20) NOT NULL,
  `UserDB` varchar(50) NOT NULL,
  `PassDB` varchar(255) NOT NULL,
  `RoleDB` varchar(20) NOT NULL,
  `NameDB` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`CC`, `UserDB`, `PassDB`, `RoleDB`, `NameDB`) VALUES
(89898989, 'Sopas4', 'pqlo', 'Administrador', 'Sebaspapu'),
(123456789, 'Nilson10', '1234', 'Administrador', 'Nilson'),
(1011096803, 'Admin_Geidy', 'Geidy123', 'Administrador', 'Geidy'),
(1011201466, 'Admin_Jhojan', '111', 'Administrador', 'Jhojan'),
(1032456789, 'Coord_Laura', 'Laura2024', 'Coordinador', 'Laura Gómez'),
(1043567890, 'Audit_Carlos', 'CarlosAudit', 'Auditor', 'Carlos Mendoza'),
(1054678901, 'Coord_Andrea', 'AndreaPass', 'Coordinador', 'Andrea Vargas'),
(1065789012, 'Audit_Miguel', 'MiguelSafe', 'Auditor', 'Miguel Sánchez'),
(1076890123, 'Coord_Sofia', 'SofiaClave', 'Coordinador', 'Sofía Herrera'),
(1087901234, 'Audit_Luis', 'Luis4567', 'Auditor', 'Luis Romero'),
(1098012345, 'Coord_Camila', 'Camila2025', 'Coordinador', 'Camila Torres'),
(1109123456, 'Audit_Daniel', 'DanielPwd', 'Auditor', 'Daniel Ortega'),
(1120234567, 'Coord_Valentina', 'ValeCoord', 'Coordinador', 'Valentina López'),
(1131345678, 'Audit_David', 'DavidAudit', 'Auditor', 'David Ruiz'),
(1142456789, 'Coord_Natalia', 'NataliaC', 'Coordinador', 'Natalia Ramírez'),
(1153567890, 'Audit_Esteban', 'EstebanA1', 'Auditor', 'Esteban Morales'),
(1164678901, 'Coord_Isabella', 'IsaPass', 'Coordinador', 'Isabella León'),
(1175789012, 'Audit_Tomas', 'Tomas2024', 'Auditor', 'Tomás Castillo'),
(1186890123, 'Coord_Fernanda', 'FernandaC', 'Coordinador', 'Fernanda Peña'),
(1197901234, 'Audit_Ricardo', 'RicardoPwd', 'Auditor', 'Ricardo Cárdenas'),
(1208012345, 'Coord_Gabriela', 'GabyCoord', 'Coordinador', 'Gabriela Díaz'),
(1219123456, 'Audit_Sebastian', 'SebasAudit', 'Auditor', 'Sebastián Mejía');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalles_movimiento`
--
ALTER TABLE `detalles_movimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_movimiento` (`id_movimiento`),
  ADD KEY `id_articulo` (`id_articulo`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`CC`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalles_movimiento`
--
ALTER TABLE `detalles_movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_movimiento`
--
ALTER TABLE `detalles_movimiento`
  ADD CONSTRAINT `detalles_movimiento_ibfk_1` FOREIGN KEY (`id_movimiento`) REFERENCES `movimientos` (`id`),
  ADD CONSTRAINT `detalles_movimiento_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
