-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2025 at 04:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_products`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('ingreso','gasto') NOT NULL,
  `category` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_platform` enum('efectivo','visa','master','mercadopago') NOT NULL DEFAULT 'efectivo',
  `installments` int(11) DEFAULT 1,
  `remaining_installments` int(11) DEFAULT 1,
  `fecha` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `type`, `category`, `amount`, `payment_platform`, `installments`, `remaining_installments`, `fecha`, `description`, `created_at`) VALUES
(10, 2, 'gasto', 'Alquiler', 550000.00, 'efectivo', 1, 1, '2025-02-10', 'Alquiler\r\n', '2025-02-16 19:43:15'),
(12, 2, 'ingreso', 'Sueldo', 1750000.00, 'efectivo', 1, 1, '2025-02-01', 'Sueldo', '2025-02-16 19:44:58'),
(17, 2, 'gasto', 'Cama', 107568.00, 'visa', 1, 18, '2025-02-08', 'Cama 1/18', '2025-02-17 00:22:09'),
(18, 2, 'gasto', 'Comida', 36483.00, 'master', 1, 1, '2025-02-16', 'Abastecedor', '2025-02-17 00:36:57'),
(19, 2, 'gasto', 'Ropa', 30000.00, 'visa', 1, 3, '2025-01-01', 'Ropa 1/3', '2025-02-17 01:19:29'),
(20, 2, 'gasto', 'Propina', 150.00, 'master', 1, 1, '2025-02-16', 'Propina pedidosYa', '2025-02-17 03:33:55'),
(21, 2, 'gasto', 'Pañales', 16131.00, 'master', 1, 1, '2025-02-16', 'Pañales PedidosYa', '2025-02-17 03:34:27'),
(22, 2, 'gasto', 'Reloj Samsung', 27777.00, 'visa', 1, 8, '2025-02-17', 'Reloj Samsung 10/18', '2025-02-17 03:38:10'),
(23, 2, 'gasto', 'Saca Leche', 21373.00, 'visa', 1, 2, '2025-01-12', 'Saca Leche por tienda Galicia 7/9', '2025-02-17 03:40:59'),
(24, 2, 'gasto', 'MELI', 30140.00, 'master', 1, 1, '2025-02-15', 'Globos para cumple de Bruno', '2025-02-17 15:46:50'),
(25, 2, 'gasto', 'Dia', 27205.00, 'master', 1, 1, '2025-01-17', 'Compra día online', '2025-02-17 15:50:07'),
(26, 2, 'gasto', 'YPF', 3480.00, 'master', 1, 1, '2025-01-17', 'YPF full', '2025-02-17 15:50:55'),
(27, 2, 'gasto', 'La Española', 16448.00, 'master', 1, 1, '2025-01-19', 'Panadería', '2025-02-17 15:52:07'),
(28, 2, 'gasto', 'Yesi', 12000.00, 'mercadopago', 1, 1, '2025-02-18', 'Yesikita', '2025-02-18 18:21:43'),
(29, 2, 'gasto', 'Tuenti', 2000.00, 'mercadopago', 1, 1, '2025-02-18', 'Credito para Mari', '2025-02-18 18:29:11'),
(30, 2, 'gasto', 'Casa', 27143.00, 'mercadopago', 1, 1, '2025-02-17', 'Limpieza de tanques', '2025-02-18 18:30:02'),
(31, 2, 'gasto', 'Casa', 5000.00, 'mercadopago', 1, 1, '2025-02-18', 'Corte de Pasto', '2025-02-18 18:30:45'),
(32, 2, 'gasto', 'Pañales', 23800.00, 'mercadopago', 1, 1, '2025-02-18', 'Pañales de Bruno', '2025-02-18 18:31:18'),
(33, 2, 'gasto', 'Comida', 32200.00, 'mercadopago', 1, 1, '2025-02-15', 'Almuerzo', '2025-02-18 18:33:48'),
(34, 2, 'ingreso', 'Comida', 16000.00, 'mercadopago', 1, 1, '2025-02-15', 'De Silvia Almuerzo', '2025-02-18 18:34:17'),
(35, 2, 'gasto', 'Auto', 1057143.00, 'efectivo', 1, 1, '2025-02-06', 'Adelanto Polo', '2025-02-18 18:53:08'),
(36, 2, 'ingreso', 'Sueldo', 1358127.00, 'mercadopago', 1, 1, '2025-02-12', 'Adelanto sueldo Marzo', '2025-02-18 18:54:29'),
(37, 2, 'ingreso', 'Sueldo', 88529.00, 'mercadopago', 1, 1, '2025-02-14', 'Adelanto aumento Marzo', '2025-02-18 18:55:00'),
(40, 2, 'gasto', 'Auto', 624049.00, 'visa', 1, 1, '2025-02-04', 'Cuota Polo BBVA', '2025-02-18 19:50:28'),
(41, 2, 'gasto', 'Telepase', 16651.00, 'visa', 1, 1, '2025-02-04', 'Peaje BBVA', '2025-02-18 19:50:53'),
(42, 2, 'gasto', 'Auto', 30.00, 'visa', 1, 1, '2025-03-12', 'Ultima cuota Polo', '2025-02-18 19:54:21'),
(43, 2, 'gasto', 'Havanna', 25400.00, 'visa', 1, 1, '2025-01-28', 'Merienda', '2025-02-18 20:19:06'),
(44, 2, 'gasto', 'Youtube', 3699.00, 'visa', 1, 1, '2025-01-26', 'Youtube Premium', '2025-02-18 20:22:41'),
(45, 2, 'gasto', 'GYM', 13999.00, 'visa', 1, 1, '2025-01-21', 'Wllhub', '2025-02-18 20:23:18'),
(46, 2, 'gasto', 'Comida', 20394.00, 'visa', 1, 1, '2025-01-16', 'PedidosYa', '2025-02-18 20:24:07'),
(47, 2, 'gasto', 'Supermercado', 69623.00, 'visa', 1, 1, '2025-02-16', 'Jumbo', '2025-02-18 20:24:46'),
(48, 2, 'gasto', 'Propina', 300.00, 'visa', 1, 1, '2025-02-16', 'PedidosYa', '2025-02-18 20:25:13'),
(49, 2, 'gasto', 'Comida', 5217.00, 'visa', 1, 1, '2025-01-13', 'Supermercado', '2025-02-18 20:26:54'),
(50, 2, 'gasto', 'Funda', 8850.00, 'master', 1, 1, '2025-01-24', 'Funda de Mari', '2025-02-18 22:12:27'),
(51, 2, 'gasto', 'Ropa', 3983.00, 'master', 12, 1, '2025-01-18', 'Ropa StockCenter', '2025-02-18 22:14:24'),
(52, 2, 'gasto', 'Perfume', 22500.00, 'master', 12, 1, '2025-01-17', 'Juleriaque Perfume', '2025-02-18 22:14:53'),
(53, 2, 'gasto', 'Cheeky', 23933.00, 'master', 2, 2, '2025-01-21', 'Ropa cheeky', '2025-02-18 22:17:50'),
(54, 2, 'gasto', 'Ropa', 12561.00, 'master', 12, 12, '2025-01-18', '', '2025-02-18 22:19:21'),
(55, 2, 'gasto', 'LAR', 17000.00, 'master', 1, 1, '2025-01-19', 'Mercado Pago Lar ', '2025-02-18 22:22:12'),
(56, 2, 'gasto', 'Dia', 40618.00, 'master', 1, 1, '2025-01-24', 'Día online', '2025-02-18 22:22:49'),
(57, 2, 'gasto', 'Funda', 13700.00, 'efectivo', 1, 1, '2025-01-24', 'Funca celular - Moron', '2025-02-18 22:23:32'),
(58, 2, 'gasto', 'YPF', 10000.00, 'master', 1, 1, '2025-01-24', 'Carga de Nafta', '2025-02-18 22:24:04'),
(59, 2, 'gasto', 'Ropa', 42000.00, 'master', 1, 1, '2025-01-24', 'Cosas para Bruno Vacaciones', '2025-02-18 22:26:19'),
(60, 2, 'gasto', 'Comida', 9500.00, 'master', 1, 1, '2025-01-26', 'Minotauro', '2025-02-18 22:26:43'),
(61, 2, 'gasto', 'Comida', 3800.00, 'master', 1, 1, '2025-01-29', 'La Gamba', '2025-02-18 22:27:23'),
(62, 2, 'gasto', 'Disco', 38561.00, 'master', 1, 1, '2025-01-27', 'Disco vacaciones', '2025-02-18 22:28:35'),
(63, 2, 'gasto', 'Perros', 38562.00, 'master', 1, 1, '2025-01-27', 'Alimento de los perros', '2025-02-18 22:29:23'),
(64, 2, 'gasto', 'Comida', 28800.00, 'master', 1, 1, '2025-01-29', 'Heritage Vacaciones', '2025-02-18 22:30:01'),
(65, 2, 'gasto', 'Comida', 92150.00, 'master', 1, 1, '2025-01-29', 'Estilo Criollo Vacaciones', '2025-02-18 22:30:32'),
(66, 2, 'gasto', 'Comida', 18650.00, 'master', 1, 1, '2025-01-29', 'PedidosYa vacaciones\r\n', '2025-02-18 22:31:18'),
(67, 2, 'gasto', 'Impuesto', 6932.00, 'master', 1, 1, '2025-02-13', 'Impuesto Tarjeta', '2025-02-18 22:33:55'),
(68, 2, 'gasto', 'Comida', 22850.00, 'master', 1, 1, '2025-02-13', 'Comida PedidosYa', '2025-02-18 22:36:57'),
(69, 2, 'gasto', 'Comida', 43783.00, 'mercadopago', 1, 1, '2025-02-18', 'Verdulería', '2025-02-18 22:38:48'),
(70, 2, 'gasto', 'Ropa', 60000.00, 'visa', 1, 1, '2025-01-15', 'Ropa Moov ultima cuota(Se puso una fecha de Febrero)', '2025-02-18 22:46:07'),
(71, 2, 'gasto', 'Juguetes', 27550.00, 'visa', 3, 3, '2025-01-08', 'Kinderland', '2025-02-18 22:47:26'),
(72, 2, 'gasto', 'Comida', 145500.00, 'visa', 1, 1, '2025-01-31', 'El Atlantico vacaciones', '2025-02-18 22:48:29'),
(73, 2, 'gasto', 'Comida', 62641.00, 'visa', 1, 1, '2025-01-31', 'Comida en vacaciones', '2025-02-18 22:49:32'),
(74, 2, 'gasto', 'Comida', 35659.00, 'visa', 1, 1, '2025-01-31', 'Comida PedidosYa', '2025-02-18 22:50:12'),
(75, 2, 'gasto', 'Comida', 32300.00, 'visa', 1, 1, '2025-02-02', 'McDonald', '2025-02-18 22:50:39'),
(76, 2, 'gasto', 'Supermercado', 14877.00, 'visa', 1, 1, '2025-02-03', 'El abastecedor', '2025-02-18 22:51:13'),
(77, 2, 'gasto', 'MELI', 31240.00, 'visa', 1, 1, '2025-02-03', 'Compra en MercadoLibre', '2025-02-18 22:51:50'),
(78, 2, 'gasto', 'Cine', 26900.00, 'visa', 1, 1, '2025-02-04', 'Cine Mufaza', '2025-02-18 22:52:17'),
(79, 2, 'gasto', 'Cine', 7500.00, 'visa', 1, 1, '2025-02-04', 'Nachos', '2025-02-18 22:52:55'),
(80, 2, 'gasto', 'Ropa', 12267.00, 'visa', 3, 3, '2025-02-05', 'Ropa Mimo', '2025-02-18 22:53:38'),
(81, 2, 'gasto', 'Comida', 18830.00, 'visa', 1, 1, '2025-02-05', 'Rappi.', '2025-02-18 22:54:25'),
(82, 2, 'gasto', 'Comida', 10900.00, 'visa', 1, 1, '2025-02-06', 'McDonalds', '2025-02-18 22:54:52'),
(83, 2, 'gasto', 'Comida', 20594.00, 'visa', 1, 1, '2025-02-06', 'PedidosYa', '2025-02-18 22:55:21'),
(84, 2, 'gasto', 'Proteina', 22251.00, 'visa', 2, 1, '2025-02-06', 'Preteina Whey Farmacity', '2025-02-18 22:56:13'),
(85, 2, 'gasto', 'Proteina', 23001.00, 'visa', 2, 2, '2025-02-06', 'Proteina Simplicity', '2025-02-18 22:56:45'),
(86, 2, 'gasto', 'Supermercado', 24148.00, 'visa', 1, 1, '2025-02-09', 'Compra Abastecedor', '2025-02-18 22:59:43'),
(87, 2, 'gasto', 'Comida', 30000.00, 'visa', 1, 1, '2025-02-10', 'Paraisos del Chiripa', '2025-02-18 23:00:12'),
(88, 2, 'gasto', 'Internet', 24639.00, 'visa', 1, 1, '2025-02-10', 'Telecentro Internet', '2025-02-18 23:00:55'),
(89, 2, 'gasto', 'Comida', 23788.00, 'visa', 1, 1, '2025-02-12', 'El Abastecedor', '2025-02-18 23:01:49'),
(90, 2, 'gasto', 'Comida', 3172.00, 'visa', 1, 1, '2025-02-13', 'PedidosYa el total fue 22170 pero me devuelven 18998', '2025-02-18 23:13:11'),
(91, 2, 'gasto', 'Celular', 10219.00, 'visa', 1, 1, '2025-02-13', 'Movistar Movil', '2025-02-18 23:13:56'),
(95, 2, 'gasto', 'Supermercado', 36298.00, 'master', 1, 1, '2025-02-19', 'CulBeneficios', '2025-02-19 17:27:43'),
(96, 2, 'gasto', 'YPF', 30000.00, 'master', 1, 1, '2025-02-01', 'Nafta YPF', '2025-02-19 17:28:11'),
(97, 2, 'gasto', 'Comida', 15300.00, 'mercadopago', 1, 1, '2025-02-19', 'Pedido comida oribe', '2025-02-19 17:28:38'),
(98, 2, 'gasto', 'Nafta', 30000.00, 'master', 1, 1, '2025-02-19', 'Nafta YPF', '2025-02-23 19:03:15'),
(99, 2, 'gasto', 'Supermercado', 69724.00, 'master', 1, 1, '2025-02-01', 'Super ChangoMas', '2025-02-23 19:04:20'),
(100, 2, 'ingreso', 'Supermercado', 20000.00, 'efectivo', 1, 1, '2025-02-19', 'Reintegro compra Super ChangoMas', '2025-02-23 19:04:57'),
(101, 2, 'gasto', 'Movistar', 4500.00, 'mercadopago', 1, 1, '2025-02-19', 'Recarga Internet', '2025-02-23 19:06:36'),
(102, 2, 'gasto', 'Rifa', 4000.00, 'mercadopago', 1, 1, '2025-02-20', 'Rifa Biancusqui', '2025-02-23 19:07:01'),
(103, 2, 'gasto', 'GYM', 14000.00, 'visa', 1, 1, '2025-02-23', 'Gympass', '2025-02-23 19:14:23'),
(104, 2, 'gasto', 'Comida', 14500.00, 'mercadopago', 1, 1, '2025-02-21', 'Gasto comida Mari y Rocio', '2025-02-23 19:16:59'),
(105, 2, 'gasto', 'Masajes', 16000.00, 'mercadopago', 1, 1, '2025-02-21', 'Masajes Julieta', '2025-02-23 19:17:29'),
(106, 2, 'gasto', 'Comida', 12300.00, 'mercadopago', 1, 1, '2025-02-21', 'Pizzería 360\r\n', '2025-02-23 19:18:08'),
(107, 2, 'gasto', 'Barbería', 10000.00, 'mercadopago', 1, 1, '2025-02-22', 'Pola', '2025-02-23 19:18:46'),
(108, 2, 'gasto', 'Vape', 20000.00, 'efectivo', 1, 1, '2025-02-22', 'Vaper Ignite Mari', '2025-02-23 19:19:23'),
(109, 2, 'gasto', 'Comida', 100000.00, 'mercadopago', 1, 1, '2025-02-22', 'Transfer a Fabito', '2025-02-23 19:19:55'),
(110, 2, 'gasto', 'Comida', 9700.00, 'mercadopago', 1, 1, '2025-02-23', 'Pizzería Tres60', '2025-02-24 01:19:08'),
(111, 2, 'gasto', 'GYM', 11000.00, 'master', 1, 1, '2025-02-24', 'Gympass change to Silver plan\r\n', '2025-02-24 16:56:12'),
(112, 2, 'gasto', 'GYM', 11000.00, 'mercadopago', 1, 1, '2025-02-24', 'Tranferencia NitroGYM', '2025-02-24 16:56:44'),
(113, 2, 'gasto', 'Supermercado', 26686.00, 'master', 1, 1, '2025-02-24', 'Abastecedor', '2025-02-24 16:57:43'),
(114, 2, 'ingreso', 'Sueldo', 1680768.00, 'efectivo', 1, 1, '2025-03-01', 'Sueldo Febrero ', '2025-02-24 21:30:43'),
(115, 2, 'ingreso', 'Sueldo', 1358127.00, 'efectivo', 1, 1, '2025-03-07', 'Adelanto Marzo 2025', '2025-02-24 21:33:17'),
(116, 2, 'gasto', 'Jardin', 141960.00, 'mercadopago', 1, 1, '2025-03-10', 'Cuota Jardín', '2025-02-25 13:21:35'),
(117, 2, 'gasto', 'Alquiler', 531000.00, 'efectivo', 1, 1, '2025-03-07', 'Alquiler', '2025-02-25 15:14:18'),
(118, 2, 'gasto', 'Comida', 14400.00, 'mercadopago', 1, 1, '2025-02-26', 'Delivery Tres60', '2025-02-27 03:45:35'),
(119, 2, 'gasto', 'YPF', 30000.00, 'visa', 1, 1, '2025-02-28', 'YPF Nafta', '2025-02-28 19:47:32'),
(120, 2, 'gasto', 'Supermercado', 66805.00, 'mercadopago', 1, 1, '2025-02-27', 'Compra DIA', '2025-02-28 19:49:00'),
(121, 2, 'ingreso', 'Supermercado', 25000.00, 'efectivo', 1, 1, '2025-02-27', 'Reintegro compra DIA', '2025-02-28 19:49:31'),
(122, 2, 'gasto', 'Merienda', 12619.00, 'visa', 1, 1, '2025-02-28', 'Merienda PedidosYa', '2025-03-01 09:06:07'),
(123, 2, 'gasto', 'Comida', 24660.00, 'master', 1, 1, '2025-02-24', 'Comida PedidasYa', '2025-03-01 09:07:35'),
(124, 2, 'gasto', 'Ropa', 10767.00, 'visa', 6, 6, '2025-03-01', 'Ropa Robert 1/6', '2025-03-01 22:13:04'),
(125, 2, 'gasto', 'Comida', 23000.00, 'visa', 1, 1, '2025-03-01', 'Torta La Española', '2025-03-03 02:24:46'),
(126, 2, 'gasto', 'Comida', 30000.00, 'mercadopago', 1, 1, '2025-03-03', 'Comida Casa EZE', '2025-03-04 03:59:57'),
(127, 2, 'gasto', 'Comida', 15130.00, 'visa', 1, 1, '2025-03-03', 'Supermercado DIA Merienda\r\n', '2025-03-04 04:01:30'),
(128, 2, 'gasto', 'Ropa', 8183.00, 'visa', 6, 6, '2025-03-04', 'Penguin cuota 1/6', '2025-03-05 18:55:05'),
(129, 2, 'gasto', 'Comida', 1600.00, 'mercadopago', 1, 1, '2025-03-01', 'Velas y resto de la española', '2025-03-07 12:20:36'),
(130, 2, 'gasto', 'Sueldo', 75000.00, 'mercadopago', 1, 1, '2025-03-05', 'Sueldo de Mari', '2025-03-07 12:21:52'),
(131, 2, 'gasto', 'Pasto', 18000.00, 'mercadopago', 1, 1, '2025-03-05', 'Corta Pasto', '2025-03-07 12:22:20'),
(132, 2, 'gasto', 'Pañales', 26094.00, 'mercadopago', 1, 1, '2025-03-05', 'Pañales Bruno', '2025-03-07 12:23:11'),
(133, 2, 'gasto', 'Limpieza', 15250.00, 'mercadopago', 1, 1, '2025-03-06', 'Yesiquita', '2025-03-07 12:23:48'),
(134, 2, 'ingreso', 'Sueldo', 75000.00, 'efectivo', 1, 1, '2025-03-06', 'Pañales mensual', '2025-03-07 12:24:36'),
(135, 2, 'gasto', 'Comida', 23000.00, 'mercadopago', 1, 1, '2025-03-06', 'Comida de Mari', '2025-03-07 12:24:59'),
(136, 2, 'gasto', 'Comida', 25000.00, 'mercadopago', 1, 1, '2025-03-06', 'Asado con los Pibes', '2025-03-07 12:25:18'),
(137, 2, 'gasto', 'Estacionamiento', 7000.00, 'mercadopago', 1, 1, '2025-03-06', 'Estacionamiento Capital', '2025-03-07 12:30:19'),
(138, 2, 'gasto', 'Servicio', 1140.00, 'mercadopago', 1, 1, '2025-03-07', 'Agua del depto', '2025-03-07 16:46:01'),
(139, 2, 'gasto', 'Luz', 54900.00, 'efectivo', 1, 1, '2025-03-08', 'Luz del mes', '2025-03-09 03:56:17'),
(140, 2, 'gasto', 'Tuenti', 2000.00, 'mercadopago', 1, 1, '2025-03-07', 'Recarga tuenti Maria', '2025-03-09 13:59:44'),
(141, 2, 'gasto', 'Masajes', 20000.00, 'mercadopago', 1, 1, '2025-03-07', 'Masajista', '2025-03-09 14:00:07'),
(142, 2, 'gasto', 'Comida', 21360.00, 'mercadopago', 1, 1, '2025-03-07', 'Hamburguesa Brenda k', '2025-03-09 14:01:08'),
(143, 2, 'gasto', 'Barbería', 15000.00, 'mercadopago', 1, 1, '2025-03-08', 'Pola', '2025-03-09 14:01:32'),
(144, 2, 'gasto', 'Supermercado', 52750.00, 'visa', 1, 1, '2025-03-07', 'Compra Abastecedor', '2025-03-09 14:02:43'),
(145, 2, 'gasto', 'MELI', 35070.00, 'visa', 1, 1, '2025-03-07', 'Extras del cumple de Bruno', '2025-03-09 14:03:37'),
(146, 2, 'gasto', 'Celular', 19140.00, 'visa', 1, 1, '2025-03-12', 'Movistar', '2025-03-11 13:10:27'),
(147, 2, 'gasto', 'Comida', 13200.00, 'mercadopago', 1, 1, '2025-03-11', 'Comida Tres60\r\n', '2025-03-12 00:58:26'),
(148, 2, 'gasto', 'Limpieza', 23760.00, 'mercadopago', 1, 1, '2025-03-11', 'Favia 2 días', '2025-03-12 01:02:11'),
(149, 2, 'gasto', 'Supermercado', 18768.00, 'visa', 1, 1, '2025-03-09', 'Compra Abastecedor', '2025-03-12 01:03:41'),
(150, 2, 'gasto', 'Supermercado', 14960.00, 'visa', 1, 1, '2025-03-10', 'Compra Abastecedor', '2025-03-12 01:04:13'),
(151, 2, 'gasto', 'Movistar', 19139.33, 'visa', 1, 1, '2025-03-01', 'Movistar FO y Celular', '2025-03-12 13:31:29'),
(152, 2, 'gasto', 'Internet', 25811.00, 'visa', 1, 1, '2025-03-12', 'Telecentro ultima cuota', '2025-03-12 13:32:26'),
(153, 2, 'gasto', 'Seguro', 133179.00, 'visa', 1, 1, '2025-03-12', 'Seguro Federación Patronal', '2025-03-12 22:49:33'),
(154, 2, 'gasto', 'Comida', 14700.00, 'mercadopago', 1, 1, '2025-03-13', 'Comida Tres60', '2025-03-14 00:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product`, `type`, `description`, `stock`, `price`, `cost`, `user_id`, `create_at`) VALUES
(7, 'Body negro', 'body', 'El mejor', 5, 5500, 1000, 2, '2025-03-25 12:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `turns`
--

CREATE TABLE `turns` (
  `id` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `employee` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turns`
--

INSERT INTO `turns` (`id`, `client_name`, `email`, `phone`, `employee`, `date`, `user_id`, `created_at`) VALUES
(8, 'Elias', 'elias.kroug@gmail.com', '1140995122', 'Pola', '2025-03-28 09:00:00', 2, '2025-03-23 19:11:57'),
(9, 'Mari', 'elias.kroug@gmail.com', '1140995122', 'Pola', '2025-03-25 10:00:00', 2, '2025-03-23 19:43:41'),
(10, 'Roberto', 'elias.kroug@gmail.com', '1140995122', 'Pola', '2025-03-29 10:00:00', 2, '2025-03-23 20:19:04'),
(11, 'Silvia', 'elias.kroug@gmail.com', '1140995122', 'Pola', '2025-03-28 13:00:00', 2, '2025-03-23 20:19:38'),
(12, 'Elias', 'elias.kroug@gmail.com', '1140995122', 'Pola', '2025-03-25 09:00:00', 2, '2025-03-23 22:12:02'),
(13, 'Bruno', 'elias.kroug@gmail.com', '1140995122', 'Otro', '2025-03-25 09:00:00', 2, '2025-03-24 04:36:42'),
(14, 'Bryan', 'brian.c@gmail.com', '1140995122', 'Pola', '2025-03-28 18:00:00', 2, '2025-03-27 13:51:28'),
(15, 'Bruno', 'elias.kroug@gmail.com', '1140995122', 'Pola', '2025-04-05 12:00:00', 2, '2025-04-05 01:40:36'),
(16, 'Masages', 'elias.kroug@gmail.com', '1140995122', 'Julieta', '2025-04-10 18:00:00', 2, '2025-04-07 14:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(2, 'ekroug', '$2a$10$r3uZMc57gW2RsooPe0YMK.YkWdaIMMjyXQEzW0GxoZwl9RtORvQPO', 'Elias Kroug'),
(3, 'marik', '$2a$10$R4bOxa2BIkKykKTFei68ue82e4k9aRoK5Up6fbK.FIJo9yPVWEIva', 'Maria');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_accounts_user` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `turns`
--
ALTER TABLE `turns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_turns_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `turns`
--
ALTER TABLE `turns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `fk_accounts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `turns`
--
ALTER TABLE `turns`
  ADD CONSTRAINT `fk_turns_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
