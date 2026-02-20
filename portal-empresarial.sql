-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-01-2026 a las 08:56:43
-- Versión del servidor: 10.6.22-MariaDB-0ubuntu0.22.04.1
-- Versión de PHP: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portal-empresarial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) DEFAULT 'draft',
  `level` int(11) DEFAULT 0,
  `fixed` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `announcements`
--

INSERT INTO `announcements` (`id`, `user_id`, `title`, `content`, `status`, `level`, `fixed`, `created_at`, `updated_at`) VALUES
(20, 12, 'Reporte de incidencias', 'Buenos días, en caso de encontrar cualquier incidencia sobre el aplicativo podéis enviar un correo a portalempresarial@monlau.com o xaviermorcam@campus.monlau.com, os atenderé lo antes posible. ', 'archived', 2, 1, '2024-02-02 11:50:02', '2025-02-25 20:13:21'),
(21, 12, 'Responsive', 'Teóricamente el aplicativo lo he diseñado para todas las resoluciones habidas y por haber, en caso de no ver cualquier punto o consideráis que es erróneo o poco cómodo de cara al usuario en una resolución en específico podéis comentármelo al correo destacado. ', 'archived', 0, 0, '2024-02-02 11:52:02', '2025-02-25 20:13:21'),
(22, 12, 'Linkedin', 'Este proyecto tiene mucho trabajo detrás, os agradecería que me siguieseis en Linkedin... \n\nPerfil: linkedin.com/in/xavier-morell', 'published', 0, 1, '2024-02-02 11:53:36', '2025-02-25 20:13:32'),
(23, 12, 'Proyecto y código fuente', 'No os olvidéis de darle una estrella en Github al proyecto en github.com/Xavimc04/company-simulator', 'archived', 0, 0, '2024-02-02 11:54:44', '2025-02-25 20:13:19'),
(24, 12, 'Salida a BETA del portal', 'Accede a este enlace y dale like al post! \n\nhttps://www.linkedin.com/pulse/versi%25C3%25B3n-beta-del-portal-empresarial-xavi-morell-wokvf', 'archived', 1, 0, '2024-02-07 16:07:19', '2025-02-25 20:13:19'),
(25, 12, 'Error 400 en pantalla', 'Buenas tardes, en caso de que os aparezca en pantalla \"400 - Bad request\", revisad que lo que estéis comprando o estéis accediendo no tenga guiones! Si es un producto pedid que quiten el guion, si no es vuestro enviadme un correo y lo cambiaré manualmente. Muchas gracias. ', 'archived', 2, 1, '2024-02-16 14:59:18', '2025-02-25 20:13:18'),
(26, 12, '🚀 ¡Nuevas mejoras en el Portal Empresarial! 🔥', 'Hemos actualizado la plataforma para ofrecerte una experiencia más limpia y eficiente:\n\n✅ Solo productos de empresas activas – Di adiós a productos de empresas inactivas.\n🔍 Nuevo filtro – Encuentra lo que necesitas más rápido que nunca.\n\n✨ En Wevvi seguimos optimizando el marketplace para que vendas más y mejor. ¿Aún no nos conoces? Escríbenos y llevamos tu negocio al siguiente nivel. 🚀🔥', 'archived', 2, 0, '2025-02-25 20:16:27', '2025-02-25 20:16:43'),
(27, 12, '🚀 ¡Nuevas mejoras en el Portal Empresarial! 🔥', 'Hemos actualizado la plataforma para ofrecerte una experiencia más limpia y eficiente:\n\n✅ Solo productos de empresas activas – Di adiós a productos de empresas inactivas.\n\n🔍 Nuevo filtro – Encuentra lo que necesitas más rápido que nunca.\n\n✨ En Wevvi seguimos optimizando el marketplace para que vendas más y mejor. ¿Aún no nos conoces? Escríbenos y llevamos tu negocio al siguiente nivel. 🚀🔥', 'published', 1, 0, '2025-02-25 20:17:06', '2025-11-27 19:05:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centers`
--

CREATE TABLE `centers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `centers`
--

INSERT INTO `centers` (`id`, `name`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Monlau Group', 'contacto@monlau.com', 'active', '2023-10-25 15:58:02', '2023-10-25 17:08:38'),
(3, 'Application Owner', 'portalempresarial@monlau.com', 'active', '2023-10-25 16:01:09', '2024-02-08 08:27:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `social_denomination` varchar(100) DEFAULT NULL,
  `sector` varchar(70) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'inactive',
  `cif` varchar(30) DEFAULT NULL,
  `icon` longtext DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `cp` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `form_level` varchar(100) DEFAULT NULL,
  `website` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `center_id`, `social_denomination`, `sector`, `status`, `cif`, `icon`, `phone`, `location`, `cp`, `city`, `contact_email`, `form_level`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Avancem-amb-voste', 2, 'Avannubo', 'Educación', 'inactive', 'K8235310', 'FFwHDVc2lQYD6ZhNvDjOmngEhSaQB9hp50BTiLi8.jpg', '607824440', 'Carrer almogàvers, 7', '08923', 'Marina, Barcelona', 'xavier.morell@avannubo.com', 'Otros', 'https://avannubo.com', '2023-11-09 17:03:23', '2025-02-25 19:53:35'),
(2, 'Apple', 2, 'Apple, INC', 'Informática', 'active', 'H8356240', 'WEqU0xl0GT0Lsuw0YqgbVToAB27nJCfUdAJIvoB6.png', NULL, NULL, NULL, NULL, 'contacto@apple.com', 'Bachillerato', 'https://aclaputra.github.io/company-profile/', '2023-11-23 16:42:56', '2025-05-27 19:12:51'),
(3, 'Eventics', 2, 'Eventics,SL', 'Arte y cultura', 'inactive', 'B23901278', 'CbZYTj78pdMxLZforBLicAunzUHYmxzFXOeKiLdc.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'derekhigdel@campus.monlau.com', 'CFGM Gestión Administrativa', 'https://aleixhiemay.wixsite.com/eventics', '2024-01-31 17:27:03', '2025-02-25 20:07:54'),
(4, 'Bless Design, SL', 2, 'Bless Design,SL', 'Material y mobiliario de oficina', 'inactive', 'B90762345', 'URRn3LI7fuuY6LXC3jLssyaPXvmD6TEcJ9olbs6Y.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', NULL, 'CFGM Gestión Administrativa', 'https://raccoon-opossum-tlke.squarespace.com/config/.com', '2024-01-31 17:56:41', '2024-02-22 14:41:15'),
(5, 'Regreen-Furniture', 2, 'Regreen Furniture,SL', 'Material y mobiliario de oficina', 'inactive', 'B67451234', 'TATf0dMDmti9iH0cGYlFjgDYSxpMGrOjXmBB6SJS.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'alejandropragui@campus.monlau.com', 'CFGM Gestión Administrativa', 'https://65dcc1b6b4928.site123.me/', '2024-01-31 18:00:17', '2025-02-21 07:49:18'),
(6, 'SNAPSNACK', 2, 'SNAPSNACK,SL', 'Alimentación', 'inactive', 'B78650123', 'MGsWAQ0DJXkkRsANn7AJIWeAyJzxy9STzVHL0zoQ.png', '933408204', 'C/ Monlau,6', '08027', 'Barcelona', 'raulmorcal@campus.monlau.com', 'CFGM Gestión Administrativa', NULL, '2024-01-31 18:17:28', '2025-02-21 07:50:44'),
(7, 'TURBOTECH', 2, 'TURBOTECH,SL', 'Transportes, logística y almacenamiento', 'inactive', 'B62390123', 'suwt0RzOwpTI1Soa7jtHpT7Ht30wQR2UbeOkjFiN.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'hannahheijar@campus.monlau.com', 'CFGM Gestión Administrativa', 'https://turbotechnew.wixsite.com/turbotech', '2024-01-31 18:20:07', '2025-02-21 07:54:35'),
(8, 'PBOOM-OFFICE', 2, 'PBOOM OFFICE,SL', 'Material y mobiliario de oficina', 'inactive', 'B7823460', 'F3CfMwnN1Eg39CdyQm9YO14HgIUv4r62QvjMrSfE.png', '933408204', 'C/ Monlau,6', '08027', 'Barcelona', 'petrovan@campus.monlau.com', 'CFGM Gestión Administrativa', 'https://redoyu5467.wixsite.com/my-site-1', '2024-01-31 18:22:41', '2025-02-21 08:03:30'),
(9, 'FEM-FESTA', 2, 'FEM FESTA, SL', 'Ocio', 'inactive', 'B57901234', 'GqTuNgbi9mayRT3pMa1kfu86BElr0nMo5PvqLhFW.jpg', '933408204', 'C/ Monlau,6', '08027', 'Barcelona', 'hectorcamesp@campus.monlau.com', 'Otros', 'https://sway.cloud.microsoft/NrrMxgIHfq5SB3rG?ref=Link', '2024-02-02 11:30:45', '2025-02-21 08:08:46'),
(10, 'TECNOFIX', 2, 'TECNOFIX,SL', 'Informática', 'inactive', 'B81257891', 'B0f8klHNlWwwF2VNmxUt3FKfu5suVvwhj3B3TcRX.png', '933408204', 'C/ Monlau, 6', '08027', 'BARCELONA', 'martaandmar@campus.monlau.com', 'Otros', 'https://daraca052.wixsite.com/tecnofix', '2024-02-02 11:32:47', '2025-02-21 08:09:01'),
(11, 'JOVAGGIO', 2, 'JOVAGGIO,SL', 'Informática', 'inactive', 'B51213490', '0k0gI9mZGhjlMjtSoBSy5T02LrFYRFn0MzHNuI8f.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'martilopbel@campus.monlau.com', 'Otros', NULL, '2024-02-02 11:34:29', '2025-02-21 08:17:52'),
(12, 'Keymouse', 2, 'Keymouse,SL', 'Informática', 'inactive', 'B54901827', 'LjmmXfA7JRJoCiHwV1X88EIreoKssIYe4CyyQx2B.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'paugilrea@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-05 15:07:44', '2024-02-19 14:26:06'),
(13, 'Elite Barber', 2, 'Elite Barber,SL', 'Moda', 'inactive', 'B18523100', 'fheO63wPWSpNUAlopRCTp5QXwsXGuHQVJNDp4XDJ.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'alexgrafor@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-05 15:09:04', '2024-02-19 14:26:50'),
(14, 'Planchistería Gloria', 2, 'Planchistería Gloria,SL', 'Servicios a empresas', 'inactive', 'B85971354', 'S0udtfaCRU20VAscrywVUXHMEodBnJsJVrYmQATq.png', '933408204', 'C/ Monlau,6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', NULL, '2024-02-05 15:11:29', '2024-02-05 15:34:51'),
(15, 'Montana', 2, 'Montana,SL', 'Moda', 'inactive', 'B25793614', '0kSqNmhLQUY1Ti9ZpWH3uY9WnNao7p3UobeDpQm6.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'elsacoygar@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-05 15:12:03', '2024-02-19 14:28:06'),
(16, 'Tecof', 2, 'Tecof,SA', 'Material y mobiliario de oficina', 'inactive', 'A08534176', 'k4kReOWCVm1tMGmFFEJXjpnjz1pVI69f5jnzxpf6.png', '933408204', 'C/Monlau,6', '08027', 'Barcelona', 'antonijidon@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-05 15:12:58', '2024-02-19 14:29:16'),
(17, 'Aromes', 2, 'Aromes,SL', 'Alimentación', 'inactive', 'B89234812', 'IAxwoDEMzoNbjsfoSZWgY1bIXGAcyq5IFWoh5x7l.png', '933408204', 'C/Monlau,6', '08027', 'Barcelona', 'desireereypen@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-05 15:13:26', '2024-02-19 14:25:08'),
(18, 'Mariscos Recio S.L', 3, 'Mariscos Recio', 'Alimentación', 'inactive', 'Y346786432', 'vVmUESkJorcnak4Um0gpDfvuaqXYvyIQ64FEpy7u.png', NULL, NULL, NULL, NULL, NULL, 'Bachillerato', 'http://google.com', '2024-02-07 14:41:00', '2024-02-07 15:04:19'),
(19, 'UP DEFENCE', 2, 'UP DEFENCE,SL', 'Seguridad', 'inactive', 'B25270187', 'jtyHzSZ3bzkgLsYDxFHwYX1MvBvlK8nskj1IjUW1.png', '933408204', 'C/ Monlau.6', '08027', 'BARCELONA', 'zamirasebcol@campus.monlau.com', 'CFGS Márketing y Publicidad', 'https://rachelsottec3.wixsite.com/updefence', '2024-02-08 14:35:26', '2024-02-19 14:50:58'),
(20, 'AURORES', 2, 'AURORES,SL', 'Servicios a empresas', 'inactive', 'B29711186', 'Jj1kfx1j48hwhQpyE4PVXwel737LkSvteWdKOGgC.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'bertacamsel@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-08 14:48:28', '2024-02-19 14:51:56'),
(21, 'AUTOESCOLA JOVES', 2, 'AUTOESCOLA JOVES', 'Servicios a empresas', 'inactive', 'B12782300', '67gRm9u1jiXv2suQP4QJGbpjyddtRlhe0PygOKin.png', '933408204', 'C/ Monlau,6', '08027', 'BARCELONA', 'ferrangarred@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-08 14:49:50', '2024-02-19 14:52:42'),
(22, 'NURAULA', 2, 'NURAULA,SL', 'Moda', 'inactive', 'B12389011', '6lkv0bfNMdfww42aUW4AQMon8R6PMjJkjthKcGIm.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'patriciajarbel@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-08 14:52:35', '2024-02-19 14:53:58'),
(23, 'MEISON CARS', 2, 'MEISON CARS,SL', 'Transportes, logística y almacenamiento', 'inactive', 'B12894588', 'lfCqR55jmj77cI9PKEavobsIgqUNI6OjFXBM3lPZ.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'arnaubecmar@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-08 14:53:45', '2024-02-19 14:54:43'),
(24, 'TO U MARKETING', 2, 'TO U MARKETING,SL', 'Servicios a empresas', 'inactive', 'B61232345', 'AKTrPpaTlA44yDwior0JRE4wHptPlVXM3QZYHKmC.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'valentinaherher@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-08 14:55:08', '2024-02-19 14:55:34'),
(25, 'GYMTAS', 2, 'GYMTAS,SL', 'Ocio', 'inactive', 'B99003567', 'aRFsO9STCIXgde12Zgvr6WIQvXcfk59ynOgiVQ2B.png', '933408204', 'C/Monlau,6', '08027', 'Barcelona', 'marionabrabei@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2024-02-08 15:09:05', '2024-02-19 14:56:38'),
(26, 'GREENWRAP', 2, 'GREENWRAP', 'Transportes, logística y almacenamiento', 'active', 'B08643058', 'i2FxXfw4joHuAdMgyOSZB1fH0sq0LiDGlr0xktGV.png', '933408204', 'C/ Monlau 6', '08027', 'Barcelona', '', 'CFGM Gestión Administrativa', NULL, '2025-02-25 17:01:59', '2025-02-26 15:22:31'),
(27, 'SALUD360', 2, 'SALUD360', 'Salud y parafarmacia', 'active', 'B666333399', 'KXUKDvKIIMgKT2u0oQbcq686CRRzLdMkIntVa57V.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', NULL, 'Emprendimiento', 'https://salud360.ivanhuesca.dev/', '2025-02-26 07:38:43', '2025-02-26 15:45:36'),
(28, 'DRINKO', 2, 'DRINKO', 'Hostelería', 'active', 'B90876754', 'GeOEZXSS9fzeovdhORkP0feLP1Va5bma3OFjJeCk.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'marcosrodpal@monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 07:41:34', '2025-02-26 16:59:23'),
(29, 'COMFY', 2, 'COMFY SL', 'Imagen y sonido', 'active', 'B63987410', 'eA6Llzl03w1S1IQl4ojzloWReBeE06ubL33FNOHF.jpg', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'luciacasfer@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 07:42:20', '2025-02-26 15:23:16'),
(30, 'PROVEST', 2, 'PROVEST', 'Seguridad', 'active', 'B08103400', 'WKIX5pURQI5SXnGCuOGGyZIupbi7veIycXaC5mtE.png', '933408204', 'C/ Monlau, 2', '08027', 'Barcelona', 'provestip@gmail.com', 'CFGM Gestión Administrativa', NULL, '2025-02-26 07:43:44', '2025-02-26 15:28:53'),
(32, 'SAFER', 2, 'SAFER', 'Educación', 'active', 'B77799963', 'M5RFA4qF09guEqsPoZHM0QjnsB8ShbsGhT3A04yZ.jpg', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', NULL, '2025-02-26 07:45:16', '2025-02-26 15:44:48'),
(38, 'RENDZ', 2, 'RENDZ', 'Informática', 'active', 'B87963214', 'KDnz3JSiMFMi0qqTdKFnP1Oep0c81OVF3bjIfmmV.png', '933408204', 'C/Monlau.6', '08027', 'Barcelona', 'saralanveg@monlau.com', 'CFGS Márketing y Publicidad', 'https://rendz.alumnes-monlau.com/', '2025-02-26 07:50:45', '2025-02-26 15:22:33'),
(39, 'BANER', 2, 'BANER', 'Informática', 'active', 'B89745621', 'jOmL9hH16X7pneJ4Dxrhgy7l1a8KVcFApVxaUX8L.png', '933408204', 'C/Monlau,6', '08027', 'Barcelona', 'carlospergal@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 07:51:17', '2025-02-26 15:30:06'),
(42, 'PHANTTON', 2, 'PHANTTON SL', 'Educación', 'active', 'B25874125', '9JBNDW5RbmtD5vsUSlzBhpvN63DB10CZcWwJuUyR.png', '933408204', 'C/Monlau. 6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', NULL, '2025-02-26 09:21:14', '2025-02-26 15:41:54'),
(43, 'CLEANS', 2, 'CLEANS SL', 'Hostelería', 'active', 'B96857412', 'PXK7kMIE0ahASrB1WtyFADJJQyq82RuOhk1ad1Tq.png', '933408204', 'C/Monlau,6', '08027', 'Barcelona', 'alexpeioca@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 09:21:52', '2025-02-26 15:27:10'),
(44, 'FLAVORMATIC', 2, 'FLAVORMATIC SL', 'Hostelería', 'active', 'B08013674', 'ncRChkdP31V4lDoQgbz4JuqmPcP95ykDiWmKVByi.png', '933408204', 'C/ Monlau 6', '08027', 'Barcelona', 'flavormaticsl@gmail.com', 'CFGM Gestión Administrativa', NULL, '2025-02-26 09:23:20', '2025-02-26 15:42:16'),
(45, 'PUROVAPEO', 2, 'PUROVAPEO SL', 'Deportes', 'active', 'B90125678', 'sg8meh02ByG8E0b0lnj2O3oAL1SqddzcqTWx7Kua.png', '933408204', 'Monlau, 6', '08027', 'Barcelona', 'liamrubtej@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 09:25:21', '2025-02-26 16:50:58'),
(49, 'RESTHOM', 2, 'RESTHOM', 'Informática', 'active', 'B78541236', 'XToVsc507vFZzamzGTdQji9nCH8S0o9aGa8tUYuC.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'martigalola@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 09:30:57', '2025-02-26 15:31:20'),
(50, 'ARRELS', 2, 'ARRELS', 'Educación', 'active', 'B78457825', 'kPXscc0yeKzkCi3eNp9MZc6pM6nVsqrye0ZT2bd9.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', NULL, '2025-02-26 11:45:34', '2025-02-26 15:42:39'),
(51, 'GLOWINTHEMUD', 2, 'GLOWINTHEMUD', 'Imagen y sonido', 'active', 'B74148965', 'ED0EgdvHNzu7P2kuLeJ0CBXSosziRSDKSqHV8wxL.png', '933408204', 'Monlau, 6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', NULL, '2025-02-26 11:47:40', '2025-02-26 15:43:09'),
(52, 'LEKTRON', 2, 'LEKTRON', 'Informática', 'active', 'B73914682', 'U8rSkxbEcNM63qVT4KiVvSFkI2WAZmC5hQTzPBCT.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'danielgalord@campus.monlau.com', 'Emprendimiento', NULL, '2025-02-26 11:49:09', '2025-02-26 16:07:31'),
(53, 'IDILLYCFLOWERS', 2, 'IDILLYCFLOWERS', 'Arte y cultura', 'active', 'B45639712', 'k2O9nwqlljzg4AVIKn7etKbymtrIihSgnNoU6SQz.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', 'https://www.instagram.com/idyllicflowersmd/', '2025-02-26 12:01:46', '2025-02-26 18:16:06'),
(54, 'ASTRALEA', 2, 'ASTRALEA', 'Arte y cultura', 'active', 'B15975314', 'htXLEBAGVmtnD6HfgTGGdDdpLiO0vw2laWgMl5pn.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', NULL, 'CFGS Márketing y Publicidad', NULL, '2025-02-26 12:06:08', '2025-02-26 15:45:06'),
(55, 'PROVIDENCEESPORTS', 2, 'PROVIDENCEESPORTS', 'Informática', 'active', 'B85214796', 'PIZVLDZLQhW7Yk44QodQII0vWsEIcVJyWcNLO0oJ.png', '933408204', 'C/Monlau,6', '08027', 'Barcelona', 'aleixcrucar@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 12:07:21', '2025-02-26 15:45:29'),
(56, 'RITMOSEMERGENTES', 2, 'RITMOSEMERGENTES', 'Imagen y sonido', 'active', 'B25896314', 'WYfmFCxbr5qNJ9MjDk2ijhML8A9nlKoooLVFhVWp.png', '933408204', 'C/Monlau.6', '08027', 'Barcelona', 'polhermes@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 12:08:44', '2025-02-26 15:45:45'),
(57, 'AJGOURMET', 2, ' AJGOURMET', 'Alimentación', 'active', 'B12398745', 'GR1Wxo2abStGSUjqCpNy98BYV4Ae6heUcQZPN2tA.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'juditmuntab@campus.monlau.com', 'CFGS Márketing y Publicidad', NULL, '2025-02-26 12:09:44', '2025-02-26 15:45:58'),
(58, 'EXTREMESLASH', 2, 'EXTREMESLASH', 'Material y mobiliario de oficina', 'active', 'B08779621', 'fis9UCHpUAAtNuUqYLpjTOU2cYAnbXtJ8QI2fqVV.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'Extremeslashh@hotmail.com', 'CFGM Gestión Administrativa', NULL, '2025-02-26 12:16:15', '2025-02-26 15:46:25'),
(59, 'NATIVA', 2, 'NATIVA', 'Salud y parafarmacia', 'active', 'B08192296', 'kjWn9I4uFtFF9ZIgI68L0zXVcvmVOiwO6D0puZxD.png', '933408204', 'C/ Monlau, 6', '08027', 'Barcelona', 'info.nativa.es@gmail.com', 'CFGM Gestión Administrativa', NULL, '2025-02-26 12:17:18', '2025-02-26 15:46:38'),
(60, 'VITALPERFORM', 2, 'VITALPERFORM', 'Deportes', 'active', 'B45632178', 'mhCvxm6LyCR5oCwpIXM2eer1Ryo3PrjjKOnMWShU.png', '933408204', 'C/Monlau, 6', '08027', 'Barcelona', 'xavieratavar@campus.monlau.com', 'Emprendimiento', NULL, '2025-02-26 12:18:34', '2025-02-26 16:01:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_employees`
--

CREATE TABLE `company_employees` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dept` varchar(100) DEFAULT NULL,
  `boss` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `company_employees`
--

INSERT INTO `company_employees` (`id`, `company_id`, `user_id`, `dept`, `boss`, `created_at`, `updated_at`) VALUES
(6, 2, 17, 'Finanzas', 1, '2024-01-08 16:01:36', '2024-01-08 16:01:37'),
(9, 3, 28, 'Recursos humanos', 0, '2024-01-31 18:10:18', '2024-01-31 18:10:18'),
(11, 3, 31, 'Finanzas', 0, '2024-01-31 18:13:35', '2024-01-31 18:13:43'),
(43, 14, 66, 'Recepción', 0, '2024-02-05 15:14:00', '2024-02-05 15:14:00'),
(44, 14, 80, 'Recursos humanos', 0, '2024-02-05 15:14:30', '2024-02-05 15:14:30'),
(45, 14, 64, 'Finanzas', 0, '2024-02-05 15:14:50', '2024-02-05 15:14:50'),
(46, 13, 70, 'Recepción', 0, '2024-02-05 15:18:52', '2024-02-05 15:18:52'),
(47, 13, 81, 'Recursos humanos', 0, '2024-02-05 15:19:36', '2024-02-05 15:19:36'),
(48, 16, 67, 'Recursos humanos', 0, '2024-02-05 15:20:57', '2024-02-05 15:20:57'),
(49, 16, 73, 'Finanzas', 0, '2024-02-05 15:21:12', '2024-02-05 15:21:12'),
(50, 16, 72, 'Compras', 0, '2024-02-05 15:21:40', '2024-02-05 15:21:40'),
(51, 16, 71, 'Finanzas', 0, '2024-02-05 15:25:17', '2024-02-05 15:25:17'),
(52, 13, 84, 'Compras', 0, '2024-02-05 15:26:10', '2024-02-05 15:26:10'),
(53, 17, 77, 'Ventas', 0, '2024-02-05 15:28:24', '2024-02-05 15:29:48'),
(54, 17, 69, 'Compras', 0, '2024-02-05 15:29:11', '2024-02-05 15:30:20'),
(55, 17, 63, 'Ventas', 0, '2024-02-05 15:31:20', '2024-02-05 15:31:20'),
(56, 17, 62, 'Finanzas', 0, '2024-02-05 15:32:14', '2024-02-05 15:32:14'),
(57, 12, 76, 'Recepción', 0, '2024-02-05 15:33:47', '2024-02-05 15:33:47'),
(58, 12, 75, 'Finanzas', 0, '2024-02-05 15:34:07', '2024-02-05 15:35:09'),
(59, 12, 59, 'Compras', 0, '2024-02-05 15:34:24', '2024-02-05 15:34:24'),
(60, 12, 78, 'Recursos humanos', 0, '2024-02-05 15:34:46', '2024-02-05 15:34:46'),
(61, 12, 82, 'Ventas', 0, '2024-02-05 15:35:00', '2024-02-05 15:35:00'),
(62, 15, 65, 'Recepción', 0, '2024-02-05 15:35:41', '2024-02-05 15:35:41'),
(63, 15, 74, 'Finanzas', 0, '2024-02-05 15:35:58', '2024-02-05 15:35:58'),
(64, 15, 68, 'Compras', 0, '2024-02-05 15:36:34', '2024-02-05 15:36:34'),
(65, 18, 103, 'Recepción', 0, '2024-02-07 14:41:50', '2024-02-07 14:41:50'),
(66, 18, 104, 'Recepción', 0, '2024-02-07 14:41:55', '2024-02-07 14:41:55'),
(67, 18, 105, 'Recursos humanos', 0, '2024-02-07 14:42:00', '2024-02-07 14:42:00'),
(68, 18, 106, 'Recursos humanos', 0, '2024-02-07 14:42:06', '2024-02-07 14:42:06'),
(69, 18, 107, 'Compras', 1, '2024-02-07 14:42:13', '2024-02-07 14:42:13'),
(70, 18, 108, 'Recursos humanos', 0, '2024-02-07 14:42:18', '2024-02-07 14:42:18'),
(71, 18, 112, 'Recursos humanos', 0, '2024-02-07 14:44:47', '2024-02-07 14:44:47'),
(72, 18, 111, 'Finanzas', 0, '2024-02-07 14:44:52', '2024-02-07 14:44:52'),
(73, 18, 110, 'Compras', 0, '2024-02-07 14:45:01', '2024-02-07 14:45:01'),
(74, 18, 109, 'Recursos humanos', 0, '2024-02-07 14:45:05', '2024-02-07 14:45:05'),
(75, 18, 114, 'Recursos humanos', 0, '2024-02-07 14:47:53', '2024-02-07 14:47:53'),
(76, 18, 116, 'Recepción', 0, '2024-02-07 14:48:13', '2024-02-07 14:48:13'),
(77, 18, 117, 'Recursos humanos', 1, '2024-02-07 14:49:14', '2024-02-07 14:49:14'),
(78, 18, 119, 'Finanzas', 1, '2024-02-07 14:49:21', '2024-02-07 14:49:21'),
(79, 18, 118, 'Recursos humanos', 0, '2024-02-07 14:49:28', '2024-02-07 14:49:28'),
(80, 18, 120, 'Finanzas', 0, '2024-02-07 14:49:33', '2024-02-07 14:49:33'),
(81, 18, 115, 'Recursos humanos', 0, '2024-02-07 14:49:58', '2024-02-07 14:49:58'),
(82, 18, 121, 'Finanzas', 0, '2024-02-07 14:50:02', '2024-02-07 14:50:02'),
(83, 18, 122, 'Recursos humanos', 1, '2024-02-07 14:52:29', '2024-02-07 14:52:29'),
(84, 18, 123, 'Finanzas', 1, '2024-02-07 14:52:34', '2024-02-07 14:52:34'),
(85, 18, 124, 'Compras', 0, '2024-02-07 14:59:01', '2024-02-07 14:59:01'),
(86, 18, 125, 'Recepción', 0, '2024-02-07 15:03:16', '2024-02-07 15:03:16'),
(87, 18, 126, 'Recepción', 0, '2024-02-07 15:10:05', '2024-02-07 15:10:05'),
(88, 18, 127, 'Recepción', 0, '2024-02-07 15:13:40', '2024-02-07 15:13:40'),
(89, 18, 128, 'Recursos humanos', 0, '2024-02-07 16:35:55', '2024-02-07 16:35:55'),
(91, 18, 130, 'Finanzas', 0, '2024-02-07 17:00:36', '2024-02-07 17:00:36'),
(92, 18, 131, 'Recursos humanos', 0, '2024-02-07 17:00:41', '2024-02-07 17:00:41'),
(93, 18, 132, 'Recursos humanos', 1, '2024-02-07 17:00:47', '2024-02-07 17:00:47'),
(94, 18, 133, 'Finanzas', 1, '2024-02-07 17:00:53', '2024-02-07 17:00:53'),
(95, 18, 134, 'Finanzas', 0, '2024-02-07 17:00:58', '2024-02-07 17:00:58'),
(96, 18, 135, 'Recursos humanos', 0, '2024-02-07 17:01:04', '2024-02-07 17:01:04'),
(97, 18, 136, 'Recepción', 0, '2024-02-07 17:01:09', '2024-02-07 17:01:09'),
(98, 18, 137, 'Compras', 0, '2024-02-07 17:01:18', '2024-02-07 17:01:18'),
(99, 18, 138, 'Finanzas', 0, '2024-02-07 17:01:23', '2024-02-07 17:01:23'),
(100, 18, 139, 'Compras', 1, '2024-02-07 17:01:29', '2024-02-07 17:01:29'),
(101, 18, 140, 'Recepción', 0, '2024-02-07 17:01:40', '2024-02-07 17:01:40'),
(102, 18, 141, 'Recursos humanos', 0, '2024-02-07 17:02:07', '2024-02-07 17:02:07'),
(103, 18, 142, 'Recursos humanos', 1, '2024-02-07 17:02:11', '2024-02-07 17:02:11'),
(104, 18, 143, 'Recursos humanos', 0, '2024-02-07 17:02:37', '2024-02-07 17:02:37'),
(106, 19, 98, 'Finanzas', 0, '2024-02-08 14:46:26', '2024-02-08 14:46:26'),
(107, 19, 88, 'Compras', 0, '2024-02-08 14:46:44', '2024-02-08 14:46:44'),
(108, 19, 95, 'Ventas', 0, '2024-02-08 14:47:08', '2024-02-08 14:47:08'),
(109, 21, 96, 'Ventas', 0, '2024-02-08 14:50:56', '2024-02-08 14:50:56'),
(110, 21, 113, 'Compras', 0, '2024-02-08 14:51:22', '2024-02-08 14:51:22'),
(111, 22, 90, 'Finanzas', 0, '2024-02-08 14:53:22', '2024-02-08 14:53:22'),
(112, 22, 97, 'Finanzas', 0, '2024-02-08 14:53:35', '2024-02-08 14:53:35'),
(113, 22, 91, 'Ventas', 0, '2024-02-08 14:54:14', '2024-02-08 14:54:14'),
(115, 23, 92, 'Ventas', 0, '2024-02-08 14:56:48', '2024-02-08 14:56:48'),
(116, 23, 146, 'Recursos humanos', 0, '2024-02-08 14:58:47', '2024-02-08 14:58:47'),
(117, 23, 147, 'Compras', 0, '2024-02-08 15:00:45', '2024-02-08 15:00:45'),
(118, 22, 148, 'Finanzas', 0, '2024-02-08 15:01:25', '2024-02-08 15:01:25'),
(119, 25, 86, 'Finanzas', 0, '2024-02-08 15:09:49', '2024-02-08 15:09:49'),
(120, 25, 93, 'Recursos humanos', 0, '2024-02-08 15:10:05', '2024-02-08 15:10:05'),
(121, 25, 101, 'Ventas', 0, '2024-02-08 15:10:34', '2024-02-08 15:10:34'),
(122, 20, 87, 'Finanzas', 0, '2024-02-08 15:20:20', '2024-02-08 15:20:20'),
(123, 20, 99, 'Compras', 0, '2024-02-08 15:20:52', '2024-02-08 15:20:52'),
(124, 20, 94, 'Finanzas', 0, '2024-02-08 15:21:04', '2024-02-08 15:21:04'),
(125, 23, 149, 'Ventas', 0, '2024-02-08 15:27:45', '2024-02-08 15:27:45'),
(126, 20, 150, 'Recepción', 0, '2024-02-08 16:08:43', '2024-02-08 16:08:43'),
(127, 24, 89, 'Compras', 0, '2024-02-13 14:21:16', '2024-02-13 14:21:16'),
(128, 24, 145, 'Finanzas', 0, '2024-02-13 14:21:31', '2024-02-13 14:21:31'),
(129, 24, 100, 'Ventas', 0, '2024-02-13 14:21:49', '2024-02-13 14:21:49'),
(130, 1, 17, 'Recepción', 0, '2024-02-13 17:29:39', '2024-02-13 17:29:39'),
(132, 1, 33, 'Finanzas', 1, '2024-05-28 14:34:13', '2024-05-28 14:34:13'),
(133, 26, 153, 'Recepción', 0, '2025-02-26 09:40:03', '2025-02-26 09:40:03'),
(134, 27, 155, 'Compras', 0, '2025-02-26 09:40:59', '2025-02-26 09:40:59'),
(135, 27, 156, 'Compras', 0, '2025-02-26 09:49:36', '2025-02-26 09:49:36'),
(136, 27, 160, 'Finanzas', 0, '2025-02-26 11:42:48', '2025-02-26 11:42:48'),
(137, 52, 158, 'Ventas', 0, '2025-02-26 11:49:54', '2025-02-26 11:49:54'),
(138, 52, 157, 'Recursos humanos', 0, '2025-02-26 11:51:06', '2025-02-26 11:51:06'),
(139, 38, 170, 'Compras', 0, '2025-02-26 14:37:02', '2025-02-26 14:37:02'),
(140, 38, 167, 'Finanzas', 0, '2025-02-26 14:37:32', '2025-02-26 14:37:32'),
(141, 38, 171, 'Compras', 0, '2025-02-26 14:39:14', '2025-02-26 14:39:14'),
(142, 38, 164, 'Finanzas', 0, '2025-02-26 14:39:39', '2025-02-26 14:39:39'),
(143, 26, 187, 'Recursos humanos', 1, '2025-02-26 14:42:53', '2025-02-26 14:42:53'),
(144, 29, 168, 'Compras', 0, '2025-02-26 14:44:09', '2025-02-26 14:44:09'),
(145, 26, 195, 'Ventas', 1, '2025-02-26 14:44:15', '2025-02-26 14:44:15'),
(146, 29, 163, 'Ventas', 0, '2025-02-26 14:44:40', '2025-02-26 14:44:40'),
(147, 29, 169, 'Recursos humanos', 0, '2025-02-26 14:45:20', '2025-02-26 14:45:20'),
(148, 29, 177, 'Ventas', 0, '2025-02-26 14:45:46', '2025-02-26 14:45:46'),
(149, 26, 197, 'Finanzas', 1, '2025-02-26 14:46:02', '2025-02-26 14:46:02'),
(150, 58, 201, 'Compras', 1, '2025-02-26 14:48:49', '2025-02-26 14:48:49'),
(151, 49, 165, 'Compras', 0, '2025-02-26 14:48:59', '2025-02-26 14:48:59'),
(152, 49, 180, 'Compras', 0, '2025-02-26 14:49:29', '2025-02-26 14:49:29'),
(153, 55, 161, 'Compras', 0, '2025-02-26 14:50:58', '2025-02-26 14:50:58'),
(154, 55, 172, 'Ventas', 0, '2025-02-26 14:51:25', '2025-02-26 14:51:25'),
(155, 58, 193, 'Recursos humanos', 1, '2025-02-26 14:51:29', '2025-02-26 14:51:29'),
(156, 56, 200, 'Compras', 0, '2025-02-26 14:52:58', '2025-02-26 14:52:58'),
(157, 56, 181, 'Ventas', 0, '2025-02-26 14:53:20', '2025-02-26 14:53:20'),
(158, 57, 199, 'Finanzas', 0, '2025-02-26 14:54:28', '2025-02-26 14:54:28'),
(159, 57, 179, 'Compras', 0, '2025-02-26 14:54:48', '2025-02-26 14:54:48'),
(160, 57, 178, 'Recursos humanos', 0, '2025-02-26 14:55:18', '2025-02-26 14:55:18'),
(161, 44, 190, 'Recursos humanos', 1, '2025-02-26 14:55:22', '2025-02-26 14:55:22'),
(162, 57, 175, 'Compras', 0, '2025-02-26 14:55:39', '2025-02-26 14:55:39'),
(163, 39, 176, 'Compras', 0, '2025-02-26 14:56:39', '2025-02-26 14:56:39'),
(164, 39, 174, 'Ventas', 0, '2025-02-26 14:57:01', '2025-02-26 14:57:01'),
(165, 58, 203, 'Recepción', 1, '2025-02-26 14:57:03', '2025-02-26 14:57:03'),
(166, 58, 202, 'Ventas', 1, '2025-02-26 14:57:26', '2025-02-26 14:57:26'),
(167, 44, 186, 'Recepción', 1, '2025-02-26 14:57:26', '2025-02-26 14:57:26'),
(168, 44, 183, 'Finanzas', 1, '2025-02-26 14:58:50', '2025-02-26 14:58:50'),
(169, 43, 166, 'Compras', 0, '2025-02-26 14:59:36', '2025-02-26 14:59:36'),
(170, 43, 162, 'Ventas', 0, '2025-02-26 14:59:59', '2025-02-26 14:59:59'),
(171, 30, 182, 'Recursos humanos', 1, '2025-02-26 15:00:10', '2025-02-26 15:00:10'),
(172, 59, 189, 'Recepción', 1, '2025-02-26 15:00:27', '2025-02-26 15:00:27'),
(173, 30, 185, 'Finanzas', 1, '2025-02-26 15:00:43', '2025-02-26 15:00:43'),
(174, 59, 196, 'Finanzas', 1, '2025-02-26 15:00:46', '2025-02-26 15:00:46'),
(175, 30, 188, 'Compras', 1, '2025-02-26 15:01:02', '2025-02-26 15:01:02'),
(176, 30, 194, 'Ventas', 1, '2025-02-26 15:01:26', '2025-02-26 15:01:26'),
(177, 59, 173, 'Recursos humanos', 1, '2025-02-26 15:01:38', '2025-02-26 15:01:38'),
(178, 30, 191, 'Recepción', 1, '2025-02-26 15:01:50', '2025-02-26 15:01:50'),
(179, 59, 192, 'Recursos humanos', 1, '2025-02-26 15:01:54', '2025-02-26 15:01:54'),
(180, 59, 198, 'Compras', 1, '2025-02-26 15:02:29', '2025-02-26 15:02:29'),
(181, 44, 184, 'Compras', 1, '2025-02-26 15:53:48', '2025-02-26 15:53:48'),
(182, 52, 204, 'Finanzas', 0, '2025-02-26 16:07:59', '2025-02-26 16:07:59'),
(183, 27, 205, 'Ventas', 0, '2025-02-26 16:09:15', '2025-02-26 16:09:15'),
(184, 60, 206, 'Compras', 0, '2025-02-26 16:09:53', '2025-02-26 16:09:53'),
(186, 32, 226, 'Finanzas', 0, '2025-02-26 16:47:34', '2025-02-26 16:47:34'),
(187, 32, 215, 'Compras', 0, '2025-02-26 16:48:21', '2025-02-26 16:48:21'),
(188, 42, 210, 'Compras', 0, '2025-02-26 16:52:14', '2025-02-26 16:52:14'),
(189, 42, 218, 'Ventas', 0, '2025-02-26 16:52:40', '2025-02-26 16:52:40'),
(190, 50, 224, 'Finanzas', 0, '2025-02-26 16:53:59', '2025-02-26 16:53:59'),
(191, 50, 212, 'Finanzas', 0, '2025-02-26 16:54:20', '2025-02-26 16:54:20'),
(192, 50, 214, 'Ventas', 0, '2025-02-26 16:54:50', '2025-02-26 16:54:50'),
(193, 50, 213, 'Ventas', 0, '2025-02-26 16:55:08', '2025-02-26 16:55:08'),
(194, 45, 219, 'Compras', 0, '2025-02-26 16:55:54', '2025-02-26 16:55:54'),
(195, 45, 220, 'Compras', 0, '2025-02-26 16:56:28', '2025-02-26 16:56:28'),
(196, 28, 223, 'Finanzas', 0, '2025-02-26 17:00:02', '2025-02-26 17:00:02'),
(197, 28, 229, 'Compras', 0, '2025-02-26 17:00:21', '2025-02-26 17:00:21'),
(198, 28, 225, 'Finanzas', 0, '2025-02-26 17:00:47', '2025-02-26 17:00:47'),
(199, 53, 217, 'Compras', 1, '2025-02-26 17:08:41', '2025-02-26 17:08:41'),
(200, 51, 227, 'Compras', 0, '2025-02-26 17:11:12', '2025-02-26 17:11:12'),
(201, 51, 228, 'Compras', 0, '2025-02-26 17:11:35', '2025-02-26 17:11:35'),
(202, 51, 209, 'Finanzas', 0, '2025-02-26 17:11:57', '2025-02-26 17:11:57'),
(203, 54, 222, 'Compras', 0, '2025-02-26 17:16:56', '2025-02-26 17:16:56'),
(204, 54, 221, 'Finanzas', 0, '2025-02-26 17:17:23', '2025-02-26 17:17:23'),
(205, 54, 216, 'Compras', 0, '2025-02-26 17:19:34', '2025-02-26 17:19:34'),
(206, 54, 211, 'Compras', 0, '2025-02-26 17:20:05', '2025-02-26 17:20:05'),
(207, 32, 231, 'Finanzas', 0, '2025-02-27 17:43:27', '2025-02-27 17:43:27'),
(208, 32, 230, 'Compras', 1, '2025-02-27 17:43:45', '2025-02-27 17:43:45'),
(209, 26, 232, 'Recursos humanos', 1, '2025-03-04 17:24:22', '2025-03-04 17:24:22'),
(210, 60, 208, 'Finanzas', 1, '2025-03-14 08:17:15', '2025-03-14 08:17:15'),
(211, 3, 17, 'Recepción', 0, '2025-05-27 19:20:08', '2025-05-27 19:20:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_market`
--

CREATE TABLE `company_market` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `index` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `company_market`
--

INSERT INTO `company_market` (`id`, `company_id`, `index`) VALUES
(2, 1, 'messages'),
(3, 1, 'english_availability'),
(4, 1, 'public_email');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_teachers`
--

CREATE TABLE `company_teachers` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `company_teachers`
--

INSERT INTO `company_teachers` (`id`, `user_id`, `company_id`) VALUES
(11, 16, 1),
(12, 102, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company_wholesalers`
--

CREATE TABLE `company_wholesalers` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `wholesaler_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `company_wholesalers`
--

INSERT INTO `company_wholesalers` (`id`, `company_id`, `wholesaler_id`) VALUES
(6, 1, 3),
(8, 2, 3),
(10, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery_notes`
--

CREATE TABLE `delivery_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `wholesaler_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` enum('pending','delivered') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `delivery_notes`
--

INSERT INTO `delivery_notes` (`id`, `number`, `order_id`, `company_id`, `wholesaler_id`, `issue_date`, `delivery_date`, `status`, `notes`, `pdf_path`, `created_at`, `updated_at`) VALUES
(1, 'ALB-4-502-20250527-BC9E', 502, 3, 4, '2025-05-27', '2025-05-28', 'pending', 'Pedido realizado a través del Portal Empresarial', 'delivery_notes/albaran_ALB-4-502-20250527-BC9E.pdf', '2025-05-27 19:23:40', '2025-05-27 19:23:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `wholesaler_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mails`
--

CREATE TABLE `mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mails`
--

INSERT INTO `mails` (`id`, `sender_id`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 16, 'dsa', 'dsa', '2025-05-27 18:47:10', '2025-05-27 18:47:10'),
(2, 16, 'dsa', 'dsa', '2025-05-27 18:47:20', '2025-05-27 18:47:20'),
(3, 16, 'dsa', 'dsa', '2025-05-27 18:47:43', '2025-05-27 18:47:43'),
(4, 16, 'dsa', 'dsa', '2025-05-27 18:57:40', '2025-05-27 18:57:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mails_users`
--

CREATE TABLE `mails_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_id` bigint(20) UNSIGNED NOT NULL,
  `readt_at` timestamp NULL DEFAULT NULL,
  `onCopy` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mails_users`
--

INSERT INTO `mails_users` (`id`, `message_id`, `recipient_id`, `readt_at`, `onCopy`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 16, '2025-05-27 18:47:11', 0, NULL, '2025-05-27 18:47:10', '2025-05-27 18:47:11'),
(2, 2, 16, '2025-05-27 18:47:21', 0, NULL, '2025-05-27 18:47:20', '2025-05-27 18:47:21'),
(3, 3, 16, '2025-05-27 18:47:44', 0, NULL, '2025-05-27 18:47:43', '2025-05-27 18:47:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mail_attachments`
--

CREATE TABLE `mail_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mail_attachments`
--

INSERT INTO `mail_attachments` (`id`, `mail_id`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 2, 'vite.svg', 'attachments/iLV1noWiMKPckSppLiRI3OvGYJsKtaZUdFuCgt0K.svg', '2025-05-27 18:47:20', '2025-05-27 18:47:20'),
(2, 3, 'index.html', 'attachments/wVyefsEtdVFl6JYHtO6bJaHRrrr1E4Z8iR7FIDBa.html', '2025-05-27 18:47:43', '2025-05-27 18:47:43'),
(3, 4, 'index-DTAptU2p.js', 'attachments/Bvr0kQe0ocYy0O5f4aWWRr4MWIABloBQfqKqlity.js', '2025-05-27 18:57:40', '2025-05-27 18:57:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_13_175341_create_announcements_table', 10),
(6, '2024_05_13_175341_create_centers_table', 10),
(7, '2024_05_13_175341_create_companies_table', 10),
(8, '2024_05_13_175341_create_company_employees_table', 10),
(9, '2024_05_13_175341_create_company_market_table', 10),
(10, '2024_05_13_175341_create_company_teachers_table', 10),
(11, '2024_05_13_175341_create_company_wholesalers_table', 10),
(12, '2024_05_13_175341_create_failed_jobs_table', 10),
(13, '2024_05_13_175341_create_order_products_table', 10),
(14, '2024_05_13_175341_create_orders_table', 10),
(15, '2024_05_13_175341_create_password_reset_tokens_table', 10),
(16, '2024_05_13_175341_create_product_categories_table', 10),
(17, '2024_05_13_175341_create_products_table', 10),
(18, '2024_05_13_175341_create_roles_table', 10),
(19, '2024_05_13_175341_create_user_cart_products_table', 10),
(20, '2024_05_13_175341_create_users_table', 10),
(21, '2024_05_13_175341_create_verification_codes_table', 10),
(22, '2024_05_13_175341_create_wholesalers_table', 10),
(23, '2024_05_13_175344_add_foreign_keys_to_announcements_table', 10),
(24, '2024_05_13_175344_add_foreign_keys_to_companies_table', 10),
(25, '2024_05_13_175344_add_foreign_keys_to_company_employees_table', 10),
(26, '2024_05_13_175344_add_foreign_keys_to_company_market_table', 10),
(27, '2024_05_13_175344_add_foreign_keys_to_company_teachers_table', 10),
(28, '2024_05_13_175344_add_foreign_keys_to_company_wholesalers_table', 10),
(29, '2024_05_13_175344_add_foreign_keys_to_order_products_table', 10),
(30, '2024_05_13_175344_add_foreign_keys_to_orders_table', 10),
(31, '2024_05_13_175344_add_foreign_keys_to_product_categories_table', 10),
(32, '2024_05_13_175344_add_foreign_keys_to_products_table', 10),
(33, '2024_05_13_175344_add_foreign_keys_to_user_cart_products_table', 10),
(34, '2024_05_13_175344_add_foreign_keys_to_users_table', 10),
(35, '2024_05_13_175344_add_foreign_keys_to_verification_codes_table', 10),
(36, '2024_05_13_175344_add_foreign_keys_to_wholesalers_table', 10),
(37, '2024_05_13_180000_create_wholesaler_product_categories_table', 11),
(38, '2024_05_13_180001_create_wholesaler_products_table', 11),
(39, '2024_05_13_180002_add_foreign_keys_to_wholesaler_product_categories_table', 11),
(40, '2024_05_13_180003_add_foreign_keys_to_wholesaler_products_table', 11),
(41, '2025_04_03_135916_create_emails_table', 11),
(42, '2025_04_03_135926_create_emails_users_table', 11),
(43, '2025_04_04_133411_create_emails_attachments_table', 11),
(44, '2025_05_15_000000_add_wholesaler_product_id_to_user_cart_products_table', 11),
(45, '2025_05_15_000001_add_wholesaler_product_id_to_order_products_table', 11),
(46, '2025_05_15_000002_add_wholesaler_id_to_orders_table', 11),
(47, '2025_05_15_000004_create_pending_wholesaler_deliveries_table', 11),
(48, '2025_05_16_163312_create_delivery_notes_table', 11),
(49, '2025_05_17_000001_create_invoices_table', 11),
(50, '2025_05_20_164050_create_wholesaler_sector_table', 11),
(51, '2025_05_20_164714_add_sector_id_to_wholesalers_table', 11),
(52, '2025_05_23_175113_drop_company_product_stock_table', 11),
(53, '2025_05_27_171529_add_company_id_to_wholesaler_products_table', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `seller_company_id` int(11) DEFAULT NULL,
  `wholesaler_id` int(11) DEFAULT NULL,
  `buyer_company_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `serial`, `status`, `seller_company_id`, `wholesaler_id`, `buyer_company_id`, `user_id`, `created_at`, `updated_at`) VALUES
(108, 'ORD251521708096024', 'processed', 25, NULL, 6, 152, '2024-02-16 15:07:04', '2024-02-16 15:07:16'),
(109, 'ORD24421708096032', 'processed', 24, NULL, 4, 42, '2024-02-16 15:07:12', '2024-02-16 15:07:29'),
(110, 'ORD22601708096056', 'processed', 22, NULL, 9, 60, '2024-02-16 15:07:36', '2024-02-16 15:08:09'),
(111, 'ORD41001708096078', 'processed', 4, NULL, 24, 100, '2024-02-16 15:07:58', '2024-02-16 15:08:12'),
(112, 'ORD61001708096078', 'processed', 6, NULL, 24, 100, '2024-02-16 15:07:58', '2024-02-16 15:08:14'),
(113, 'ORD141001708096078', 'processed', 14, NULL, 24, 100, '2024-02-16 15:07:58', '2024-02-16 15:08:16'),
(114, 'ORD23601708096447', 'processed', 23, NULL, 9, 60, '2024-02-16 15:14:07', '2024-02-16 15:14:23'),
(115, 'ORD14681708096503', 'processed', 14, NULL, 15, 68, '2024-02-16 15:15:03', '2024-02-16 15:15:25'),
(116, 'ORD91461708096519', 'processed', 9, NULL, 23, 146, '2024-02-16 15:15:19', '2024-02-16 15:15:34'),
(117, 'ORD4861708096555', 'processed', 4, NULL, 25, 86, '2024-02-16 15:15:55', '2024-02-16 15:16:25'),
(118, 'ORD16911708096565', 'processed', 16, NULL, 22, 91, '2024-02-16 15:16:05', '2024-02-16 15:17:41'),
(119, 'ORD15661708096592', 'processed', 15, NULL, 14, 66, '2024-02-16 15:16:32', '2024-02-16 15:16:44'),
(120, 'ORD24321708096603', 'processed', 24, NULL, 7, 32, '2024-02-16 15:16:43', '2024-02-16 15:16:54'),
(121, 'ORD71001708096628', 'processed', 7, NULL, 24, 100, '2024-02-16 15:17:08', '2024-02-16 15:17:26'),
(122, 'ORD16911708096649', 'processed', 16, NULL, 22, 91, '2024-02-16 15:17:29', '2024-02-16 15:17:48'),
(123, 'ORD25421708096666', 'processed', 25, NULL, 4, 42, '2024-02-16 15:17:46', '2024-02-16 15:18:04'),
(124, 'ORD22731708096708', 'processed', 22, NULL, 16, 73, '2024-02-16 15:18:28', '2024-02-16 15:21:29'),
(125, 'ORD16911708096748', 'processed', 16, NULL, 22, 91, '2024-02-16 15:19:08', '2024-02-16 15:19:20'),
(126, 'ORD23731708097170', 'processed', 23, NULL, 16, 73, '2024-02-16 15:26:10', '2024-02-16 15:26:37'),
(127, 'ORD24601708097179', 'processed', 24, NULL, 9, 60, '2024-02-16 15:26:19', '2024-02-16 15:27:01'),
(128, 'ORD25321708097257', 'processed', 25, NULL, 7, 32, '2024-02-16 15:27:37', '2024-02-16 15:28:21'),
(129, 'ORD6681708097281', 'processed', 6, NULL, 15, 68, '2024-02-16 15:28:01', '2024-02-16 15:28:29'),
(130, 'ORD161461708097294', 'processed', 16, NULL, 23, 146, '2024-02-16 15:28:14', '2024-02-16 15:28:54'),
(131, 'ORD7861708097305', 'processed', 7, NULL, 25, 86, '2024-02-16 15:28:25', '2024-02-16 15:28:44'),
(132, 'ORD91001708097341', 'processed', 9, NULL, 24, 100, '2024-02-16 15:29:01', '2024-02-16 15:29:20'),
(133, 'ORD151521708097380', 'processed', 15, NULL, 6, 152, '2024-02-16 15:29:40', '2024-02-16 15:29:52'),
(134, 'ORD14911708097481', 'processed', 14, NULL, 22, 91, '2024-02-16 15:31:21', '2024-02-16 15:43:22'),
(135, 'ORD22661708097690', 'processed', 22, NULL, 14, 66, '2024-02-16 15:34:50', '2024-02-16 15:35:00'),
(136, 'ORD15421708097804', 'processed', 15, NULL, 4, 42, '2024-02-16 15:36:44', '2024-02-16 15:37:01'),
(137, 'ORD4681708097882', 'processed', 4, NULL, 15, 68, '2024-02-16 15:38:02', '2024-02-16 15:38:21'),
(138, 'ORD9861708097909', 'processed', 9, NULL, 25, 86, '2024-02-16 15:38:29', '2024-02-16 15:38:46'),
(139, 'ORD24731708097916', 'processed', 24, NULL, 16, 73, '2024-02-16 15:38:36', '2024-02-16 15:47:01'),
(140, 'ORD25601708097937', 'processed', 25, NULL, 9, 60, '2024-02-16 15:38:57', '2024-02-16 15:39:35'),
(141, 'ORD161001708097942', 'processed', 16, NULL, 24, 100, '2024-02-16 15:39:02', '2024-02-16 15:39:12'),
(142, 'ORD161001708097985', 'processed', 16, NULL, 24, 100, '2024-02-16 15:39:45', '2024-02-16 15:39:56'),
(143, 'ORD6911708098026', 'processed', 6, NULL, 22, 91, '2024-02-16 15:40:26', '2024-02-16 15:43:28'),
(144, 'ORD221521708098042', 'processed', 22, NULL, 6, 152, '2024-02-16 15:40:42', '2024-02-16 15:47:07'),
(145, 'ORD141461708098175', 'processed', 14, NULL, 23, 146, '2024-02-16 15:42:55', '2024-02-16 15:43:15'),
(146, 'ORD23661708098209', 'processed', 23, NULL, 14, 66, '2024-02-16 15:43:29', '2024-02-16 15:43:40'),
(147, 'ORD24861708098341', 'processed', 24, NULL, 25, 86, '2024-02-16 15:45:41', '2024-02-16 15:45:52'),
(148, 'ORD9731708098368', 'processed', 9, NULL, 16, 73, '2024-02-16 15:46:08', '2024-02-16 15:47:04'),
(149, 'ORD251001708098390', 'processed', 25, NULL, 24, 100, '2024-02-16 15:46:30', '2024-02-16 15:46:40'),
(150, 'ORD14321708098409', 'processed', 14, NULL, 7, 32, '2024-02-16 15:46:49', '2024-02-16 15:47:00'),
(151, 'ORD7661708098414', 'processed', 7, NULL, 14, 66, '2024-02-16 15:46:54', '2024-02-16 15:47:20'),
(152, 'ORD16601708098414', 'processed', 16, NULL, 9, 60, '2024-02-16 15:46:54', '2024-02-16 15:47:13'),
(153, 'ORD41521708098415', 'processed', 4, NULL, 6, 152, '2024-02-16 15:46:55', '2024-02-16 15:47:10'),
(154, 'ORD6421708098417', 'processed', 6, NULL, 4, 42, '2024-02-16 15:46:57', '2024-02-16 15:47:15'),
(155, 'ORD23911708098423', 'processed', 23, NULL, 22, 91, '2024-02-16 15:47:03', '2024-02-16 15:48:43'),
(156, 'ORD221461708098486', 'processed', 22, NULL, 23, 146, '2024-02-16 15:48:06', '2024-02-16 15:48:30'),
(157, 'ORD13951708100383', 'processed', 13, NULL, 19, 95, '2024-02-16 16:19:43', '2024-02-16 16:22:32'),
(158, 'ORD10761708100535', 'processed', 10, NULL, 12, 76, '2024-02-16 16:22:15', '2024-02-16 16:24:20'),
(159, 'ORD10761708100604', 'processed', 10, NULL, 12, 76, '2024-02-16 16:23:24', '2024-02-16 16:24:24'),
(160, 'ORD12531708100613', 'processed', 12, NULL, 10, 53, '2024-02-16 16:23:33', '2024-02-16 16:24:22'),
(161, 'ORD19701708100667', 'processed', 19, NULL, 13, 70, '2024-02-16 16:24:27', '2024-02-16 16:24:34'),
(162, 'ORD3691708100758', 'processed', 3, NULL, 17, 69, '2024-02-16 16:25:58', '2024-02-16 16:26:09'),
(163, 'ORD8871708100843', 'processed', 8, NULL, 20, 87, '2024-02-16 16:27:23', '2024-02-16 16:36:34'),
(164, 'ORD17311708100904', 'processed', 17, NULL, 3, 31, '2024-02-16 16:28:24', '2024-02-16 16:29:20'),
(165, 'ORD8951708101198', 'processed', 8, NULL, 19, 95, '2024-02-16 16:33:18', '2024-02-16 16:33:29'),
(166, 'ORD11761708101207', 'processed', 11, NULL, 12, 76, '2024-02-16 16:33:27', '2024-02-16 16:33:55'),
(167, 'ORD12501708101213', 'processed', 12, NULL, 11, 50, '2024-02-16 16:33:33', '2024-02-16 16:34:19'),
(168, 'ORD10691708101382', 'processed', 10, NULL, 17, 69, '2024-02-16 16:36:22', '2024-02-16 16:42:47'),
(169, 'ORD11691708101604', 'processed', 11, NULL, 17, 69, '2024-02-16 16:40:04', '2024-02-16 16:42:50'),
(170, 'ORD13761708101630', 'processed', 13, NULL, 12, 76, '2024-02-16 16:40:30', '2024-02-16 16:41:00'),
(171, 'ORD12701708101677', 'processed', 12, NULL, 13, 70, '2024-02-16 16:41:17', '2024-02-16 16:41:51'),
(172, 'ORD12701708101733', 'processed', 12, NULL, 13, 70, '2024-02-16 16:42:13', '2024-02-16 16:42:23'),
(173, 'ORD5951708101767', 'processed', 5, NULL, 19, 95, '2024-02-16 16:42:47', '2024-02-16 16:43:03'),
(174, 'ORD17501708101774', 'processed', 17, NULL, 11, 50, '2024-02-16 16:42:54', '2024-02-16 16:43:56'),
(175, 'ORD17501708101818', 'processed', 17, NULL, 11, 50, '2024-02-16 16:43:38', '2024-02-16 16:43:59'),
(176, 'ORD3871708101820', 'processed', 3, NULL, 20, 87, '2024-02-16 16:43:40', '2024-02-21 17:21:24'),
(177, 'ORD5871708101820', 'processed', 5, NULL, 20, 87, '2024-02-16 16:43:40', '2024-02-21 17:15:27'),
(178, 'ORD8761708101951', 'processed', 8, NULL, 12, 76, '2024-02-16 16:45:51', '2024-02-16 16:46:26'),
(179, 'ORD12461708102127', 'processed', 12, NULL, 8, 46, '2024-02-16 16:48:47', '2024-02-16 16:49:10'),
(180, 'ORD19461708102127', 'processed', 19, NULL, 8, 46, '2024-02-16 16:48:47', '2024-02-16 16:49:12'),
(181, 'ORD20461708102127', 'processed', 20, NULL, 8, 46, '2024-02-16 16:48:47', '2024-02-16 16:49:14'),
(182, 'ORD17701708102155', 'processed', 17, NULL, 13, 70, '2024-02-16 16:49:15', '2024-02-16 16:49:24'),
(183, 'ORD17701708102194', 'processed', 17, NULL, 13, 70, '2024-02-16 16:49:54', '2024-02-16 16:50:12'),
(184, 'ORD3951708102260', 'processed', 3, NULL, 19, 95, '2024-02-16 16:51:00', '2024-02-16 17:04:57'),
(185, 'ORD21501708102264', 'processed', 21, NULL, 11, 50, '2024-02-16 16:51:04', '2024-02-16 16:51:20'),
(186, 'ORD13691708102284', 'processed', 13, NULL, 17, 69, '2024-02-16 16:51:24', '2024-02-16 16:51:59'),
(187, 'ORD5761708102435', 'processed', 5, NULL, 12, 76, '2024-02-16 16:53:55', '2024-02-16 16:54:54'),
(188, 'ORD20501708102510', 'processed', 20, NULL, 11, 50, '2024-02-16 16:55:10', '2024-02-16 16:55:27'),
(189, 'ORD21701708102581', 'processed', 21, NULL, 13, 70, '2024-02-16 16:56:21', '2024-02-16 16:56:37'),
(190, 'ORD8691708102658', 'processed', 8, NULL, 17, 69, '2024-02-16 16:57:38', '2024-02-16 16:58:45'),
(191, 'ORD17461708102677', 'processed', 17, NULL, 8, 46, '2024-02-16 16:57:57', '2024-02-16 16:58:25'),
(192, 'ORD10871708102707', 'processed', 10, NULL, 20, 87, '2024-02-16 16:58:27', '2024-02-22 14:46:00'),
(193, 'ORD11871708102707', 'processed', 11, NULL, 20, 87, '2024-02-16 16:58:27', '2024-02-16 16:58:54'),
(194, 'ORD8691708102735', 'processed', 8, NULL, 17, 69, '2024-02-16 16:58:55', '2024-02-16 16:59:07'),
(195, 'ORD10951708102772', 'processed', 10, NULL, 19, 95, '2024-02-16 16:59:32', '2024-02-16 17:04:58'),
(196, 'ORD3761708102991', 'processed', 3, NULL, 12, 76, '2024-02-16 17:03:11', '2024-02-16 17:03:45'),
(197, 'ORD13871708103046', 'processed', 13, NULL, 20, 87, '2024-02-16 17:04:06', '2024-02-16 17:04:55'),
(198, 'ORD19501708103046', 'processed', 19, NULL, 11, 50, '2024-02-16 17:04:06', '2024-02-16 17:04:48'),
(199, 'ORD20701708103080', 'processed', 20, NULL, 13, 70, '2024-02-16 17:04:40', '2024-02-16 17:05:19'),
(200, 'ORD11951708103086', 'processed', 11, NULL, 19, 95, '2024-02-16 17:04:46', '2024-02-16 17:05:00'),
(201, 'ORD5691708103090', 'processed', 5, NULL, 17, 69, '2024-02-16 17:04:50', '2024-02-16 17:05:21'),
(202, 'ORD21461708103180', 'processed', 21, NULL, 8, 46, '2024-02-16 17:06:20', '2024-02-16 17:07:49'),
(203, 'ORD20951708103576', 'processed', 20, NULL, 19, 95, '2024-02-16 17:12:56', '2024-02-16 17:13:05'),
(204, 'ORD21691708103627', 'processed', 21, NULL, 17, 69, '2024-02-16 17:13:47', '2024-02-16 17:14:05'),
(205, 'ORD11701708103725', 'processed', 11, NULL, 13, 70, '2024-02-16 17:15:25', '2024-02-16 17:16:03'),
(206, 'ORD13501708103734', 'processed', 13, NULL, 11, 50, '2024-02-16 17:15:34', '2024-02-16 17:15:55'),
(207, 'ORD11701708103755', 'processed', 11, NULL, 13, 70, '2024-02-16 17:15:55', '2024-02-16 17:16:05'),
(208, 'ORD19871708103764', 'processed', 19, NULL, 20, 87, '2024-02-16 17:16:04', '2024-02-21 17:15:52'),
(209, 'ORD10461708103779', 'processed', 10, NULL, 8, 46, '2024-02-16 17:16:19', '2024-02-16 17:18:18'),
(210, 'ORD19281708352746', 'processed', 19, NULL, 3, 28, '2024-02-19 14:25:46', '2024-02-19 15:07:23'),
(211, 'ORD19351708352875', 'processed', 19, NULL, 5, 35, '2024-02-19 14:27:55', '2024-02-19 14:38:38'),
(212, 'ORD12281708352910', 'processed', 12, NULL, 3, 28, '2024-02-19 14:28:30', '2024-02-19 15:07:29'),
(213, 'ORD12281708352972', 'processed', 12, NULL, 3, 28, '2024-02-19 14:29:32', '2024-02-19 15:07:31'),
(214, 'ORD12351708353173', 'processed', 12, NULL, 5, 35, '2024-02-19 14:32:53', '2024-02-19 14:38:42'),
(215, 'ORD21391708353181', 'processed', 21, NULL, 5, 39, '2024-02-19 14:33:01', '2024-02-19 14:38:45'),
(216, 'ORD17351708353273', 'processed', 17, NULL, 5, 35, '2024-02-19 14:34:33', '2024-02-19 14:38:46'),
(217, 'ORD20391708353382', 'processed', 20, NULL, 5, 39, '2024-02-19 14:36:22', '2024-02-19 14:39:12'),
(219, 'ORD51131708439694', 'processed', 5, NULL, 21, 113, '2024-02-20 14:34:54', '2024-02-20 14:46:09'),
(220, 'ORD81131708439694', 'processed', 8, NULL, 21, 113, '2024-02-20 14:34:54', '2024-02-20 14:46:11'),
(221, 'ORD101131708439694', 'processed', 10, NULL, 21, 113, '2024-02-20 14:34:54', '2024-02-20 14:46:22'),
(222, 'ORD111131708439694', 'processed', 11, NULL, 21, 113, '2024-02-20 14:34:54', '2024-02-20 14:46:23'),
(223, 'ORD131131708439694', 'processed', 13, NULL, 21, 113, '2024-02-20 14:34:54', '2024-02-20 14:46:25'),
(224, 'ORD171131708439694', 'processed', 17, NULL, 21, 113, '2024-02-20 14:34:54', '2024-02-20 14:46:26'),
(225, 'ORD17531708440656', 'processed', 17, NULL, 10, 53, '2024-02-20 14:50:56', '2024-02-20 14:51:09'),
(226, 'ORD21531708440656', 'processed', 21, NULL, 10, 53, '2024-02-20 14:50:56', '2024-02-20 14:51:11'),
(227, 'ORD20531708440784', 'processed', 20, NULL, 10, 53, '2024-02-20 14:53:04', '2024-02-20 14:55:00'),
(228, 'ORD19531708440842', 'processed', 19, NULL, 10, 53, '2024-02-20 14:54:02', '2024-02-20 14:55:03'),
(229, 'ORD8531708440889', 'processed', 8, NULL, 10, 53, '2024-02-20 14:54:49', '2024-02-20 14:55:05'),
(230, 'ORD3381708534246', 'processed', 3, NULL, 5, 38, '2024-02-21 16:50:46', '2024-02-21 16:50:59'),
(231, 'ORD5311708534662', 'processed', 5, NULL, 3, 31, '2024-02-21 16:57:42', '2024-02-21 16:58:15'),
(232, 'ORD20281708535379', 'processed', 20, NULL, 3, 28, '2024-02-21 17:09:39', '2024-02-21 17:09:57'),
(233, 'ORD3321708538397', 'processed', 3, NULL, 7, 32, '2024-02-21 17:59:57', '2024-02-28 17:06:57'),
(239, 'ORD291671740582623', 'processed', 29, NULL, 38, 167, '2025-02-26 15:10:23', '2025-02-26 15:10:52'),
(240, 'ORD291641740582623', 'processed', 29, NULL, 38, 164, '2025-02-26 15:10:23', '2025-02-26 15:10:54'),
(241, 'ORD291711740582630', 'processed', 29, NULL, 38, 171, '2025-02-26 15:10:30', '2025-02-26 15:10:55'),
(242, 'ORD291701740582634', 'processed', 29, NULL, 38, 170, '2025-02-26 15:10:34', '2025-02-26 15:10:56'),
(243, 'ORD381791740582736', 'processed', 38, NULL, 57, 179, '2025-02-26 15:12:16', '2025-02-26 15:14:20'),
(244, 'ORD381681740582749', 'processed', 38, NULL, 29, 168, '2025-02-26 15:12:29', '2025-02-26 15:12:54'),
(245, 'ORD381791740582812', 'processed', 38, NULL, 57, 179, '2025-02-26 15:13:32', '2025-02-26 15:14:24'),
(246, 'ORD591941740583789', 'processed', 59, NULL, 30, 194, '2025-02-26 15:29:49', '2025-02-26 15:32:18'),
(247, 'ORD301731740584033', 'processed', 30, NULL, 59, 173, '2025-02-26 15:33:53', '2025-02-26 15:34:10'),
(248, 'ORD441531740584262', 'processed', 44, NULL, 26, 153, '2025-02-26 15:37:42', '2025-02-26 15:38:25'),
(249, 'ORD302021740584566', 'processed', 30, NULL, 58, 202, '2025-02-26 15:42:46', '2025-02-26 15:45:28'),
(250, 'ORD581861740584689', 'processed', 58, NULL, 44, 186, '2025-02-26 15:44:49', '2025-02-26 15:50:39'),
(251, 'ORD262021740584694', 'processed', 26, NULL, 58, 202, '2025-02-26 15:44:54', '2025-02-26 15:45:26'),
(252, 'ORD442021740584959', 'processed', 44, NULL, 58, 202, '2025-02-26 15:49:19', '2025-02-26 15:49:35'),
(253, 'ORD442011740585245', 'processed', 44, NULL, 58, 201, '2025-02-26 15:54:05', '2025-02-26 15:54:14'),
(254, 'ORD441931740585436', 'processed', 44, NULL, 58, 193, '2025-02-26 15:57:16', '2025-02-26 15:57:35'),
(255, 'ORD442011740585477', 'processed', 44, NULL, 58, 201, '2025-02-26 15:57:57', '2025-02-26 15:58:21'),
(256, 'ORD441931740585679', 'processed', 44, NULL, 58, 193, '2025-02-26 16:01:19', '2025-02-26 16:01:32'),
(257, 'ORD441931740585920', 'processed', 44, NULL, 58, 193, '2025-02-26 16:05:20', '2025-02-26 16:05:38'),
(258, 'ORD581861740586072', 'pending', 58, NULL, 44, 186, '2025-02-26 16:07:52', '2025-02-26 16:07:52'),
(259, 'ORD592031740586305', 'processed', 59, NULL, 58, 203, '2025-02-26 16:11:45', '2025-03-19 16:02:00'),
(260, 'ORD512141740592385', 'processed', 51, NULL, 50, 214, '2025-02-26 17:53:05', '2025-02-26 17:55:45'),
(261, 'ORD512141740592493', 'processed', 51, NULL, 50, 214, '2025-02-26 17:54:53', '2025-02-26 17:55:50'),
(262, 'ORD282261740592678', 'processed', 28, NULL, 32, 226, '2025-02-26 17:57:58', '2025-02-27 14:12:28'),
(263, 'ORD502271740592763', 'processed', 50, NULL, 51, 227, '2025-02-26 17:59:23', '2025-02-26 18:00:08'),
(264, 'ORD262291740592949', 'processed', 26, NULL, 28, 229, '2025-02-26 18:02:29', '2025-02-28 16:42:46'),
(265, 'ORD322291740592949', 'processed', 32, NULL, 28, 229, '2025-02-26 18:02:29', '2025-02-26 18:07:13'),
(266, 'ORD542171740593516', 'processed', 54, NULL, 53, 217, '2025-02-26 18:11:56', '2025-02-26 18:13:44'),
(267, 'ORD532211740593598', 'processed', 53, NULL, 54, 221, '2025-02-26 18:13:18', '2025-02-26 18:13:34'),
(268, 'ORD271661740755499', 'processed', 27, NULL, 43, 166, '2025-02-28 15:11:39', '2025-02-28 15:12:53'),
(269, 'ORD552141740755535', 'processed', 55, NULL, 50, 214, '2025-02-28 15:12:15', '2025-02-28 15:13:32'),
(270, 'ORD552141740755585', 'processed', 55, NULL, 50, 214, '2025-02-28 15:13:05', '2025-02-28 15:13:35'),
(271, 'ORD421801740755646', 'processed', 42, NULL, 49, 180, '2025-02-28 15:14:06', '2025-02-28 15:21:41'),
(272, 'ORD591741740755664', 'processed', 59, NULL, 39, 174, '2025-02-28 15:14:24', '2025-02-28 15:22:22'),
(273, 'ORD501721740755685', 'processed', 50, NULL, 55, 172, '2025-02-28 15:14:45', '2025-02-28 15:15:04'),
(274, 'ORD391921740755685', 'processed', 39, NULL, 59, 192, '2025-02-28 15:14:45', '2025-02-28 15:15:25'),
(275, 'ORD431551740755727', 'processed', 43, NULL, 27, 155, '2025-02-28 15:15:27', '2025-02-28 15:16:00'),
(276, 'ORD442271740755735', 'processed', 44, NULL, 51, 227, '2025-02-28 15:15:35', '2025-02-28 15:16:25'),
(277, 'ORD511841740755743', 'processed', 51, NULL, 44, 184, '2025-02-28 15:15:43', '2025-02-28 15:16:00'),
(278, 'ORD582191740755746', 'processed', 58, NULL, 45, 219, '2025-02-28 15:15:46', '2025-02-28 15:38:35'),
(279, 'ORD492101740755769', 'processed', 49, NULL, 42, 210, '2025-02-28 15:16:09', '2025-02-28 15:25:00'),
(280, 'ORD511921740755983', 'processed', 51, NULL, 59, 192, '2025-02-28 15:19:43', '2025-02-28 15:20:05'),
(281, 'ORD492141740756003', 'processed', 49, NULL, 50, 214, '2025-02-28 15:20:03', '2025-02-28 15:20:13'),
(282, 'ORD592271740756025', 'processed', 59, NULL, 51, 227, '2025-02-28 15:20:25', '2025-02-28 15:20:49'),
(283, 'ORD501801740756056', 'processed', 50, NULL, 49, 180, '2025-02-28 15:20:56', '2025-02-28 15:21:36'),
(284, 'ORD451841740756059', 'processed', 45, NULL, 44, 184, '2025-02-28 15:20:59', '2025-02-28 15:21:07'),
(285, 'ORD442191740756080', 'processed', 44, NULL, 45, 219, '2025-02-28 15:21:20', '2025-02-28 15:38:32'),
(286, 'ORD271741740756117', 'processed', 27, NULL, 39, 174, '2025-02-28 15:21:57', '2025-02-28 15:22:25'),
(287, 'ORD582101740756151', 'processed', 58, NULL, 42, 210, '2025-02-28 15:22:31', '2025-02-28 15:25:05'),
(288, 'ORD391551740756159', 'processed', 39, NULL, 27, 155, '2025-02-28 15:22:39', '2025-02-28 15:22:46'),
(289, 'ORD431721740756202', 'processed', 43, NULL, 55, 172, '2025-02-28 15:23:22', '2025-02-28 15:23:45'),
(290, 'ORD551661740756205', 'processed', 55, NULL, 43, 166, '2025-02-28 15:23:25', '2025-02-28 15:23:43'),
(291, 'ORD582141740756490', 'processed', 58, NULL, 50, 214, '2025-02-28 15:28:10', '2025-02-28 15:28:18'),
(292, 'ORD451921740756537', 'processed', 45, NULL, 59, 192, '2025-02-28 15:28:57', '2025-02-28 15:29:07'),
(293, 'ORD511551740756591', 'processed', 51, NULL, 27, 155, '2025-02-28 15:29:51', '2025-02-28 15:29:59'),
(294, 'ORD421841740756616', 'processed', 42, NULL, 44, 184, '2025-02-28 15:30:16', '2025-02-28 15:30:27'),
(295, 'ORD272271740756623', 'processed', 27, NULL, 51, 227, '2025-02-28 15:30:23', '2025-02-28 15:30:52'),
(296, 'ORD442101740756634', 'processed', 44, NULL, 42, 210, '2025-02-28 15:30:34', '2025-02-28 15:31:06'),
(297, 'ORD551741740756639', 'processed', 55, NULL, 39, 174, '2025-02-28 15:30:39', '2025-02-28 15:30:49'),
(298, 'ORD452031740756652', 'processed', 45, NULL, 58, 203, '2025-02-28 15:30:52', '2025-02-28 15:31:09'),
(299, 'ORD502031740756652', 'processed', 50, NULL, 58, 203, '2025-02-28 15:30:52', '2025-02-28 15:31:06'),
(300, 'ORD592191740756656', 'processed', 59, NULL, 45, 219, '2025-02-28 15:30:56', '2025-02-28 15:38:29'),
(301, 'ORD491661740756713', 'processed', 49, NULL, 43, 166, '2025-02-28 15:31:53', '2025-02-28 15:32:04'),
(302, 'ORD442101740756720', 'processed', 44, NULL, 42, 210, '2025-02-28 15:32:00', '2025-02-28 15:32:15'),
(303, 'ORD391721740756722', 'processed', 39, NULL, 55, 172, '2025-02-28 15:32:02', '2025-02-28 15:32:15'),
(304, 'ORD431801740756726', 'processed', 43, NULL, 49, 180, '2025-02-28 15:32:06', '2025-02-28 15:32:22'),
(305, 'ORD272191740756957', 'processed', 27, NULL, 45, 219, '2025-02-28 15:35:57', '2025-02-28 15:38:26'),
(306, 'ORD501841740756966', 'processed', 50, NULL, 44, 184, '2025-02-28 15:36:06', '2025-02-28 15:36:44'),
(307, 'ORD442141740756981', 'processed', 44, NULL, 50, 214, '2025-02-28 15:36:21', '2025-02-28 15:36:36'),
(308, 'ORD581661740757013', 'processed', 58, NULL, 43, 166, '2025-02-28 15:36:53', '2025-02-28 15:37:09'),
(309, 'ORD511721740757037', 'processed', 51, NULL, 55, 172, '2025-02-28 15:37:17', '2025-02-28 15:37:46'),
(310, 'ORD552271740757064', 'processed', 55, NULL, 51, 227, '2025-02-28 15:37:44', '2025-02-28 15:38:24'),
(311, 'ORD451551740757073', 'processed', 45, NULL, 27, 155, '2025-02-28 15:37:53', '2025-02-28 15:38:11'),
(312, 'ORD421921740757136', 'processed', 42, NULL, 59, 192, '2025-02-28 15:38:56', '2025-02-28 15:39:14'),
(313, 'ORD581661740757183', 'processed', 58, NULL, 43, 166, '2025-02-28 15:39:43', '2025-02-28 15:39:55'),
(314, 'ORD432031740757192', 'processed', 43, NULL, 58, 203, '2025-02-28 15:39:52', '2025-02-28 15:40:00'),
(315, 'ORD491741740757193', 'processed', 49, NULL, 39, 174, '2025-02-28 15:39:53', '2025-02-28 15:40:07'),
(316, 'ORD592101740757206', 'processed', 59, NULL, 42, 210, '2025-02-28 15:40:06', '2025-02-28 15:40:20'),
(317, 'ORD391801740757214', 'processed', 39, NULL, 49, 180, '2025-02-28 15:40:14', '2025-02-28 15:40:31'),
(318, 'ORD501921740757415', 'processed', 50, NULL, 59, 192, '2025-02-28 15:43:35', '2025-02-28 15:43:48'),
(319, 'ORD592141740757415', 'processed', 59, NULL, 50, 214, '2025-02-28 15:43:35', '2025-02-28 15:43:43'),
(320, 'ORD511801740757516', 'processed', 51, NULL, 49, 180, '2025-02-28 15:45:16', '2025-02-28 15:45:34'),
(321, 'ORD451721740757571', 'processed', 45, NULL, 55, 172, '2025-02-28 15:46:11', '2025-02-28 15:46:23'),
(322, 'ORD441661740757575', 'processed', 44, NULL, 43, 166, '2025-02-28 15:46:15', '2025-02-28 15:46:32'),
(323, 'ORD431841740757577', 'processed', 43, NULL, 44, 184, '2025-02-28 15:46:17', '2025-02-28 15:46:28'),
(324, 'ORD552191740757577', 'processed', 55, NULL, 45, 219, '2025-02-28 15:46:17', '2025-02-28 15:46:33'),
(325, 'ORD492271740757587', 'processed', 49, NULL, 51, 227, '2025-02-28 15:46:27', '2025-02-28 15:46:42'),
(326, 'ORD421551740757623', 'processed', 42, NULL, 27, 155, '2025-02-28 15:47:03', '2025-02-28 15:47:11'),
(327, 'ORD272101740757627', 'processed', 27, NULL, 42, 210, '2025-02-28 15:47:07', '2025-02-28 15:47:23'),
(328, 'ORD581741740757679', 'processed', 58, NULL, 39, 174, '2025-02-28 15:47:59', '2025-02-28 15:53:04'),
(329, 'ORD392031740757722', 'processed', 39, NULL, 58, 203, '2025-02-28 15:48:42', '2025-03-19 16:01:56'),
(330, 'ORD272141740757855', 'processed', 27, NULL, 50, 214, '2025-02-28 15:50:55', '2025-02-28 15:51:08'),
(331, 'ORD501551740757887', 'processed', 50, NULL, 27, 155, '2025-02-28 15:51:27', '2025-02-28 15:51:36'),
(332, 'ORD441741740757972', 'processed', 44, NULL, 39, 174, '2025-02-28 15:52:52', '2025-02-28 15:53:08'),
(333, 'ORD591661740757988', 'processed', 59, NULL, 43, 166, '2025-02-28 15:53:08', '2025-02-28 15:53:24'),
(334, 'ORD431921740757993', 'processed', 43, NULL, 59, 192, '2025-02-28 15:53:13', '2025-02-28 15:53:25'),
(335, 'ORD492191740758006', 'processed', 49, NULL, 45, 219, '2025-02-28 15:53:26', '2025-02-28 15:54:22'),
(336, 'ORD391841740758010', 'processed', 39, NULL, 44, 184, '2025-02-28 15:53:30', '2025-02-28 15:53:37'),
(337, 'ORD582271740758014', 'processed', 58, NULL, 51, 227, '2025-02-28 15:53:34', '2025-02-28 15:53:58'),
(338, 'ORD512031740758029', 'processed', 51, NULL, 58, 203, '2025-02-28 15:53:49', '2025-02-28 15:54:00'),
(339, 'ORD451801740758043', 'processed', 45, NULL, 49, 180, '2025-02-28 15:54:03', '2025-02-28 15:54:40'),
(340, 'ORD552101740758076', 'processed', 55, NULL, 42, 210, '2025-02-28 15:54:36', '2025-02-28 15:54:53'),
(341, 'ORD421721740758099', 'processed', 42, NULL, 55, 172, '2025-02-28 15:54:59', '2025-02-28 15:55:10'),
(342, 'ORD512191740758257', 'processed', 51, NULL, 45, 219, '2025-02-28 15:57:37', '2025-02-28 15:57:47'),
(343, 'ORD581841740758262', 'processed', 58, NULL, 44, 184, '2025-02-28 15:57:42', '2025-02-28 15:58:41'),
(344, 'ORD452271740758300', 'processed', 45, NULL, 51, 227, '2025-02-28 15:58:20', '2025-02-28 15:59:22'),
(345, 'ORD442031740758343', 'processed', 44, NULL, 58, 203, '2025-02-28 15:59:03', '2025-02-28 15:59:12'),
(346, 'ORD432141740758353', 'processed', 43, NULL, 50, 214, '2025-02-28 15:59:13', '2025-02-28 15:59:48'),
(347, 'ORD501661740758394', 'processed', 50, NULL, 43, 166, '2025-02-28 15:59:54', '2025-02-28 16:00:05'),
(348, 'ORD551551740758404', 'processed', 55, NULL, 27, 155, '2025-02-28 16:00:04', '2025-02-28 16:00:14'),
(349, 'ORD591801740758446', 'processed', 59, NULL, 49, 180, '2025-02-28 16:00:46', '2025-02-28 16:01:09'),
(350, 'ORD271721740758459', 'processed', 27, NULL, 55, 172, '2025-02-28 16:00:59', '2025-02-28 16:01:14'),
(351, 'ORD491921740758495', 'processed', 49, NULL, 59, 192, '2025-02-28 16:01:35', '2025-02-28 16:01:55'),
(352, 'ORD392101740758498', 'processed', 39, NULL, 42, 210, '2025-02-28 16:01:38', '2025-02-28 16:01:52'),
(353, 'ORD421741740758525', 'processed', 42, NULL, 39, 174, '2025-02-28 16:02:05', '2025-02-28 16:02:20'),
(354, 'ORD531711740760604', 'processed', 53, NULL, 38, 171, '2025-02-28 16:36:44', '2025-02-28 16:37:08'),
(355, 'ORD382171740760607', 'processed', 38, NULL, 53, 217, '2025-02-28 16:36:47', '2025-02-28 16:37:07'),
(356, 'ORD522001740760686', 'processed', 52, NULL, 56, 200, '2025-02-28 16:38:06', '2025-02-28 16:40:17'),
(357, 'ORD522001740760754', 'processed', 52, NULL, 56, 200, '2025-02-28 16:39:14', '2025-02-28 16:40:24'),
(358, 'ORD531711740760777', 'processed', 53, NULL, 38, 171, '2025-02-28 16:39:37', '2025-02-28 16:39:49'),
(359, 'ORD561581740760777', 'processed', 56, NULL, 52, 158, '2025-02-28 16:39:37', '2025-02-28 16:40:19'),
(360, 'ORD281941740760837', 'processed', 28, NULL, 30, 194, '2025-02-28 16:40:37', '2025-02-28 16:42:50'),
(361, 'ORD262111740760855', 'processed', 26, NULL, 54, 211, '2025-02-28 16:40:55', '2025-02-28 17:04:11'),
(362, 'ORD601771740760890', 'processed', 60, NULL, 29, 177, '2025-02-28 16:41:30', '2025-02-28 16:42:32'),
(363, 'ORD292061740760896', 'processed', 29, NULL, 60, 206, '2025-02-28 16:41:36', '2025-02-28 16:42:55'),
(364, 'ORD541971740760936', 'processed', 54, NULL, 26, 197, '2025-02-28 16:42:16', '2025-02-28 16:43:04'),
(365, 'ORD302291740760938', 'processed', 30, NULL, 28, 229, '2025-02-28 16:42:18', '2025-02-28 16:42:49'),
(366, 'ORD572261740760953', 'processed', 57, NULL, 32, 226, '2025-02-28 16:42:33', '2025-02-28 16:46:27'),
(367, 'ORD321991740760990', 'processed', 32, NULL, 57, 199, '2025-02-28 16:43:10', '2025-02-28 16:43:44'),
(368, 'ORD321711740761137', 'processed', 32, NULL, 38, 171, '2025-02-28 16:45:37', '2025-02-28 16:46:01'),
(369, 'ORD382261740761141', 'processed', 38, NULL, 32, 226, '2025-02-28 16:45:41', '2025-02-28 16:46:29'),
(370, 'ORD262291740761164', 'processed', 26, NULL, 28, 229, '2025-02-28 16:46:04', '2025-02-28 16:46:19'),
(371, 'ORD571771740761180', 'processed', 57, NULL, 29, 177, '2025-02-28 16:46:20', '2025-02-28 16:46:47'),
(372, 'ORD531941740761189', 'processed', 53, NULL, 30, 194, '2025-02-28 16:46:29', '2025-02-28 16:47:52'),
(373, 'ORD302171740761191', 'processed', 30, NULL, 53, 217, '2025-02-28 16:46:31', '2025-02-28 16:46:48'),
(374, 'ORD562061740761220', 'processed', 56, NULL, 60, 206, '2025-02-28 16:47:00', '2025-02-28 16:47:14'),
(375, 'ORD291991740761248', 'processed', 29, NULL, 57, 199, '2025-02-28 16:47:28', '2025-02-28 16:47:48'),
(376, 'ORD541581740761261', 'processed', 54, NULL, 52, 158, '2025-02-28 16:47:41', '2025-02-28 16:49:27'),
(377, 'ORD281971740761274', 'processed', 28, NULL, 26, 197, '2025-02-28 16:47:54', '2025-02-28 16:49:01'),
(378, 'ORD602001740761296', 'processed', 60, NULL, 56, 200, '2025-02-28 16:48:16', '2025-02-28 16:48:26'),
(379, 'ORD522111740761341', 'processed', 52, NULL, 54, 211, '2025-02-28 16:49:01', '2025-02-28 17:04:16'),
(380, 'ORD262291740761367', 'processed', 26, NULL, 28, 229, '2025-02-28 16:49:27', '2025-02-28 16:49:44'),
(381, 'ORD262111740761409', 'processed', 26, NULL, 54, 211, '2025-02-28 16:50:09', '2025-02-28 17:04:17'),
(382, 'ORD381771740761541', 'processed', 38, NULL, 29, 177, '2025-02-28 16:52:21', '2025-02-28 16:52:31'),
(383, 'ORD522291740761550', 'processed', 52, NULL, 28, 229, '2025-02-28 16:52:30', '2025-02-28 16:52:59'),
(384, 'ORD291711740761565', 'processed', 29, NULL, 38, 171, '2025-02-28 16:52:45', '2025-02-28 16:53:00'),
(385, 'ORD522291740761571', 'processed', 52, NULL, 28, 229, '2025-02-28 16:52:51', '2025-02-28 16:53:02'),
(386, 'ORD262171740761611', 'processed', 26, NULL, 53, 217, '2025-02-28 16:53:31', '2025-02-28 16:54:15'),
(387, 'ORD281581740761614', 'processed', 28, NULL, 52, 158, '2025-02-28 16:53:34', '2025-02-28 16:53:53'),
(388, 'ORD572001740761635', 'processed', 57, NULL, 56, 200, '2025-02-28 16:53:55', '2025-02-28 16:54:16'),
(389, 'ORD602111740761655', 'processed', 60, NULL, 54, 211, '2025-02-28 16:54:15', '2025-02-28 17:04:19'),
(390, 'ORD561991740761677', 'processed', 56, NULL, 57, 199, '2025-02-28 16:54:37', '2025-02-28 16:54:51'),
(391, 'ORD531971740761697', 'processed', 53, NULL, 26, 197, '2025-02-28 16:54:57', '2025-02-28 16:55:28'),
(392, 'ORD542061740761711', 'processed', 54, NULL, 60, 206, '2025-02-28 16:55:11', '2025-02-28 16:55:28'),
(393, 'ORD281581740761720', 'processed', 28, NULL, 52, 158, '2025-02-28 16:55:20', '2025-02-28 16:55:34'),
(394, 'ORD302261740761721', 'processed', 30, NULL, 32, 226, '2025-02-28 16:55:21', '2025-02-28 16:55:51'),
(395, 'ORD321941740761738', 'processed', 32, NULL, 30, 194, '2025-02-28 16:55:38', '2025-02-28 16:55:57'),
(396, 'ORD282061740761993', 'processed', 28, NULL, 60, 206, '2025-02-28 16:59:53', '2025-02-28 17:00:53'),
(397, 'ORD602291740762016', 'processed', 60, NULL, 28, 229, '2025-02-28 17:00:16', '2025-02-28 17:01:04'),
(398, 'ORD291941740762028', 'processed', 29, NULL, 30, 194, '2025-02-28 17:00:28', '2025-02-28 17:01:22'),
(399, 'ORD522171740762028', 'processed', 52, NULL, 53, 217, '2025-02-28 17:00:28', '2025-02-28 17:00:56'),
(400, 'ORD561711740762037', 'processed', 56, NULL, 38, 171, '2025-02-28 17:00:37', '2025-02-28 17:01:02'),
(401, 'ORD282061740762041', 'processed', 28, NULL, 60, 206, '2025-02-28 17:00:41', '2025-02-28 17:00:51'),
(402, 'ORD321971740762044', 'processed', 32, NULL, 26, 197, '2025-02-28 17:00:44', '2025-02-28 17:03:02'),
(403, 'ORD531581740762052', 'processed', 53, NULL, 52, 158, '2025-02-28 17:00:52', '2025-02-28 17:01:11'),
(404, 'ORD382001740762073', 'processed', 38, NULL, 56, 200, '2025-02-28 17:01:13', '2025-02-28 17:01:22'),
(405, 'ORD301771740762074', 'processed', 30, NULL, 29, 177, '2025-02-28 17:01:14', '2025-02-28 17:01:28'),
(406, 'ORD572111740762074', 'processed', 57, NULL, 54, 211, '2025-02-28 17:01:14', '2025-02-28 17:04:20'),
(407, 'ORD602291740762112', 'processed', 60, NULL, 28, 229, '2025-02-28 17:01:52', '2025-02-28 17:10:14'),
(408, 'ORD262261740762134', 'processed', 26, NULL, 32, 226, '2025-02-28 17:02:14', '2025-02-28 17:02:54'),
(409, 'ORD291941740762151', 'processed', 29, NULL, 30, 194, '2025-02-28 17:02:31', '2025-02-28 17:02:44'),
(410, 'ORD321971740762158', 'processed', 32, NULL, 26, 197, '2025-02-28 17:02:38', '2025-02-28 17:03:07'),
(411, 'ORD541991740762193', 'processed', 54, NULL, 57, 199, '2025-02-28 17:03:13', '2025-02-28 17:03:27'),
(412, 'ORD522261740762393', 'processed', 52, NULL, 32, 226, '2025-02-28 17:06:33', '2025-02-28 17:08:44'),
(413, 'ORD541711740762433', 'processed', 54, NULL, 38, 171, '2025-02-28 17:07:13', '2025-02-28 17:07:44'),
(414, 'ORD561941740762444', 'processed', 56, NULL, 30, 194, '2025-02-28 17:07:24', '2025-02-28 17:07:49'),
(415, 'ORD261771740762467', 'processed', 26, NULL, 29, 177, '2025-02-28 17:07:47', '2025-02-28 17:08:14'),
(416, 'ORD602171740762502', 'processed', 60, NULL, 53, 217, '2025-02-28 17:08:22', '2025-02-28 17:08:40'),
(417, 'ORD532061740762516', 'processed', 53, NULL, 60, 206, '2025-02-28 17:08:36', '2025-02-28 17:08:48'),
(418, 'ORD382111740762517', 'processed', 38, NULL, 54, 211, '2025-02-28 17:08:37', '2025-02-28 17:09:01'),
(419, 'ORD321581740762537', 'processed', 32, NULL, 52, 158, '2025-02-28 17:08:57', '2025-02-28 17:09:41'),
(420, 'ORD291971740762549', 'processed', 29, NULL, 26, 197, '2025-02-28 17:09:09', '2025-02-28 17:09:48'),
(421, 'ORD572291740762551', 'processed', 57, NULL, 28, 229, '2025-02-28 17:09:11', '2025-02-28 17:10:21'),
(422, 'ORD302001740762556', 'processed', 30, NULL, 56, 200, '2025-02-28 17:09:16', '2025-02-28 17:09:28'),
(423, 'ORD281991740762655', 'processed', 28, NULL, 57, 199, '2025-02-28 17:10:55', '2025-02-28 17:11:24'),
(424, 'ORD522261740762657', 'processed', 52, NULL, 32, 226, '2025-02-28 17:10:57', '2025-02-28 17:11:21'),
(425, 'ORD321581740762690', 'processed', 32, NULL, 52, 158, '2025-02-28 17:11:30', '2025-02-28 17:11:42'),
(426, 'ORD521771740762818', 'processed', 52, NULL, 29, 177, '2025-02-28 17:13:38', '2025-02-28 17:13:48'),
(427, 'ORD291581740762821', 'processed', 29, NULL, 52, 158, '2025-02-28 17:13:41', '2025-02-28 17:14:04'),
(428, 'ORD541941740762852', 'processed', 54, NULL, 30, 194, '2025-02-28 17:14:12', '2025-02-28 17:14:30'),
(429, 'ORD382291740762860', 'processed', 38, NULL, 28, 229, '2025-02-28 17:14:20', '2025-02-28 17:14:57'),
(430, 'ORD281711740762867', 'processed', 28, NULL, 38, 171, '2025-02-28 17:14:27', '2025-02-28 17:14:55'),
(431, 'ORD561971740762874', 'processed', 56, NULL, 26, 197, '2025-02-28 17:14:34', '2025-02-28 17:14:45'),
(432, 'ORD531991740762878', 'processed', 53, NULL, 57, 199, '2025-02-28 17:14:38', '2025-02-28 17:14:55'),
(433, 'ORD322061740762909', 'processed', 32, NULL, 60, 206, '2025-02-28 17:15:09', '2025-02-28 17:16:38'),
(434, 'ORD262001740762909', 'processed', 26, NULL, 56, 200, '2025-02-28 17:15:09', '2025-02-28 17:15:20'),
(435, 'ORD602261740762914', 'processed', 60, NULL, 32, 226, '2025-02-28 17:15:14', '2025-02-28 17:15:26'),
(436, 'ORD302111740762950', 'processed', 30, NULL, 54, 211, '2025-02-28 17:15:50', '2025-02-28 17:25:09'),
(437, 'ORD322061740762977', 'processed', 32, NULL, 60, 206, '2025-02-28 17:16:17', '2025-02-28 17:16:44'),
(438, 'ORD572171740762998', 'processed', 57, NULL, 53, 217, '2025-02-28 17:16:38', '2025-02-28 17:16:53'),
(439, 'ORD322061740763033', 'processed', 32, NULL, 60, 206, '2025-02-28 17:17:13', '2025-02-28 17:17:38'),
(440, 'ORD291581740763093', 'processed', 29, NULL, 52, 158, '2025-02-28 17:18:13', '2025-02-28 17:18:32'),
(441, 'ORD521711740763288', 'processed', 52, NULL, 38, 171, '2025-02-28 17:21:28', '2025-02-28 17:21:49'),
(442, 'ORD532001740763316', 'processed', 53, NULL, 56, 200, '2025-02-28 17:21:56', '2025-02-28 17:22:14'),
(443, 'ORD562171740763317', 'processed', 56, NULL, 53, 217, '2025-02-28 17:21:57', '2025-02-28 17:22:21'),
(444, 'ORD261941740763321', 'processed', 26, NULL, 30, 194, '2025-02-28 17:22:01', '2025-02-28 17:22:12'),
(445, 'ORD301971740763341', 'processed', 30, NULL, 26, 197, '2025-02-28 17:22:21', '2025-02-28 17:22:38'),
(446, 'ORD572061740763373', 'processed', 57, NULL, 60, 206, '2025-02-28 17:22:53', '2025-02-28 17:23:05'),
(447, 'ORD381581740763382', 'processed', 38, NULL, 52, 158, '2025-02-28 17:23:02', '2025-02-28 17:23:23'),
(448, 'ORD321771740763429', 'processed', 32, NULL, 29, 177, '2025-02-28 17:23:49', '2025-02-28 17:24:03'),
(449, 'ORD282111740763453', 'processed', 28, NULL, 54, 211, '2025-02-28 17:24:13', '2025-02-28 17:25:15'),
(450, 'ORD521711740763488', 'processed', 52, NULL, 38, 171, '2025-02-28 17:24:48', '2025-02-28 17:24:59'),
(451, 'ORD601991740763494', 'processed', 60, NULL, 57, 199, '2025-02-28 17:24:54', '2025-02-28 17:25:06'),
(452, 'ORD292261740763519', 'processed', 29, NULL, 32, 226, '2025-02-28 17:25:19', '2025-02-28 17:25:51'),
(453, 'ORD542291740763526', 'processed', 54, NULL, 28, 229, '2025-02-28 17:25:26', '2025-02-28 17:25:55'),
(454, 'ORD381581740763532', 'processed', 38, NULL, 52, 158, '2025-02-28 17:25:32', '2025-02-28 17:25:46'),
(455, 'ORD292261740763630', 'processed', 29, NULL, 32, 226, '2025-02-28 17:27:10', '2025-02-28 17:27:22'),
(456, 'ORD521971740763753', 'processed', 52, NULL, 26, 197, '2025-02-28 17:29:13', '2025-02-28 17:29:26'),
(457, 'ORD282001740763785', 'processed', 28, NULL, 56, 200, '2025-02-28 17:29:45', '2025-02-28 17:30:02'),
(458, 'ORD562291740763790', 'processed', 56, NULL, 28, 229, '2025-02-28 17:29:50', '2025-02-28 17:30:01'),
(459, 'ORD381991740763866', 'processed', 38, NULL, 57, 199, '2025-02-28 17:31:06', '2025-02-28 17:31:27'),
(460, 'ORD321771740763873', 'pending', 32, NULL, 29, 177, '2025-02-28 17:31:13', '2025-02-28 17:31:13'),
(461, 'ORD531771740763873', 'processed', 53, NULL, 29, 177, '2025-02-28 17:31:13', '2025-02-28 17:31:27'),
(462, 'ORD302061740763881', 'processed', 30, NULL, 60, 206, '2025-02-28 17:31:21', '2025-02-28 17:31:30'),
(463, 'ORD571711740763911', 'processed', 57, NULL, 38, 171, '2025-02-28 17:31:51', '2025-02-28 17:32:15'),
(464, 'ORD601941740763994', 'processed', 60, NULL, 30, 194, '2025-02-28 17:33:14', '2025-02-28 17:33:24'),
(465, 'ORD261581740764018', 'processed', 26, NULL, 52, 158, '2025-02-28 17:33:38', '2025-02-28 17:33:51'),
(466, 'ORD322111740764019', 'processed', 32, NULL, 54, 211, '2025-02-28 17:33:39', '2025-02-28 17:34:11'),
(467, 'ORD542261740764022', 'processed', 54, NULL, 32, 226, '2025-02-28 17:33:42', '2025-02-28 17:34:12'),
(468, 'ORD292171740764032', 'processed', 29, NULL, 53, 217, '2025-02-28 17:33:52', '2025-02-28 17:34:15'),
(469, 'ORD422191741104379', 'processed', 42, NULL, 45, 219, '2025-03-04 16:06:19', '2025-03-04 16:17:16'),
(470, 'ORD501861741795546', 'processed', 50, NULL, 44, 186, '2025-03-12 16:05:46', '2025-03-12 16:10:41'),
(471, 'ORD261861741795678', 'processed', 26, NULL, 44, 186, '2025-03-12 16:07:58', '2025-03-12 16:10:47'),
(472, 'ORD591861741795783', 'processed', 59, NULL, 44, 186, '2025-03-12 16:09:43', '2025-03-12 16:10:49'),
(473, 'ORD452101742320622', 'processed', 45, NULL, 42, 210, '2025-03-18 17:57:02', '2025-03-18 17:57:10'),
(474, 'ORD592031745337804', 'pending', 59, NULL, 58, 203, '2025-04-22 16:03:24', '2025-04-22 16:03:24'),
(475, 'ORD262031745338181', 'pending', 26, NULL, 58, 203, '2025-04-22 16:09:41', '2025-04-22 16:09:41'),
(476, 'ORD442031745338435', 'pending', 44, NULL, 58, 203, '2025-04-22 16:13:55', '2025-04-22 16:13:55'),
(477, 'ORD442031745417414', 'pending', 44, NULL, 58, 203, '2025-04-23 14:10:14', '2025-04-23 14:10:14'),
(478, 'ORD442031745418470', 'pending', 44, NULL, 58, 203, '2025-04-23 14:27:50', '2025-04-23 14:27:50'),
(479, 'ORD262031745418739', 'pending', 26, NULL, 58, 203, '2025-04-23 14:32:19', '2025-04-23 14:32:19'),
(480, 'ORD262031745420002', 'pending', 26, NULL, 58, 203, '2025-04-23 14:53:22', '2025-04-23 14:53:22'),
(481, 'ORD442031745420292', 'pending', 44, NULL, 58, 203, '2025-04-23 14:58:12', '2025-04-23 14:58:12'),
(482, 'ORD592031745420460', 'pending', 59, NULL, 58, 203, '2025-04-23 15:01:00', '2025-04-23 15:01:00'),
(483, 'ORD592031745420605', 'pending', 59, NULL, 58, 203, '2025-04-23 15:03:25', '2025-04-23 15:03:25'),
(484, 'ORD592031745420749', 'pending', 59, NULL, 58, 203, '2025-04-23 15:05:49', '2025-04-23 15:05:49'),
(485, 'ORD592031745420903', 'pending', 59, NULL, 58, 203, '2025-04-23 15:08:23', '2025-04-23 15:08:23'),
(486, 'ORD592031745943815', 'pending', 59, NULL, 58, 203, '2025-04-29 16:23:35', '2025-04-29 16:23:35'),
(487, 'ORD302031745943994', 'pending', 30, NULL, 58, 203, '2025-04-29 16:26:34', '2025-04-29 16:26:34'),
(488, 'ORD442031745944069', 'pending', 44, NULL, 58, 203, '2025-04-29 16:27:49', '2025-04-29 16:27:49'),
(489, 'ORD442031745944094', 'pending', 44, NULL, 58, 203, '2025-04-29 16:28:14', '2025-04-29 16:28:14'),
(490, 'ORD442031745944120', 'pending', 44, NULL, 58, 203, '2025-04-29 16:28:40', '2025-04-29 16:28:40'),
(491, 'ORD262031745944170', 'pending', 26, NULL, 58, 203, '2025-04-29 16:29:30', '2025-04-29 16:29:30'),
(492, 'ORD262031745944201', 'pending', 26, NULL, 58, 203, '2025-04-29 16:30:01', '2025-04-29 16:30:01'),
(493, 'ORD442031745944222', 'pending', 44, NULL, 58, 203, '2025-04-29 16:30:22', '2025-04-29 16:30:22'),
(494, 'ORD302031745944260', 'pending', 30, NULL, 58, 203, '2025-04-29 16:31:00', '2025-04-29 16:31:00'),
(495, 'ORD302031745944296', 'pending', 30, NULL, 58, 203, '2025-04-29 16:31:36', '2025-04-29 16:31:36'),
(496, 'ORD302031745944343', 'pending', 30, NULL, 58, 203, '2025-04-29 16:32:23', '2025-04-29 16:32:23'),
(497, 'ORD442031745944417', 'pending', 44, NULL, 58, 203, '2025-04-29 16:33:37', '2025-04-29 16:33:37'),
(498, 'ORD442031745944456', 'pending', 44, NULL, 58, 203, '2025-04-29 16:34:16', '2025-04-29 16:34:16'),
(499, 'ORD302031745944523', 'pending', 30, NULL, 58, 203, '2025-04-29 16:35:23', '2025-04-29 16:35:23'),
(500, 'ORD262031745944570', 'pending', 26, NULL, 58, 203, '2025-04-29 16:36:10', '2025-04-29 16:36:10'),
(501, 'ORD442031745944616', 'pending', 44, NULL, 58, 203, '2025-04-29 16:36:56', '2025-04-29 16:36:56'),
(502, 'WSLORD4171748366620', 'pending', NULL, 4, 3, 17, '2025-05-27 19:23:40', '2025-05-27 19:23:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `wholesaler_product_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `wholesaler_product_id`, `amount`) VALUES
(303, 144, 105, NULL, 2),
(304, 144, 103, NULL, 2),
(305, 144, 94, NULL, 2),
(306, 145, 174, NULL, 10),
(307, 146, 117, NULL, 1),
(308, 147, 170, NULL, 1),
(309, 147, 171, NULL, 1),
(310, 148, 139, NULL, 4),
(311, 148, 131, NULL, 5),
(312, 148, 146, NULL, 4),
(313, 149, 187, NULL, 5),
(314, 149, 195, NULL, 5),
(315, 149, 194, NULL, 5),
(316, 150, 174, NULL, 1),
(317, 150, 173, NULL, 1),
(318, 151, 22, NULL, 1),
(319, 152, 204, NULL, 1),
(320, 152, 196, NULL, 2),
(321, 152, 200, NULL, 1),
(322, 152, 197, NULL, 2),
(323, 152, 199, NULL, 3),
(324, 152, 203, NULL, 4),
(325, 153, 53, NULL, 1),
(326, 154, 88, NULL, 1),
(327, 154, 220, NULL, 1),
(492, 239, 282, NULL, 1),
(493, 240, 278, NULL, 1),
(494, 241, 282, NULL, 1),
(495, 242, 288, NULL, 1),
(496, 243, 271, NULL, 1),
(497, 244, 279, NULL, 1),
(498, 244, 272, NULL, 1),
(499, 244, 271, NULL, 1),
(500, 245, 272, NULL, 1),
(501, 246, 299, NULL, 1),
(502, 247, 325, NULL, 1),
(503, 248, 352, NULL, 1),
(504, 249, 324, NULL, 1),
(505, 250, 329, NULL, 1),
(506, 251, 362, NULL, 2),
(507, 251, 365, NULL, 3),
(508, 252, 291, NULL, 5),
(509, 252, 359, NULL, 15),
(510, 253, 332, NULL, 1),
(511, 254, 360, NULL, 14),
(512, 255, 354, NULL, 3),
(513, 256, 378, NULL, 10),
(514, 257, 382, NULL, 3),
(515, 258, 305, NULL, 4),
(516, 258, 308, NULL, 4),
(517, 259, 301, NULL, 1),
(518, 260, 414, NULL, 1),
(519, 261, 414, NULL, 1),
(520, 262, 394, NULL, 1),
(521, 263, 393, NULL, 1),
(522, 264, 357, NULL, 11),
(523, 265, 409, NULL, 1),
(524, 266, 411, NULL, 1),
(525, 267, 423, NULL, 1),
(526, 268, 264, NULL, 1),
(527, 268, 265, NULL, 2),
(528, 268, 263, NULL, 1),
(529, 269, 300, NULL, 1),
(530, 270, 295, NULL, 3),
(531, 271, 402, NULL, 2),
(532, 271, 407, NULL, 2),
(533, 271, 404, NULL, 2),
(534, 271, 419, NULL, 1),
(535, 271, 421, NULL, 1),
(536, 272, 301, NULL, 1),
(537, 272, 379, NULL, 1),
(538, 272, 388, NULL, 1),
(539, 273, 392, NULL, 2),
(540, 274, 342, NULL, 5),
(541, 274, 326, NULL, 4),
(542, 274, 353, NULL, 5),
(543, 275, 312, NULL, 1),
(544, 275, 302, NULL, 1),
(545, 276, 383, NULL, 1),
(546, 276, 291, NULL, 1),
(547, 276, 322, NULL, 1),
(548, 276, 382, NULL, 1),
(549, 276, 360, NULL, 7),
(550, 276, 364, NULL, 7),
(551, 276, 368, NULL, 7),
(552, 277, 422, NULL, 1),
(553, 277, 433, NULL, 6),
(554, 277, 444, NULL, 3),
(555, 277, 412, NULL, 1),
(556, 277, 414, NULL, 1),
(557, 277, 416, NULL, 1),
(558, 278, 307, NULL, 1),
(559, 279, 289, NULL, 1),
(560, 279, 293, NULL, 1),
(561, 280, 422, NULL, 1),
(562, 280, 412, NULL, 1),
(563, 280, 433, NULL, 1),
(564, 281, 293, NULL, 1),
(565, 281, 280, NULL, 1),
(566, 282, 336, NULL, 2),
(567, 282, 306, NULL, 2),
(568, 282, 380, NULL, 2),
(569, 282, 379, NULL, 2),
(570, 282, 388, NULL, 1),
(571, 283, 393, NULL, 1),
(572, 284, 400, NULL, 4),
(573, 284, 396, NULL, 2),
(574, 285, 382, NULL, 1),
(575, 285, 320, NULL, 1),
(576, 285, 314, NULL, 1),
(577, 285, 374, NULL, 1),
(578, 285, 364, NULL, 1),
(579, 285, 327, NULL, 1),
(580, 285, 322, NULL, 1),
(581, 285, 343, NULL, 1),
(582, 285, 371, NULL, 1),
(583, 285, 330, NULL, 1),
(584, 285, 360, NULL, 1),
(585, 286, 264, NULL, 1),
(586, 286, 265, NULL, 3),
(587, 286, 266, NULL, 1),
(588, 287, 319, NULL, 2),
(589, 288, 326, NULL, 4),
(590, 288, 342, NULL, 10),
(591, 288, 353, NULL, 10),
(592, 288, 339, NULL, 4),
(593, 289, 312, NULL, 1),
(594, 289, 316, NULL, 1),
(595, 290, 287, NULL, 1),
(596, 290, 295, NULL, 1),
(597, 291, 308, NULL, 1),
(598, 291, 305, NULL, 1),
(599, 292, 396, NULL, 2),
(600, 292, 395, NULL, 1),
(601, 293, 422, NULL, 4),
(602, 293, 444, NULL, 2),
(603, 293, 414, NULL, 1),
(604, 294, 419, NULL, 3),
(605, 294, 421, NULL, 2),
(606, 294, 402, NULL, 3),
(607, 294, 417, NULL, 3),
(608, 294, 403, NULL, 3),
(609, 294, 390, NULL, 2),
(610, 294, 407, NULL, 3),
(611, 295, 266, NULL, 3),
(612, 295, 264, NULL, 1),
(613, 295, 265, NULL, 3),
(614, 295, 267, NULL, 1),
(615, 296, 361, NULL, 1),
(616, 296, 368, NULL, 1),
(617, 296, 371, NULL, 1),
(618, 296, 360, NULL, 1),
(619, 296, 327, NULL, 1),
(620, 296, 382, NULL, 1),
(621, 297, 277, NULL, 3),
(622, 297, 296, NULL, 3),
(623, 298, 396, NULL, 1),
(624, 299, 393, NULL, 1),
(625, 300, 306, NULL, 2),
(626, 300, 381, NULL, 5),
(627, 300, 385, NULL, 1),
(628, 301, 285, NULL, 1),
(629, 301, 293, NULL, 1),
(630, 302, 383, NULL, 1),
(631, 303, 353, NULL, 10),
(632, 303, 339, NULL, 3),
(633, 304, 312, NULL, 1),
(634, 304, 316, NULL, 2),
(635, 305, 264, NULL, 1),
(636, 305, 263, NULL, 1),
(637, 306, 391, NULL, 1),
(638, 306, 393, NULL, 1),
(639, 307, 382, NULL, 1),
(640, 307, 361, NULL, 1),
(641, 307, 377, NULL, 1),
(642, 307, 364, NULL, 10),
(643, 308, 319, NULL, 2),
(644, 309, 422, NULL, 3),
(645, 309, 416, NULL, 1),
(646, 310, 296, NULL, 3),
(647, 310, 277, NULL, 3),
(648, 311, 400, NULL, 1),
(649, 311, 395, NULL, 1),
(650, 312, 421, NULL, 1),
(651, 312, 405, NULL, 3),
(652, 312, 389, NULL, 3),
(653, 312, 407, NULL, 3),
(654, 312, 417, NULL, 3),
(655, 312, 419, NULL, 1),
(656, 313, 329, NULL, 1),
(657, 314, 302, NULL, 2),
(658, 315, 280, NULL, 1),
(659, 315, 285, NULL, 1),
(660, 316, 381, NULL, 1),
(661, 316, 299, NULL, 1),
(662, 316, 379, NULL, 1),
(663, 317, 326, NULL, 2),
(664, 317, 342, NULL, 2),
(665, 317, 339, NULL, 2),
(666, 317, 445, NULL, 2),
(667, 317, 353, NULL, 2),
(668, 318, 392, NULL, 1),
(669, 319, 299, NULL, 1),
(670, 319, 380, NULL, 1),
(671, 319, 387, NULL, 1),
(672, 320, 434, NULL, 3),
(673, 320, 414, NULL, 3),
(674, 321, 400, NULL, 2),
(675, 322, 383, NULL, 1),
(676, 322, 330, NULL, 2),
(677, 322, 332, NULL, 1),
(678, 322, 320, NULL, 1),
(679, 323, 316, NULL, 2),
(680, 323, 312, NULL, 2),
(681, 323, 302, NULL, 1),
(682, 324, 277, NULL, 2),
(683, 325, 285, NULL, 3),
(684, 325, 293, NULL, 1),
(685, 326, 389, NULL, 1),
(686, 326, 407, NULL, 1),
(687, 326, 403, NULL, 1),
(688, 326, 419, NULL, 1),
(689, 326, 417, NULL, 1),
(690, 327, 264, NULL, 1),
(691, 327, 265, NULL, 1),
(692, 328, 298, NULL, 2),
(693, 328, 337, NULL, 1),
(694, 329, 353, NULL, 250),
(695, 329, 326, NULL, 200),
(696, 329, 445, NULL, 10),
(697, 330, 264, NULL, 1),
(698, 331, 393, NULL, 2),
(699, 331, 391, NULL, 1),
(700, 332, 383, NULL, 1),
(701, 332, 327, NULL, 2),
(702, 332, 322, NULL, 2),
(703, 332, 364, NULL, 20),
(704, 332, 366, NULL, 3),
(705, 332, 372, NULL, 7),
(706, 333, 386, NULL, 1),
(707, 333, 336, NULL, 1),
(708, 333, 299, NULL, 1),
(709, 333, 380, NULL, 1),
(710, 334, 312, NULL, 1),
(711, 334, 302, NULL, 1),
(712, 335, 289, NULL, 1),
(713, 336, 326, NULL, 20),
(714, 336, 342, NULL, 50),
(715, 336, 339, NULL, 20),
(716, 336, 353, NULL, 100),
(717, 336, 445, NULL, 60),
(718, 337, 308, NULL, 3),
(719, 337, 307, NULL, 3),
(720, 337, 305, NULL, 3),
(721, 338, 422, NULL, 5),
(722, 338, 416, NULL, 2),
(723, 338, 434, NULL, 2),
(724, 338, 414, NULL, 2),
(725, 339, 396, NULL, 3),
(726, 340, 277, NULL, 2),
(727, 341, 399, NULL, 1),
(728, 341, 407, NULL, 1),
(729, 341, 390, NULL, 1),
(730, 341, 417, NULL, 1),
(731, 341, 403, NULL, 1),
(732, 341, 419, NULL, 1),
(733, 342, 422, NULL, 1),
(734, 343, 305, NULL, 4),
(735, 343, 308, NULL, 4),
(736, 343, 311, NULL, 2),
(737, 344, 396, NULL, 10),
(738, 345, 383, NULL, 3),
(739, 345, 343, NULL, 4),
(740, 345, 291, NULL, 20),
(741, 346, 302, NULL, 1),
(742, 347, 392, NULL, 30),
(743, 348, 287, NULL, 5),
(744, 348, 300, NULL, 5),
(745, 348, 295, NULL, 5),
(746, 349, 299, NULL, 3),
(747, 349, 384, NULL, 3),
(748, 349, 379, NULL, 3),
(749, 350, 266, NULL, 2),
(750, 350, 265, NULL, 5),
(751, 350, 263, NULL, 2),
(752, 350, 264, NULL, 1),
(753, 350, 267, NULL, 2),
(754, 351, 280, NULL, 1),
(755, 351, 285, NULL, 4),
(756, 351, 289, NULL, 1),
(757, 351, 293, NULL, 1),
(758, 352, 326, NULL, 2),
(759, 352, 339, NULL, 1),
(760, 353, 399, NULL, 1),
(761, 353, 405, NULL, 1),
(762, 353, 402, NULL, 1),
(763, 353, 421, NULL, 1),
(764, 354, 423, NULL, 2),
(765, 354, 429, NULL, 2),
(766, 354, 427, NULL, 1),
(767, 355, 279, NULL, 1),
(768, 355, 274, NULL, 1),
(769, 355, 283, NULL, 1),
(770, 356, 268, NULL, 1),
(771, 357, 269, NULL, 1),
(772, 357, 270, NULL, 2),
(773, 358, 427, NULL, 1),
(774, 358, 423, NULL, 2),
(775, 358, 429, NULL, 2),
(776, 359, 284, NULL, 3),
(777, 359, 297, NULL, 3),
(778, 359, 276, NULL, 3),
(779, 360, 397, NULL, 1),
(780, 361, 369, NULL, 1),
(781, 361, 347, NULL, 6),
(782, 361, 367, NULL, 8),
(783, 361, 350, NULL, 2),
(784, 362, 438, NULL, 4),
(785, 362, 437, NULL, 1),
(786, 363, 278, NULL, 3),
(787, 363, 288, NULL, 9),
(788, 364, 418, NULL, 3),
(789, 365, 324, NULL, 2),
(790, 366, 344, NULL, 1),
(791, 366, 321, NULL, 1),
(792, 366, 349, NULL, 1),
(793, 367, 425, NULL, 1),
(794, 367, 424, NULL, 2),
(795, 367, 420, NULL, 4),
(796, 368, 420, NULL, 4),
(797, 368, 409, NULL, 1),
(798, 368, 424, NULL, 3),
(799, 369, 272, NULL, 1),
(800, 370, 369, NULL, 40),
(801, 371, 349, NULL, 4),
(802, 371, 340, NULL, 4),
(803, 372, 427, NULL, 1),
(804, 373, 325, NULL, 1),
(805, 373, 328, NULL, 1),
(806, 374, 276, NULL, 1),
(807, 374, 297, NULL, 1),
(808, 374, 284, NULL, 1),
(809, 375, 288, NULL, 4),
(810, 375, 282, NULL, 2),
(811, 375, 278, NULL, 4),
(812, 376, 418, NULL, 2),
(813, 377, 398, NULL, 2),
(814, 377, 406, NULL, 2),
(815, 377, 394, NULL, 2),
(816, 377, 408, NULL, 1),
(817, 377, 410, NULL, 1),
(818, 378, 437, NULL, 2),
(819, 378, 442, NULL, 1),
(820, 378, 438, NULL, 2),
(821, 379, 268, NULL, 1),
(822, 379, 269, NULL, 1),
(823, 380, 357, NULL, 100),
(824, 381, 338, NULL, 1),
(825, 381, 369, NULL, 9),
(826, 381, 350, NULL, 23),
(827, 382, 272, NULL, 2),
(828, 382, 273, NULL, 1),
(829, 382, 279, NULL, 1),
(830, 382, 275, NULL, 1),
(831, 382, 283, NULL, 1),
(832, 382, 271, NULL, 1),
(833, 383, 268, NULL, 1),
(834, 383, 269, NULL, 1),
(835, 383, 270, NULL, 1),
(836, 384, 286, NULL, 8),
(837, 384, 278, NULL, 8),
(838, 384, 282, NULL, 4),
(839, 384, 288, NULL, 11),
(840, 385, 268, NULL, 2),
(841, 386, 357, NULL, 50),
(842, 386, 338, NULL, 50),
(843, 386, 347, NULL, 50),
(844, 387, 406, NULL, 2),
(845, 387, 394, NULL, 2),
(846, 387, 398, NULL, 2),
(847, 388, 349, NULL, 3),
(848, 388, 309, NULL, 2),
(849, 388, 321, NULL, 1),
(850, 389, 435, NULL, 4),
(851, 389, 437, NULL, 4),
(852, 389, 443, NULL, 4),
(853, 390, 276, NULL, 4),
(854, 390, 297, NULL, 4),
(855, 391, 423, NULL, 3),
(856, 391, 428, NULL, 4),
(857, 391, 427, NULL, 2),
(858, 392, 418, NULL, 2),
(859, 392, 411, NULL, 1),
(860, 393, 397, NULL, 20),
(861, 394, 324, NULL, 4),
(862, 394, 317, NULL, 4),
(863, 394, 325, NULL, 4),
(864, 395, 409, NULL, 5),
(865, 395, 425, NULL, 5),
(866, 395, 420, NULL, 5),
(867, 396, 398, NULL, 10),
(868, 397, 443, NULL, 3),
(869, 397, 435, NULL, 3),
(870, 397, 440, NULL, 3),
(871, 397, 439, NULL, 3),
(872, 397, 442, NULL, 3),
(873, 397, 437, NULL, 3),
(874, 397, 436, NULL, 3),
(875, 398, 282, NULL, 4),
(876, 399, 268, NULL, 1),
(877, 399, 269, NULL, 1),
(878, 400, 297, NULL, 4),
(879, 400, 284, NULL, 10),
(880, 400, 276, NULL, 15),
(881, 401, 406, NULL, 11),
(882, 401, 410, NULL, 1),
(883, 402, 420, NULL, 5),
(884, 402, 425, NULL, 1),
(885, 403, 432, NULL, 5),
(886, 403, 431, NULL, 5),
(887, 404, 272, NULL, 1),
(888, 404, 273, NULL, 1),
(889, 404, 275, NULL, 1),
(890, 404, 283, NULL, 2),
(891, 404, 281, NULL, 2),
(892, 405, 324, NULL, 4),
(893, 406, 344, NULL, 4),
(894, 406, 309, NULL, 2),
(895, 406, 349, NULL, 2),
(896, 406, 321, NULL, 4),
(897, 407, 440, NULL, 7),
(898, 408, 367, NULL, 4),
(899, 408, 347, NULL, 2),
(900, 408, 357, NULL, 5),
(901, 409, 286, NULL, 1),
(902, 410, 424, NULL, 10),
(903, 410, 420, NULL, 5),
(904, 411, 418, NULL, 2),
(905, 411, 413, NULL, 2),
(906, 412, 268, NULL, 1),
(907, 413, 418, NULL, 1),
(908, 413, 413, NULL, 1),
(909, 413, 411, NULL, 1),
(910, 414, 297, NULL, 5),
(911, 414, 276, NULL, 1),
(912, 415, 350, NULL, 10),
(913, 415, 338, NULL, 100),
(914, 415, 347, NULL, 11),
(915, 415, 341, NULL, 10),
(916, 416, 443, NULL, 1),
(917, 416, 437, NULL, 1),
(918, 417, 423, NULL, 4),
(919, 418, 274, NULL, 1),
(920, 418, 272, NULL, 1),
(921, 418, 283, NULL, 1),
(922, 418, 275, NULL, 1),
(923, 418, 279, NULL, 1),
(924, 419, 424, NULL, 23),
(925, 419, 425, NULL, 3),
(926, 419, 420, NULL, 16),
(927, 419, 409, NULL, 15),
(928, 420, 278, NULL, 5),
(929, 420, 286, NULL, 5),
(930, 420, 282, NULL, 5),
(931, 420, 288, NULL, 6),
(932, 421, 340, NULL, 10),
(933, 421, 309, NULL, 5),
(934, 421, 321, NULL, 3),
(935, 422, 324, NULL, 2),
(936, 422, 325, NULL, 2),
(937, 422, 317, NULL, 2),
(938, 422, 328, NULL, 2),
(939, 423, 406, NULL, 4),
(940, 423, 394, NULL, 2),
(941, 423, 397, NULL, 2),
(942, 423, 410, NULL, 1),
(943, 424, 269, NULL, 1),
(944, 425, 409, NULL, 1),
(945, 425, 424, NULL, 1),
(946, 425, 420, NULL, 1),
(947, 425, 425, NULL, 1),
(948, 426, 268, NULL, 2),
(949, 426, 269, NULL, 2),
(950, 426, 270, NULL, 1),
(951, 427, 278, NULL, 3),
(952, 427, 286, NULL, 3),
(953, 427, 282, NULL, 3),
(954, 427, 288, NULL, 3),
(955, 428, 413, NULL, 1),
(956, 429, 290, NULL, 25),
(957, 429, 273, NULL, 21),
(958, 430, 406, NULL, 5),
(959, 430, 398, NULL, 5),
(960, 430, 397, NULL, 5),
(961, 431, 276, NULL, 5),
(962, 431, 297, NULL, 5),
(963, 431, 284, NULL, 5),
(964, 432, 429, NULL, 1),
(965, 432, 423, NULL, 3),
(966, 432, 428, NULL, 1),
(967, 432, 427, NULL, 3),
(968, 433, 424, NULL, 6),
(969, 433, 425, NULL, 1),
(970, 433, 409, NULL, 4),
(971, 434, 357, NULL, 4),
(972, 434, 369, NULL, 2),
(973, 434, 362, NULL, 2),
(974, 434, 350, NULL, 4),
(975, 435, 435, NULL, 4),
(976, 435, 441, NULL, 2),
(977, 436, 324, NULL, 3),
(978, 436, 325, NULL, 1),
(979, 437, 420, NULL, 2),
(980, 438, 309, NULL, 5),
(981, 438, 340, NULL, 10),
(982, 438, 349, NULL, 5),
(983, 438, 344, NULL, 5),
(984, 439, 425, NULL, 8),
(985, 440, 278, NULL, 20),
(986, 440, 288, NULL, 20),
(987, 440, 282, NULL, 20),
(988, 441, 268, NULL, 4),
(989, 442, 427, NULL, 1),
(990, 442, 423, NULL, 1),
(991, 442, 429, NULL, 1),
(992, 442, 428, NULL, 1),
(993, 443, 276, NULL, 10),
(994, 443, 284, NULL, 10),
(995, 443, 297, NULL, 15),
(996, 444, 365, NULL, 5),
(997, 444, 369, NULL, 2),
(998, 445, 325, NULL, 1),
(999, 446, 344, NULL, 15),
(1000, 447, 272, NULL, 20),
(1001, 447, 292, NULL, 10),
(1002, 447, 279, NULL, 10),
(1003, 448, 409, NULL, 8),
(1004, 448, 425, NULL, 3),
(1005, 449, 406, NULL, 7),
(1006, 449, 394, NULL, 7),
(1007, 449, 408, NULL, 3),
(1008, 450, 269, NULL, 100),
(1009, 450, 270, NULL, 50),
(1010, 451, 443, NULL, 2),
(1011, 451, 435, NULL, 4),
(1012, 452, 278, NULL, 5),
(1013, 453, 418, NULL, 2),
(1014, 453, 413, NULL, 1),
(1015, 454, 283, NULL, 10),
(1016, 455, 288, NULL, 1),
(1017, 455, 286, NULL, 6),
(1018, 456, 268, NULL, 2),
(1019, 456, 269, NULL, 2),
(1020, 457, 406, NULL, 8),
(1021, 457, 394, NULL, 2),
(1022, 457, 408, NULL, 1),
(1023, 458, 297, NULL, 38),
(1024, 458, 276, NULL, 6),
(1025, 459, 279, NULL, 2),
(1026, 459, 271, NULL, 1),
(1027, 459, 272, NULL, 4),
(1028, 460, 420, NULL, 4),
(1029, 461, 423, NULL, 1),
(1030, 461, 428, NULL, 1),
(1031, 461, 430, NULL, 1),
(1032, 461, 426, NULL, 3),
(1033, 461, 429, NULL, 5),
(1034, 462, 324, NULL, 4),
(1035, 463, 340, NULL, 10),
(1036, 463, 309, NULL, 10),
(1037, 463, 321, NULL, 10),
(1038, 463, 349, NULL, 10),
(1039, 464, 440, NULL, 1),
(1040, 464, 438, NULL, 1),
(1041, 465, 357, NULL, 392),
(1042, 465, 365, NULL, 10),
(1043, 465, 362, NULL, 10),
(1044, 466, 420, NULL, 16),
(1045, 466, 425, NULL, 16),
(1046, 466, 424, NULL, 16),
(1047, 467, 411, NULL, 1),
(1048, 467, 418, NULL, 2),
(1049, 468, 278, NULL, 4),
(1050, 468, 286, NULL, 5),
(1051, 468, 282, NULL, 5),
(1052, 468, 288, NULL, 5),
(1053, 469, 421, NULL, 1),
(1054, 470, 392, NULL, 2),
(1055, 470, 391, NULL, 5),
(1056, 471, 365, NULL, 5),
(1057, 471, 367, NULL, 10),
(1058, 471, 350, NULL, 10),
(1059, 471, 369, NULL, 2),
(1060, 471, 347, NULL, 5),
(1061, 472, 299, NULL, 2),
(1062, 472, 379, NULL, 2),
(1063, 473, 396, NULL, 1),
(1064, 474, 385, NULL, 1),
(1065, 474, 380, NULL, 1),
(1066, 474, 306, NULL, 1),
(1067, 475, 369, NULL, 20),
(1068, 475, 362, NULL, 4),
(1069, 476, 382, NULL, 2),
(1070, 477, 359, NULL, 1),
(1071, 477, 360, NULL, 1),
(1072, 477, 363, NULL, 1),
(1073, 477, 364, NULL, 1),
(1074, 477, 371, NULL, 1),
(1075, 478, 327, NULL, 5),
(1076, 479, 341, NULL, 1),
(1077, 480, 365, NULL, 1),
(1078, 481, 334, NULL, 1),
(1079, 482, 385, NULL, 1),
(1080, 482, 380, NULL, 1),
(1081, 483, 388, NULL, 1),
(1082, 484, 306, NULL, 1),
(1083, 485, 386, NULL, 1),
(1084, 486, 380, NULL, 1),
(1085, 487, 324, NULL, 4),
(1086, 488, 291, NULL, 1),
(1087, 489, 332, NULL, 1),
(1088, 490, 363, NULL, 1),
(1089, 491, 362, NULL, 1),
(1090, 492, 341, NULL, 1),
(1091, 493, 351, NULL, 1),
(1092, 494, 317, NULL, 4),
(1093, 495, 324, NULL, 4),
(1094, 496, 328, NULL, 4),
(1095, 497, 354, NULL, 1),
(1096, 497, 361, NULL, 1),
(1097, 497, 322, NULL, 1),
(1098, 497, 364, NULL, 1),
(1099, 498, 377, NULL, 10),
(1100, 499, 331, NULL, 4),
(1101, 500, 367, NULL, 1),
(1102, 501, 355, NULL, 1),
(1103, 502, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `email`, `token`, `created_at`) VALUES
(43, 'xaviermorcam@campus.monlau.com', '181865efb8e2812f59c132f42724d83751bf3d9cd7c6191d4f94cc12913677d1', '2024-05-21 13:45:42'),
(51, 'ferrea@monlau.com', 'e4b8fe801f7c661c3669e753021dfbaa0c6de4d67d71c7280a36dbe99e22a8e1', '2025-02-19 10:47:47'),
(102, 'hectorpalcas@campus.monlau.com', 'a2c25f86e1f3386ee98433a0715839c2fb667572322b8ee53528b904a278fb0d', '2025-02-26 17:17:24'),
(105, 'marcosrodpal@monlau.com', 'f6e7a39fa658d161fc0d9a9c4ca2dee3ba02195925386062578e75f2183fad01', '2025-03-04 14:53:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pending_wholesaler_deliveries`
--

CREATE TABLE `pending_wholesaler_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pending_wholesaler_deliveries`
--

INSERT INTO `pending_wholesaler_deliveries` (`id`, `order_id`, `company_id`, `delivery_date`, `processed`, `created_at`, `updated_at`) VALUES
(1, 502, 3, '2025-05-28', 0, '2025-05-27 19:23:40', '2025-05-27 19:23:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `company_id`, `label`, `description`, `reference`, `price`, `stock`, `image`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(13, 3, 'Altavoz XL', '¡Que tiemblen las paredes! Con estos altavoces de 2000W de potencia sentirás que la música recorre tu cuerpo de arriba a abajo con cada tono. ¡Nadie se olvidará de tu evento jamás!', 'A102', 74.5, 0, 's5eeNyPWr9qqaRHtbcv477QkjY2WL5XJdsJr9sQJ.png', 'active', 12, '2024-02-02 14:31:13', '2024-02-15 11:53:58'),
(22, 7, 'OPEL CORSA', 'GS 1.2T XHL 74W (100CV) S/S', '111', 18000, 0, 'XghxNTACjMsIuUGiFXb402VH2dMJjUZQhiCPvVdq.png', 'active', 29, '2024-02-07 17:05:40', '2024-02-19 14:31:11'),
(27, 8, 'Trituradora reciclable', 'Una trituradora de papel cual cada 5 hojas trituradas es 1 hoja reciclado', 'T20242', 850, 0, 'ReHJPs6NZg0TyvM99wn4E7eL3hAu4fBHWCgotAzK.jpg', 'active', 23, '2024-02-07 17:09:55', '2024-02-07 17:30:26'),
(28, 7, 'TOYOTA Proace City', 'Combri L1 1.5D VX 100, Dimensiones: 4.403 mm L x 1.848 mm A x 1.880 mm A', '333', 28000, 0, 'l4m7nTkoEmTU2sD0mgETn4I4IQkVDCEfCytfCxbi.png', 'active', 29, '2024-02-07 17:10:21', '2024-02-19 17:13:14'),
(32, 4, 'Escritorio en Madera Deleyna', 'Escritorio en Madera Deleyna cuenta con espacio para almacenar tus documentos y material de oficina que te ayudará a mantener ordenado tu espacio de trabajo.', 'mobiliario001', 200, 0, 'W6MfzGwl9AP8uINsIw0YIZ51JCRrH6dxeMFZNuUk.webp', 'active', 13, '2024-02-07 17:13:35', '2024-02-07 17:13:35'),
(33, 5, 'Armario de oficina con puerta', 'Armario blanco de oficina con puerta de medidas 50x30x80 cm.', 'AR/0001', 50, 0, 'GL8rAMh311CV5ROPcPwaeZ7ZecGXnqAQDsvT5j4M.jpg', 'active', 17, '2024-02-07 17:15:28', '2024-02-07 17:15:28'),
(35, 7, 'MAXUS E DELIVER 9', 'Deliver 9 2.0D L3H2. Espacio de carga de 9,7 o 11,0 m3', '444', 34000, 0, 'wwP31ujq2dSnHUC5HZGr3a2NDlGJspUK05rcmgVQ.png', 'active', 29, '2024-02-07 17:16:24', '2024-02-19 17:13:02'),
(37, 7, 'NISSAN Primastar', 'Furgón 2.0dCi S&S L1H1 1... Dimensiones: 5.080 mm L x 1.956 mm A x 1.963 mm A', '666', 40000, 0, '01CWkhQbp3xRfB3meNwrOzPVRNfnW4A5OnmbnrpE.png', 'active', 29, '2024-02-07 17:17:42', '2024-02-19 17:12:48'),
(40, 8, 'Grapadora Ultra', 'Una grapadora la cual dando le al botón cambia de modo a una quitagrapas la cual cuando quitas una grapa se reutiliza y va con las demás grapas para poder utilizarse', 'G20242', 19.99, 0, '9USzq3Py1MHU5LGvm3Df9NI4JR75ela7MtjaGEXa.jpg', 'active', 23, '2024-02-07 17:18:47', '2024-02-07 17:18:47'),
(41, 8, 'Bolígrafo recargable', 'Bolígrafo azul con cartuchos de tinta recargables', 'B20245', 3.85, 0, 'jpVj8ezOzZJKpPxy5tanCURlXNO1SDFRY68fdBKw.jpg', 'active', 23, '2024-02-07 17:18:51', '2024-02-07 17:18:51'),
(42, 8, 'Boligrafo Azul', 'Bolígrafo de color azul', 'B20241', 1, 0, 'xmBNM9znE1pbjeBjcphHjaZCGVlpJC5wqTmCOviK.jpg', 'inactive', 25, '2024-02-07 17:20:29', '2024-02-23 14:36:39'),
(43, 7, 'Mercedes Clase V', 'Dimensiones: 4.895-5.140 mm L x 1.928 mm A x 1.880 mm A', '555', 67000, 0, '4QGJpsbzuQqIGThEe1HFd6kGizljn17cpjMzuRlm.png', 'active', 29, '2024-02-07 17:21:39', '2024-02-19 17:13:29'),
(44, 8, 'Bolígrafo negro', 'Boligrafo de color negro', 'B20242', 1, 0, 'cXseEFegaBblPPI803MZ53vgld8IpOmLYihi3rGV.jpg', 'active', 25, '2024-02-07 17:27:39', '2024-02-07 17:27:39'),
(45, 7, 'BMW X4', 'BMW X4 DRIVE', '7897', 65000, 0, 'IQmhh4aMbCOVbqOgwPUnNK8zthdS7pxQx7VyqGy8.png', 'active', 27, '2024-02-07 17:28:46', '2024-02-19 14:26:04'),
(46, 8, 'Blanqueahojas', 'Una maquina que quita cualquier cosa de una hoja y la deja como nueva', 'B20246', 1500, 0, 'j0I999VxBV2LR0qffoupwLbZaDv8iv8bk1VIR1QB.webp', 'active', 23, '2024-02-07 17:28:55', '2024-02-07 17:39:16'),
(47, 4, 'Mesa operativa', 'La mesa cuenta con la particularidad de sus apoyos con forma trapezoidal regulables en altura, que concede a la mesa de oficina una estética ligera, elegante y actual.', 'mobiliario002', 220, 0, 'pCOWfP2Xp8jHVzjb7veaWk3GeWeNNYj6Z8a53F4r.jpg', 'active', 13, '2024-02-07 17:30:19', '2024-02-07 17:30:19'),
(48, 8, 'Grapas', 'Grapas', 'G20243', 1.5, 0, 'COBg3dacLfNesixfKjms7NVcCCSIBX93a52M7hji.webp', 'inactive', 25, '2024-02-07 17:31:04', '2024-02-23 14:36:58'),
(49, 8, 'Boligrafo rojo', 'Boligrafo rojo', 'B20243', 1, 0, 'VsNjpvyoZB9jtuCHejypFjvKXeXzLYWsUotACrIg.jpg', 'inactive', 25, '2024-02-07 17:31:23', '2024-02-23 14:35:32'),
(50, 5, 'Pack mesa y sillas (2) de oficina ', 'Mesa y sillas para oficina. Accesorios aparte.', 'MS/0001', 520, 0, 's6PAE21C0LTmw6qOwHbb1QqQoILDEOZQXwxLwjli.jpg', 'active', 17, '2024-02-07 17:32:39', '2024-02-09 14:37:55'),
(51, 8, 'libretas pequenias', 'Libretas pequeñas', 'L20241', 3.5, 0, 'L6U0gTcaNbeVlynIB0R72UH6Vaw0lvtvEColNwFy.jpg', 'inactive', 25, '2024-02-07 17:33:32', '2024-02-23 14:32:35'),
(52, 6, 'BigSnap negro', 'Màquina gran de menjar amb capacitat de 55-65 buits', 'BS001', 8500, 0, '9jkhdGq62PzFwNUOfrKhPFfclQlYDpzZygzkys94.png', 'active', 21, '2024-02-07 17:33:36', '2024-02-15 22:45:11'),
(53, 4, 'Mesa Ofiina', 'El sistema incluye diferentes soluciones de archivo, bloques individuales y armarios.', 'mobiliario003', 150, 0, '2SNp2bZcBX4NmopSFMeUJNuIEDp5q442y2htsksx.jpg', 'active', 13, '2024-02-07 17:34:49', '2024-02-07 17:34:49'),
(54, 5, 'iPhone 14 Pro', 'iPhone 14 Pro 512GB - Libre - Dual eSIM', 'APPL/0001', 950, 0, '2KSUZXZY61hT7jeCRquJ4qAqkeepXsXzZCjMwtA8.jpg', 'active', 24, '2024-02-07 17:37:21', '2024-02-15 13:11:24'),
(55, 8, 'Libretas', 'Libreta con anillas', 'L20242', 10, 0, '65sln1EulStGxotREbJuyJjUcn1kmqZiASdGAD9l.jpg', 'active', 25, '2024-02-07 17:40:10', '2024-02-07 17:40:10'),
(56, 8, 'Grapadora', 'Grapadora', 'G20243', 7.5, 0, 'Brio4I5m6PP1TU3Rd7g0Yhbt5GLmgLNJjfmu89p0.jpg', 'inactive', 25, '2024-02-07 17:42:24', '2024-02-23 14:35:59'),
(57, 4, 'Mesa de despacho ', 'La mesa de despacho esta fabricado con múltiples materiales en los que resalta la estructura metálica, el cristal y diferentes tipos de madera.', 'mobiliario004', 175, 0, 'v70U10awit165R5Yq0z33pFiXTP3QbkqiwIMG20W.jpg', 'active', 13, '2024-02-07 17:43:33', '2024-02-07 17:43:33'),
(58, 8, 'Paquete de hojas en blanco', '1000 hojas en blanco', 'H20241', 21.99, 0, 'DqeJfB5E9PYnuIaLQcbuhJoJEPvYwBgu9ImB4ovr.jpg', 'active', 25, '2024-02-07 17:45:39', '2024-02-07 17:45:39'),
(59, 5, 'Colores para sillas', 'Colores para sillas. Precio 10 euros en función de las medidas de la silla. ', 'Col/0001', 10, 0, 'wGl8tddAkJtpTEmYkQ0SmLLhpivKIM2E4kumOCTI.jpg', 'active', 34, '2024-02-07 17:46:03', '2024-02-07 17:46:03'),
(60, 5, 'Silla blanca de oficina', 'Silla blanca con reposabrazos, altura regulable con piel sintética blanca 64x120 cm', 'SI/0001', 100, 0, 'PXVcYC8vLiH1rV06o8PnveCncNgTH20Ne5ee40WU.jpg', 'active', 17, '2024-02-07 17:46:04', '2024-02-07 17:46:04'),
(61, 8, 'Boligrafo verde', 'Bolígrafo verde', 'B20244', 1, 0, 'Cutj4qCNNmmWXttXnTnOENBqgcY1XuRQc8FB6cUW.jpg', 'inactive', 25, '2024-02-07 17:59:50', '2024-02-23 14:35:45'),
(62, 8, 'Clip', 'Clips de hojas', 'C20241', 9.85, 0, 'q9rP6Yl31FBRE2Ac6xktXWspEJkf23vgfFq7jMBU.jpg', 'active', 25, '2024-02-07 18:00:41', '2024-02-07 18:00:41'),
(63, 3, 'Proyector para pantalla blanca', 'Proyector para pantalla, ideal para pantallas tamaño sala o tamaño cine. Grancalidad de imagen y total fluidez en el momento de la proyección. ', 'P101', 69.5, 0, 'aaWRRNcRGPVGdsO2fHnQVGyrZCP5Yld7orKNxlkL.png', 'active', 12, '2024-02-07 18:00:56', '2024-02-09 14:39:41'),
(64, 4, 'Silla Operativa', ' La silla es ideal para los entornos de trabajo actuales por el confort que brinda a los usuarios  moverse de una forma dinámica para realizar otras funciones, levantarse, desplazarse con rapidez y comodidad', 'mobiliario005', 120, 0, 'gNyqDkON40E0EQtyNW08G2EFuIHhig5a46YqKfvX.jpg', 'active', 13, '2024-02-07 18:01:16', '2024-02-07 18:01:16'),
(65, 6, 'MidSanp negro', 'Màquina midjana de menjar amb capacitat de 25-30 buits,  ', 'MS001', 7200, 0, 'H2ikhDCWSyPlztg8AB1FjQBKYuVlTtugMZEr3tZX.png', 'active', 21, '2024-02-07 18:01:39', '2024-02-15 22:43:02'),
(66, 8, 'Trituradora', 'Trituradora de papel', 'T20241', 99.99, 0, 'Evlqr4gZZAgRXAluQ5yp3YUaTxS2tH4rv052wtmA.jpg', 'active', 25, '2024-02-07 18:02:53', '2024-02-07 18:02:53'),
(67, 8, 'Tijeras', 'Tijeras', 'T20001', 2.35, 0, 'uCeKVmCDQTm3Ti8S4iKVNeUc073oIGaVgCOKPPGl.jpg', 'active', 25, '2024-02-07 18:03:09', '2024-02-21 17:31:41'),
(68, 8, 'Carpetas', 'Carpeta', 'C20002', 14.95, 0, 'm6hiQe0HT4WQRDRBe0nX9xzreMWrv6Bx2r6guj97.jpg', 'active', 25, '2024-02-07 18:05:13', '2024-02-21 17:33:33'),
(69, 8, 'Lapiz', 'Lapiz', 'L20001', 1, 0, 'PfgPxRpHOucZiJd5jOV6cW49tVAewWLx8HqTFgUw.png', 'active', 25, '2024-02-07 18:07:28', '2024-02-21 17:36:25'),
(70, 6, 'SmallSnap negro', 'Màquina petita de menjar amb capacitat de 15-20  buits', 'SS001', 6800, 0, 'NPVRmIm3qHZuD85SXjyMrGhBiyFb3a9bKyDttQly.png', 'active', 21, '2024-02-07 18:07:31', '2024-02-15 22:43:25'),
(71, 4, 'Silla Dirección', ' Una elegante silla de dirección que une ergonomía, confort y diseño. Además, la perfecta tecnología ergonómica ofrece un apoyo específico para la zona lumbar, acomodando al usuario en una postura saludable durante toda la jornada.', 'mobiliario006', 155, 0, 'P8lY6PF3qggYKdrEmgSEw7vdjXvtsvyEQYPvYHre.jpg', 'active', 13, '2024-02-07 18:07:37', '2024-02-07 18:07:37'),
(72, 5, 'Iphone 12 mini reacondicionado', 'Iphone 12 mini color azul reacondicionado de 128GB', 'APPLREC/0001', 210, 0, 'bHOm6ZoJf1bVsh20P4rik46xqec3G0d7S7MEG5Z1.jpg', 'active', 18, '2024-02-07 18:07:48', '2024-02-14 17:51:53'),
(73, 8, 'Goma', 'Goma', 'G20241', 1.19, 0, '9na9YdE4hxdikPcy1uSU1EjuJ3XamBDbYenbXOyG.jpg', 'active', 25, '2024-02-07 18:08:24', '2024-02-07 18:08:24'),
(74, 8, 'Sacapuntas', 'Maquina automática para sacar punta a los lapizes', 'S20241', 5, 0, 'KTcOW2uWc4LZx88JnJrHHLGSjVBy79MkbMgTHP4h.jpg', 'active', 25, '2024-02-07 18:08:53', '2024-02-07 18:08:53'),
(75, 6, 'BigSnap azul', 'Màquina gran de menjar amb capacitat de 55-65 buits', 'BS002', 8500, 0, 'IZUDZMZPxC4Efryxff9NH7i1SWmiPTBOPkvsjItf.png', 'active', 21, '2024-02-07 18:11:41', '2024-02-15 22:40:46'),
(76, 5, 'Armario con patas cortas REACONDICIONADO', 'Color: Marrón - Medidas: única -  100% material natural de los pirineos.  Patas extraídas de otros armarios.', 'AR/0002', 40.5, 0, 'zFXFviWbKs2Qlg40LuYqCD3vvi5ukQYSBIvbq27w.jpg', 'active', 19, '2024-02-07 18:12:57', '2024-02-07 18:18:13'),
(77, 6, 'SnackChocolate', 'Pack de 595 undades de diferentes chiacolates y snack\'s dulces', 'PRD001', 550, 0, 'fHegQPYklN03vOljzqj1VIiGSyL1aNG99SX6fU87.png', 'active', 22, '2024-02-07 18:16:32', '2024-02-15 23:03:20'),
(78, 6, 'RBigSnap negra', 'Màquina gran recondicionades de menjar amb capacitat de 55-65 buits', 'RBS001', 4000, 0, 'QKeIpZGokk0hVNco80IUsUkWgmJG8o3jcVT5LPQR.png', 'active', 21, '2024-02-07 18:19:36', '2024-02-15 22:56:01'),
(79, 3, 'Pantalla de proyección tamaño sala', 'Pantalla de proyección tamaño sala, perfecta para conferencias, reuniones y actos especiales cercanos. ¡Tus presentaciones asombrarán a todos a partir de ahora!', 'P102', 179.5, 0, '2FvK8ZESSDM17Gbpa2M4XJkAqQKq4aS4WrPfKHEX.png', 'active', 12, '2024-02-07 18:24:08', '2024-02-15 13:51:37'),
(80, 6, 'SnackFries', 'Pack variado de volsas de patatas 595 productos', 'PRD002', 550, 0, 'ni8HU9P3VfaNgBFPGwsoVx88ss0Lvxb7cPiFWHrv.png', 'active', 22, '2024-02-08 14:46:11', '2024-02-15 23:03:09'),
(81, 19, 'Sensor de movimiento BLINK', 'Nuestro sensor BLINK cuenta con sensor infrarrojo de movimiento que localiza los posibles intrusos al detectar movimiento y avisa a la Central Receptora.', '001', 40.99, 0, '3FxBpl39yfpNpXFVf2Xyvi17GhzDUu8OGvkJ43bV.png', 'active', 35, '2024-02-08 15:01:27', '2024-02-08 15:01:27'),
(82, 6, 'MidSnap azul', 'Màquina midjana de menjar amb capacitat de 25-30 buits,  ', 'MS002', 7200, 0, 'aw5npq4C7aBRPP3Dp9zQF7JlPTb0i7qhI3x1GKuP.png', 'active', 21, '2024-02-08 15:01:56', '2024-02-15 22:45:48'),
(83, 6, 'RMidSnap negro', 'Màquina midjana recondicionades de menjar amb capacitat de 25-30 buits,  ', 'RMS001', 3200, 0, 'vBW4R9EJWivRgDHBVXQsQwJt2VHjAo4SLo4Zr28O.png', 'active', 21, '2024-02-08 15:02:37', '2024-02-15 22:56:36'),
(84, 6, 'SmallSnap azul', 'Màquina petita de menjar amb capacitat de 15-20  buits', 'SS002', 6800, 0, 'GaFQtjxui9zEQ6duzYZdceZmfURWbQhYCogbtn4O.png', 'active', 21, '2024-02-08 15:03:18', '2024-02-15 22:45:59'),
(85, 6, 'RSmallSnap negro', 'Màquina petita recondicionades de menjar amb capacitat de 15-20  buits', 'RSS001', 2000, 0, 'tVkZwtnqSVZXlvH4Gfx34FHZsGoUfjTwadGB1fGz.png', 'active', 21, '2024-02-08 15:03:50', '2024-02-15 22:56:48'),
(86, 19, 'Cámara de videovigilancia WIDEYE', 'La cámara WIDEYE cuenta con un sistema de reconocimiento que permite llevar un registro de personas. Además de tener visión nocturna y sistema de grabación.', '002', 68.5, 0, 'EffHDuUHcqibAfmebUE08FQfJ003sQecFudhI9V8.png', 'active', 36, '2024-02-08 15:04:03', '2024-02-08 15:04:03'),
(87, 19, 'Alarma anti intrusos NOT IN', 'Con la alarma NOT-IN y la aplicación MyAlarmPRO con notificaciones a tiempo real, podrás tener un control total. Con sistema antirrobo integrado y protección anti sabotaje.', '003', 52.99, 0, 'AwdpTPvHSKdtTaJPJengbuE3B6nh8SrqKePscINA.png', 'active', 37, '2024-02-08 15:09:37', '2024-02-16 16:27:08'),
(88, 6, 'SnackPastry', 'Pack de bolleria industrial', 'PRD003', 200, 0, 'WEcBF4BuyqO4O6vX1yuUj8HZ0Cd15CoE8wSahjYD.png', 'active', 22, '2024-02-08 15:10:59', '2024-02-15 23:03:38'),
(89, 19, 'CyberSeguridad Ultra / 1 mes', 'Con nuestro servicio de ciber seguridad protegerás dispositivos, redes y los datos de tus clientes. Cubrimos la seguridad de la red, de la nube y la física.', '004', 177, 0, 'YQmEdZkSv0PlPM6coZKzXFYg9J2fKzp1DieyXfZe.png', 'active', 38, '2024-02-08 15:21:15', '2024-02-08 15:21:34'),
(90, 19, 'CyberSeguridad Ultra / 6 meses', 'Precio oferta al comprar 6 meses. Con nuestro servicio de ciber seguridad protegerás dispositivos, redes y los datos de tus clientes. Cubrimos la seguridad de la red, de la nube y la física.', '005', 885, 0, 'SITYCZEHLpgsbFhbtpFUfH75agghwMv7sFkL3NkN.png', 'active', 38, '2024-02-08 15:23:10', '2024-02-08 15:23:10'),
(91, 6, 'RBigSnap azul', 'Màquina gran recondicionades de menjar amb capacitat de 55-65 buits', 'RBS002', 4000, 0, 'X72QfKp90u61z6WO169WYkRILC2q2oRUG2pHO3BE.png', 'active', 21, '2024-02-08 15:25:51', '2024-02-15 22:55:44'),
(92, 19, 'Servicio de seguridad / 1 mes', 'Enviamos a nuestro personal de seguridad totalmente cualificado para proteger tu empresa de forma presencial las 24 horas del día.', '006', 1600, 0, 'oQFvuV9xN0f9izsNYIVW2ZZbTPC4PmjyWL4mnGTp.png', 'active', 39, '2024-02-08 15:26:23', '2024-02-08 15:26:23'),
(93, 19, 'Servicio de seguridad / 6 meses', 'Precio con descuento al comprar 6 meses. Enviamos a nuestro personal de seguridad totalmente cualificado para proteger tu empresa de forma presencial las 24 horas del día.', '007', 8000, 0, '1aEMbtCU0QLaxfiE0mskrcTxpNtfTchfFnzpt3AV.png', 'active', 39, '2024-02-08 15:27:13', '2024-02-08 15:28:05'),
(94, 22, 'Camiseta Blanca Personalizable', NULL, 'CBL01', 12.99, 0, 'F5riFFbEHoZUzEln4osdswYdAeSdlG3Nuolad5MM.png', 'active', 40, '2024-02-08 15:27:14', '2024-02-08 15:42:04'),
(95, 6, 'RMidSnap azul', 'Màquina midjana recondicionades de menjar amb capacitat de 25-30 buits', 'RMS002', 3200, 0, 'oismYsozv2jzb87QHcDUOwTcOK2SK6FoUtGSw9uR.png', 'active', 21, '2024-02-08 15:28:46', '2024-02-15 22:58:48'),
(96, 19, 'Servicio de seguridad / 1 año', 'Precio descuento al comprar 1 año. Enviamos a nuestro personal de seguridad totalmente cualificado para proteger tu empresa de forma presencial las 24 horas del día.', '008', 17000, 0, 'bx4dfrWqsMOJ1dnCFsIhyGISzkEiTERlT4cAeIp8.png', 'active', 39, '2024-02-08 15:28:47', '2024-02-08 15:28:47'),
(97, 22, 'Gorra Blanca Personalizable', NULL, 'GBL01', 9.99, 0, 'RvpfuXhq7hk9ijvDiuViiHlKSsEGWqh2xAMwQbUS.png', 'active', 40, '2024-02-08 15:29:26', '2024-02-08 15:42:30'),
(98, 4, 'Sillas Reuniones ', 'Pack de dos silla de confort ideal para las reuniones.', 'mobiliario007', 75, 0, 'Pm5Lt4G2Oae168my3VwomQuCv9sb9UbcXpGd15Rt.jpg', 'active', 13, '2024-02-08 15:29:33', '2024-02-08 15:29:33'),
(99, 22, 'Camisa Blanca Personalizable Unisex', NULL, 'CBL02', 19.99, 0, 'TV2eyNeqeCHGmRaDhErF1mjIsff2xkVtmlJjjmwB.png', 'active', 40, '2024-02-08 15:30:43', '2024-02-08 15:42:40'),
(100, 19, 'Servicio de instalación', 'Nuestros técnicos de instalación se desplazarán hasta tu empresa para realizar la instalación de las alarmas, cámaras y sensores.', '009', 5, 0, 'MigJtxntVP6SH6iVm478lU41m6IqClCyPcGkmF00.png', 'active', 39, '2024-02-08 15:31:17', '2024-02-08 15:31:17'),
(101, 22, 'Americana Negra', NULL, 'AMN01', 59.99, 0, 'OJe5dFAQLElxf7w7AlCbuW5EIj4YbPw8JEnhkP6w.png', 'active', 40, '2024-02-08 15:31:43', '2024-02-08 15:43:03'),
(102, 22, 'Pantalones Cortos Negros ', NULL, 'PCN01', 19.99, 0, 'gVidAOnx6CLIUVKhmPnCfVwrTcHbzfJsnrOJI9EO.png', 'active', 40, '2024-02-08 15:32:38', '2024-02-08 15:32:38'),
(103, 22, 'Pantalon de trabajo', NULL, 'PTR01', 29.99, 0, 'aa8242N5qotNKzwzJJL5MY6qDBvb1tQCffiMBiZF.png', 'active', 40, '2024-02-08 15:33:44', '2024-02-08 15:51:59'),
(104, 22, 'Chaqueta fina de trabajo', NULL, 'CHF01', 44.99, 0, 'ADJmi8VrdmS8cGbANrpc41zazZI3PT3zmtEpXul8.png', 'active', 40, '2024-02-08 15:34:35', '2024-02-08 15:52:28'),
(105, 22, 'Anorak de trabajo', NULL, 'ANT01', 59.99, 0, 'YKMwVczwaClZAt3GWTDlqiktbscraUZzEm4sLIuW.png', 'active', 40, '2024-02-08 15:35:12', '2024-02-08 15:52:40'),
(106, 22, 'Chubasquero reflectante', NULL, 'CRF01', 79.99, 0, 'FwjE9MG96ErE2ImyxGg42Cmhd0O0kV7Ug4wHIszC.png', 'active', 40, '2024-02-08 15:35:59', '2024-02-08 15:53:00'),
(107, 22, 'Falda de trabajo azul marino', NULL, 'FAL01', 19.99, 0, 'vRxfNwBwY2gpplNluT15yvHfvaY9uQX6N3JL3Bzk.png', 'active', 40, '2024-02-08 15:36:47', '2024-02-13 15:57:33'),
(108, 22, 'Zapatillas de trabajo', NULL, 'ZAP01', 39.99, 0, 'aRFeKwVyC71OXvns8maiSgh0m23MP9nvyPfqNMHP.png', 'active', 40, '2024-02-08 15:37:25', '2024-02-08 15:53:43'),
(109, 22, 'Delantal de trabajo personalizable', NULL, 'DEL01', 14.99, 0, 'FjhVVxM0wYiHG5nCRmUtBlsezepyaIqQrijp1oTx.png', 'active', 40, '2024-02-08 15:38:03', '2024-02-13 15:58:05'),
(110, 4, 'Silla sala de espera', 'silla para tu sala de espera para 3 personas ideal para tu sala de espera ', 'mobiliario008', 175, 0, 'D67DubUVCrLDs7tWc47WUw7RfRYalOVp0UCp7X5i.jpg', 'active', 13, '2024-02-08 15:40:40', '2024-02-08 15:40:40'),
(111, 23, 'Toyota Corolla', 'Bueno bonito barato', '001', 26.422, 0, '6DYPhBv6oVMYngtIhr6jc3LiIT2LMPUPYqW2N1yK.png', 'active', 41, '2024-02-08 15:43:14', '2024-02-13 15:53:10'),
(112, 23, 'Nissan X Trail ', 'El Nissan X-Trail es un SUV versátil y espacioso, con tracción en las cuatro ruedas opcional.', '002', 35.311, 0, 'pgFwS4KQTNwVm4yx7d4AE2CJb9QChl3A3VNYVzJy.png', 'active', 42, '2024-02-08 15:49:59', '2024-02-13 15:55:35'),
(113, 23, 'Kia Niro', 'El Kia Niro es un SUV compacto híbrido o completamente eléctrico, conocido por su eficiencia y diseño moderno.', '003', 27.725, 0, 't2JhpXs5pW3FNpLuKlAlXKTdARZXC16DrfgnzDLl.png', 'active', 43, '2024-02-08 15:50:55', '2024-02-13 15:55:03'),
(114, 23, 'Kia Sportage', 'El Kia Sportage es un SUV compacto con estilo deportivo, tecnología avanzada y opciones de motorización eficientes.', '004', 27.927, 0, '5bacAnjCIZNiZ1a6pAHZz3TU6Og152yZboE9lJsw.png', 'active', 43, '2024-02-08 15:51:40', '2024-02-13 15:55:49'),
(115, 23, 'Toyota RAV4', ' La Toyota RAV4 es un SUV compacto muy popular, reconocido por su confiabilidad, versatilidad y eficiencia en el consumo de combustible.', '005', 37.089, 0, '2OwJeHLWu7deQUbFA5eXZ28RP72EqHQewuijh6qR.png', 'active', 41, '2024-02-08 15:52:32', '2024-02-13 15:53:38'),
(116, 4, 'Sofá  sala de espera ', 'Sofá amplio para sala tu sala de espera ', 'mobiliario009', 570, 0, 'byV1WumzsMhV7PfGAIUeEmtJGaoGIuGZ5dE61z9D.jpg', 'active', 13, '2024-02-08 15:54:25', '2024-02-08 15:54:25'),
(117, 23, 'Hyundai Tucson', ' El Hyundai Tucson es un SUV compacto con un diseño elegante, tecnología avanzada y opciones de motor eficientes.', '006', 26.346, 0, 'aljF2atxKS5xQXA3QqBBeizLugkyJjdUC7m9jHn0.png', 'active', 44, '2024-02-08 15:54:53', '2024-02-13 15:56:36'),
(118, 23, 'Toyota Yaris Cross', 'El Toyota Yaris Cross es un SUV subcompacto con diseño moderno, eficiencia de combustible y características de seguridad avanzadas.', '007', 27.154, 0, 'DA6UJ7HrHee04vLxq6jz5rDTmBWAkqUwsbznqSzB.png', 'active', 41, '2024-02-08 15:55:46', '2024-02-13 15:53:59'),
(119, 23, 'Honda Civic', ' El Honda Civic es un sedán compacto icónico, apreciado por su confiabilidad, eficiencia y dinámica de conducción emocionante.', '008', 36.199, 0, 'e2dqXnxPG5KkIx2GoCc5mjmJVEBo8qM34bTAS4jP.png', 'active', 45, '2024-02-08 15:56:32', '2024-02-13 15:56:42'),
(120, 11, 'Proyector Epson S39', 'Proyector Epson para colegios o oficinas.', '006', 1249, 0, 'pAIyBuQzzOA7aBlR6s5Nrf5qZzMFTz5I3WEUmvo1.webp', 'active', 49, '2024-02-09 07:46:05', '2024-02-09 08:37:06'),
(121, 11, 'PRO X SUPERLIGHT 2', 'Ratolí', '008', 99, 0, 'Hkt8mWGKI3mdw6fWOMcKaGYPPKA6F11n4qpwwb2T.webp', 'active', 49, '2024-02-09 08:07:15', '2024-02-09 08:39:29'),
(122, 11, 'Pack 1 usuario', NULL, '001', 5, 0, 'y5elLHRTb3PWHulws3ddSxW9C9JyixT48bcpA9Ja.png', 'active', 46, '2024-02-09 08:33:15', '2024-02-09 08:33:15'),
(123, 11, 'Saiyin Altavoces pasivos', NULL, '007', 59, 0, 'JFwwKFeHYVufU4U6sel8hCXJzfsm6RVIJvx5FR0N.webp', 'active', 49, '2024-02-09 08:34:50', '2024-02-09 08:34:50'),
(124, 11, 'Pack 5 usuarios', NULL, '002', 19.99, 0, 'jDmbZzq9NSlgskW3ZsobKln1Z6sZ6s2mMGWQBWQk.png', 'active', 46, '2024-02-09 08:36:25', '2024-02-09 08:36:25'),
(125, 11, 'Pack 10 usuarios', NULL, '003', 42.75, 0, '9qIJCPdg622gOYVqpi0zvppQhoBNdACTakirFkll.png', 'active', 46, '2024-02-09 08:37:53', '2024-02-09 08:37:53'),
(126, 11, 'Pack 25 usuarios', NULL, '004', 115, 0, 'M3RPhqiG8vfz4heLLYzsVXnMfpLTGPxDn4mkTr56.png', 'active', 46, '2024-02-09 08:38:51', '2024-02-09 08:38:51'),
(127, 11, 'Pack 50 usuarios', NULL, '005', 235, 0, 'AV2U3iS8N1B1BbSaUAnuu7yYRhUDXG7ucyfsV60L.png', 'active', 46, '2024-02-09 08:39:32', '2024-02-09 08:39:32'),
(128, 11, 'HP VICTUS GAMING 512GB', 'PC ', '009', 499.99, 0, 'XmPUOmrmvmt2mdSe1zfZNEFjyhdcUICftrpCfwU2.webp', 'active', 48, '2024-02-09 08:43:16', '2024-02-09 08:50:48'),
(129, 11, 'HP Pavilion x360 14\" i5 512GB', 'PC ', '010', 399.99, 0, 'NoCPcc7WistBiskxFXFbBctnAClOIAuRlPcWBGmq.webp', 'active', 48, '2024-02-09 08:47:05', '2024-02-09 08:51:00'),
(130, 11, 'HP Pavilion x360 19\" i5 225GB', 'PC ', '011', 499.99, 0, 'aRHET398dK5zk031agNTcbbH8wWSMAhOq2g8bQJ1.webp', 'active', 48, '2024-02-09 08:49:49', '2024-02-09 08:51:15'),
(131, 9, 'Sudadera FEMfesta', 'Sudadera de color negro con el nombre de FemFesta y en la parte de atras el logo', 'Sudadera', 40, 0, 'xG54lcUcLU0z1Z6x6A3l54hoGK1vg1Qkp1lBZReT.png', 'active', 51, '2024-02-09 09:11:26', '2024-02-09 09:11:26'),
(132, 10, 'Pack Básico', 'Pantalla 23\' 60Hz, Teclado y ratón. Ordenador: I5-12500 (gráficos integrados) RAM 8 GB 512 SSD Sistema Operativo: Windows 10', 'PN-001', 700, 0, 'S51rru2PKlDhEqRTSgNWqPPtofXqjODDAl6BpEUU.png', 'active', 50, '2024-02-09 09:15:56', '2024-02-09 09:15:56'),
(133, 9, 'Gorra FemFEsta', 'Gorra negra con el logo en el centro de FemFesta', 'Gotta', 12, 0, 'JTSkRdIxGLXuBhXwHjHaSRJgN1MKYuau2vSinSlY.png', 'active', 51, '2024-02-09 09:18:17', '2024-02-09 09:18:17'),
(134, 10, 'Portátil Gama de Entrada', 'Marca: Lenovo Procesador: AMD Ryzen 3 7320U RAM: 8 GB Almacenamiento: SSD 256 GB Pantalla: 15\'6 60Hz Sistema Operativo: Windows 11,Reacondicionado', 'PR-001', 290, 0, 'MqTmPhMjzzfT5h5EEAQDjddREQozpKobs691EXbJ.png', 'active', 33, '2024-02-09 09:18:55', '2024-02-09 09:18:55'),
(135, 9, 'Gorro de FemFesta', 'Gorro de color negro con el logo en pequeño en la parte inferior ', 'Gorro', 12, 0, '1Rs4xG9TFoze8pT0DLW9qvgC984DxMk4FFgLv3w2.png', 'active', 51, '2024-02-09 09:19:51', '2024-02-09 09:19:51'),
(136, 10, 'Portátil Gama Media', 'Marca:Procesador: Intel Core i5-1235U RAM: 8 GB SSD 512 GB Pantalla: 15\'6 60Hz Sistema Operativo: Windows 11 Reacondicionado', 'PR-002', 430, 0, 'maOUeqxrG0liYpFCkcZnw1iZXC7U4WjmSj2Pxaoj.png', 'active', 33, '2024-02-09 09:21:02', '2024-02-09 09:21:02'),
(137, 9, 'Bolsa de tela FemFesta', 'Bolsa de tela negra con el logo de FemFesta en la parte central  ', 'Bolsa de tela', 3, 0, 'byVCYi3aLcACL6cSu2QfELhn4R2T3U78YaJJCMYO.png', 'active', 51, '2024-02-09 09:21:46', '2024-02-09 09:21:46'),
(138, 10, 'Portátil Gama Alta', 'Marca: HP Procesador: Ryzen 7 6800H RAM: 16 GB Almacenamiento: SSD 512 GB Gráfica: RTX 3050Ti Pantalla: 16\'1 144Hz Sistema Operativo: Windows 11 Reacondicionado', 'PR-003', 900, 0, 'P3kfUp57UHgAzo0aBwbc8WUiAkwJrlCQSsfDXfhB.png', 'active', 33, '2024-02-09 09:23:04', '2024-02-09 09:23:04'),
(139, 9, 'Funda de iphone 11 FemFesta', 'Funda de iphone 11 negra con el logo de FemFesta en la parte central de la funda ', 'Funda de iphone 11', 10, 0, 'iL2CatCTinoqjdJ1drYkBi5nuCOMbLykf3JDWMbG.jpg', 'active', 52, '2024-02-09 09:24:19', '2024-02-09 09:24:19'),
(140, 10, 'Samsung Galaxy Tab A9', 'Pantalla: 11\"  Almacenamiento: 128GB  Wi-Fi Reacondicionado', 'PR-004', 270, 0, 'YNSzVf54WSCzDIKmvg0sOsVu4i5ygkii9ywHmXls.png', 'active', 33, '2024-02-09 09:25:00', '2024-02-09 09:25:00'),
(141, 9, 'Funda de iphone 11 FemFesta', 'Funda de iphone 11 de color gris con el logo en la parte central de la gunda', 'Funda de iphone 11', 10, 0, 'HAxSnMMMG8u6SR3wjI8m0LGx2THgjv36rNwOpq28.png', 'active', 52, '2024-02-09 09:25:57', '2024-02-09 09:25:57'),
(142, 10, 'Apple iPad 2021', 'Pantalla: 10.2\"  Almacenamiento: 64GB  Wi-Fi Reacondicionado', 'PR-005', 300, 0, 'vLeg1HAVyIUf9hCKhywzxH5WK99FBTXMdDv9moaD.png', 'active', 33, '2024-02-09 09:26:49', '2024-02-09 09:26:50'),
(143, 9, 'Camiseta corta Femfesta ', 'Camiseta corta de color gris claro con el logo de Femfesta en la parte superior derecha ', 'Camiseta corta ', 15, 0, 'qIVDIlxBVnqRDOgO6yYC5p1ELUdTesFHDyxLrKy9.png', 'active', 51, '2024-02-09 09:28:13', '2024-02-09 09:28:13'),
(144, 10, 'Soporte Empresa', 'Precio 45 euros la hora, Tiempo mínimo de contratación presencial 2 horas', 'S-001', 45, 0, 'R9kARpVCuaEqwuTgHHUjUBrct0xzQkixCnRoGPIb.jpg', 'active', 32, '2024-02-09 09:30:46', '2024-02-09 09:30:46'),
(145, 10, 'Soporte domestico', '35 euros la hora, Tiempo mínimo de contratación 1 hora', 'S-002', 35, 0, 'Adj4KXnFC6cuhSPyErXIdL9v4L3pgkLYyLKijpdz.png', 'active', 32, '2024-02-09 09:32:41', '2024-02-09 09:32:41'),
(146, 9, 'Vaso de Cristal FemFesta ', 'Vaso de Cristal con el logo de FemFesta en el centror ', 'Vaso de Cristal', 2, 0, 'zVAnY6k33RcFu7AMQPDAxMLa16WDu2DrhJFJbtpJ.png', 'active', 52, '2024-02-09 09:43:44', '2024-02-09 09:43:44'),
(147, 10, 'Suscripción Premium', 'Se eliminan las comisiones y se está colocado el primero en incidencias para soporte doméstico.', 'SP-001', 6.99, 0, 'FgZEBwkXqKhdk0kzLoAYqrkndKdGq2uG788Jc3yP.png', 'active', 53, '2024-02-09 11:24:51', '2024-02-09 11:24:51'),
(148, 4, 'Sofá 2 plazas', NULL, 'mobiliario010', 275, 0, 'yrb6Uexx8AhZV4kSGbxEnYUswqNELPJrdSfehlXg.jpg', 'active', 13, '2024-02-09 14:20:49', '2024-02-09 14:40:33'),
(149, 4, 'Perchero de madera', NULL, 'mobiliario011', 45, 0, '9lx9uA4ORSyFwASUwF8jfWveMXMK6BxGE9DU0kpX.jpg', 'inactive', 13, '2024-02-09 14:27:32', '2024-02-21 17:03:22'),
(150, 8, 'celo ', 'Celo Pequeño', 'C20245', 1.5, 0, 'TEOorL1tv93e35XIAf9Lu6rVS0Ec65vOVgPNf6sI.jpg', 'active', 25, '2024-02-09 14:34:46', '2024-02-21 17:41:48'),
(151, 8, 'Celo Grande', 'Celo Grande', 'C20242', 3.5, 0, '3sgarWRAKpfRDBl415aaRH2a4N68Syy9AXhNWOkW.jpg', 'active', 25, '2024-02-09 14:37:23', '2024-02-09 14:37:23'),
(152, 4, 'Lámpara Colgante', NULL, 'mobiliario013', 110, 0, 'Av1tLfAnHGikMOjC7RLiDK9V8DCq5uhgvyQIpwcr.jpg', 'active', 13, '2024-02-09 14:39:31', '2024-02-09 14:39:51'),
(153, 5, 'Samsung s23 Ultra reacondicionado', 'Samsung s23 Ultra Dual, lliure, 512GB 12GB RAM, Phantom Black', 'SAMREC/001', 250, 0, 'nZU2UDO4N3hlijI2o4k9FABkRRBz3ZQzvLaP3s8C.jpg', 'active', 18, '2024-02-09 14:42:49', '2024-02-14 17:58:42'),
(154, 4, 'Mesa Auxiliar', NULL, 'mobiliario014', 123, 0, 'eIBebqqP9ZbLX9ol74KTSicq6BbTUFj6wJvGNUt3.webp', 'active', 13, '2024-02-09 14:44:14', '2024-02-09 14:45:03'),
(155, 4, 'Estantería de Bambú', NULL, 'mobiliari015', 155, 0, 'FaAjgRlo37VDQM6TlcmKZOaEprhvQU0Y8gakPmwh.webp', 'active', 13, '2024-02-09 14:47:05', '2024-02-09 14:47:05'),
(156, 5, 'Silla con foto del trabajador.', 'Solo incluye la personalización (imagen persona). Material ecológico', 'SSP/0001', 20, 0, 'M95uHrocdwOovXU2kck2ByGwV1mBmG4or0G4Oqce.jpg', 'active', 34, '2024-02-09 14:47:17', '2024-02-09 14:47:17'),
(157, 4, 'Silla de Oficina', NULL, 'mobiliario', 84, 0, 'VfWCkna6D4qqk6J9TnlciDThsLUnRH0k5QmLJdDC.jpg', 'active', 13, '2024-02-09 14:49:14', '2024-02-09 14:49:14'),
(158, 6, 'DrinkSnap', 'Pack de bebidas con 867 bebidas', 'PRD004', 950, 0, 'miRJUT2Gm01c3irrYExtzaXOQ29tqp2xVQ4JsOOv.png', 'active', 22, '2024-02-09 14:49:42', '2024-02-15 23:02:53'),
(159, 5, 'Mesa con cajones.', 'Mesa con cajones ', 'Mes/0001', 200, 0, 'l40tmCFgLWqQf79MBehDTB5JLw9ZcjQnNA6jlCrA.jpg', 'active', 17, '2024-02-09 14:49:48', '2024-02-09 14:49:48'),
(160, 4, 'diseño1', NULL, 'diseño001', 3000, 0, 'Pgqa0dhZFQJKDGJi46oH3LShLR9LIbCkM7eAUyns.jpg', 'active', 14, '2024-02-09 14:52:20', '2024-02-09 14:52:20'),
(161, 5, 'Cargador Samsung Reacondicionado ', 'Cargador de Samsung reacondicionado (cable aparte)', 'CARGREC/001', 25, 0, 'gaBCiKg90aHaZ25d2INl5VmsD89B95yV406ecUnD.jpg', 'active', 18, '2024-02-09 14:53:59', '2024-02-09 14:53:59'),
(162, 4, 'Cocina', NULL, 'diseño002', 2500, 0, 'mraP07TUIo3cYVnNNKoGIfKsMEG5IuhEumtmzU2D.jpg', 'active', 14, '2024-02-09 14:55:29', '2024-02-09 14:55:29'),
(163, 5, 'Mesa 100% de piedra.', 'Mesa 100% con piedra de Sahara, hecho a mano. ', 'Mes/0002', 450, 0, 'CkCwlNhRQKRN9NINqKlxAXi2q8YofbqVtBtwT5Q2.jpg', 'active', 17, '2024-02-09 14:55:30', '2024-02-09 14:58:48'),
(164, 4, 'sala de espera', NULL, 'diseño003', 1500, 0, '74SdrTaf7tdDWd3hnkLA6Gj6ovshjjTGzqc8du5L.jpg', 'active', 14, '2024-02-09 14:59:32', '2024-02-09 14:59:32'),
(165, 4, 'Recepcción', NULL, 'diseño004', 1750, 0, 'JOP7CR0iE1cXyBmGYQbeW9SeoEhrboCNXhUpopgX.jpg', 'active', 14, '2024-02-09 15:04:17', '2024-02-09 15:04:17'),
(166, 5, 'Escritorio XX22', 'Pack de mesa + silla estilo siglo 22', 'MS/003', 1500, 0, 'iZpoNoCjvDbMbVRP8sM9vfrhUDw6B8m32vEjmTCi.jpg', 'active', 17, '2024-02-09 15:06:51', '2024-02-15 14:54:25'),
(167, 5, 'Cargador triple inalámbrico para Apple', 'Cargador plegable inalámbrico triple para (Apple, Apple Watch...)', 'CARAPL/0001', 50, 0, 'o8uusm8VYH9sI6ONWWgGtdwdVnw1Mei4ChCrSGlz.jpg', 'active', 60, '2024-02-09 15:07:46', '2024-02-15 23:05:15'),
(168, 1, 'Servidor VPS', 'Máquina virtual con entorno Windows, 1GB Bandwidth, 28RAM, 5TB M.2', 'VPS1', 69.7, 0, 'bb3fovVJxxVozOcBm2lcxuUu8M6KfpK5DOgutbwy.png', 'active', 55, '2024-02-13 14:17:40', '2024-02-13 14:17:40'),
(169, 24, 'PLAN ESENCIAL', 'Contenido marketing - Plan de 1 mes.', '001', 1300, 0, 'PhsYbzOGKkbUummHDiQrKpKFnkyegtfuW1joomXi.jpg', 'active', 56, '2024-02-13 16:03:58', '2024-02-16 14:53:27'),
(170, 24, 'PLAN SPOTIFY', 'Contenido de marketing - Plan 3 meses', '002', 2500, 0, 'yRpmJNuXTaOTG6AdN2S83DUVPIfotyTwpkZSObtp.jpg', 'active', 56, '2024-02-13 16:05:47', '2024-02-16 14:53:41'),
(171, 24, 'A LA CARTA', 'Contenido marketing - A la carta.', '003', 750, 0, 't7cUAvjukZOze6OrrWjZDsOzhHA2b3snsAEbVlR7.jpg', 'active', 56, '2024-02-13 16:07:02', '2024-02-13 16:07:02'),
(172, 14, 'Pack Básico de Mecánica', '¡DISFRUTA DEL PACK BÁSICO PARA TU COCHE! Te incluye: •	Revisión general del vehículo. •	Cambio de aceites. •	Nivelación de líquidos.', '0001', 49.95, 0, '85mLp78J1dYea9YYfoRO52EVzbH1BjXUSqImHyxI.png', 'active', 57, '2024-02-13 17:33:07', '2024-02-13 17:37:41'),
(173, 14, 'Pack Medio de Mecánica', '¡DISFRUTA DEL PACK MEDIO PARA TU COCHE! Te incluye: •	Revisión general del vehículo. •	Cambio de aceites. •	Nivelación de líquidos. •	Sustitución de filtros.', '0002', 99.95, 0, 'beODDx04PUyparotuFYfizKW4BNEx3AwvL55uxvt.jpg', 'active', 57, '2024-02-13 17:34:15', '2024-02-13 17:37:49'),
(174, 14, 'Pack Avanzado de Mecánica', '¡DISFRUTA DEL AVANZADO PARA TU COCHE! Te incluye: •	Revisión general del vehículo. •	Cambio de aceites. •	Nivelación de líquidos. •	Sustitución de filtros. •	Lavado del vehiculo.', '0003', 149.95, 0, '8yThhzjOacSlpJsxu5GsG9ZLKgFVaZ8m1se5OQeC.png', 'active', 57, '2024-02-13 17:35:35', '2024-02-13 17:37:59'),
(175, 5, 'Samsung Galaxy Z Flip 4', 'Samsung Galaxy Z Flip 4, 8GB de RAM + 128GB - Morat', 'SAM/0001', 600, 0, 'bz6fU3lTxfPMJMCBIvij2ToX6b5izu1HEmt7rZPh.jpg', 'active', 24, '2024-02-14 18:20:20', '2024-02-15 13:11:05'),
(176, 5, 'APPLE AirPods 2021 3ª Reacondicionado', 'Inalámbricos, Bluetooth®, Estuche de Carga Inalámbrica, Chip H1, Blanco', 'AUR/001R', 70, 0, '28CZZP5hxDcHiaUzsURzZaRe9DCv4jxJd3Uwu7hi.jpg', 'active', 18, '2024-02-14 18:20:26', '2024-02-14 18:21:52'),
(177, 12, 'KeyMouse Icarus', 'Monitor Gaming de 27\" 4K con panel IPS y 144Hz para una experiencia inmersiva. Colores vibrantes, transiciones fluidas y diseño ergonómico.', '0001', 299.95, 0, 'n0qjPqF47ileJqBzAVfKjOtwBoIzilZYTbyEYwpI.jpg', 'active', 58, '2024-02-14 18:45:37', '2024-02-14 18:45:37'),
(178, 12, 'KeyMouse Kitsune RGB V2', 'Experimenta la comodidad suprema con nuestra silla gaming de cuero. Iluminación LED lateral, diseño ergonómico y ruedas suaves para una experiencia gaming envolvente y estilizada.', '0002', 219.95, 0, 'cUWuaQkxgIiWJmxjGCcH6kK0RHy9uL4KD8k018DT.jpg', 'active', 58, '2024-02-14 18:47:54', '2024-02-14 18:47:54'),
(179, 12, 'KeyMouse Aton Black', 'Disfruta del sonido excepcional con auriculares con cable, con luces LED y almohadillas cómodas para una experiencia auditiva envolvente y placentera.', '0003', 89.95, 0, 'oGCStZPLdpNYxBp5t0Hb4hhBI1f2ZTt3cvJYhh56.jpg', 'active', 58, '2024-02-14 18:48:33', '2024-02-14 18:48:33'),
(180, 12, 'KeyMouse Arkane Elite', 'Maximiza tu rendimiento gaming con nuestro ratón inalámbrico de 16.000 DPI. Precisión extrema y libertad sin cables para una experiencia de juego inigualable.', '0004', 39.95, 0, '1ao47IG7sCk8TqfG1a74M2N0jzdXqWaMdf1uJESz.jpg', 'active', 58, '2024-02-14 18:49:15', '2024-02-14 18:49:15'),
(181, 5, 'Apple MacBook Air', 'Chip M1 de Apple, 8 GB, 256 GB SSD, MacOS, Teclado Magic Keyboard Touch ID, Oro', 'MAC/0001', 959, 0, '9ZXbgyagluMFZt6DRNTx6s9aQLFoAkeOc2mY9H5x.jpg', 'active', 59, '2024-02-14 22:00:41', '2024-02-14 22:00:41'),
(182, 3, 'Altavoz individual', 'Altavoz de eventos individual con 1200W de potencia, ¡Perfecto para pequeños y grandes escenarios! ', 'A101', 49.5, 0, 'qysaFXHZDuzdAZBfEUh6kEoAC8FFgqqdr6inm0SN.png', 'active', 12, '2024-02-15 11:46:54', '2024-02-15 11:46:54'),
(183, 3, 'Altavoces para eventos (x2)', '¿No tienes suficiente con uno? ¡Sin problema! Aquí tenemos justo lo que buscabas. Los mejores altavoces para eventos ahora en pack y con el mejor precio. Con 1200W de potencia cada uno y una discreción de ninja en el escenario. ', 'A103', 94.95, 0, 'sVuz7QK2PZVVFm1vdWNxyOUAhKzxeDrVUDSYxYor.png', 'active', 12, '2024-02-15 11:51:34', '2024-02-15 11:51:34'),
(184, 3, 'Sala peque para eventos Eventics', 'Sala preparada para eventos cercanos, con un aforo máximo de 30 personas. Cuenta con sofás comodísimos para tus invitados, dos filas de focos, 4 altavoces de 1200W, pantalla con proyector y un atril para que se te escuche bien. ', 'S001', 1589.5, 0, 'uYZNOA46GIm2yiAQ7ReSDquaKzleaSN5hT5plev1.jpg', 'active', 77, '2024-02-15 12:08:15', '2024-02-19 15:05:52'),
(185, 3, 'Sala en el palau de congressos Eventics', 'Sala en el palau de congressos con capacidad para 250 persona y totalmente equipado para organizar el mejor evento de tu vida. ¡No dejes escapar esta oportunidad única!', 'S004', 4134.5, 0, 's6ExTvJXTwxolcHcwkl4uLCJqiCOP4Be5qKhtyw5.jpg', 'active', 77, '2024-02-15 12:26:41', '2024-02-19 15:06:11'),
(186, 3, 'Sala para eventos Aforo 100 Eventics', 'Sala preparada para eventos potentes, con un aforo máximo de 100 personas. Equipada a la perfección para ofrecer un evento perfecto, con una calidad de audio, espacio y decoración inigualable. ¡La gente querrá repetir cada día!', 'S002', 2989.5, 0, '1PxJDUNVjX918Akf1qcBwZB2kxuu5MVD4HnCrh30.png', 'active', 77, '2024-02-15 12:58:59', '2024-02-19 14:32:38'),
(187, 25, 'Mancuerna (16kg)', NULL, '001', 65, 0, NULL, 'active', 63, '2024-02-15 14:48:08', '2024-02-15 14:53:33'),
(188, 25, 'Banco', NULL, '002', 900, 0, NULL, 'active', 63, '2024-02-15 14:49:10', '2024-02-15 14:49:10'),
(189, 25, 'Bicicleta Estática', NULL, '003', 1600, 0, NULL, 'active', 62, '2024-02-15 14:50:05', '2024-02-15 14:50:05'),
(190, 25, 'Cinta Estática', NULL, '004', 1950, 0, NULL, 'active', 62, '2024-02-15 14:50:57', '2024-02-15 14:50:57'),
(191, 25, 'Polea', NULL, '005', 1200, 0, NULL, 'active', 62, '2024-02-15 14:51:22', '2024-02-15 14:51:22'),
(192, 25, 'Doble Polea', NULL, '006', 2500, 0, NULL, 'active', 62, '2024-02-15 14:52:07', '2024-02-15 14:52:07'),
(193, 25, 'Squat Hacka', NULL, '007', 2400, 0, NULL, 'active', 62, '2024-02-15 14:52:48', '2024-02-15 14:52:48'),
(194, 25, 'Barra', NULL, '008', 190, 0, NULL, 'active', 63, '2024-02-15 14:53:03', '2024-02-15 14:53:03'),
(195, 25, 'Discos (25kg)', NULL, '009', 130, 0, NULL, 'active', 63, '2024-02-15 14:53:25', '2024-02-15 14:53:25'),
(196, 16, 'Impresora', 'Se trata de una impresora que, a través de un programa, se puede escribir un texto y deslizando la pequeña* impresora el texto se copiaria.', 'TEC0001', 130, 0, 'SG8fVMfJAt0oZEOsKbxdnPqgfXfV6bzLYdjt5KbX.png', 'active', 64, '2024-02-15 20:55:37', '2024-02-15 21:00:38'),
(197, 16, 'Proyector de bolsillo', 'Un producto esencial para cualquier persona, muy útil, ya que con solo el móvil y este pequeño proyector, se podrían hacer presentaciones en cualquier lugar a través de un wifi integrado en el mismo proyector.', 'TEC0002', 90, 0, 'a8zHIP287OMp61VuoJn5feKZq3IuLwn2huFQhWw6.png', 'active', 64, '2024-02-15 20:56:47', '2024-02-15 21:00:47'),
(198, 16, 'Subrayador Inteligente', 'Es un aparato que se asemeja a un subrayador normal y corriente. Con la diferencia que tiene incorporada un dispositivo que hace al “subrayar” se copie en el dispositivo que queramos.', 'TEC0003', 120, 0, '1QYKfDHCyJBIKhS9FwRzDj0tK8HDQa9GK6PbEfTb.png', 'active', 64, '2024-02-15 20:58:05', '2024-02-15 21:00:57'),
(199, 16, 'Asistente Jarvis', 'Es un asistente virtual que hacen el trabajo a través de: Texto o por voz, especialmente en una aplicación de mensajería instantánea o en otra aplicación', 'TEC0004', 100, 0, '0ytZ5vGIhgcjbUx5AjV0gYTmpkRwbDNm7yRBA0XP.png', 'active', 64, '2024-02-15 21:00:18', '2024-02-15 21:00:18'),
(200, 16, 'Pack de 4 rotuladores de pizarra', 'Ofrecen ventajas respecto a los marcadores con depósito de tinta tipo esponja. Gracias a la tinta líquida el marcador se desliza con facilidad sobre la pizarra. ', 'TEC0006', 12, 0, 'wQkxDGkoKTPYmGVg9O0yuYuZOItOw57W6bP72GFc.png', 'active', 65, '2024-02-15 21:02:24', '2024-02-15 21:02:24'),
(201, 16, 'Pack de 10 bolígrafos', 'Bolsa de 10 Bolígrafos Cristal. Punta de 1 mm. Trazo de 0,5 mm. Tinta base de aceite. Cuerpo de plástico transparente, hexagonal. ', 'TEC0005', 10, 0, 'XvGQxOX6ussbSSHvLQYtqkbTTzReQiwU3lHmMhJj.png', 'active', 65, '2024-02-15 21:03:21', '2024-02-15 21:03:21'),
(202, 16, 'Pack de 4 subrayadores', 'Faber-Castell 254602 - Set de Escritorio Textliner 46 con 24 subrayadores.', 'TEC0008', 12, 0, '316yACQiN1CMkfTPPGobrSz0fNVXJfDeSGaBRetF.png', 'active', 65, '2024-02-15 21:04:25', '2024-02-15 21:04:25'),
(203, 16, 'Pack de 12 lápices', 'Consistente en una mina o barrita de pigmento generalmente de grafito y una grasa o arcilla especial. ', 'TEC0007', 5, 0, 'o2VUgdIF6nGdTArVDwnsD14J7cnQtnlqdFWzpmIV.png', 'active', 65, '2024-02-15 21:05:18', '2024-02-15 21:05:18'),
(204, 16, 'Pizarra Blanca', 'Pizarra blanca de 60 x 90 cm para escribir y dibujar con rotuladores borrables en seco. La pizarra tiene un marco de madera y está hecha de un tablero de aglomerado recubierto de pintura blanca.', 'TEC0009', 40, 0, 'Evhbt2kNPtmAMGtL1dtZl8UdjuTyG22t16Qt1YHW.png', 'active', 65, '2024-02-15 21:06:02', '2024-02-15 21:06:02'),
(205, 5, 'Cadira Gaming D\'oficina', 'S\'adapta a l\'esquena com un guant, el seient està farcit d\'escuma modelada en fred d\'alta densitat, és ajustable, reclinable i inclou coixins.', 'CA/0001', 110, 0, 'mhehFjd3B8SRWgu4RCV9bkfiUxjdyX3LKQDvGEsl.jpg', 'active', 17, '2024-02-15 22:07:06', '2024-02-15 22:07:06'),
(206, 5, 'APPLE AirPods 3ª gen Reacondicionats', 'Inalámbricos, Bluetooth®,  Estuche de Carga Inalámbrica,  Chip H1, Blanco', 'air/001', 70, 0, '9rMTbzCjjzaFXZ6P7vrrLP3Vx4i8UCwYzu1Exzd6.jpg', 'active', 60, '2024-02-15 22:12:08', '2024-02-15 22:12:08'),
(207, 5, 'Cadira Ergonòmica LAMBO', 'Ús 8H, Reposacaps, Increïble Suport Lumbar, En Negre', 'ca/001', 200, 0, 'TdNyqd0VK4jEwF7Ga28xopzU3WCiYUNDHSlwhTDW.jpg', 'active', 17, '2024-02-15 22:15:16', '2024-02-15 22:15:16'),
(208, 5, 'Taula Oficina DAVEN', '136x130x72 cm, amb prestatges, a Fusta color Negre', 'TAUDAVEN/0001', 170, 0, 'HBX03kPNkJiuvhUujvQffnOJAD6ullinhf7i27Qv.jpg', 'active', 17, '2024-02-15 22:20:02', '2024-02-15 22:20:02'),
(209, 5, 'Taula Oficina DAVEN 2', '136x130x72 cm, amb prestatges, a Fusta color Blanc i Noguera', 'TAUDAVEN/0002', 150, 0, 'OM24QARutOqArvyKz7V3Kq9NeCvxEv7NQJHvh52y.jpg', 'active', 17, '2024-02-15 22:21:29', '2024-02-15 22:21:41'),
(210, 6, 'SnackVending negra', 'maquina gran amb maquina de cafè inclosa de 60-65 buit i 10 tipus de cafès', 'SV001', 700, 0, 'aEgJBrE3AVWTYlaVaDbvoevE9YM0BDWaWI2y0JpC.png', 'active', 20, '2024-02-15 22:23:32', '2024-02-15 22:26:18'),
(211, 6, 'SnackVending azul', 'Maquina gran amb maquina de cafè inclosa de 60-65 buit i 10 tipus de cafès', 'SV002', 700, 0, 'oR5irY0zwTL4R5VNUmEockuzRqAgxsk9YlCrGaOl.png', 'active', 20, '2024-02-15 22:26:06', '2024-02-15 22:26:06'),
(212, 6, 'SnackVending gris', 'Maquina gran amb maquina de cafè inclosa de 60-65 buit i 10 tipus de cafès', 'SV003', 700, 0, 'PHIoWXJbfgzFev4XVW2thObpkt2iF2PTF3ehW7o6.png', 'active', 20, '2024-02-15 22:30:01', '2024-02-15 22:30:01'),
(213, 5, 'Taula Oficina EXIM Reacondicionat', 'Taula feta amb fusta a partir de materials reciclats', 'taul/0002', 70, 0, 'u7yQgacpS9DA2wzu1EK6ndpoSCZbm2kcMPcXvCeY.jpg', 'active', 19, '2024-02-15 22:39:19', '2024-02-15 22:39:19'),
(214, 5, 'Ratolí personalitzat nº1', 'Ratolí personalitzat nº1', 'rat/0003', 20, 0, 'UGqMPI5gmfmdmN6EqdFl2nKV6fHU4zoqB756QyPa.jpg', 'active', 34, '2024-02-15 22:45:45', '2024-02-15 22:45:45'),
(215, 5, 'Taula personalitzada', 'Taula personalitzada ', 'taul/0004', 50, 0, 'h0hT80nWpXiuDtE30VrWlvMweHeOMvUwyfBtLbkH.jpg', 'active', 34, '2024-02-15 22:49:52', '2024-02-15 22:49:52'),
(216, 5, 'ratolí personalitzat Nom + Dibuix', 'ratolí personalitzat Erik (Nom + Dibuix)', 'rat/0005', 30, 0, 'HjYfts4kFIJDfyqkuFblIkbn29Q8YwyKoNDhrFgm.jpg', 'active', 34, '2024-02-15 22:52:16', '2024-02-15 22:52:16'),
(217, 5, 'Teclat d\'ordinador x23 recondicionat', 'Teclat d\'ordinador x23 recondicionat', 'tecla/001', 30, 0, 'Al44d2vgpa4MHKciqiBuU1qpbTKBCx2f7EB6qvwU.jpg', 'active', 66, '2024-02-15 22:54:46', '2024-02-15 22:54:46'),
(218, 6, 'RSmallSnap azul', 'Màquina petita recondicionades de menjar amb capacitat de 15-20  buits', 'RSS002', 2000, 0, 'aRNSAVFcfDW6bhF67c9klqnqMJP3whZb5ZLQWRy1.png', 'active', 21, '2024-02-15 22:59:30', '2024-02-15 23:01:17'),
(219, 5, 'Armari d\'arxiu tecnològic 4lac ', 'Armari d\'arxiu tecnològic 4 lac', '4lac/001', 2500, 0, 'i2kJIUqAh9MPzMJdIS706XnlazctC9HcfkYaVKv4.jpg', 'active', 17, '2024-02-15 22:59:53', '2024-02-15 22:59:53'),
(220, 6, 'SnackCoffee', NULL, 'SC005', 200, 0, 'YoahuT7TaCngGbT02HRCyUBtcGW3C14PcxbnptzK.png', 'active', 22, '2024-02-15 23:02:37', '2024-02-15 23:02:37'),
(221, 5, 'Cadira x200 advance', 'Cadira x200 advance molt còmoda', 'cad/001', 250, 0, 'vjw8clC60MEu9HCNhXpxVfP9BE1kGQIP1uYqDmZC.jpg', 'active', 17, '2024-02-15 23:03:07', '2024-02-15 23:03:07'),
(222, 6, 'HealthySnack', NULL, 'HS006', 400, 0, '74gbIRbNGy2uMPRJOMQUbPCfCbVmB20oMwPj87Bq.png', 'active', 22, '2024-02-15 23:04:23', '2024-02-15 23:04:23'),
(223, 5, 'Apple iMac (2023) Reacondicionat', '24\" Retina 4.5K,  Chip M3, CPU de 8 núcleos,  GPU de 8 núcleos,  8 GB RAM, 256GB SSD,  macOS Sonoma', 'mac/003', 480, 0, 'hkhpffaqHHF7cWCc1GkuBxCnQNRMhyehqhdALW8P.jpg', 'active', 59, '2024-02-15 23:08:06', '2024-02-15 23:08:06'),
(224, 5, ' iMac 21\" 2015 APPLE  Reacondicionat', ' 21,5 \", Intel Core i5,  16 GB, 1000 GB, MacOS', 'mac/003', 425, 0, 'lUPcxwAdpDbNVkBr23iLet0yTE2q6Clw68WouKVM.jpg', 'active', 59, '2024-02-15 23:09:26', '2024-02-15 23:09:26'),
(225, 5, 'Reloj Inteligente 2024x', 'Reloj para recibir y contestar llamadas, mensajes  conectados al móvil, cuenta con botón especial para avisar a la policía y servicios de emergencia junto con la ubicación actual mediante el GPS.', 'relg/001', 65, 0, 'wiaN2P43ejJp5E7dsootayF6u9OsWOMDx5S1mIQQ.jpg', 'active', 60, '2024-02-15 23:12:43', '2024-02-15 23:12:43'),
(226, 5, 'cadira electrica amb rodes ', 'Cadira electrica amb rodes d\'ultima tecnologia', 'cad/0006', 1250, 0, 'TVjvf4KfMH18C34AtQX0mZhNxyZmWChHXDJFPFQ4.jpg', 'active', 17, '2024-02-15 23:15:50', '2024-02-15 23:15:50'),
(227, 5, 'Bancada 4 Seients MOBY BASE', 'Estructura Metal, Madera', 'bancada/001', 340, 0, 'uztMZ9wCETevzaFqOCaZmV81hKduYo8ryiEgFtzk.jpg', 'active', 17, '2024-02-15 23:20:30', '2024-02-15 23:40:04'),
(228, 5, 'Prestatgeria Metàl·lica Oficina', 'EXPRESS - Prestatgeria Metàl·lica Oficina 170x100 cm, Fet amb Materials 100% reciclats', 'Prest/0005', 150, 0, '70sJdMOqL3qLfSqdLEx4q5CT4HYI0bHEmzmsfgUi.jpg', 'active', 19, '2024-02-15 23:24:15', '2024-02-15 23:24:15'),
(229, 5, 'Tipus de Fusta', 'Tipus de Fusta per personalitzar el teu mobiliari', 'mad/0003', 5, 0, 'hnWPtbQ7LWOvSVfS5OkpouoVGnACUTHtNfifIwBQ.png', 'active', 34, '2024-02-15 23:29:41', '2024-02-15 23:29:42'),
(230, 5, 'Sofa personalitzat per a sala de descans', 'Sofa personalitzat per a sala de descans', 'sofa/0004', 1240, 0, 'sYTleDtCwdxdHz8y5a8PgJ0qbQQkqeIRilvEpJRB.jpg', 'active', 34, '2024-02-15 23:32:42', '2024-02-15 23:32:42'),
(231, 13, 'Servicio de Barbería ( EVENTOS)', 'Ofrecemos un servicio de Barbería especializada en eventos. Servicio personalizado para que vayan a los eventos con su apariencia cuidada y arreglada. Precio para empresas de 10 a 20 personas.', 'Cuidado Personal', 120, 0, 'fiDzZ06sVJpBG80DsHl4Hcv7VvC7lEaEZt9OtocG.png', 'active', 67, '2024-02-16 10:47:16', '2024-02-16 11:58:13'),
(232, 13, 'Servicio Barbería  (EVENTOS)', 'Ofrecemos un servicio de peluquería especializada en eventos. Servicio personalizado para que vayan a los eventos con su apariencia cuidada y arreglada. Precio para empresas de 21 a 30 personas.', 'Cuidado Personal', 200, 0, 'zZMz5xA7nsl0sz7n6VLA2Edq46Zk2Cfpm9jT8RnF.png', 'active', 67, '2024-02-16 10:51:10', '2024-02-16 11:58:24'),
(233, 13, 'Servicio de Barbería (EVENTOS)', 'Ofrecemos un servicio de barbería especializada en eventos. Servicio personalizado para que vayan a los eventos con su apariencia cuidada y arreglada. Precio para empresas + 30 de personas.', 'Cuidado Personal', 270, 0, 'QdzieiQBwTloXFJimw7gHacGsGJCiI2ob3QlCMRd.png', 'active', 67, '2024-02-16 10:55:54', '2024-02-16 11:58:34'),
(234, 13, 'Servicio de Barbería (EVENTOS)', 'Ofrecemos un servicio de peluquería especializada en eventos. Incluye corte + barba + cejas. Precio para empresas de 10 a 20 personas.', 'Cuidado Personal', 180, 0, '0aVVmoTmz2WvKvLEtXkjQwyOaES4YpecXPEJS9M4.jpg', 'active', 68, '2024-02-16 11:18:16', '2024-02-16 11:53:14'),
(235, 13, 'Servicio de Barbería (EVENTOS)', 'Ofrecemos un servicio de peluquería especializada en eventos. Incluye corte + barba + cejas. Precio para empresas de 21 a 30 personas.', 'Cuidado Personal', 357, 0, 'wNlBRy6GP0z9dfse7myX9Z4YMInCydx5IAj8MyzV.jpg', 'active', 68, '2024-02-16 11:24:38', '2024-02-16 11:53:47'),
(236, 13, 'Servicio de Barbería (EVENTOS)', 'Ofrecemos un servicio de peluquería especializada en eventos. Incluye corte + barba + cejas. Precio para empresas de + 30 personas.', 'Cuidado Personal', 480, 0, 'LKOKGjYvsuKUFqmlnI8kL3ySkl03aPjF2MSL5SvR.jpg', 'active', 68, '2024-02-16 11:30:10', '2024-02-16 11:54:05'),
(237, 15, 'Americana de traje', NULL, '001', 99.95, 0, 'DUAcQIeVHzEI9o0pf63z7pnRFrZrMhoRl2qwG5cU.png', 'active', 69, '2024-02-16 12:18:59', '2024-02-16 12:18:59'),
(238, 15, 'Pantalones de traje', NULL, '002', 49.95, 0, 'QY1MEGh91Xvszpq2niYitdvUpMdUoAD6BhfLJnsJ.png', 'active', 69, '2024-02-16 12:19:47', '2024-02-16 12:19:47'),
(239, 15, 'Camisa elástica', NULL, '003', 29.95, 0, 'kJYMZTfJmaOKB0Jb6M7TyuwqEUNuOYqwawHlVtGW.png', 'active', 69, '2024-02-16 12:20:34', '2024-02-16 12:20:34'),
(240, 15, 'Corbata 100% seda', NULL, '004', 22.95, 0, 'NyiBWiTdZAsH5m1xX4TAP9qbQA6SWFcbqhR1sjva.png', 'active', 69, '2024-02-16 12:21:15', '2024-02-16 12:21:15'),
(241, 15, 'Zapatos de vestir', NULL, '005', 39.95, 0, 'ppJ3X2EslDJeqjVRpbw8LYhtXhxKzmazMXqXqaqo.png', 'active', 69, '2024-02-16 12:21:40', '2024-02-16 12:21:40'),
(242, 15, 'Camisa popelín', NULL, '006', 25.95, 0, 'BT9XXA3RMovXSbN3u8vIOLtanxvxBm1WutYO3OWL.png', 'active', 69, '2024-02-16 12:22:40', '2024-02-16 12:22:40'),
(243, 15, 'Mini falda', NULL, '007', 35.95, 0, 'VBusBD7Z0o6miJOlWlFjpdDeWAd4RWaCRnAZYYaT.png', 'active', 69, '2024-02-16 12:23:06', '2024-02-16 12:23:06'),
(244, 15, 'Pantalón recto tobillero', NULL, '008', 39.95, 0, 'wyqwVzImiK39TZSLvxpsgkRn5eu2NV4PIcozV8B0.png', 'active', 69, '2024-02-16 12:23:31', '2024-02-16 12:23:31'),
(245, 15, 'Blazer básica', NULL, '009', 39.95, 0, 'bei562mWHZ8c376vy2zCquiRJEwJfyBM36o8qZmZ.png', 'active', 69, '2024-02-16 12:24:06', '2024-02-16 12:24:06'),
(246, 15, 'Zapato destalonado tacón alto', NULL, '0010', 29.95, 0, '3zkGFilMSGg7SGjMMXe79gnIfLsvT78ycGgBEC03.png', 'active', 69, '2024-02-16 12:24:43', '2024-02-16 12:24:43'),
(247, 17, 'Pack Esmorzar', 'Gaudeix de la combinació perfecta per començar el teu dia amb gust i energia', '001', 12.5, 0, 'fvK1FMKdGaqBlD2cYsmpNamcJFoVoU1AfUhFD2CN.png', 'active', 70, '2024-02-16 13:07:30', '2024-02-16 13:09:37'),
(248, 17, 'Pack Brenar', 'Tria entre un deliciós tros de pastís o un apetitós sandvitx, acompanyat d\'un refrescant suc natural. ', '002', 4.99, 0, '4o1UMYBR4w3CZPYnZjTO1zUBk0aY02HKpiVfy3yv.png', 'active', 70, '2024-02-16 13:11:24', '2024-02-16 13:11:24'),
(249, 17, 'Pack Coffee Break', 'Cafè doble, intens i recomfortant, acompanyat d\'una deliciosa cookie. Una pausa perfecte per disfrutar. Sabor i comoditat a cada glop!', '003', 6.95, 0, 'Hh8jnXtSEYA9Ko4XA4pzqnsNyhhStlUExqMrqBMb.png', 'active', 70, '2024-02-16 13:14:23', '2024-02-16 13:14:23');
INSERT INTO `products` (`id`, `company_id`, `label`, `description`, `reference`, `price`, `stock`, `image`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(250, 20, 'YOGA', 'El yoga es una disciplina milenaria originada en la India que busca la unión entre mente, cuerpo y espíritu.', '001', 100, 0, 'HqxuePAOXtduEs28XzCe76eddba2D1UQfOIWjfm4.jpg', 'active', 71, '2024-02-16 14:26:26', '2024-02-16 14:26:26'),
(251, 20, 'PILATES', 'El pilates es un sistema de ejercicios repetitivos que se realizan en una colchoneta o con otros equipos para promover la fuerza, la estabilidad y la flexibilidad. PILATES 80€ 2 clases semanales', '002', 80, 0, 'rK6ruoEh1RzNImFRhVbvE9BVYMPrKpDTfXYFmLJw.jpg', 'active', 72, '2024-02-16 14:27:24', '2024-02-16 14:27:24'),
(252, 20, 'HIPOPRESIVOS', 'Los hipopresivos son una técnica de entrenamiento abdominal que se enfoca en la respiración y la postura para fortalecer y restaurar los músculos del suelo abdominal y pélvico 1', '003', 76, 0, 'B92rfw6DDL0ykXmcu8C687LIE3aaw3ympDkQQe2r.jpg', 'active', 73, '2024-02-16 14:28:12', '2024-02-16 14:28:12'),
(253, 20, 'YIN YOGA', 'El yin yoga es un estilo de yoga que se basa en la relajación y el estiramiento de las posturas, con el fin de estimular la energía vital o chi', '004', 110, 0, 'wYxYaj1M3piPDxGXYEwQCU0RnGQncYYJCxz3tp4S.jpg', 'active', 71, '2024-02-16 14:28:55', '2024-02-16 14:28:55'),
(254, 20, 'YOGA HATHA VINYASA', 'El Hatha Vinyasa Yoga combina la estabilidad del Hatha con la fluidez del Vinyasa, enfocándose en secuencias fluidas para fortalecer, flexibilizar y conectar mente-cuerpo. Es adaptable a diferentes niveles.', '005', 120, 0, 'kX5FQ7pgRiGf3KAeFH1nJS1RzRPDSG1U0WWk4Viy.jpg', 'active', 71, '2024-02-16 14:29:50', '2024-02-16 14:29:50'),
(255, 21, 'Conduccion avanzada y riesgo', NULL, '001', 230.35, 0, NULL, 'active', 74, '2024-02-16 14:48:10', '2024-02-20 14:38:48'),
(256, 21, 'Seguridad vial ', NULL, '002', 123.66, 0, NULL, 'active', 74, '2024-02-16 14:48:57', '2024-02-20 14:40:04'),
(257, 21, 'Experiencias team building', NULL, '003', 105.17, 0, NULL, 'active', 75, '2024-02-16 14:50:50', '2024-02-20 14:39:31'),
(258, 21, 'Cambios de legislacion y trafico', NULL, '004', 59.59, 0, NULL, 'active', 76, '2024-02-16 14:51:59', '2024-02-20 14:41:04'),
(259, 7, 'Seguros', 'Todo tipo de seguros en un año', '999', 1299, 0, 'qw2D6tjMNImD0YKwYi5oydEP4WiTfzxZIefvFwlw.png', 'active', 29, '2024-02-16 15:20:13', '2024-02-22 14:43:59'),
(260, 7, 'Fiat 500', NULL, '12345', 10000, 0, 'pk2NaFPSFSaolucYRMXdEFUFoz1ZtOIGoJuWfWQM.webp', 'active', 27, '2024-02-16 15:40:10', '2024-02-16 15:40:10'),
(261, 7, 'Cupra Leon Hibrido Enchufable', 'De 0 a 100 de 5 a 9 segundos, 245 CV. Capacidad de remolque de 1.700kg', '112', 43000, 0, 'cmy0ke29wuwuPWuplOPXpVMNRsUoQ5J2Wl31k3pt.png', 'active', 29, '2024-02-19 14:50:18', '2024-02-19 14:52:12'),
(262, 2, 'Apple Watch', NULL, 'WTCH3', 220.4, 0, NULL, 'active', 78, '2025-02-25 19:55:27', '2025-05-27 19:12:12'),
(263, 27, 'Botiquin avanzado y caja de mascarillas', 'Ofrece un botiquín avanzado y una caja de mascarillas.', '00001', 35.5, 0, NULL, 'active', 79, '2025-02-26 11:54:27', '2025-02-26 13:11:59'),
(264, 27, 'Botiquin primeros auxilios y pastillero', 'Ofrece un botiquín de primeros auxilios y pastillero.', '00002', 32.2, 0, NULL, 'active', 79, '2025-02-26 13:11:51', '2025-02-26 13:11:51'),
(265, 27, 'Planes de salud personalizados', 'Ofrece una gran variedad de ejercicios físicos y planes de alimentación.', '00003', 12.5, 0, NULL, 'active', 79, '2025-02-26 13:12:18', '2025-02-26 13:12:18'),
(266, 27, 'Disp gel hidroalcoholico y recarga', 'Ofrece un dispensador de gel hidroalcohólico y una recarga para rellenar el bote.', '00004', 10, 0, NULL, 'active', 79, '2025-02-26 13:13:27', '2025-02-26 13:15:13'),
(267, 27, 'Termometro digital y pulsioximetro', 'Ofrece un termómetro digital junto a un pulsioxímetro.', '00005', 29.99, 0, NULL, 'active', 79, '2025-02-26 13:15:00', '2025-02-26 13:15:00'),
(268, 52, 'Portatil Milvus', 'Ultraligero, potente y avanzado. Con pantalla de alta resolución, gran autonomía y conectividad superior, supera a la mayoría de los portátiles actuales.', '001', 1350, 0, 'dFBvg9v5MguBK5oinwDsTV4ML9YgveHkV5NzqZgO.png', 'active', 82, '2025-02-26 14:46:56', '2025-02-26 14:46:56'),
(269, 52, 'Lapiz digital', 'Escribe, dibuja y navega con alta precisión. Control por gestos, IA integrada y almacenamiento en la base del dispositivo para fácil acceso.', '002', 75, 0, 'WFwgofEnnNUNwVFfSubNC0hnt5hg35VapZX8Fbyb.png', 'active', 83, '2025-02-26 14:48:30', '2025-02-26 14:48:30'),
(270, 52, 'USB fly', 'Transfiere datos sin cables con alta velocidad y compatibilidad universal. Compacto y fácil de usar.', '003', 25, 0, 'gJtwB5ZHtlU8ztLLqm5vtbIgeiKfbucjHXN1l3Gz.png', 'active', 83, '2025-02-26 14:49:12', '2025-02-26 14:49:12'),
(271, 38, 'Pro webcam', 'Nuestra Pro Webcam ofrece Full HD 1080p a 30 fps, con enfoque automático y corrección de luz para una imagen nítida. Incluye tapa de privacidad y micrófonos estéreo para sonido claro. Compatible con Windows, macOS, Android y Chrome OS.', 'MED001', 60.05, 0, '1Z8tFVT2Y2Z0IgrHTpuAYGai1F0FKAow2juBvhJ5.png', 'active', 81, '2025-02-26 14:51:11', '2025-02-26 14:51:11'),
(272, 38, 'Camara vlog', 'Nuestra Cámara Vlog tiene pantalla giratoria táctil, 4K (30p) y Full HD a 120p, AF al ojo en tiempo real y autoexposición facial. Incluye micrófono direccional con paravientos, zoom 2x, pantalla de 7.5 cm y lente teleobjetivo.', 'MED002', 543.75, 0, 'h1GlJeTICLiux3WXmNmcpfQWIr2ZwU6pTZ7UzvO1.png', 'active', 81, '2025-02-26 14:54:06', '2025-02-26 14:54:06'),
(273, 38, 'Tripode camara', 'Nuestro Trípode para Cámara es ligero y resistente, hecho de aleación de aluminio. Ofrece altura ajustable de 43 cm a 172 cm, cabezal panorámico de 3 vías y base estable con mango grueso. Incluye mando a distancia y soporte para smartphones.', 'MED003', 23.25, 0, 'g01k4T3Xateb4uXbXNJECOPBBOlgTICNLYFIbvNN.png', 'active', 81, '2025-02-26 14:55:41', '2025-02-26 14:55:41'),
(274, 38, 'Estabilizador smartphone', 'El Estabilizador Vimble 4SE es ligero (315 g) y portátil, con batería de 9 h y diseño ergonómico. Ofrece estabilización en 3 ejes, control por gestos, seguimiento facial y modos creativos. Compatible con teléfonos de hasta 88 mm y 260 g.', 'MED004', 51.75, 0, '6GaswsnGth8b68xVzLNMRoV3tUqb7R4twPxzNuXi.png', 'active', 81, '2025-02-26 14:57:19', '2025-02-26 14:57:20'),
(275, 38, 'Kit iluminacion softbox', 'El Kit de Iluminación incluye softbox de 16\'\' x 16\'\' con luces LED de 45W, brillo y temperatura (3000-6500K) ajustables por control remoto. Ofrece ángulo de 180° y trípode plegable ajustable (27,56’’-59,06’’) para iluminación precisa.', 'MED005', 30.75, 0, 'I3Ef1ul5dU8jkITXWFRruRHIuEnNR3vV5LnW2xbM.png', 'active', 81, '2025-02-26 14:58:36', '2025-02-26 14:58:36'),
(276, 56, 'Gorra', 'Gorra de la marca de Ritmos Emergentes.', 'GORRAS', 20, 0, 'edWoGtKJDHy08MWHwKcxHvLiFuUiVZBpB3l23qQk.png', 'active', 87, '2025-02-26 14:58:57', '2025-02-27 15:27:02'),
(277, 55, 'Scyrox 8', 'Un mouse ultraligero con sensor de alta precisión y diseño ergonómico para un rendimiento óptimo en gaming competitivo. Su estructura minimalista y tecnología avanzada garantizan velocidad y control.', '000001', 76, 0, 'unIEp92qcDrkeG6r5r379O5yCSASlad0kvX75hEf.jpg', 'active', 90, '2025-02-26 14:59:32', '2025-02-26 14:59:53'),
(278, 29, 'Camiseta Vintage', NULL, 'Camisetas01', 16, 0, 'ZSeZI5WV2L9d3AM3zmymYDdWEagrVQBSPKQw0FDU.png', 'active', 88, '2025-02-26 14:59:37', '2025-02-26 14:59:37'),
(279, 38, 'Estudio fotografico', 'El Estudio Fotográfico incluye un soporte de fondo de 2x3m con pantallas en 3 colores, ideal para fotógrafos de todos los niveles. Es portátil y fácil de usar, permitiendo personalizar el entorno y capturar momentos especiales con calidad y practicidad.', 'MED006', 71.25, 0, 'gZPa7gE6CFtdmRlByhAqOLciAeLuzp5eSciYrt2b.png', 'active', 81, '2025-02-26 14:59:41', '2025-02-26 14:59:41'),
(280, 49, 'Sistema de Alarma Inteligente Basico', 'Un sistema de alarma completo para el hogar que incluye sensores de movimiento, sirena y control desde la app móvil.', 'P0001', 250, 0, 'nat2v2UfPAqz6hcQttJ5EmfxygY3ZHEahV4qkyBa.png', 'active', 89, '2025-02-26 15:00:10', '2025-02-26 15:00:10'),
(281, 38, 'Teclado TKL Z Pro RGB Switch Blue', 'Optimiza tu espacio con el TKL Z Pro RGB Switch Blue Compacto (TKL) ideal para oficina. RGB personalizable, switches mecánicos intercambiables, USB-C desmontable y diseño portátil y resistente.  ¡Eficiencia y confort en cada tecla!', 'TEC001', 34.99, 0, 'CcT6JYJmGnG3j0Ff1DeoMTT27M3eMYM0VJ3uNh9W.png', 'active', 80, '2025-02-26 15:00:19', '2025-02-26 15:00:19'),
(282, 29, 'Pantalones Vintage', NULL, 'Pantalones001', 24, 0, 'ZdlWfH3e1F7MQcT8D256AzKgp5fkm158mXRuZxtf.png', 'active', 88, '2025-02-26 15:00:41', '2025-02-26 15:00:41'),
(283, 38, 'Combo microfonos inalambricos', 'El Combo de Micrófonos Inalámbricos LARK M2 es ultraliviano (9g) y ofrece sonido de estudio (48kHz/24 bits). Tiene cancelación de ruido, batería de 40h, alcance de 300m y control fácil. Compatible con iPhone, Android, cámaras y PC.', 'MED007', 149.25, 0, 'WM0LLSp2d3iXsutNMDgAnqHu8pmcWr2pLuJPFcZI.png', 'active', 81, '2025-02-26 15:01:26', '2025-02-26 15:01:26'),
(284, 56, 'Pantalon corto', 'Pantalón corto de la marca de Ritmos Emergentes.', 'PANTALONES', 30, 0, 'rJag5cCqhGNhYLR8N48tzir2WE4fVejGthh3DnmL.png', 'active', 87, '2025-02-26 15:01:40', '2025-02-27 15:28:07'),
(285, 49, 'Sensores de seguridad 360 HD', 'Sensores de vigilancia con visión nocturna y detección de movimiento, ideal para monitorear exteriores.', 'P0002', 150, 0, 'bIu4atKPqU0I6M2hU5CNHrT1pq2Pbf0nbU33l9nK.png', 'active', 89, '2025-02-26 15:01:41', '2025-02-26 15:01:42'),
(286, 29, 'Chaqueta Vintage', NULL, 'Chaqueta001', 32, 0, 'ZWhygrvKxaTaOsdLzdXlPggpS6LeyNAvnxpugR0l.png', 'active', 88, '2025-02-26 15:01:43', '2025-02-26 15:01:43'),
(287, 55, 'Lamzu Maya', 'Ratón inalámbrico con diseño compacto y peso optimizado, ideal para jugadores que buscan agilidad y respuesta instantánea. Su sensor de última generación y switches táctiles ofrecen una experiencia fluida y precisa.', '000002', 119, 0, '6gSnapLBSfjgo63kiNg28PbhDXltXuPS9Ni3iVKL.jpg', 'active', 90, '2025-02-26 15:01:53', '2025-02-26 15:01:53'),
(288, 29, 'Bolso Vintage', NULL, 'Bolso001', 18, 0, '3vKrBBCN8pg4yad7S0pWeC9UrdeByzfGKUro8y8Q.png', 'active', 88, '2025-02-26 15:02:39', '2025-02-26 15:02:39'),
(289, 49, 'Sistema de Videovigilancia Premium', 'Inclou càmeres de seguretat avançades, un panell de control central i monitoratge remot les 24 hores.', 'P0003', 600, 0, 'ALA3JcpMYY34fV85IsIW3rXZnebCZ3it7nAxGKjk.png', 'active', 89, '2025-02-26 15:02:41', '2025-02-26 15:02:42'),
(290, 38, 'Mouse Z Pro SuperLight', ' El Z Pro SuperLight es un ratón inalámbrico para profesionales. Su sensor de 25.600 DPI y tecnología Lightspeed garantizan precisión, conectividad y eficiencia en el trabajo diario que optimiza tareas.', 'TEC002', 20, 0, 'V5EKde7CzVJQ8yEyjaMtKDNdpYhXL8BVSq4Ly6r2.png', 'active', 80, '2025-02-26 15:03:06', '2025-02-26 15:03:06'),
(291, 44, 'AGUA', NULL, 'AG040', 12, 0, 'Pn19xYZUKGzEKF2iSET2UF5xPdzip34XTsELQ0Di.webp', 'active', 84, '2025-02-26 15:03:12', '2025-02-26 15:03:12'),
(292, 38, 'Silla Z Pro Confort Extreme', 'Nuestra primera silla de alto rendimiento, brinda soporte total para cabeza, cuello y hombros con un reposacabezas ajustable, su material de suspensión exclusivo garantiza comodidad duradera, mientras que el reposacabezas tiene un ajuste perfecto.', 'TEC003', 110, 0, 'vlsQ5S3kAvsKPnuT9NKGdWl6iVlUtftMotvrOps8.png', 'active', 80, '2025-02-26 15:03:25', '2025-02-26 15:03:25'),
(293, 49, 'Servicio de Monitoreo 24H', 'Servicio mensual de monitorización y soporte técnico con respuesta inmediata frente a emergencias.', 'S0001', 30, 0, 'oxoM3M4yNK2BOdN8fErWgpXabaGSMi7FtVYotWmY.png', 'active', 92, '2025-02-26 15:04:11', '2025-02-26 15:04:11'),
(294, 38, 'Mousepad RendZ PE L Series', 'Nuestro set de alfombrillas de fibra textil de alta calidad que garantiza durabilidad, una base antideslizante con excelente estabilidad, sus dimensiones de 470x390 mm la hacen ideal para cualquier espacio.', 'TEC004', 8, 0, 'Opv4pHCiGQwM8XuTqgk4xgylcIZmeaKZZRTqCXZL.png', 'active', 80, '2025-02-26 15:06:20', '2025-02-26 15:06:20'),
(295, 55, 'Mousepad FX Type99', ' Alfombrilla de alto rendimiento con superficie híbrida optimizada para velocidad y control. Su base antideslizante y bordes reforzados garantizan durabilidad y estabilidad en cada partida.', '000003', 111, 0, 'LnSDalQbRd4PLtXDP72nreUp6DuNSVcvWbpvZ8TR.jpg', 'active', 91, '2025-02-26 15:07:12', '2025-02-26 15:07:12'),
(296, 55, 'Epomaker x Aula F75', 'Teclado mecánico compacto con diseño premium y montura gasket para una experiencia de escritura suave y silenciosa. Personalizable con switches intercambiables y conectividad versátil.', '000004', 80, 0, '1qp5CyS86y28nB5ipBzSlr4jHFCYNTOfmcHiGlfH.jpg', 'active', 93, '2025-02-26 15:09:11', '2025-02-26 15:09:11'),
(297, 56, 'Camiseta basica', 'Camiseta Básica de la marca de Ritmos Emergentes.', 'CAMISETAS', 15, 0, 'qkc0EyLc1bPkXBFgBXxjk70djZZLoVTJOenAOCA6.png', 'active', 87, '2025-02-26 15:09:22', '2025-02-27 15:28:36'),
(298, 58, 'CyberTable', 'Es un escritorio futurista que integra inteligencia artificial, control por voz y gestos y una pantalla táctil para manejar tareas. Su diseño ergonómico y ajustable garantiza un máximo confort.', 'CYTA06', 3000, 0, 'IP8IuUVFl9cbXbRyC9tMmWbVDFiz0VRIdmTfdG5u.png', 'active', 95, '2025-02-26 15:10:41', '2025-02-26 15:17:24'),
(299, 59, 'Ambientador de Citricos', 'Refresca tu espacio con un estallido de energía y vitalidad gracias a las notas cítricas de limón, naranja y bergamota. ¡Frescura instantánea!', 'NAOC', 9.5, 0, 'FjL4HRXSeaEHh1iPG1HckK8l3bknq9ygMB50UsNa.png', 'active', 101, '2025-02-26 15:10:48', '2025-02-26 16:03:35'),
(300, 55, 'Apex Pro TKL', 'Teclado gaming con switches magnéticos ajustables para una respuesta ultra rápida y personalización total. Su formato sin teclado numérico maximiza el espacio y la comodidad en el escritorio.', '000005', 204, 0, 'buslOvqj6gBBu9ub1xdUGoArgWxLFUpTDnsvbAYK.jpg', 'active', 93, '2025-02-26 15:10:58', '2025-02-26 15:10:58'),
(301, 59, 'Ambientador de Eucalipto y Menta', 'Siente la frescura revitalizante de la menta y el eucalipto, una combinación perfecta para un baño limpio y lleno de vitalidad.', 'NAOEM', 9.5, 0, 'NOAs9peq8CXlV7dDw1TqstUnzXMSovw7H0WQW3Ho.png', 'active', 101, '2025-02-26 15:12:31', '2025-02-26 16:03:42'),
(302, 43, 'Fregadora Karcher BP CLASSIC', 'Fregadora compacta para superficies medianas. Rendimiento de hasta 2000 m²/h. Gran maniobrabilidad y visibilidad durante la limpieza. Manejo sencillo con panel Easy Operation. Depósito totalmente desmontable para fácil mantenimiento.', 'PR1', 3865.55, 0, 'bbnJxXUhOfq3x9FSReAb5XbTKcMXodNdZdLD3rjl.jpg', 'active', 114, '2025-02-26 15:13:09', '2025-02-26 15:13:09'),
(303, 30, '	Anorac impermeable', 'Jaqueta de protecció contra la pluja i el vent, ideal per a entorns de treball a l’exterior. Fabricada en polièster amb folre polar interior, proporciona aïllament tèrmic.', 'AIE', 75, 0, 'RzZloCKfAkykPJhDwNJeh17PlMHXNlnAJtBDx1SN.png', 'active', 107, '2025-02-26 15:13:12', '2025-02-26 15:13:12'),
(304, 30, '	Armilles reflectants', 'Dissenyades per millorar la visibilitat en entorns de treball amb poca il·luminació. Ideals per a obrers, policies de trànsit i equips d’emergència. Fabricades amb materials lleugers i transpirables.', 'ARS', 3.5, 0, 'qZHoDkXDusG2J1t4e1shGZFBWHqGmkY50OvLrqf8.png', 'active', 109, '2025-02-26 15:13:31', '2025-02-26 15:16:49'),
(305, 58, 'Futuredesk', 'Es una mesa de trabajo futurista diseñada para optimizar la productividad. Incorpora inteligencia artificial, un asistente virtual, control por voz y gestos, y una pantalla táctil para gestionar tareas y dispositivos', 'FUDE6', 3000, 0, '0fE7PoNL07ioTVw54ABgf05BJn7LdS9kTKlS5BzA.png', 'active', 95, '2025-02-26 15:13:35', '2025-02-26 15:13:35'),
(306, 59, 'Ambientador de Flor de Loto', 'Aporta un toque elegante y delicado con la flor de loto, un aroma floral suave que transforma tu baño en un santuario de tranquilidad.', 'NAOFDL', 9.5, 0, 'rlYkz6aDofaOVQzVqktVKtp8jANeY8dwF94sfcDZ.png', 'active', 101, '2025-02-26 15:14:00', '2025-02-26 16:03:48'),
(307, 58, 'Aura Vision', 'Gafas inteligentes ultra con pantalla de realidad aumentada para ver textos, recibir notificaciones y hacer traducciones instantáneas. Se sincronizan fácilmente con dispositivos iOS, Android y Apple.', '	AUVI4', 650, 0, 'TMjjuS83LVsBxdeFP2Na5saB3o0Qd4mWk2WqYuw2.png', 'active', 96, '2025-02-26 15:14:15', '2025-02-26 15:14:15'),
(308, 58, 'HeatChair ', 'Es una silla ergonómica inteligente con corrección de postura automática. Incorpora calefacción lumbar y función de masaje para el máximo confort. Diseño moderno con controles táctiles integrados en los apoyabrazos.', 'HECH8', 999.99, 0, 'WHgUvdS0GiCIdTcDcNeXpuuNTY2RER2sPlaE6Zef.png', 'active', 94, '2025-02-26 15:14:40', '2025-02-28 15:26:16'),
(309, 57, 'Coctel Delicatessen', '14 PIEZAS SALADAS Y 2 DULCES  (19,83€ por persona) MÍNIMO 10 PERSONAS  ', '34545757', 19.83, 0, 'frj8fXBEEQojbZCw2CFtFTiK3bAcexooVPF3VSX5.png', 'active', 110, '2025-02-26 15:14:43', '2025-02-26 15:30:28'),
(310, 30, '	Cascos antisoroll', 'Dispositius dissenyats per reduir l\'exposició a sorolls forts en entorns industrials. Ofereixen una atenuació acústica de fins a SNR 34dB per protegir l\'audició. Incorporen coixinets d\'escuma viscoelàstica per a més confort durant l\'ús prolongat.', 'CAL', 45.5, 0, 'sVu6ncMNa5TicJTpdxhGtUuiF7KI86ehn9XofRdx.jpg', 'active', 109, '2025-02-26 15:14:44', '2025-02-26 15:17:30'),
(311, 58, 'AIBUDS', 'sonido envolvente con diseño ligero de grafeno y fibra de carbono, y acabado que cambia de color con la luz.', 'AIBU11', 900, 0, 'BKfpLsae6AXzJIMkWJuQb4yW9dYGhB0ua4dyyfBt.jpg', 'active', 99, '2025-02-26 15:14:47', '2025-02-26 15:14:47'),
(312, 43, 'Hidrolimpiadora GHP 575X  Bosch ', 'Motor de 2.8 kW y presión de 75 bares, ideal para suciedad incrustada. Diseño compacto y robusto para trabajos exigentes. Lanza de alta presión para limpieza profunda. Cable de 5 m y manguera de 7.5 m para amplio alcance.', 'PR2', 669.9, 0, '1cBNsZ4DDO25Jzl0dIlt3boiUZLSjul6xatlvNnJ.jpg', 'active', 114, '2025-02-26 15:15:35', '2025-02-26 15:15:35'),
(313, 59, 'Ambientador de Lavanda', 'Disfruta de un ambiente calmante y sereno con el suave aroma de la lavanda, ideal para crear un oasis de relajación en tu baño.', 'NAOL', 9.5, 0, 'FEq6i2G1jBM2Aj6rrbbLGu1YBXx47C9Qn8mJuOS4.png', 'active', 101, '2025-02-26 15:16:04', '2025-02-26 16:03:55'),
(314, 44, 'AGUA PEPINO LIMON', '', 'PL040', 17, 0, 'HCPXlFiSk5vz3kKPSsH32reQxcv3I94usu8mA6c2.jpg', 'active', 84, '2025-02-26 15:16:04', '2025-02-26 15:16:04'),
(315, 30, '	Cascos de seguretat', 'Protegeixen el cap contra impactes en obres de construcció, fàbriques i zones d’alt risc. Fets amb materials resistents i amb ajust ergonòmic.', 'CDS', 15, 0, 'LK4dyWLH42sHGPgS9HoO6Wb3KSHgLspNP4LS66AA.png', 'active', 109, '2025-02-26 15:16:05', '2025-02-28 16:48:32'),
(316, 43, 'Rubbermaid Carro de Limpieza Microfibra', 'Facilita la separación de mopas sucias y limpias. Capacidad para dos cubos de desinfección. Dimensiones: 122,6 x 55,9 x 111,8 cm.', 'PR3', 770.5, 0, 'eRi3on1j87FLnM8y3zRxqYeEjWRFHGjsCRmCMNZ9.jpg', 'active', 114, '2025-02-26 15:16:12', '2025-02-26 15:16:13'),
(317, 30, 'Mono de treball', 'Dissenyats per oferir protecció contra brutícia, productes químics i altres riscos laborals. Utilitzats en fàbriques i tallers mecànics.', 'MDT', 45.5, 0, 'ddXLYIKDgU8b74cYEbklaFm2jCsRkvO0Ztg5LJvk.png', 'active', 107, '2025-02-26 15:16:20', '2025-02-26 15:16:20'),
(318, 44, 'AGUA LICHI Y COCO', NULL, 'LC040', 17, 0, '436zng66WkXfaKLFkDmoXevvYTTKQXgUL2zQdsVk.jpg', 'active', 84, '2025-02-26 15:16:29', '2025-02-26 15:16:29'),
(319, 58, 'TechLuxe Chair', 'Es una silla ergonómica con inteligencia artificial, diseñada para adaptarse a tu cuerpo y optimizar la comodidad. Incluye controles táctiles, iluminación LED personalizable y funciones avanzadas para uso profesional.', 'TECH9', 999.99, 0, 'dET2QNOljd61bTJrZe1HBAIMivUN5bDF5uvZuzZ8.png', 'active', 94, '2025-02-26 15:16:48', '2025-02-26 15:22:01'),
(320, 44, 'AGUA LIMON MENTA HIERBABUENA', NULL, 'LMH039', 17, 0, 'ic78fTG6BckbkChDgTc0GbsnTAPR2RJ3vV1aD9ST.jpg', 'active', 84, '2025-02-26 15:17:03', '2025-02-26 15:17:03'),
(321, 57, 'Coctel Mediterraneo', '16 PIEZAS SALADAS Y 3 DULCES  (21,03€ por persona) MÍNIMO 10 PERSONAS  ', '2838384', 21.03, 0, 'QXMSg2k16NgZDPlAXtiSJmODkxwhGouQ58gOl0HU.png', 'active', 110, '2025-02-26 15:17:13', '2025-02-26 15:31:00'),
(322, 44, 'FRESA Y KIWI', NULL, 'FK040', 17, 0, 'sbHSJCfQNPBKXqdHlIWY7bRGrXX2FIa2k1ObBaow.jpg', 'active', 84, '2025-02-26 15:17:24', '2025-02-26 15:17:24'),
(323, 30, '	Cinturo porta eines', 'Accessori ergonòmic dissenyat per transportar eines de manera pràctica i segura. Fabricat en cuir reforçat, ofereix durabilitat i resistència al desgast. Compta amb múltiples butxaques per organitzar tornavisos, martells i altres utensilis.', 'CPE', 30, 0, '8NH4OqMr0ijfj46ueWXj1Ttr7Z33HCTh4yMmehJg.jpg', 'active', 109, '2025-02-26 15:18:01', '2025-02-26 15:18:53'),
(324, 30, 'Pack EPI', 'Els pantalons, amb múltiples butxaques i reforços als genolls, ofereixen resistència i flexibilitat. La samarreta transpirable compta amb bandes reflectants per millorar la visibilitat.', 'PKEPI', 35.5, 0, 'GF2r3ZoAU85NBeLmgo13g2boOCfLQFMpGUakbqwI.jpg', 'active', 107, '2025-02-26 15:18:42', '2025-02-26 15:18:43'),
(325, 30, 'Guants de proteccio', 'Essencials per a la seguretat laboral en diferents sectors, com la construcció, la indústria química i la metal·lúrgia. Proporcionen comoditat, destresa i protecció contra riscos mecànics, tèrmics i químics.', 'GDP', 9.5, 0, 'lVD6x5Fm1xfvqjUsnWuWxzqHtPLjTqf5pPu6CbSf.png', 'active', 109, '2025-02-26 15:19:25', '2025-02-26 15:20:06'),
(326, 39, 'Fiambrera DOBLE', 'Perfecta para el día a día fuera de casa. Espectacular fiambrera doble hermética color negro.', 'REF001', 7.9, 0, 'kMzbeVgBJSnsoTnezD4jl3EqxlbKnml2PawnKdCZ.png', 'active', 116, '2025-02-26 15:19:30', '2025-02-26 15:19:30'),
(327, 44, 'MANGO PINA COCO', NULL, 'MPC040', 17, 0, 'BdDsiuu3DY54pO88xjPewwdfkFMEdSMZHPvH3sup.jpg', 'active', 84, '2025-02-26 15:19:41', '2025-02-26 15:19:41'),
(328, 30, 'Botes de seguretat', 'Calçat reforçat amb puntera d’acer o composite, dissenyat per protegir els peus d’impactes i perforacions en entorns laborals exigents.', 'BDS', 65.5, 0, 'n80YwIHzqh5SFeufI8kXCBbLSk7IHloMX1f9CpDO.jpg', 'active', 108, '2025-02-26 15:19:52', '2025-02-26 15:19:52'),
(329, 58, 'NEUROBEATS', 'Auriculares elegantes con acabados metálicos, cojines ergonómicos, sonido de alta fidelidad y controles táctiles.', 'NEBE10', 900, 0, 'jEQF4dObQKjNZQVsnB0ossMjNbNsK84q5bRdp61n.jpg', 'active', 99, '2025-02-26 15:19:57', '2025-02-26 15:19:57'),
(330, 44, 'MORAS ARANDANOS FRAMBUESAS CON LIMON', NULL, 'ML040', 17, 0, '0aB6AwzjBjZwL9mcK9awc7rHYQeyByCPp377xVaw.jpg', 'active', 84, '2025-02-26 15:20:03', '2025-02-26 15:20:03'),
(331, 30, 'Mascareta respiradors', 'Indispensables en entorns amb partícules en suspensió, vapors tòxics o agents contaminants. Utilitzats en la salut, la indústria química i la construcció.', 'MIR', 22.5, 0, 'dfEkVhMS26xtS3zCMGnevZLA9zngL3XgI92ko1A6.jpg', 'active', 109, '2025-02-26 15:20:24', '2025-02-26 15:21:33'),
(332, 44, 'MANZANA VERDE Y UVA VERDE', NULL, 'MU040', 17, 0, 'Njg7uv4h5sMtQz0VbXpE0w7TcXqR3ZJENrrv8hrQ.jpg', 'active', 84, '2025-02-26 15:20:25', '2025-02-26 15:20:25'),
(333, 44, 'POMELO ROSA Y GINSENG', NULL, 'PG040', 17, 0, 'nYYEHX5r0ip6xPvfP6YK12V82NefKU1QqmufjejJ.jpg', 'active', 84, '2025-02-26 15:20:44', '2025-02-26 15:20:44'),
(334, 44, 'NARANJA SANGUINA Y HIERBAS PROVENZALES', NULL, 'NH040', 17, 0, '6PSsEWtustTAsqcdkBsjEkA34kmkFCnMwzAgfzFt.jpg', 'active', 84, '2025-02-26 15:21:08', '2025-02-26 15:21:08'),
(335, 30, '	Ulleres de seguretat', 'Dissenyades per evitar lesions oculars causades per partícules voladores, esquitxos químics o radiació lluminosa. Ergonòmiques i resistents.', 'UDS', 12.5, 0, 'oRk10DThNvWvA6wLSrKp2B3oPCZyHvaXhxI7IR9D.png', 'active', 109, '2025-02-26 15:21:47', '2025-02-26 16:07:35'),
(336, 59, 'Ambientador de Vainilla', 'Envuelve tu baño en una atmósfera cálida y acogedora con el dulce aroma de la vainilla, perfecto para sentirte en casa.', 'NAOV', 9.5, 0, 'PLJCpMrrs0PCePIvVJGDCtjnbu70EbUcw3q9m1Ju.png', 'active', 101, '2025-02-26 15:21:48', '2025-02-26 16:04:03'),
(337, 58, 'Vision Edge', 'Las gafas Vision Edge combinan diseño moderno e IA avanzada con reconocimiento facial y asistencia personalizada, ofreciendo una experiencia única con una interfaz discreta y cómoda.', 'VIED4', 650, 0, 'UiTfNMMsNt83sdgipZ7NYpv8FGpEZPPKfefmHjsD.png', 'active', 96, '2025-02-26 15:22:10', '2025-02-26 15:22:10'),
(338, 26, 'Bolsa de papel personalizable', '5 UNIDADES', 'BOL', 1, 0, 'Pq6szb5Gc1h39mgqRS7yniMi8ofOfX4gDqCdADDM.png', 'active', 111, '2025-02-26 15:22:26', '2025-02-26 15:28:39'),
(339, 39, 'Taza termorreguladora', 'Taza corporativa termorreguladora. Mantiene el calor de su contenido hasta 4 horas. Color blanco.', 'REF002', 5, 0, 'nfEQFZGWcmaWwniVMN94PdXPmCifmXxYXdXx2dGR.png', 'active', 116, '2025-02-26 15:22:36', '2025-02-26 15:22:36'),
(340, 57, 'Lunch Bocados de Lujo', 'MÍNIMO 10 PERSONAS', '3445566', 22.23, 0, 'qw3SLglkHWgkf7e5WTO8L5vXcFvFJXO9P2ZxNPBU.png', 'active', 118, '2025-02-26 15:23:45', '2025-02-26 15:31:31'),
(341, 26, 'Bolsa de tela', '1 UNIDAD', 'TEL', 3.31, 0, 'UfM1LCjJvzXRk8uu4u9vSvO3hzARa5HQ8Q7HYDky.png', 'active', 111, '2025-02-26 15:24:32', '2025-02-26 15:28:45'),
(342, 39, 'Libreta ECO', 'Libreta de 100 hojas con portada compuesta de papel reciclado. ', 'REF003', 2, 0, 'RVgqtfOsZ4p5xtx5RtTm7jLexg6W13N82bpYI50B.png', 'active', 120, '2025-02-26 15:24:57', '2025-02-26 15:30:50'),
(343, 44, 'BARRITA DE CEREALES', NULL, 'BC017', 1.5, 0, 'TFHePP1njeSLWyaajiSzW3FLtyV8RmtFDSQ87XUI.jpg', 'active', 86, '2025-02-26 15:24:59', '2025-02-26 15:24:59'),
(344, 57, 'Lunch Sabores de Autor', 'MÍNIMO 10 PERSONAS', '3455667', 23.43, 0, 'V4Mx9cvG2BBVJrmq5PMT2xmC14cmbiOgibwyETpT.png', 'active', 118, '2025-02-26 15:27:14', '2025-02-26 15:32:07'),
(345, 59, 'Crema de manos para piel Grasa 1L', 'Nuestra Crema de Manos para Pieles Grasas hidrata regulando el exceso de sebo y manteniendo las manos suaves. Con aloe vera y extractos vegetales, ofrece un cuidado perfecto para pieles grasas, proporcionando hidratación ligera y control de brillo.', 'NCDMPG', 38, 0, '9ZO2BewQ4ad9D7n4Rpu71Z22it0fts2KSp9X36Ud.png', 'active', 97, '2025-02-26 15:27:37', '2025-02-26 16:04:24'),
(346, 44, 'BARRITA CHOCOLATE', 'Petita i deliciosa barreta amb xocolata amb llet, perfecta per a un caprici dolç i ràpid. La seva mida pràctica la fa ideal per portar amb tu a qualsevol lloc.', 'BC 027', 1, 0, '6rONodmIPJJRUsN2op1H53LSuhXEpaluePXfMeBc.png', 'active', 85, '2025-02-26 15:27:52', '2025-02-26 15:27:52'),
(347, 26, 'Cinta adhesiva de papel personalizable', '1 UNIDAD', 'CIP', 2.27, 0, 'xiL4oaRw8uxWD9qpHjoch0FIrQBb9fXX6z6dETqY.png', 'active', 111, '2025-02-26 15:28:24', '2025-02-26 15:28:24'),
(348, 44, 'BARRITA ENERGETICA', NULL, 'BE018', 2, 0, 'hXiCSHSRzWQg4tY57PsBJn6Nm3hvT5q4GEobkXkb.jpg', 'active', 86, '2025-02-26 15:29:00', '2025-02-26 15:29:00'),
(349, 57, 'Tapas Gourmet', 'Servilletas cocktail catering incluidas ', '3838472', 22, 0, 'XX8Fi9SUuLZ7ZYDW37xF5aE2hI8kK67AvVms7V6W.png', 'active', 119, '2025-02-26 15:29:21', '2025-02-26 15:32:35'),
(350, 26, 'Cajas doble canal reforzadas', '1 UNIDAD', 'CAJ', 1.65, 0, 'E0F5l0BDHsBLneq8rQTnw8Wgb6QAMkBXtupEyS3W.png', 'active', 112, '2025-02-26 15:29:29', '2025-02-26 15:29:29'),
(351, 44, 'CANA DE CHOCOLATE', 'Hojaldre tierno y esponjoso relleno de una irresistible crema de chocolate. Ideal para acompañar con café o disfrutar en cualquier momento del día.', 'CC 025', 1, 0, 'Dn2Wi85Z9iaon2V7OJQAHjFEUiReA0CufAKbabqF.png', 'active', 85, '2025-02-26 15:29:29', '2025-02-26 15:29:29'),
(352, 44, 'BATIDO PROTEICO', NULL, 'BP022', 1.35, 0, 'yctI4aYRDzAxj2JLnSbCsNwlATTIGFMGAwKFd8V3.webp', 'active', 86, '2025-02-26 15:30:22', '2025-02-26 15:30:22'),
(353, 39, 'Boligrafo ', 'Bolígrafo común. Color único.', 'REF004', 1.2, 0, 'B28fhHRrQc5lTJauVwxHlvtfJLfM85H8cQNLivU8.png', 'active', 120, '2025-02-26 15:32:01', '2025-02-26 15:32:01'),
(354, 44, 'BEBIDA A BASE DE CAFEINA', NULL, 'BC021', 2.25, 0, 'SVCeS9dehYQO3RJ67mUsTr1qGuOL5sQRcu8qDGSd.jpg', 'active', 86, '2025-02-26 15:32:09', '2025-02-26 15:32:09'),
(355, 44, 'COCACOLA', 'Refrescante y burbujeante, con su inconfundible sabor original. La bebida perfecta para acompañar cualquier snack o comida.', 'CO 032', 2.1, 0, '5a0EBaejWoHrvJZeB9leHZfSxCpwK7J68cq79YMa.png', 'active', 85, '2025-02-26 15:32:46', '2025-02-26 15:32:46'),
(356, 44, 'FRUTAS DESHIDRATADAS', NULL, 'FD019', 1, 0, '360uLOWToQsyQKGqx9ft3g3AX6gHLrJwXTcWhiJZ.jpg', 'active', 86, '2025-02-26 15:33:07', '2025-02-26 15:33:07'),
(357, 26, 'Cajas menores para envios', '2 UNIDADES', 'CEN', 1, 0, '5qYtcVeScRRokmiovRzvPgMDIuWuXdkMOwzzXNaU.png', 'active', 112, '2025-02-26 15:33:12', '2025-02-26 15:33:12'),
(358, 44, 'COCACOLA ZERO ', 'Todo el sabor de la clásica Coca-Cola, pero sin azúcar. Ideal para quienes buscan refrescarse sin renunciar al sabor original.', 'CZ 033', 2, 0, 'BXTxJG4G1HryAbDaICqS0iV6gL66m3hBQrxzgyUm.png', 'active', 85, '2025-02-26 15:33:33', '2025-02-26 15:33:33'),
(359, 44, 'CROISSANT', 'Clásico croissant de mantequilla, con su inconfundible textura esponjosa por dentro y ligeramente crujiente por fuera. Perfecto para un desayuno o snack rápido.', 'CR 025 ', 1.2, 0, '3LPDs5ISjtdfRPVCumHbiyYJu703y16erRC3kaym.png', 'active', 85, '2025-02-26 15:34:08', '2025-02-26 15:34:08'),
(360, 44, 'DONUTS', 'Suaves, esponjosos y con un glaseado irresistible. Este clásico de la bollería es perfecto para disfrutar en el desayuno o como un dulce tentempié.', 'DO 029 ', 2, 0, 'BAMlVlFCHfhdSbR9dEyShDm7LBdT55HFxWzaTvXJ.png', 'active', 85, '2025-02-26 15:34:42', '2025-02-26 15:34:42'),
(361, 44, 'FANTA ', 'Refresco afrutado y burbujeante con el inconfundible sabor de la naranja. Refrescante y lleno de sabor para cualquier momento del día.', 'FA 034 ', 1, 0, 'yE6Fb93lkRXj7AOZ592NvH4RE7mmX3mMVV7KQ3wF.png', 'active', 85, '2025-02-26 15:35:25', '2025-02-26 15:35:25'),
(362, 26, 'Cinta adhesiva de papel reforzado', '1 UNIDAD', 'CIN', 2.89, 0, 'Opw61NhQOuzj76CrG3S7Ekf5PMiY86Mtan4CdLpk.png', 'active', 121, '2025-02-26 15:35:34', '2025-02-26 15:35:34'),
(363, 44, 'FILIPINOS ', 'Deliciosos aros de galleta crujiente bañados en chocolate. Su combinación de texturas y su tamaño hacen que sean un snack perfecto para compartir o disfrutar solo.', 'FI 030 ', 1.25, 0, 'lLcQThcLvQaZDv1Z7VLHhtpHeQJ8ARbrp8yOsTi5.png', 'active', 85, '2025-02-26 15:36:05', '2025-02-26 15:36:05'),
(364, 44, 'KITKAT ', 'Cuatro crujientes barritas de galleta recubiertas de un suave chocolate con leche. Un snack clásico para disfrutar en cualquier momento con su característico \"¡tómate un respiro!\".', 'KK 026', 1, 0, '41Kbm8481RXlpzYwpEoHmT1sTHyScVVOUebzAs8o.png', 'active', 85, '2025-02-26 15:36:41', '2025-02-26 15:36:41'),
(365, 26, 'Palet de fibra de madera prensada', '1 UNIDAD', 'PAL', 8.26, 0, 'HwnpmtbzVEYlaK5LTUo5vLnAGHEYlTuwFPLyC09P.png', 'active', 113, '2025-02-26 15:37:26', '2025-02-26 15:37:26'),
(366, 44, 'FRUTOS SECOS VARIADOS', NULL, 'FS012', 1.5, 0, 'kmM491tpM2Ln6uHYwMvxZXpO4bd7zjbBWKcHv1YD.jpg', 'active', 86, '2025-02-26 15:37:50', '2025-02-26 15:37:50'),
(367, 26, 'Papel de burbujas sostenible', '4 UNIDADES', 'BUR', 1, 0, 'Mo3zQxueXkMkoNbttgS2g6xZqrDWciun39rENR6C.png', 'active', 115, '2025-02-26 15:38:26', '2025-02-26 15:38:26'),
(368, 44, 'FUZE TEA', NULL, 'FT020', 1, 0, 'tYKvMYwQwnEamDwIBj5V326dGeVOJ5GGlaG1VIDJ.jpg', 'active', 86, '2025-02-26 15:38:30', '2025-02-26 15:38:30'),
(369, 26, 'Virutas de papel', '1 Kg', 'VIR', 16.53, 0, 'UOkFGrk0uzynhpSPQw402aDfIhVfzYuk2uXInwX8.png', 'active', 115, '2025-02-26 15:39:16', '2025-02-26 15:39:16'),
(370, 44, 'PAN DE PIPAS', NULL, 'PP016', 1, 0, 'lAYtOP7ZtFMlB8NuhMY3LPyKmEz1PAW0Y4x1UQ6k.jpg', 'active', 86, '2025-02-26 15:39:16', '2025-02-26 15:39:16'),
(371, 44, 'PALITOS DE PAN', NULL, 'PP015', 1, 0, 'YRRY5ywl7lrcq7IzC2YXxldrJPrvur8FlQPzthwF.jpg', 'active', 86, '2025-02-26 15:40:14', '2025-02-26 15:40:14'),
(372, 44, 'OREOS ', 'Clásicas galletas de cacao con un relleno cremoso de vainilla. Un bocado dulce con un equilibrio perfecto entre crujiente y cremoso.', 'OR 031', 2.1, 0, '4PPlgyYQwGaqGytgHqlhjBzEOfrJTBckfw2MQ4BF.png', 'active', 85, '2025-02-26 15:40:16', '2025-02-26 15:40:16'),
(373, 44, 'ROLLL VEGETAL VEGANO', NULL, 'RV014', 2.4, 0, 'CB6EzFsLJlXRcQsZhyRd6J0EqjtAVctg1kVFItwd.jpg', 'active', 86, '2025-02-26 15:40:51', '2025-02-26 15:40:51'),
(374, 44, 'PALMERA CHOCOLATE', 'Deliciosa palmera de hojaldre crujiente cubierta con una generosa capa de chocolate. Disfruta de su sabor dulce y su textura ligera, sin aceite de palma, para una opción más consciente.', 'PC 024', 1, 0, 'u3JKZoWrowUhe9UfFKHc4w09i701Ktfpue4b7o5M.png', 'active', 85, '2025-02-26 15:41:18', '2025-02-26 15:41:18'),
(375, 44, 'SANWICH VEGETAL VEGANO', NULL, 'SV013', 2.5, 0, 'sifC5VC64wJujk1G7yyYRmLdXrxzNavEPs9osxf0.jpg', 'active', 86, '2025-02-26 15:42:29', '2025-02-26 15:42:29'),
(376, 44, 'ZUMOS', NULL, 'ZU023', 1, 0, 'lRqXSLbelCzm747Hy4Nwsot0GtZ26uvv8NLsoXeg.png', 'active', 86, '2025-02-26 15:42:55', '2025-02-26 15:42:55'),
(377, 44, 'PATATAS FRITAS', 'Crujientes y doradas patatas fritas, con el punto justo de sal. Un snack clásico para disfrutar solo o acompañado, ideal para calmar el antojo salado.', 'PF 028', 2.6, 0, 'MXhT9YcPOTrdZBcCEeSuC8xGJgomIX9TFISItnoG.png', 'active', 85, '2025-02-26 15:44:12', '2025-02-26 15:44:12'),
(378, 44, 'REDBULL ', 'Bebida energética diseñada para mantenerte activo y enfocado. Con cafeína y taurina, es ideal para esos momentos en los que necesitas un extra de energía.', 'RB 035', 2.25, 0, 'qdlm76ugSCA7K7butFjySnq5093kqPAfrMker8Yk.png', 'active', 85, '2025-02-26 15:47:11', '2025-02-26 15:47:11'),
(379, 59, 'Toallitas Humedas NATIVA Pack 10', 'Nuestras Toallitas Húmedas ofrecen una limpieza rápida y eficaz, dejando la piel fresca y cuidada. Suaves y resistentes, están formuladas para ser delicadas con la piel y aptas para el uso diario.', 'NTH', 15.8, 0, 'eC4esd67viLOBrANKJjHin6mFCjeM71jGak3gcfI.png', 'active', 105, '2025-02-26 15:50:54', '2025-02-26 16:15:06'),
(380, 59, 'Papel WC NATIVA 12 uds', 'Nuestro Papel de Baño Básico ofrece una textura suave y resistente para un uso diario cómodo y confiable. Con varias capas y gran absorción, garantiza una limpieza eficaz y delicada con la piel.', 'NPDB', 4.8, 0, 'dXwp8VjkhdPBBZsrQnkYMoYn4wz6fp48fNHu9N4z.png', 'active', 104, '2025-02-26 15:59:49', '2025-02-26 16:12:23'),
(381, 59, 'Crema de manos Basica hidratante 1L', 'Nuestra Crema de Manos Hidratante para todo tipo de pieles ofrece una hidratación esencial para el día a día, dejando las manos suaves, nutridas y protegidas. ', 'NCDMB', 38, 0, 'Av5dXIKgfsdddnSjP6cEKL8amuRAGzq6sySoxzhW.png', 'active', 97, '2025-02-26 16:00:23', '2025-02-26 16:05:25'),
(382, 44, 'Alquiler maquina de vending ', 'Alquiler de maquina de vending con pantalla interactiva que proporciona sugerencias.', 'MVD001', 100, 0, 'omkmMvAJ7qZL34ZoEvcVOFY0HAqkcKRwf7sysxsM.jpg', 'active', 122, '2025-02-26 16:01:27', '2025-02-26 16:05:29'),
(383, 44, 'Alquiler maquina agua Flavormatic ', 'Maquina dispensadora de agua con detección de huella dactilar para llevar un control junto con la aplicación gratuita de Flavormatic de la deshidratación de tus empleados', 'MVA001', 100, 0, 'Yhl1uh0nvTH1ad03grxEqibJANjb6IPCaWr8g4ZP.png', 'active', 122, '2025-02-26 16:04:46', '2025-02-26 16:04:46'),
(384, 59, 'Jabon de Manos Exfoliante', 'Renueva tu piel con nuestro jabón exfoliante, que limpia, suaviza e hidrata en cada lavado. Su fórmula vegana, con microgránulos naturales, elimina impurezas sin resecar, dejando tus manos frescas y suaves. ¡Cuidado diario con aroma y bienestar!', 'NJDME', 18.2, 0, 'JSd8Tt9TSnrlrMLBN3cNDCB8xoDa9ANtjGaICPJ6.png', 'active', 98, '2025-02-26 16:05:42', '2025-02-26 16:08:23'),
(385, 59, 'Jabon de Manos Hidratante', 'Limpia profundamente sin resecar, dejando la piel suave y nutrida. Enriquecido con aceites naturales, libre de parabenos y sulfatos, y con un aroma delicado. Además, su envase eco-friendly ayuda a reducir el impacto ambiental.', 'NJDMH', 16.5, 0, '60By6qLd1YOUbdZ8Rj5goBjD2Q5wtLYgG9U2tXJE.png', 'active', 98, '2025-02-26 16:07:29', '2025-02-26 16:07:29'),
(386, 59, 'Crema de Manos para Piel Madura', 'Nuestra Crema de Manos para Pieles Maduras hidrata profundamente, reafirma y regenera la piel gracias a su fórmula con aceites naturales, vitamina E y colágeno. Combatirá los signos del envejecimiento.', 'NCDMPM', 38, 0, 'ARVpZCpTLRYnX6aGeRXzsR0dmz7wkLk5nvQLhyJS.png', 'active', 97, '2025-02-26 16:07:53', '2025-02-26 16:07:53'),
(387, 59, 'Crema de Manos para Piel Seca', 'Nuestra Crema de Manos para Pieles Secas nutre y repara en profundidad, dejando las manos suaves y protegidas. Enriquecida con manteca de karité, glicerina y aceites naturales, proporciona hidratación duradera sin sensación pegajosa.', 'NCDMPS', 38, 0, 'j6aAMPsGkHqi2ROnNivPoDD0q2NPgz7WigXltW9w.png', 'active', 97, '2025-02-26 16:09:31', '2025-02-26 16:09:31'),
(388, 59, 'Cepillos de Dientes Biodegradables 5 uds', 'Cepillo de dientes de bambú eco-friendly con mango 100% biodegradable y cerdas suaves de origen vegetal. Libre de BPA, ofrece limpieza profunda y segura. Compostable, resistente y sostenible. Pack de 5 cepillos.', 'NCDB', 7, 0, 'tTF2inEMgCfKyE2HUls95jPQPFGhcLFi4M0fslXz.png', 'active', 102, '2025-02-26 16:10:20', '2025-02-26 16:11:49'),
(389, 42, 'Esfera NH35', 'Esfera NH35', '4936VA', 15, 0, 'G70UItk1Evjn6JT24FPEJI982nijThuaSlrt1zjK.png', 'active', 126, '2025-02-26 17:00:20', '2025-02-26 17:21:46'),
(390, 42, 'Funda', 'Funda para guardar las herramientas ', '0900HG', 40, 0, 'BCrOY6s82Zv23F4bLFGfKRb8Oj0dV9xoIMyXAQYC.png', 'active', 131, '2025-02-26 17:01:19', '2025-02-26 18:07:12'),
(391, 50, 'ESSENTIAL BOX', 'Ideal para empresas con pequeños equipos, que buscan una solución práctica y accesible para fomentar hábitos saludables entre sus empleados sin comprometer su presupuesto. ', 'FV001', 38.45, 0, '8L5THFYca3k8zryOM956ePDaraRZwFx80qKY6KT5.png', 'active', 133, '2025-02-26 17:02:16', '2025-02-26 17:09:44'),
(392, 50, 'GROVE BOX', 'El equilibrio perfecto entre cantidad y variedad. Perfecto para equipos medianos o trabajadores que desean disfrutar de una amplia selección de frutas y verduras frescas durante toda la semana.', 'FV002', 55.32, 0, 'p730bnZUKf2RqNdqDfOaoO3KfC7HdiVjlLsJur5S.png', 'active', 133, '2025-02-26 17:02:41', '2025-02-26 17:09:53'),
(393, 50, 'MAX BOX', 'Diseñado para grandes equipos numerosos que necesitan una provisión completa, permite ahorrar tiempo y dinero en compras semanales, optimizando recursos tanto personales como corporativos.', 'FV003', 90.47, 0, 'oSoyECqqgQXnZm7dbtAyquadhbXlccdq48Kf59XZ.png', 'active', 133, '2025-02-26 17:03:04', '2025-02-26 17:10:00'),
(394, 28, 'Cata de vino tinto ', ' 3 vinos tinto (+90 pts Guía Peñín), picos de pan gourmet, juego de cartas temático, posavasos y guía de cata. Calidad, diversión y sabor en cada detalle. ¡El regalo perfecto para amantes del vino!', 'CT1', 79.99, 0, 'dbGSHqjE5Aff3z3uwxKH2FkqTPFVVt3fGeU1ghux.png', 'active', 135, '2025-02-26 17:10:10', '2025-02-26 17:38:05'),
(395, 45, 'Vapanda digital 28000', '10 unidades de 28.000 puffs CARACTERÍSTICAS: • eLiquid: 36ml • LCD, batería y líquido • Resistencia doble MODOS: • Boost Mode • Eco Mode Niveles de nicotina: • 20mg / 50mg', 'vap28000', 95, 0, '18TYMbihIi8sQHMWpx28c7ZNQUfCLESE7L7YqCes.png', 'active', 134, '2025-02-26 17:12:11', '2025-02-26 17:27:08'),
(396, 45, 'Vapeex 30000', '10 unidades de 30.000 puffs CARACTERÍSTICAS -eLiquid: 36ml -LCD, batería y liquido - Resistencia doble - Modos: - Eco Mode - Plus Mode - Pro mode - Max mode - Pantalla con temporizador de tiempo de calada - Niveles de nicotina: 20mg / 50mg', 'vap30000', 95, 0, 'JAYz1gfZyXbMOCLDf5bgHoJYA5zCiv7LEWDN3HrH.png', 'active', 134, '2025-02-26 17:12:15', '2025-02-26 17:15:08'),
(397, 28, 'Cata de vino blanco', '3 vinos (+90 pts Guía Peñín), picos de pan artesanos, juego temático, posavasos y guía de cata. Frescura, sofisticación y diversión en cada copa. ¡El regalo perfecto para amantes del vino blanco!', 'CB1', 79.99, 0, 'CrM7E5PXCWlqcbnJ3pmwxxKWC8lskxKcOnTIUOfR.png', 'active', 135, '2025-02-26 17:12:45', '2025-02-26 17:37:59'),
(398, 28, 'Cata de cervezas artesanales ', '4 cervezas artesanales de distintos estilos, snack maridaje, juego temático, posavasos y guía de cata. Sabor, diversión y calidad en cada sorbo. ¡El plan ideal para amantes de la cerveza artesanal!', 'CCA1', 79.99, 0, 'N9U9O7N5hmViukPsUnOSHsiw7SxSOlAk3XOBZPJq.png', 'active', 135, '2025-02-26 17:14:12', '2025-02-26 17:37:53'),
(399, 42, 'Esfera NH38', 'Esfera NH38', '4733RG', 15, 0, 'binSUWd97czebB2m00tqE2HeFnBtMoZRCaX8le3q.png', 'active', 126, '2025-02-26 17:14:43', '2025-02-26 17:45:04'),
(400, 45, 'Vapanda Sisha 20000', '10 unidades de 20.000 puffs CARACTERÍSTICAS -eLiquid: 29ml - LCD, batería y líquido - Modos: - Boost mode: 20000 puffs - Niveles de nicotina: 20mg / 50mg', 'sisha20000', 90, 0, 'DOC4D03eGAZroeM6K4zrpSfLOvFbDqrIM4XD2Cjo.png', 'active', 134, '2025-02-26 17:15:52', '2025-02-26 17:27:01'),
(401, 45, 'Vapers savage stars 20000', '10 unidades de 20.000 puffs CARACTERÍSTICAS -eLiquid: 26ml -LCD, batería y liquido - Resistencia doble - Modos: - Eco Mode - Plus Mode - Pro mode - Max mode - Pantalla con temporizador de tiempo de calada - Niveles de nicotina: 20mg / 50mg', 'vap20000', 90, 0, 'ZBvCpunyjoqKnE75HBtMRsGXXKnNN5Yc5eL3cR4n.png', 'active', 134, '2025-02-26 17:22:51', '2025-02-26 17:26:52'),
(402, 42, 'Esfera NH70', 'Esfera NH70', '7495KJ', 15, 0, 'n3o2gBDleuPWpyrXesPlrI42zjIkG3eyDnqbxdE6.png', 'active', 126, '2025-02-26 17:23:05', '2025-02-26 17:46:04'),
(403, 42, 'Correa Datejust President', 'Correa Plata/Oro/Oro rosa', '8490WW', 50, 0, NULL, 'active', 127, '2025-02-26 17:25:49', '2025-02-26 17:25:49'),
(404, 42, 'Correa Datejust 5p', 'Correa Datejust Plata/Oro/Oro rosa', '7739LO', 50, 0, NULL, 'active', 127, '2025-02-26 17:27:54', '2025-02-26 17:27:54'),
(405, 42, 'Correa Datejust 3p', 'Correa Datejust Plata/Oro/Oro rosa', '4009OL', 50, 0, NULL, 'active', 127, '2025-02-26 17:28:35', '2025-02-26 17:28:35'),
(406, 28, 'Preparado Sex on the Beach', 'Sex on the Beach con nuestra caja de coctelería: vodka premium, licor de melocotón, zumos de naranja y arándano, shaker, vasos personalizados y medidas exactas. ¡Frescura y diversión en cada sorbo, sin desperdicios!', 'PSOTB1', 59.99, 0, 'vi1MGHY9vv76gmMqCJhP1omujpIqQEMTBVNb9mtV.png', 'active', 136, '2025-02-26 17:30:19', '2025-02-26 17:37:45'),
(407, 42, 'Agujas', 'Agujas ', '9080PÑ', 10, 0, 'Dxo1L309oit0ys1B1saVdNrS1PDJWvbqJ4or7C9B.png', 'active', 128, '2025-02-26 17:30:21', '2025-02-26 18:03:43'),
(408, 28, 'Preparado Negroni', 'Negroni con nuestra caja de coctelería: gin Seagram’s, vermut rojo, Campari, rodaja de naranja, shaker y vasos personalizados. Proporciones perfectas para un cóctel clásico, sin complicaciones ni desperdicios. ¡Sofisticación en cada sorbo!', 'PN1', 59.99, 0, 'eNLZrRZJfYsvuU117UCA17bX5BjjgxDwBNUUaDZc.png', 'active', 136, '2025-02-26 17:32:02', '2025-02-26 17:37:33'),
(409, 32, 'Anota tus ahorros y logros', 'Lleva tus apuntes al siguiente nivel con el cuaderno oficial de SAFER. Anota ideas, finanzas y apuntes del cursos. ', 'SAF-NTB-2402', 4.99, 0, '5QyV3ZHUwxsN3xlz9xEqcd19OQovWrq2qCuZHZht.jpg', 'active', 123, '2025-02-26 17:32:03', '2025-02-26 17:32:03'),
(410, 28, 'Preparado Espresso Martini', 'Espresso Martini con nuestra caja de coctelería: vodka premium, licor de café, azúcar líquido, café arábica, shaker y vasos personalizados. Ingredientes exactos para un cóctel intenso y sofisticado. ¡Puro carácter en cada sorbo!', 'PEM1', 59.99, 0, '1kZEqQ5raS8MzlJ9W2vaxRqBThMxZh9imbYso2F6.png', 'active', 136, '2025-02-26 17:33:21', '2025-02-26 17:37:25'),
(411, 54, 'El pack que lo parte SUPER CHILL 6prod ', 'Contenido: Anillos + Pines a elegir Packaging personalizado - Caja color negro - Papeles plateados - Bolsa de tela - Cajita para la joya de terciopelo en negro - Tarjeta Astraléa + QR de la web', 'Pack001', 130, 0, 'TNrwQkebeyab6Wn4QopmI6PplBzlVHoZoRb2K4t4.png', 'active', 138, '2025-02-26 17:39:25', '2025-02-26 17:45:55'),
(412, 51, 'Limpiador Multisuperficies Starter Set', 'Nuestro Limpiador Multisuperficies es reutilizable y eficaz contra grasa y suciedad. Solo llénelo con agua, añada una pastilla y listo. Ingredientes seguros, ideales para superficies donde se manipulan alimentos. Cada pastilla rinde una botella completa.', 'LM01', 12, 0, 'GtMPRPs4jWL49h1IoAiq05tF93xBzWAcNBrv50Sr.jpg', 'active', 137, '2025-02-26 17:40:10', '2025-02-26 17:40:10'),
(413, 54, 'El pack que lo parte CHILL Min 12prod', 'Contenido: Collares + Pendientes a elegir Packaging personalizado - Caja color plata - Papeles negros - Bolsa de tela - Cajitas de terciopelo en negro para las joyas - Tarjeta Astraléa + QR de la web - Mensaje personalizado en la parte superior de la caja', 'Pack002', 230, 0, 'dcn4wbxXVPNCVMi3xm4K6fICr7b716UoNZuMGNgi.png', 'active', 138, '2025-02-26 17:45:11', '2025-02-26 17:45:12'),
(414, 51, 'Set basico de limpiador de lavabo', 'Desde la bañera hasta los azulejos, los ingredientes de origen vegetal y respetuosos con el planeta trabajan para eliminar los restos de jabón y la suciedad sin productos químicos agresivos. Simplemente llénelo con agua, coloque una tableta y ¡listo!', 'LB01', 12, 0, 'FMuGKomPcW3CuOqCeED0gjjqvCcRg1virXAN4r5d.png', 'active', 137, '2025-02-26 17:46:38', '2025-02-26 17:46:38'),
(415, 42, 'Agujas flecha', 'Agujas NH35', '0976HG', 12, 0, 'Vld13XoVOnyKq9BK2YsVAp74mK840tKpJ7oNFgZy.png', 'active', 128, '2025-02-26 17:48:30', '2025-02-26 18:03:58'),
(416, 51, 'Set basico de limpiador de cristales', 'Nuestro limpiador de vidrios y espejos deja sus ventanas y superficies cristalinas sin químicos ni ingredientes agresivos. Simplemente llénelo con agua, coloque una tableta y ¡listo! Tu reflejo nunca se ha visto mejor.', 'LC01', 12, 0, 'UjjyXEuXmihc69oM93U4Ep1P0TKi8PH622xAEI2S.png', 'active', 137, '2025-02-26 17:48:54', '2025-02-26 17:48:54'),
(417, 42, 'Sistema', 'Sistema NH35', '1378JH', 50, 0, 'Vgj62ZUoZY9NtARrYHaS1IamsxBNpOmXEzzgt5UU.png', 'active', 129, '2025-02-26 17:50:31', '2025-02-26 18:04:20'),
(418, 54, 'Pack que lo parte QUE FLIPAS Min20 prod', 'Pack min 20u de pendientes, collares, anillos, o pines, packaging personalizable + trajeta personalizada y espejo incluido.', 'Pack003', 430, 0, 'voEUW00JrkjyduuglTBmUvB4RCm7kCRzUpbUeU3h.png', 'active', 138, '2025-02-26 17:53:32', '2025-02-26 17:55:54'),
(419, 42, 'Kit herramientas ', 'Kit para montar el reloj', '9835MJ', 50, 0, 'FVfsFdmD8C4TiYjrGnjyNXm7lx63P54nEpzXbGxO.png', 'active', 130, '2025-02-26 18:02:15', '2025-02-26 18:02:15'),
(420, 32, 'No me lo robes que estoy ahorrando', 'Dale a tu móvil la seguridad que le darías a tus ahorros. Con diseño exclusivo, material resistente y ajuste perfecto, es el accesorio ideal para cualquier futuro millonario. Protege tu móvil con estilo y no dejes que tu dinero vuele. ', 'SAF-FUN-2403', 2.99, 0, '5M587nZlzWrugjKJsSfDMFOA3xBrve7KDVDmaQoZ.png', 'active', 125, '2025-02-26 18:05:51', '2025-02-26 18:05:51'),
(421, 42, 'Estuche', 'Estuche para guardar relojes', '0900HH', 30, 0, 'cSvSrrUobQFR4apkEwaT9axeSUUKpO5r6KL09Aga.png', 'active', 132, '2025-02-26 18:10:23', '2025-02-26 18:10:23'),
(422, 51, 'Kit Clean Suite', 'Clean Suite lo tiene todo: productos esenciales para limpiar tu hogar y cuidar el planeta, sin residuos plásticos. Incluye tus favoritos de Glow in the Mud en un solo kit, ahora con pastillas limpiadoras de inodoros y jabón en polvo para vajilla.', 'SK01', 78, 0, 'npUKcU8dnnv2rM6llRwUgefjhJ0MnoOdHt5WjmHV.png', 'active', 137, '2025-02-26 18:11:09', '2025-02-26 18:11:09'),
(423, 53, 'Ramo de 50 Rosas ', 'Ramo de 50 rosas eternas, mariposas y corona', 'RR50', 120, 0, 'wb7nXO9AsFuTbBx98BnT9YvIGD9YYeBAX1KXxgOH.jpg', 'active', 139, '2025-02-26 18:11:10', '2025-02-26 18:11:10'),
(424, 32, 'Mas cool que tu cuenta bancaria', 'Luce tu mentalidad financiera con la camiseta oficial de SAFER. Cómoda, estilosa y con diseño exclusivo, perfecta para los que ahorran sin perder el flow. Tejido suave y transpirable, disponible en varias tallas. ', 'SAF-TSH-2504', 12.99, 0, '2VEIcnniFuhUmlr0K6qP50JdfbtbLClrzLarPY9H.png', 'active', 124, '2025-02-26 18:14:03', '2025-02-26 18:14:03'),
(425, 32, 'Suma resta y no te arruines', 'Haz que tus finanzas cuadren con la calculadora oficial de SAFER. Perfecta para sumar ahorros, restar gastos y evitar dramas financieros. Diseño compacto, fácil de usar y siempre lista para que no te fundas la pasta sin darte cuenta.', 'SAF-CAL-2505', 14.95, 0, '6hakk1ifIn8FuyHzVj7ytAyFeWrWxiPqfSsPF9sM.png', 'active', 125, '2025-02-26 18:22:45', '2025-02-26 18:22:45'),
(426, 53, 'Ramo de 15 rosas y Corona', 'Ramo de rosas eternas con una Corona Grande', 'R15C', 60, 0, 'QsihfDthI8lPW1ZMu5DKIFt7ohNDqwctsIZfFLYj.jpg', 'active', 139, '2025-02-27 14:32:27', '2025-02-27 14:32:27'),
(427, 53, 'Ramo de rosas en forma de Corazon', 'Ramo de rosas eternas en forma de corazón', 'RC002', 75, 0, '1CQp4chuIHY8qDzmQXcSC64GTrs7iLyoEws1kCQ2.jpg', 'active', 139, '2025-02-27 14:36:45', '2025-02-27 14:36:45'),
(428, 53, 'Ramo multicolor eternas variedad', 'Ramo de rosas eternas de diferentes colores y tipo', 'RM011', 65, 0, 'TEge5dpojrOxcjx7Ox4zS2rqSUJI41ADhYaXgtcD.jpg', 'active', 139, '2025-02-27 14:39:41', '2025-02-27 14:39:41'),
(429, 53, 'Ramo de rosas y peluche', 'Ramo de rosas eternas con peluche a personalizar', 'RP035', 49, 0, 'oCCvIRJ9NX0WvE2zWsWq4EOkVChXANcO0gN3Z8qf.png', 'active', 139, '2025-02-27 14:41:23', '2025-02-27 14:41:23'),
(430, 53, 'Caja de Rosas con Regalo', 'Caja de rosas eternas y regalo personalizable.', 'CR02', 50, 0, 'VnpTw4gV2Nt9CNTv2eQhE70B3hgpfZuKUoLdOejL.jpg', 'active', 140, '2025-02-27 14:45:11', '2025-02-27 14:45:11'),
(431, 53, 'Maquina de corte de Cinta', 'Maquina automatica de corte de cinta', 'MC01', 150, 0, 'H677PQSoE5oP0jA7AW8t11Ydhn4CTmZDwUHUtczQ.jpg', 'active', 141, '2025-02-27 14:46:24', '2025-02-27 14:46:24');
INSERT INTO `products` (`id`, `company_id`, `label`, `description`, `reference`, `price`, `stock`, `image`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(432, 53, 'Cricut Maker 02 ', 'Maquina de personalización', 'R030', 199, 0, 'mHTlENmXgqSwFMGSlAiSycFZPpMOiBYW46KvvtKq.jpg', 'active', 141, '2025-02-27 14:47:06', '2025-02-27 14:47:06'),
(433, 51, 'Recambios de pastillas multisuperficies', 'Reduce, reutiliza y rellena con nuestras pastillas de repuesto para superficies múltiples. Nuestras pastillas sin plástico son muy eficaces y no contienen productos químicos agresivos.', 'RLM01(4u)', 10, 0, 'VS6eu4q8RdfL0IOZ5IbPOE2POsHixjYJOkngAS7l.webp', 'active', 137, '2025-02-27 17:11:03', '2025-02-27 17:11:03'),
(434, 51, 'Recambios de pastillas para el lavabo', 'Reduce, reutiliza y rellena con nuestras pastillas de repuesto para el baño. Convierte el lugar más sucio de la casa en el más limpio sin ninguno de los ingredientes agresivos.', 'LB01(4u)', 10, 0, 'RnK9OMKhbDUoccTlVmnr30GfcTY39slYZyJdYzpt.webp', 'active', 137, '2025-02-27 17:13:59', '2025-02-27 17:13:59'),
(435, 60, 'Camiseta  pantalon  michetas', 'basico', '111', 40, 0, NULL, 'active', 142, '2025-02-27 21:30:29', '2025-02-27 21:31:20'),
(436, 60, 'Camiseta pantalon michetas pelota', 'MEDIO', '222', 60, 0, NULL, 'active', 142, '2025-02-27 21:32:08', '2025-02-27 21:32:08'),
(437, 60, 'Camiseta pantalon michetas botas pelota ', 'ALTO', '333', 100, 0, NULL, 'active', 142, '2025-02-27 21:37:06', '2025-02-27 21:37:13'),
(438, 60, 'SESION 1H CON PROFESSIONAL', 'Queremos que la gente pueda tener la oportunidad de tener la ayuda de profesionales y queremos ofrecer el servicio de poder contactar con una persona experimentada.', '444', 30, 0, NULL, 'active', 144, '2025-02-27 21:38:20', '2025-02-27 22:14:59'),
(439, 60, 'SESION 2H CON PROFESSIONAL', 'Queremos que la gente pueda tener la oportunidad de tener la ayuda de profesionales y queremos ofrecer el servicio de poder contactar con una persona experimentada.', '555', 55, 0, NULL, 'active', 144, '2025-02-27 21:41:23', '2025-02-27 22:16:49'),
(440, 60, 'SESION 3H CON PROFESSIONAL', 'Queremos que la gente pueda tener la oportunidad de tener la ayuda de profesionales y queremos ofrecer el servicio de poder contactar con una persona experimentada.', '666', 80, 0, NULL, 'active', 144, '2025-02-27 21:50:48', '2025-02-27 22:16:55'),
(441, 60, 'SESION GRUPALES CON PROFESSIONALES 1H ', 'Además de las sesiones personales, queremos ofrecer sesiones grupales dónde podamos fomentar la relación de los compañeros de trabajo a través del deporte. Serían sesiones que ayudasen en los diferentes tipos de empresa con los deportes solicitados.', '777', 60, 0, NULL, 'active', 145, '2025-02-27 22:19:03', '2025-02-27 22:20:08'),
(442, 60, 'SESION GRUPALES CON PROFESSIONALES 2H ', 'Además de las sesiones personales, queremos ofrecer sesiones grupales dónde podamos fomentar la relación de los compañeros de trabajo a través del deporte. Serían sesiones que ayudasen en los diferentes tipos de empresa con los deportes solicitados.', '888', 100, 0, NULL, 'active', 145, '2025-02-27 22:19:39', '2025-02-27 22:21:39'),
(443, 60, 'SESION GRUPALES CON PROFESSIONALES 3H', 'Además de las sesiones personales, queremos ofrecer sesiones grupales dónde podamos fomentar la relación de los compañeros de trabajo a través del deporte. Serían sesiones que ayudasen en los diferentes tipos de empresa con los deportes solicitados.', '999', 130, 0, NULL, 'active', 145, '2025-02-27 22:21:33', '2025-02-27 22:21:33'),
(444, 51, 'Recambio de pastillas limpiacristales', 'Cada tableta contiene 24oz de nuestro poderoso limpiador en aerosol sin aroma para Vidrios y Espejos. Para usarlo, simplemente llene su Forever Bottle con agua, coloque una tableta y comience a limpiar.', 'RLC01(4u)', 10, 0, 'QkrAAExbeLMoAx9PFKMvIklsk6V8zjBM2torKudZ.png', 'active', 137, '2025-02-28 13:15:00', '2025-02-28 13:15:00'),
(445, 39, 'Bolsa ecologica', 'Bolsa de material reciclado.', 'REF005', 1, 0, 'mafCj0uQ0KBlCSWIKYlkHgegjrHRORDKqxQso82J.jpg', 'active', 116, '2025-02-28 15:26:16', '2025-02-28 15:26:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `label` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `product_categories`
--

INSERT INTO `product_categories` (`id`, `company_id`, `label`) VALUES
(11, 3, 'Organización eventos'),
(12, 3, 'Alquiler productos'),
(13, 4, 'MOBILIARIO ECOLOGICO'),
(14, 4, 'DISEÑO DE INTERIORES'),
(17, 5, 'Mobiliario'),
(18, 5, 'Teléfonos reacondicionados'),
(19, 5, 'Mobiliario reacondicionado'),
(20, 6, 'LLOGUER DE MÀQUINES '),
(21, 6, 'VENTA DE MÀQUINES'),
(22, 6, 'VENDA DE PRODUCTES'),
(23, 8, 'Productos Innovadores'),
(24, 5, 'Móviles'),
(25, 8, 'Productos Clasicos'),
(27, 7, 'Vehículos particulares'),
(29, 7, 'Vehículos empresa'),
(32, 10, 'Servicios informáticos'),
(33, 10, 'Productos informáticos reacondicionados'),
(34, 5, 'Servicio personalizable'),
(35, 19, 'Sensores'),
(36, 19, 'Cámaras'),
(37, 19, 'Alarmas'),
(38, 19, 'Ciberseguridad'),
(39, 19, 'Servicios'),
(40, 22, 'Merchandising para empresas'),
(41, 23, 'Toyota'),
(42, 23, 'Nissan'),
(43, 23, 'Kia'),
(44, 23, 'Hyundai'),
(45, 23, 'Honda'),
(46, 11, 'Suscripciones'),
(47, 11, 'Proyectores'),
(48, 11, 'Ordenadores'),
(49, 11, 'Hardware'),
(50, 10, 'Productos Nuevos'),
(51, 9, 'ROPA FemFesta'),
(52, 9, 'Complementos FemFesta'),
(53, 10, 'Suscripciones'),
(54, 1, 'Telefonía'),
(55, 1, 'Móvil'),
(56, 24, 'Màrketing Content'),
(57, 14, 'Servicio mecánico'),
(58, 12, 'Periféricos '),
(59, 5, 'Ordenadores'),
(60, 5, 'Accesorios'),
(61, 3, 'Personalizables'),
(62, 25, 'Máquinas'),
(63, 25, 'Material'),
(64, 16, 'Articulos innovadores'),
(65, 16, 'Articulos tradicionales'),
(66, 5, 'Accesorios reacondicionados'),
(67, 13, 'Servicio Básico'),
(68, 13, 'Servicio Premium'),
(69, 15, 'Montana'),
(70, 17, 'Cafetería'),
(71, 20, 'YOGA'),
(72, 20, 'PILATES'),
(73, 20, 'HIPOPRESIVOS'),
(74, 21, 'Cursos'),
(75, 21, 'Team Building'),
(76, 21, 'Sesiones teóricas/consultorias'),
(77, 3, 'Salas preparadas'),
(78, 2, 'Relojes'),
(79, 27, 'Sanitario'),
(80, 38, 'Tech'),
(81, 38, 'Media'),
(82, 52, 'Portatil'),
(83, 52, 'Accesorios'),
(84, 44, 'AGUAS'),
(85, 44, 'VENDIG DULCES'),
(86, 44, 'VENDING SALUDABLE'),
(87, 56, 'ROPA'),
(88, 29, 'Ropa'),
(89, 49, 'Productos'),
(90, 55, 'RATONES'),
(91, 55, 'ALFOMBRILLA'),
(92, 49, 'Subscripciones'),
(93, 55, 'TECLADOS'),
(94, 58, 'Asiento Inteligente'),
(95, 58, 'Mesa Inteligente'),
(96, 58, 'Gafas Inteligentes'),
(97, 59, 'Cremas'),
(98, 59, 'Jabones'),
(99, 58, 'Auriculares AI'),
(100, 44, 'AGUA'),
(101, 59, 'Ambientadores'),
(102, 59, 'Cepillos'),
(103, 59, 'Dispensadores'),
(104, 59, 'Papel de baño'),
(105, 59, 'Toallitas'),
(106, 30, 'ROPA'),
(107, 30, 'ROBA'),
(108, 30, 'CALÇAT'),
(109, 30, 'ACCESSORIS'),
(110, 57, 'Cócteles'),
(111, 26, 'Personalizable'),
(112, 26, 'Cajas'),
(113, 26, 'Palets'),
(114, 43, 'LIMPIEZA'),
(115, 26, 'Relleno'),
(116, 39, 'Útiles para el día a día'),
(117, 39, 'Para la ofina'),
(118, 57, 'Lunch'),
(119, 57, 'Pica pica'),
(120, 39, 'Para la oficina'),
(121, 26, 'Cintas'),
(122, 44, 'Maquinas vending'),
(123, 32, 'Papelería'),
(124, 32, 'Textil'),
(125, 32, 'Accesorios'),
(126, 42, 'Esferas'),
(127, 42, 'Correas'),
(128, 42, 'Agujas'),
(129, 42, 'Sistemas'),
(130, 42, 'Herramientas'),
(131, 42, 'Fundas'),
(132, 42, 'Estuches'),
(133, 50, 'FRUTAS Y VERDURAS'),
(134, 45, 'Vapers'),
(135, 28, 'Catas'),
(136, 28, 'Cocktails '),
(137, 51, 'Productos de limpieza'),
(138, 54, 'Packs'),
(139, 53, 'Ramo de Flores'),
(140, 53, 'Cajas de Regalo'),
(141, 53, 'Materiales'),
(142, 60, 'ROPA'),
(143, 60, 'ROPA + SESION PROFESSIONAL'),
(144, 60, 'SESION PROFESSIONAL'),
(145, 60, 'SESIONES GRUPALES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(10, 'Administrador', '2023-10-25 14:44:19', '2023-10-25 14:44:19'),
(11, 'Profesor', NULL, NULL),
(12, 'Estudiante', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `current_company` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `profile_url` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `center_id`, `current_company`, `status`, `profile_url`, `created_at`, `updated_at`) VALUES
(12, 'Administrador', 'xaviermorcam@campus.monlau.com', '$2y$10$ogS5OpmfwVZnvtx1/274Tet87sN6qFLyO2Oeiq7kzU8XVU4iT1Bt2', 10, NULL, NULL, 'active', 'Hqyx4VwYcpGxICd6E7RNpk9CVeUG7RHxqQOwEt1D.png', '2023-10-25 14:44:19', '2023-11-30 15:30:58'),
(16, 'Xavier Morell', 'xavimorellcampos@gmail.com', '$2y$10$Bqzm/aCfh.hmiPCoKFPu2uExNRhngYDzt969DnyBTn84aIJfqTC3u', 11, 2, 26, 'active', 'DXm0vuvCx8FyH7TX4AOxIKW6IyumfVl4F0i85inU.jpg', '2023-11-09 15:31:04', '2025-02-26 09:57:50'),
(17, 'Javier Salvador', 'jsalvador@monlau.com', '$2y$10$4K6wPCcM9fLlAiTA6t6S9u7tlD1uvPhuaslmooFxC/5lCQbsmZo12', 12, 2, 3, 'active', 'eV98gHY2cCd3boMZsOXSyaSxEqxIrNcnHepMoU3B.png', '2023-11-20 15:52:14', '2025-05-27 19:23:50'),
(21, 'Alba Ferré', 'ferrea@monlau.com', '$2y$10$4Ic91VoJNe9uS8XzUHPaZ.mlcITPTCBRy3X2dEbwnQdwMg3viFzem', 11, 2, 26, 'active', 'OftHfgX8lIIfJn9lRs0HhCblZgNUGZyk8dsGWM5S.jpg', '2024-01-11 15:35:24', '2025-03-26 09:44:44'),
(22, 'Test Admin ', 'mancar@monlau.com', '$2y$10$4Ic91VoJNe9uS8XzUHPaZ.mlcITPTCBRy3X2dEbwnQdwMg3viFzem', 10, 2, 25, 'active', NULL, '2024-01-11 15:37:32', '2026-01-14 17:51:31'),
(27, 'Elena de la Mota', 'delamotae@monlau.com', '$2y$10$s/fgqMVyrIf4RVfWGnSope4NkYHximniSURS5mCGRDPblMX3WQEQe', 11, 2, 8, 'active', NULL, '2024-01-31 18:07:52', '2024-02-19 14:34:30'),
(28, 'Marta', 'martagontor@campus.monlau.com', '$2y$10$nHcIyiPiEDaf7SoZmo4aQ.D5Kn0VQYAmlhRPh81xziNZF0ULAfLvG', 12, 2, 3, 'active', NULL, '2024-01-31 18:08:39', '2024-06-08 12:07:42'),
(31, 'Javier Villena Galán', 'javiervilgal@campus.monlau.com', '$2y$10$h4fiaY0VgZRXDatWtJccm.EeX5G4rGL0FEnvG1dqhAMKqbe.S0WNe', 12, 2, 3, 'active', NULL, '2024-01-31 18:12:46', '2024-05-20 11:44:55'),
(32, 'Leonardo Ribera Ibáñez', 'leonardoribiba@campus.monlau.com', '$2y$10$zynGjrsZNvnrvEUnTDKkI.tGvwYdZ.tEkh9AyTUouE5pasEk1hvUa', 12, 2, 7, 'active', NULL, '2024-01-31 18:13:29', '2024-06-09 19:21:22'),
(33, 'Daniel Ibañez', 'danielibamon@campus.monlau.com', '$2y$10$udzzj5hiNvRKI1CIh0K5Eengj/VOyC14Ck8N3Cpb6EDO0OoLRSef.', 12, 2, 6, 'active', NULL, '2024-01-31 18:19:22', '2024-04-08 13:37:55'),
(35, 'Pol Garcia Gomez', 'polgargom@campus.monlau.com', '$2y$10$MOzO72wHdc6dKN6GWfCTKOVB2J8Od4FdIh5CmYdSSqvOFsVnNTzM.', 12, 2, 5, 'active', NULL, '2024-01-31 18:19:36', '2024-05-22 09:44:51'),
(36, 'Marc Redondo Garcia', 'marcredgar@campus.monlau.com', '$2y$10$x2LleyIckbN8SzdltLn./ukonNu/V4FCaaRoJsfmfesx2z5sMa0Em', 12, 2, 8, 'active', NULL, '2024-01-31 18:19:54', '2024-04-17 15:48:27'),
(37, 'Oscar Liu', 'haowenliu@campus.monlau.com', '$2y$10$mMrriByIo/lG.p2g2HvWxu7FlIeZhvV5o50.uHzz999qpXwL7a.YS', 12, 2, 8, 'active', NULL, '2024-01-31 18:20:25', '2024-04-23 14:29:59'),
(38, 'Percy Villarroel Dominguez', 'percyvildom@campus.monlau.com', '$2y$10$8p32faFtX8tqcAxSMtWtbesj3xrrZ1q9l4vByHnpBZaJBIxYvU212', 12, 2, 5, 'active', NULL, '2024-01-31 18:20:26', '2024-04-30 14:16:16'),
(39, 'Alejandro Prados Guisado', 'alejandropragui@campus.monlau.com', '$2y$10$f6tD0AncuHIxETgHyQkd9.gsRXWniV3bbYPu8GR/iWnkGhMUB6G9q', 12, 2, 5, 'active', NULL, '2024-01-31 18:20:26', '2024-04-26 16:00:01'),
(40, 'Anavely Lopez Hurtado', 'anavelylophur@campus.monlau.com', '$2y$10$h9LbL90TOeRYSi1mVhDxBez7xQgajaLZmgeOu1fOq3kx7ISt4FfAe', 12, 2, 4, 'active', NULL, '2024-01-31 18:22:43', '2024-05-03 14:50:57'),
(41, 'Álvaro Piquer Archilla', 'alvaropiqarc@campus.monlau.com', '$2y$10$Bh6HzqHSLxyLZDVBxYEPK.mhxVIM/J0NnxnwRrwyFTTcxPePt7hKK', 12, 2, 5, 'active', NULL, '2024-01-31 18:23:22', '2024-05-28 14:53:47'),
(42, 'Kate Diaz', 'jezraelladiarag@campus.monlau.com', '$2y$10$vbwOyRlvjA5R/vDxhEuT8.3vCg7XvFnCKdz4aJzyPSjlUf/zZcjBe', 12, 2, 4, 'active', NULL, '2024-02-01 14:19:00', '2024-02-22 15:10:51'),
(43, 'Esther Ger ', 'esthergermor@campus.monlau.com', '$2y$10$BBtGhqEevQTLUp8tpVPZ1eIngAXlT5.bPfYHnSQz4LJv07GyMlnuS', 12, 2, 6, 'active', NULL, '2024-02-01 14:26:57', '2024-02-21 18:11:25'),
(44, 'judit', 'judithandmar@campus.monlau.com', '$2y$10$CjTr5pGlWCyO4p1ffGhkBOn3PL1HYWGEm6nYrMYKmrUpwLKSFewdu', 12, 2, 4, 'active', NULL, '2024-02-01 14:27:05', '2024-02-28 18:04:28'),
(45, 'aitama', 'aitanaparmor@campus.monlau.com', '$2y$10$jzscanslZlahk7yv0k1Mr.2hbxLO2jE03fV.PhmUjUeK8TAoEEsQC', 12, 2, 4, 'active', NULL, '2024-02-01 14:27:12', '2024-02-22 14:24:33'),
(46, 'Petro Vanzuryak Kogut', 'petrovan@campus.monlau.com', '$2y$10$n.EFkrK2dydsnVa5jvSDUOV7i1DTWal3Zi4n/OZ7xurcte/YGfNDq', 12, 2, 8, 'active', NULL, '2024-02-01 14:27:26', '2024-04-04 14:40:02'),
(47, 'Jhoiner Daniel Paez Guerrero', 'danielpaegue@campus.monlau.com', '$2y$10$qhg9sVEk.7U8PDB/Wj0Nr.vIsi8yprxm1p1z84ZWO6VSg0nbbh0FW', 12, 2, 8, 'active', NULL, '2024-02-01 14:27:41', '2024-02-26 17:06:58'),
(48, 'Laura Llamas', 'llamasl@monlau.com', '$2y$10$s8zayuU7S.63ZRXxfIpG9OQ7noa2iBxbAzDDHFIF2xxLpyPS6YKU2', 11, 2, 3, 'active', NULL, '2024-02-01 15:16:15', '2024-02-15 14:20:54'),
(49, 'Martí López Beltran', 'martilopbel@campus.monlau.com', '$2y$10$Ouvl2MEPUl.qvCD6G7uPX.Rt2YPLn.a5uWk1Bu2lbCWaNqInXfx9S', 12, 2, 11, 'active', NULL, '2024-02-02 11:27:28', '2024-03-01 12:20:02'),
(50, 'Daniel Garcia Brun', 'danielgarciabrun@gmail.com', '$2y$10$sX7//8dEwa.0Tz2.wO.2Qeb7Uak/HzwxqRd9DbsiMOTxu1YfQoSEu', 12, 2, 11, 'active', NULL, '2024-02-02 11:27:56', '2024-02-23 09:13:01'),
(51, 'Izan Pardell', 'izanparbla@campus.monlau.com', '$2y$10$C8NMKjsAiFyn//LuXfZNzevgELBE.hRu.mvdBa7CSYMg6z7ux./ZW', 12, 2, 9, 'active', NULL, '2024-02-02 11:28:16', '2024-04-19 07:58:22'),
(52, 'Aleix ROMERO', 'aleixrombla@campus.monlau.com', '$2y$10$mr3NyH8IPoTy7ztWrGCt7ujz3yrqF1edBQaCOqHbYf5B9C87oQvda', 12, 2, 9, 'active', NULL, '2024-02-02 11:28:18', '2024-04-12 07:21:41'),
(53, 'Daniel Ramos ', 'danielramcat@campus.monlau.com', '$2y$10$h8jICiEf87I./XnPGOew3eQqtf7mvcnhanLdpGeDsyufwLu7utbg2', 12, 2, 10, 'active', NULL, '2024-02-02 11:28:24', '2024-02-23 08:45:40'),
(54, 'Marta Andreu Marín', 'martaandmar@campus.monlau.com', '$2y$10$luP1quJilQ4AZni5C/IWjemrpgFcUBa68/GLqwtJYVFyKgJS4JIG.', 12, 2, 10, 'active', NULL, '2024-02-02 11:28:26', '2024-02-23 08:14:04'),
(55, 'Joan Berrio', 'Joanberale@campus.monlau.com', '$2y$10$7Aac9BjgytFqQhWuKFXeIutvirQplI.L7xDBIzIpSNfNdk5cipJ9y', 12, 2, 11, 'active', NULL, '2024-02-02 11:28:27', '2024-02-23 09:22:20'),
(56, 'Mario Alegre', 'marioaleigl@campus.monlau.com', '$2y$10$NYNCiMVxe9y3uxX5BKenO.5Z6v6OQGg1A8uA3S0Yk4dCMIYINsW76', 12, 2, 10, 'active', NULL, '2024-02-02 11:28:33', '2024-02-02 11:37:47'),
(57, 'Hector Camps', 'hectorcamesp@campus.monlau.com', '$2y$10$X/HHkD3jLk/xu1W47zdEUO2SE/9SKFri5MV.ayjEoC/.z2wftOUgu', 12, 2, 9, 'active', NULL, '2024-02-02 11:28:35', '2024-04-25 16:47:18'),
(58, 'Anduàlem Cendoya', 'andualemcenbat@campus.monlau.com', '$2y$10$c7swLY1Gazu.crwHc/QKW.6Sr.S1YkgoeC6gOJJHvDj3nCY0A0hNy', 12, 2, 11, 'active', NULL, '2024-02-02 11:29:39', '2024-03-01 17:02:20'),
(59, 'Marc Pérez', 'marcpercue@campus.monlau.com', '$2y$10$guKdHKIUXUEAKL7LVlSNu.jooZtfmyPS3dZbQKQKor8JaaWGthSQi', 12, 2, 10, 'active', NULL, '2024-02-02 11:29:39', '2024-02-02 12:05:29'),
(60, 'Xavi Garnica Salvador', 'xavigarsal@campus.monlau.com', '$2y$10$yMaq1t9nX9lf0G3181mwAeC7y8KVVk6KAwy7g1tfjHcwZ6UZZUBt.', 12, 2, 9, 'active', NULL, '2024-02-02 11:40:40', '2024-02-19 09:44:53'),
(61, 'Pepi Corredera', 'correderap@monlau.com', '$2y$10$qdAft7DvCrnJRta9g0S93..MgMjC1s0F0w9niqQv4nD1y2WI8.klC', 11, 2, 26, 'active', NULL, '2024-02-02 14:36:27', '2025-02-26 14:45:19'),
(62, 'Marc Ullod', 'marcullace@monlau.com', '$2y$10$/WAyX2DJV3DIAvpJ70x8U.a.irn/uFKPrQYaTFQ3FbY00byM9XLzi', 12, 2, 17, 'active', NULL, '2024-02-05 15:00:10', '2024-02-07 17:25:48'),
(63, 'Genís Borjas', 'borjasgenis@gmail.com', '$2y$10$vPt6MGsopTnXbCLivdq7UeawXfa0DtP4Nnk6pZcsOOc1o6jgjyKky', 12, 2, 17, 'active', NULL, '2024-02-05 15:00:18', '2024-02-05 15:32:57'),
(64, 'Andrés González', 'andresgonrom@campus.monlau.com', '$2y$10$MXqf03XnWNqCnyXoXbSJEOQrXAS4MHJE2B6YCPNLiJsm90gOv0iZ.', 12, 2, 14, 'active', NULL, '2024-02-05 15:00:59', '2024-02-28 20:09:52'),
(65, 'Joel Ibáñez', 'joelibaber@campus.monlau.com', '$2y$10$fRYlhsW6fXFM7GtJEpDxkuf/BGJ8wSYkE0mwll7MT0RLE82qEQt4u', 12, 2, 15, 'active', NULL, '2024-02-05 15:01:08', '2024-03-04 15:17:33'),
(66, 'Josep Rifà', 'joseprifcue@monlau.com', '$2y$10$jiAlfPBKMN4rW74gz.qFT.FZo31W.mnMN6u8POgQMNqZJfCnm/nJS', 12, 2, 14, 'active', NULL, '2024-02-05 15:01:23', '2024-02-27 17:42:29'),
(67, 'Gerard Jimenez', 'gerardjimrui@campus.monlau.com', '$2y$10$86PoBGX8WwPnF5dXFDkaW.LaIVNR387JFpejw1SlE.QHYOk587EFS', 12, 2, 16, 'active', NULL, '2024-02-05 15:01:24', '2024-02-26 15:18:02'),
(68, 'Sofía Castellote', 'sofiacasper@campus.monlau.com', '$2y$10$Rj7hB4nPVGP5w1b/5CDPD.lnMqSqOMp5Uy4Iv84xuS07weJ13lTwy', 12, 2, 15, 'active', NULL, '2024-02-05 15:01:27', '2024-03-04 16:40:15'),
(69, 'Desireé De Los Reyes', 'desireereypen@campus.monlau.com', '$2y$10$DMwVaf/HvUqjw4V0XWlWHOiMvFFpSyj2XHn0ksevA/wrhhCnJ2tyG', 12, 2, 17, 'active', NULL, '2024-02-05 15:01:31', '2024-02-24 15:03:58'),
(70, 'Adrián Benalcazar', 'davidbencas@campus.monlau.com', '$2y$10$GBCIt/VclS28QE9/eYrC7Otsq2Q6sTvPHzOKk.p1p7pM0No5g/6F.', 12, 2, 13, 'active', NULL, '2024-02-05 15:01:44', '2024-03-04 17:48:29'),
(71, 'Marc Almarcha Vizcaya', 'marcalmviz@campus.monlau.com', '$2y$10$LYvUeVGiB3FxWIBtJ2oABOa6zs0MWY5Nc95KVZGktqHDdQwzCdYYC', 12, 2, NULL, 'active', NULL, '2024-02-05 15:01:52', '2024-02-05 15:03:00'),
(72, 'Antoni Ji', 'antonijidon@campus.monlau.com', '$2y$10$zrKqVMQ0uyCL43W2ogoFm.UHOciuObkqnCmdy5f1Y7Cp/2tXhdEMq', 12, 2, 16, 'active', NULL, '2024-02-05 15:01:59', '2024-02-15 20:49:02'),
(73, 'Sandra Isern', 'sandraiserod@campus.monlau.com', '$2y$10$ZT5Pedr4M378v4rNFTKeZOHgws3KGDbWNpdb3q9Pmfg7gTahzsaCS', 12, 2, 16, 'active', NULL, '2024-02-05 15:02:49', '2024-03-04 15:29:04'),
(74, 'Carla López', 'carlalopsal@campus.monlau.com', '$2y$10$RCfYAkOXPzK/cw71ef4PC.d3gSLAAC1i8RfKzVTV7cT5Fdf9Z7dSW', 12, 2, 15, 'active', NULL, '2024-02-05 15:02:58', '2024-02-19 16:02:30'),
(75, 'Gian Castro', 'giancasrab@campus.monlau.com', '$2y$10$1d8uSgG5yfLDeh4rZMz9UeellIp2XmHslctajENe9pflYhzmu8wBW', 12, 2, NULL, 'active', NULL, '2024-02-05 15:03:04', '2024-02-05 15:03:09'),
(76, 'Jordi Gómez', 'jordigomsar@campus.monlau.com', '$2y$10$o8uHP1tCQLs8Fil907uOeuV087n/laknhpdFEick86Dnu7E0PEnx2', 12, 2, 12, 'active', NULL, '2024-02-05 15:03:12', '2024-02-27 16:59:37'),
(77, 'Adriana Gómez', 'adrianagomgar@monlau.com', '$2y$10$rDj3Hzjufng1BD.nIbCYV.sGvaUUZ2t36kaU.fDIaiAT4eCuPurxu', 12, 2, 17, 'active', NULL, '2024-02-05 15:03:16', '2024-02-05 15:32:33'),
(78, 'Guillem Lorente', 'guillemlorsan@campus.monlau', '$2y$10$o69lQMpoEE4G5sWJszJOse5zI0WsrQl4L9vmLUBn1P8GzbJWrLyXy', 12, 2, NULL, 'active', NULL, '2024-02-05 15:03:19', '2024-02-05 15:03:58'),
(79, 'Berta Medina', 'bertamedlop@campus.monlau.com', '$2y$10$x2Vg1wvPM/xBnY/LKKTJ3ORn5tInX5CnoSpkZigL2f/3GtuAszjT6', 12, 2, NULL, 'active', NULL, '2024-02-05 15:03:47', '2024-02-05 15:04:03'),
(80, 'Achouak En nahal', 'achouakenn@campus.monlau.com', '$2y$10$wWhBhy4Ad37WvP/uGTso1eP.jrqcLtfusioGyf03QoUdMNFzfLy0e', 12, 2, NULL, 'active', NULL, '2024-02-05 15:03:48', '2024-02-05 15:04:05'),
(81, 'Iker Barros Moral', 'ikerbarmor@monlau.com', '$2y$10$lQxTBgBfaW50Ka7TizPnyuZNPVitWx8nsX5jMuaTCglul87z9MM2W', 12, 2, 13, 'active', NULL, '2024-02-05 15:05:25', '2024-02-27 17:44:48'),
(82, 'Pau Gilart Real', 'paugilrea@campus.monlau.com', '$2y$10$.WhZPVmr19Hw3vt6sfl.Lu2Rf995AcfcOJ7u9bz09S4TFohiGwYpy', 12, 2, 12, 'active', NULL, '2024-02-05 15:05:43', '2024-02-05 15:36:52'),
(84, 'Alex Gracia Fortuño', 'alexgrafor@campus.monlau.com', '$2y$10$ACRFez.k./CMgVdDLzYjbOpwlgAmG5I.uV5VeH1J.0PlXevAJDBHy', 12, 2, 13, 'active', NULL, '2024-02-05 15:21:21', '2024-02-19 15:45:37'),
(85, 'Marc Perez', 'marcperiba@campus.monlau.com', '$2y$10$YX8UOsl1mdDmSl3FuZfEIuzo81B9HoNBAW1fmItsK7myOdw0WyMlq', 12, 2, NULL, 'active', NULL, '2024-02-05 15:34:27', '2024-02-05 15:39:02'),
(86, 'Mariona', 'marionabrabei@campus.monlau.com', '$2y$10$oSHSN8QSzN0ySUOm8A5BFuJMEdjuk/U2XCbjQjGurhcUjQMKeqdhO', 12, 2, 25, 'active', NULL, '2024-02-06 14:04:18', '2024-03-04 15:45:31'),
(87, 'Arnau Ruiz', 'arnauruiroc@campus.monlau.com', '$2y$10$LE28tcTjFHgciFsVeyVEJOY37A6pnKgjACQdRyp/5hCNRbiFdZbyu', 12, 2, 20, 'active', NULL, '2024-02-06 14:17:26', '2024-03-05 14:21:08'),
(88, 'Zamira Sebis', 'zamirasebcol@campus.monlau.com', '$2y$10$vAkuLraWH2ZOuMXClEeRGO6te.nQNPcfSvBb/m2XEG9xNyi.Fzca.', 12, 2, 19, 'active', NULL, '2024-02-06 14:17:46', '2024-02-29 15:37:13'),
(89, 'Sergi Colobrans Ramírez', 'sergi09cr@gmail.com', '$2y$10$lfHABjvchgkSPg2Xnnfz7.8W/BiBAOI6rx38fr6uIqB4Ry892rpTa', 12, 2, 24, 'active', NULL, '2024-02-06 14:17:49', '2024-03-05 15:44:18'),
(90, 'Patricia', 'patriciajarbel@campus.monlau.com', '$2y$10$OEbiX1XpCwGBObrI9k7GBeUUwSBrRJnhpPwBrquIKunFjQ2I0v98G', 12, 2, 22, 'active', NULL, '2024-02-06 14:17:57', '2024-03-05 15:05:45'),
(91, 'Gerard Vacas Cantero', 'gerardvaccan@campus.monlau.com', '$2y$10$0sa64e.KahhIhq2cyXw7LOZPsZG71VVXWf3ud4Q.hlBRhxeRJ7ZNi', 12, 2, 22, 'active', NULL, '2024-02-06 14:18:13', '2024-03-05 15:24:27'),
(92, 'Arnau Becerril Marín', 'arnaubecmar@campus.monlau.com', '$2y$10$9g/KbvxquP1JTjZ.nyDG7enc1Te46/NuUVmH/SaaDjOHbQG7S6zpe', 12, 2, 23, 'active', NULL, '2024-02-06 14:18:15', '2024-02-27 14:34:42'),
(93, 'Joel Gómez', 'joelgomcol@campus.monlau.com', '$2y$10$ye.toNXNHtsSM7pX7DRuv.PctJp1eTFXguiLgswAregTt.cC5NDbi', 12, 2, 25, 'active', NULL, '2024-02-06 14:18:39', '2024-02-22 15:40:42'),
(94, 'Kevin Sánchez', 'kevinsandia@campus.monlau.com', '$2y$10$y3299H3vbQjC291kCQtwNO5u6dKFMRDkHTaeAGDMrqfHeMWTS2LUa', 12, 2, 20, 'active', NULL, '2024-02-06 14:18:55', '2024-02-22 16:58:27'),
(95, 'Alma De Haro', 'almahargon@monlau.com', '$2y$10$Q.ddwDhkwwODTK7K1mDTPeBAzlBNYamMKupca8caGsXZBg6gwfFEm', 12, 2, 19, 'active', NULL, '2024-02-06 14:18:55', '2024-03-05 14:55:18'),
(96, 'Ferran Garcia', 'ferrangarred@monlau.com', '$2y$10$p8Z3g4z6NXsbsYiO6uHk8.jVACZgZuZMYysb8LtbhgXI8Q8e3N.Ky', 12, 2, 21, 'active', NULL, '2024-02-06 14:19:08', '2024-03-06 14:51:14'),
(97, 'Xènia de Mier Pinto', 'xeniamiepin@campus.monlau.com', '$2y$10$dJYA8uc9k0T215n5Tb4xwuLVW7224p1qH9W8uLm2B/CR0/fecJzTq', 12, 2, 22, 'active', NULL, '2024-02-06 14:19:36', '2024-03-05 14:34:55'),
(98, 'Rachel', 'rachelsot@monlau.com', '$2y$10$CP4qRJ3xmf2oaj87e97y0OZEcXOlME7D/OiyuK3299UwaTjnBV59q', 12, 2, 19, 'active', NULL, '2024-02-06 14:20:03', '2024-03-05 14:34:23'),
(99, 'Berta', 'bertacamsel@campus.monlau.com', '$2y$10$uYfEaX4vqDISUEarOcs2U.bIwX5eXi4E9T9jrAwIbxOgri48B4JXW', 12, 2, 20, 'active', NULL, '2024-02-06 14:21:38', '2024-03-05 15:35:49'),
(100, 'Cristhina Cañizares', 'cristinacanizales2004@gmail.com', '$2y$10$YeKm11bbzNwEw0J6SMt1rOkiEPf1cZFBuERXGmEpEdnxBlcQAO1Dy', 12, 2, 24, 'active', NULL, '2024-02-06 14:29:14', '2024-03-05 15:43:56'),
(101, 'Pau', 'pauvinnog@campus.monlau.com', '$2y$10$7XSr86ClBG54/xfZrlAPp.gwAPT2OeRpCXmQbOdhpLJggtB.IBWEi', 12, 2, 25, 'active', NULL, '2024-02-06 14:36:33', '2024-02-15 14:44:19'),
(102, 'Administrador', 'portalempresarial@monlau.com', '$2y$10$0OzjVK89gR7/snJ3A11r/enACxSOTZ2BWkScjnS98SRB6KZgzqdey', 10, 3, 18, 'active', NULL, '2024-02-07 14:24:42', '2025-02-24 10:14:18'),
(103, 'Pol', 'polpeidie@campus.monlau.com', '$2y$10$brMpyNjacSCkjraQiZEvJuEkeDtzv9asxRvlce0wbZ5iBYtk6kHjS', 12, 3, 18, 'active', 'kmIndNwvYQ3eVj0ee7JzWSNTbylMi1b6YtG3Jgdw.png', '2024-02-07 14:39:09', '2024-02-07 17:06:53'),
(104, 'Álvaro', 'alvarojurcan@campus.monlau.com', '$2y$10$zRBu0IYwCu16LNYIgUM9nOw/cXoJRrIVcUBQWiNUrFQ8RoMETD09G', 12, 3, 18, 'active', NULL, '2024-02-07 14:39:17', '2024-02-07 17:03:10'),
(105, 'raulcedroj', 'raulcedroj@campus.monlau.com', '$2y$10$5n/fY3LabOM4PNrGYVQsXuKK0Cj1ihiYglpuP9qHIhAzXS.U09W0q', 12, 3, 18, 'active', NULL, '2024-02-07 14:39:18', '2024-02-07 17:09:00'),
(106, 'Himel Majumder', 'himelmaj@campus.monlau.com', '$2y$10$vaVYK4Cy2g1pVkayZ0AW7eEkrFmPADyIfb3fB1Svlg/LBfCmQiwua', 12, 3, 18, 'active', '3PDPHlAcvPhWj7IfomEWfVxZAmEwMWpCc3UfiDr3.png', '2024-02-07 14:40:00', '2024-02-07 17:04:05'),
(107, 'Sergi Rodriguez', 'sergirodesc@campus.monlau.com', '$2y$10$BTEYJ2up1opgfucEiPqdA.kQyHk6XS/b.L.8xCyLgcreXG35UeGKy', 12, 3, 18, 'active', NULL, '2024-02-07 14:40:09', '2024-02-07 17:46:19'),
(108, 'eric', 'ericmangar@campus.monlau.com', '$2y$10$KXWpzQvzdZtP8W9ykujRjeyX72txq/GWF3Msb6WX3vPTVshSJotoe', 12, 3, 18, 'active', NULL, '2024-02-07 14:40:56', '2024-02-07 17:07:43'),
(109, 'Maria', 'mariarodira@campus.monlau.com', '$2y$10$.izqyq/V2qMnh4AgV5ZXuumZCe2I/raSeb2UFxElAzAoqw7.BYgU2', 12, 3, 18, 'active', NULL, '2024-02-07 14:43:11', '2024-02-07 17:05:18'),
(110, 'Joan', 'joanpuigra@campus.monlau.com', '$2y$10$ok3rqxCK4G0FUsiVmB9.bu..KnB6zr9NJtuFAQq97w/izMKVO4WZe', 12, 3, 18, 'active', 'O35Y3vfxHCF1lZgMNKGwxa6WD6mn1zsjUHDaAFz6.png', '2024-02-07 14:43:39', '2024-02-07 17:02:32'),
(111, 'Deivid', 'davidcanrui@campus.monlau.com', '$2y$10$TQ3V.NzfQDp5BN5VhgWAJOVwVhB6KeMy5GMfwLbVmgdccrXAReERa', 12, 3, 18, 'active', NULL, '2024-02-07 14:43:55', '2024-02-08 20:59:28'),
(112, 'Mario Martínez', 'mariomarmen@monlau.com', '$2y$10$ktI0.7jDvvj5KXuVCN4MEOKupTdJFM87qytgluSFCynMz4QMfrPdu', 12, 3, 18, 'active', 'MKj5rNjT9UtHkWX1tiVDDeekBCEYvskypBXgiR93.jpg', '2024-02-07 14:44:07', '2024-02-07 17:05:09'),
(113, 'Héctor Sánchez Ponseti', 'hectosanpon@monlau.com', '$2y$10$nxDHiaLZwCSL.ULcFemlfOJQkAu8agS85Gkq6FQ/qWxwGYSje1QqW', 12, 2, 21, 'active', NULL, '2024-02-07 14:46:58', '2024-03-05 14:40:17'),
(114, 'Albert', 'albertsorgua@campus.monlau.com', '$2y$10$c9pQ0aVKUd2xHeyhxmT1EOFNxTZyCtgQx9YH25OpG51e8sfdGevye', 12, 3, 18, 'active', NULL, '2024-02-07 14:47:33', '2024-02-07 16:59:12'),
(115, 'Xavier', 'xavieresber@campus.monlau.com', '$2y$10$fCWkjfG45Ac1YBMWf.ML7uYrf5yuQWNZYpnx3RpJ6zXnHLtQEPCPW', 12, 3, NULL, 'active', NULL, '2024-02-07 14:47:49', '2024-02-07 14:48:00'),
(116, 'Didac', 'didaccasrei@campus.monlau.com', '$2y$10$wYojhFOm9jN2Ju3UXpgMW.5u4Rhu.FipC2Z06aVMDIK.yphc/Osiq', 12, 3, 18, 'active', NULL, '2024-02-07 14:48:07', '2024-02-07 14:55:48'),
(117, 'Elian Fernández', 'elianferlab@campus.monlau.com', '$2y$10$vaqwdP6CyJuqOrRhr8h4Hu037LPuwD4Bm9QKmYvTN9rlXEptkV4m.', 12, 3, NULL, 'active', NULL, '2024-02-07 14:48:32', '2024-02-07 14:48:52'),
(118, 'Iván Sebastián Alguacil González', 'ivanalggon@campus.monlau.com', '$2y$10$yvsn7zuredUCWmDdxvGoceS.fy0UIHm1GFOupgEKgVuP/O3oa.iay', 12, 3, 18, 'active', NULL, '2024-02-07 14:48:54', '2024-02-07 17:45:14'),
(119, 'Carlos Araujo', 'carlosaragal@campus.monlau.com', '$2y$10$8TL5jgDmAOO/Md9QlhHrD./Yter4gsW34QrX6.ErCUaI47S362nPa', 12, 3, 18, 'active', NULL, '2024-02-07 14:49:13', '2024-02-07 14:50:41'),
(120, 'Marc', 'marcmarfer@campus.monlau.com', '$2y$10$NhhVLFSoGtnhaVNmjJY.xu8vysSLFOKj8z2DXyTq2vcgCAzqq9dJi', 12, 3, 18, 'active', NULL, '2024-02-07 14:49:13', '2024-02-07 16:58:32'),
(121, 'Santiago Benítez Álvarez', 'santiagobenalv@campus.monlau.com', '$2y$10$xotT4pO68kPMb10ZXE9fU.tnYB/I8P3bGJZcfeMU7eEtsTtKa3HP6', 12, 3, 18, 'active', NULL, '2024-02-07 14:49:43', '2024-02-07 16:59:15'),
(122, 'Josep', 'josepsalrom@campus.monlau.com', '$2y$10$U6EWhNg7Q0zfIwja7I/I/uzPve4rVTGeqUHIlUHjvuIIuQcWGuIAC', 12, 3, 18, 'active', NULL, '2024-02-07 14:51:21', '2024-02-07 15:01:27'),
(123, 'Carles', 'carlessanrod@campus.monlau.com', '$2y$10$1l9/UgTwystkF2Llw7V0uuy0AGB1lj01Snn8cpWcIKWEUWvnicm0K', 12, 3, 18, 'active', NULL, '2024-02-07 14:51:50', '2024-02-07 14:52:53'),
(124, 'Angel Herraiz Foz', 'angelherfoz@campus.monlau.com', '$2y$10$yxYcB25rR.3JK4tMP2Ag1e5e05IQ3qp620/PnL4d2CJFVWEmv4qDS', 12, 3, 18, 'active', NULL, '2024-02-07 14:57:21', '2024-02-07 17:01:17'),
(125, 'Adrian', 'adrianpersan@campus.monlau.com', '$2y$10$74TPbRTuaxADG2GsBAcXiuj.1TTQINpJZi/AR.FX8Z7AsOUS44E.G', 12, 3, 18, 'active', NULL, '2024-02-07 15:01:16', '2024-02-07 16:58:35'),
(126, 'Aleix', 'aleixtorzap@campus.monlau.com', '$2y$10$cgfuEfmXEvDIBMQ0U0JGN.te2vE2rk1JY1MD3OnBLkr4Ym7V4wvx6', 12, 3, 18, 'active', NULL, '2024-02-07 15:09:20', '2024-02-07 17:10:15'),
(127, 'Xavier Escobosa', 'xavi9eb@gmail.com', '$2y$10$fyAh5gwW2YS/wYYNP2cT.eAePnsH4N3T8By8SPhggHNm1HpBdDR9O', 12, 3, 18, 'active', NULL, '2024-02-07 15:12:38', '2024-02-07 15:25:13'),
(128, 'Rubén', 'rubenmaralc@campus.monlau.com', '$2y$10$YlLlLnRvSpiEor11xfqGLO0XmaoIatN9pYs.Et0mV5/Uupk33eivK', 12, 3, 18, 'active', '7hQFHmF4GsOCHqc7cMyYv64SLMQJHT5e0kZ2Mrj5.jpg', '2024-02-07 15:23:40', '2024-02-07 17:02:17'),
(129, 'Laia Añor', 'laiaanogra@campus.monlau.com', '$2y$10$SFXz/zd7KPUiBbadM8wIn.em/nPsRKXxuWI.oAiGFp2YRCRDHaL6m', 12, 2, 7, 'active', NULL, '2024-02-07 16:42:02', '2024-05-03 14:54:18'),
(130, 'oriol', 'oriolalmval@campus.monlau.com', '$2y$10$0yZw69uSvn3EiX6Kq8SRe.afNDfqaZXNeb2y7N6yK6jLq.mtUbbJW', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:09', '2024-02-07 17:03:43'),
(131, 'mateu', 'mateudcaralt@gmail.com', '$2y$10$mx/mBYwJps/WEsqJlhjlde0fSvQwu0UNTvOqf6uq3XNS/IV9ytuWS', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:09', '2024-02-07 22:03:16'),
(132, 'Marcos', 'marcosdiasim@monlau.com', '$2y$10$/lUy4OpYlX8Ioi2rYPX4J.IOrOuBVsdBxGTDU14p3sKIci48w.zNa', 12, 3, NULL, 'active', NULL, '2024-02-07 16:59:14', '2024-02-07 17:00:15'),
(133, 'pauhergue', 'pauhergue@campus.monlau.com', '$2y$10$pU8wCV4j4SD5aAENR7SZpe0nJvzZKp7kFQKDR7Car.gfduE46RHLq', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:22', '2024-02-07 18:14:25'),
(134, 'Mohamed', 'mohamedani@campus.monlau.com', '$2y$10$324t3aLj8tj3tRpEvHWvgetNxeYy2ojmExqXQqTl0ywogaWdXVlYG', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:37', '2024-02-07 17:04:21'),
(135, 'pol', 'polgarsua@campus.monlau.com', '$2y$10$ZHwRKmvbIqASf7LNbyA3xeAaoR1DHVqkCAPadqKkt6eYVoRBWUaxu', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:52', '2024-02-07 17:01:46'),
(136, 'Jordi Abadia', 'jordiabaarb@campus.monlau.com', '$2y$10$xEo/Rt9xGYqPa/bgrY.IIOiCFftamo9R40sh9fo0H3Mq55RghkDH2', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:52', '2024-02-08 10:45:10'),
(137, 'Bruno', 'brunoamagar@campus.monlau.com', '$2y$10$sjK9zZHDaK9uWKeZ6dw3Zupwv.GRLO1zoO3qYy5nop3emIWacbJru', 12, 3, 18, 'active', NULL, '2024-02-07 16:59:52', '2024-02-07 17:03:49'),
(138, 'Bruno', 'brunoduanas@campus.monlau.com', '$2y$10$NKXS9Eua.lsCKh3N19TMo.OPimuBeE48LiH/aDL2cTa0wXKtGlkgm', 12, 3, 18, 'active', NULL, '2024-02-07 17:00:40', '2024-02-07 17:08:30'),
(139, 'Alex Ortega Arasil', 'alexortara@campus.monlau.com', '$2y$10$dX3eWTkiBLkXAXagxqAS.elSv9KxAisFVF26KdNkILEXRX0Is59OG', 12, 3, 18, 'active', NULL, '2024-02-07 17:00:48', '2024-02-07 18:49:00'),
(140, 'marc', 'marc.bastias23@gmail.com', '$2y$10$hlOLaRcDXGLe3zbLgMBmDeIAsG.KhUkgx3rNvtbtKtuOvvueE08hi', 12, 3, NULL, 'active', NULL, '2024-02-07 17:00:52', '2024-02-07 17:02:17'),
(141, 'Noel', 'pacomermela080@gmail.com', '$2y$10$PgwaNWEQstFmwdmF7Tt0quDmN0u..WfyBm7fiWWo1PpalDOWBqaaO', 12, 3, NULL, 'active', NULL, '2024-02-07 17:00:53', '2024-02-07 17:02:18'),
(142, 'Jon', 'jonmonluq@campus.monlau.com', '$2y$10$oCDT8tbkV./zhSIbiBCivONeGv8JbBHfhxHPg/Y59aV.4wphXJoT.', 12, 3, 18, 'active', NULL, '2024-02-07 17:01:02', '2024-02-07 17:55:07'),
(143, 'Guillem', 'guillemnungar@campus.monlau.com', '$2y$10$x0EIjxkR5FdDgKlyWTSwbeaebGNRgsnkwodLncxn9mVWBgOm79FMC', 12, 3, 18, 'active', NULL, '2024-02-07 17:02:10', '2024-02-07 17:45:51'),
(144, 'Anahi Garcia Ardaya', 'anahigarard@campus.monlau.com', '$2y$10$3VWtF59iQQLGLZ8FiFgz9.G2Ja3tKK01RNqtlhZBXNQl131dOQGs2', 12, 2, 4, 'active', NULL, '2024-02-07 18:14:49', '2024-02-26 17:19:03'),
(145, 'Valentina', 'valentinaherher@campus.monlau.com', '$2y$10$4sh.y6fKIarSjNHfpwkXV.vkvOONQNrJItVSC.gCTj8dyQE0jzs4G', 12, 2, NULL, 'active', NULL, '2024-02-08 14:35:34', '2024-02-08 14:58:18'),
(146, 'Bernat Elias', 'bernatelimir@campus.monlau.com', '$2y$10$vzjZFXyhldNixfLJ7CX/UOZ0J07jukmJjoKGd20vJxEt2FLNWTyCi', 12, 2, 23, 'active', NULL, '2024-02-08 14:57:54', '2024-03-05 15:45:06'),
(147, 'Daniel Muñoz', 'danielmunang@campus.monlau.com', '$2y$10$PYbdTifc0WTAE3zw748f4eK2uqZPhQGhNfxHR5Wrm3e4pj/bbU3kq', 12, 2, 23, 'active', NULL, '2024-02-08 14:58:30', '2024-02-08 15:59:13'),
(148, 'David Fornieles', 'davidformor@campus.monlau.com', '$2y$10$jjBwXCL/cEs10eMdOa.nl.DeqmG1wtvNSWfhM2V1zHftelC.rwYS2', 12, 2, 22, 'active', NULL, '2024-02-08 14:59:54', '2024-02-22 15:02:17'),
(149, 'Arnau Franco', 'arnaufrabue@campus.monlau.com', '$2y$10$OsLVMQ4v.Hb9YWEovUCcKujN1FCjbgsB3emy2U2lsRsR1wcQELZoG', 12, 2, 23, 'active', NULL, '2024-02-08 15:27:03', '2024-02-08 15:57:24'),
(150, 'Álex Diestro Fernández', 'alexdiefer@campus.monlau.com', '$2y$10$VklHhrfGW68HNrIl.Dziv.NdxXNzodRqLX6SlKsPAGSAH8aHaPpbK', 12, 2, 20, 'active', NULL, '2024-02-08 16:03:25', '2024-02-29 15:31:50'),
(151, 'Dylan Anderson Leiva Maldonado ', 'dln.fct.21@gmail.com', '$2y$10$WQC2A0unEyw8Q47qhbE5eOgJ6T.wIQ8zpDjeJootHZdF4jE6.QsUe', 12, 3, NULL, 'pending', NULL, '2024-02-11 00:21:57', '2024-02-11 00:21:57'),
(152, 'Erick Rodríguez', 'erickrodmar@campus.monlau.com', '$2y$10$zbaAHDQV5IsetgmyI6oPi.raD064VAyzLALxD7tTBj7SFlDS1gjJG', 12, 2, 6, 'active', NULL, '2024-02-14 17:39:42', '2024-02-19 15:38:35'),
(153, 'Jaume Egea', 'jaumeegesan@campus.monlau.com', '$2y$10$cfBoIKRu9B24iWClTgTDmuignRkwuyNa3s7eIg.vwNs8WOCp2ZUSW', 12, 2, 26, 'active', 'awhg221p4QosbltVgE4vohNwBwtuwR2RhWYYbSyt.jpg', '2025-02-25 17:30:04', '2025-03-26 15:30:30'),
(154, 'Paola', 'sanchezp@monlau.com', '$2y$10$.Kp5PwnZFSMd5c8BwjjmduodjJ3ai3L8DSKexY.WAZLxdDCLoi8La', 11, 2, 26, 'active', NULL, '2025-02-26 09:09:08', '2025-02-26 14:41:52'),
(155, 'Iván Huesca Andújar', 'ivanhueand@campus.monlau.com', '$2y$10$lwqkne1TlHWJDf8GhtQEFunSfbYPWjaK8RJPVuDGfR3NZ5iWNCUXS', 12, 2, 27, 'active', NULL, '2025-02-26 09:37:42', '2025-09-18 09:05:10'),
(156, 'Enrique', 'enriqueflocad@campus.monlau.com', '$2y$10$CCNrlyjiao9MC4mFvgJmhOrGDmkiFD5mCcVG0qNBCF7DF.d.FVmd2', 12, 2, 27, 'active', NULL, '2025-02-26 09:38:30', '2025-02-26 11:34:23'),
(157, 'Ángel Llobet Velasco', 'angelllovel@campus.monlau.com', '$2y$10$8uuWP3TkL9hgEQLahCQ5yuXXIgYDd4zk69j2teNuMaht7fRYFW3qm', 12, 2, 52, 'active', NULL, '2025-02-26 09:41:16', '2025-02-27 09:17:25'),
(158, 'Daniel Felipe ', 'danielgalord@campus.monlau.com', '$2y$10$F4L70ZL./HjWYkhauEFIQuPHuW3xcPuASiuDwGd28r7cdKu/i64oa', 12, 2, 52, 'active', NULL, '2025-02-26 09:48:25', '2025-03-14 11:43:12'),
(160, 'Joan Corzo Marmol', 'joancormar@campus.monlau.com', '$2y$10$6jTQ5flcxtAx9xjd0bHsS.3sFtISKxHLCLbqcioBsoNqOSpXFVs4O', 12, 2, 27, 'active', NULL, '2025-02-26 11:11:58', '2025-04-30 00:53:01'),
(161, 'Aleix Cruellas Carrillo', 'aleixcrucar@campus.monlau.com', '$2y$10$7uDVhk28M2P9gEcMR0z08eiuZyI7NoGUSH8MOoMiKUN0GKqMvAD/C', 12, 2, 55, 'active', NULL, '2025-02-26 14:32:41', '2025-03-20 14:24:31'),
(162, 'Marc Comellas cano', 'marccomcan@campus.monlau.com', '$2y$10$7t3L5pzIkfNH.tc0k20r7.DurJjw6xGkRLOwaE3w.rjpDi9jtR9Cm', 12, 2, 43, 'active', NULL, '2025-02-26 14:32:48', '2025-03-19 13:07:48'),
(163, 'Lucia Castilla', 'luciacasfer@campus.monlau.com', '$2y$10$LpKwIVyjG8nla.hpwYtlY.Q2G3nQxQB5l5lGJFK97U/Hw0U..FWF6', 12, 2, 29, 'active', NULL, '2025-02-26 14:32:50', '2025-03-12 15:50:26'),
(164, 'Felipe Rodrigues da Silva', 'feliperodsil@campus.monlau.com', '$2y$10$BptMOkpPPjA/nZP.CzlvUun0I3hSQ946LEIb6NAHwmKQ9boKpqSw6', 12, 2, 38, 'active', NULL, '2025-02-26 14:32:54', '2025-02-26 15:13:28'),
(165, 'Balram singh', 'balramsinsin@campus.monlau.com', '$2y$10$9xdFbnm35G5Vc/ihTPWle.Hc5PS8MllUmiD07z5.Z9zsPjMs1Yl7i', 12, 2, 49, 'active', NULL, '2025-02-26 14:33:04', '2025-03-06 17:40:39'),
(166, 'Alex Peinado Ocaña', 'alexpeioca@campus.monlau.com', '$2y$10$l2Rb1TVPlx7oSJqF3aCri.kva9ZrvgqVlOlajNMxwet6qwOK.wPU6', 12, 2, 43, 'active', NULL, '2025-02-26 14:33:12', '2025-03-12 15:26:10'),
(167, 'Sara Langreo', 'saralanveg@monlau.com', '$2y$10$2oYfA03kKiy/mJwVlLtvH.7IGS9.CXq6YQTHEdfjm/TAvQU69Yuqu', 12, 2, 38, 'active', NULL, '2025-02-26 14:33:14', '2025-02-26 15:13:13'),
(168, 'Ignacio Pardo', 'ignacioparbar@campus.monlau.com', '$2y$10$kGjR8ydctQEh1Co09lSCW.T9L.4OCdEI.LiABTA8TAjQFU7F3up/a', 12, 2, 29, 'active', NULL, '2025-02-26 14:33:15', '2025-03-13 11:25:04'),
(169, 'Marta', 'martaruigar22@gmail.com', '$2y$10$syka3.B9sFrPc0alyTbFF.OBHin2hy1eVWjfTNzqWTnKnYQEXGVWW', 12, 2, 29, 'active', NULL, '2025-02-26 14:33:43', '2025-03-10 15:01:38'),
(170, 'Luyao', 'luyaoche@campus.monlau.com', '$2y$10$f1KoJ.FE0wJAPgsVmRcI6O/ioWlJIAqlTX6s5EB7SLM8/lOpQFE4m', 12, 2, 38, 'active', NULL, '2025-02-26 14:33:48', '2025-02-28 16:40:19'),
(171, 'Rubén Peña Gimenez', 'rubenpengim@monlau.com', '$2y$10$4T1v7C0GNM9Cy3bvufwcF.jsncWvh/W5OVIm8jfhqxKTPg/EQ0rGC', 12, 2, 38, 'active', NULL, '2025-02-26 14:33:51', '2025-03-12 16:06:20'),
(172, 'Axel', 'axelanaesp@campus.monlau.com', '$2y$10$rw50dDGzu4vkC8xOljcnzuPxJl3YB0l35IdBA0XCEvXCEwR6dD4Pa', 12, 2, 55, 'active', NULL, '2025-02-26 14:34:25', '2025-02-28 16:01:11'),
(173, 'Mario', 'mariobarrip@campus.monlau.com', '$2y$10$yDF3kttBCUVYDjY1ZUkLauM01ofwE4LNk1qeqCF6ZPu7ORHUJFEUy', 12, 2, 59, 'active', NULL, '2025-02-26 14:34:26', '2025-03-04 17:32:10'),
(174, 'Carlos Perez', 'carlospergal@campus.monlau.com', '$2y$10$p/vGqNVHxQqCMa38kTvfM.EUsnBEjFo/fTk85URh0NfkYMLwt3jzi', 12, 2, 39, 'active', NULL, '2025-02-26 14:34:34', '2025-03-12 15:49:31'),
(175, 'Johana', 'johananavgut@campus.monlau.com', '$2y$10$6i1tQR9fYKME6vo8EIm3GOKAYKbOfP/kd0C1Tq/sReIHBNrnxeTw6', 12, 2, 57, 'active', NULL, '2025-02-26 14:34:36', '2025-03-19 17:28:48'),
(176, 'Víctor Cruz ', 'victorcrudon@campus.monlau.com', '$2y$10$L7YKc7.AnYxp7IM4BFqMwuyhisimMqBO8m8qRdIil8PITSNnyLs3a', 12, 2, 39, 'active', NULL, '2025-02-26 14:34:43', '2025-03-20 17:00:29'),
(177, 'Carla Abellán', 'carlaabelop@campus.monlau.com', '$2y$10$SuTJhnBgRRQnvn0TBXl9xOs/XXYPfBFQgc6Jn6c7ZRrkVjAUhg/.S', 12, 2, 29, 'active', NULL, '2025-02-26 14:34:45', '2025-03-20 16:10:20'),
(178, 'Alba Soriano', 'albasorbur@campus.monlau.com', '$2y$10$dNMtX4TnDdn5IZqFyCrCkeGPBQvcqdo.xWVlj5Ngeudp48n3T5nZW', 12, 2, 57, 'active', NULL, '2025-02-26 14:34:51', '2025-02-26 15:34:23'),
(179, 'Alexia', 'alexiarodbai@campus.monlau.com', '$2y$10$GlxND5PTeT5hJDLf.pRkSO5oFdtgopY5fT/ZRF7VBCz4MpX5JGPna', 12, 2, 57, 'active', NULL, '2025-02-26 14:35:10', '2025-02-26 15:14:28'),
(180, 'Martí', 'martigalola@campus.monlau.com', '$2y$10$jeQ0pfwqm19XA/myw9aPGe9MrCV8ny6FxOdEJCD/0NTI9vkMIo7Li', 12, 2, 49, 'active', NULL, '2025-02-26 14:35:45', '2025-03-18 15:03:03'),
(181, 'Christian', 'christianarocue@campus.monlau.com', '$2y$10$PGmMJGdkw.QXW3FJIr8kcOAnKyCR9syUyI.hpMU2KZkbRvcli/mAa', 12, 2, 56, 'active', NULL, '2025-02-26 14:36:26', '2025-03-06 18:40:06'),
(182, 'Aroa Galán', 'aroagalmor@campus.monlau.com', '$2y$10$nYSs/hkn.3ajytRBcpz0YOpJ2X15I9uX0c2ZsjTcY0gKo2Qp5QWAS', 12, 2, 30, 'active', NULL, '2025-02-26 14:38:05', '2025-03-20 19:32:49'),
(183, 'Arnau', 'arnaumarhid@campus.monlau.com', '$2y$10$bsp6k7PkpPQ2Ssi3Q8Tj0exTkzUg9Lcx5Wds9C7E6NG4R2.NsEW/i', 12, 2, 44, 'active', NULL, '2025-02-26 14:38:07', '2025-02-26 15:05:58'),
(184, 'julia', 'juliagarvil@campus.monlau.com', '$2y$10$kmG5Y8/qsmf5yLO72uvUsurN5799ksfCP9A8tnbKIo6WX8mKFjZDi', 12, 2, 44, 'active', NULL, '2025-02-26 14:38:35', '2025-02-28 15:16:13'),
(185, 'Nerea Pueyo Azuara', 'nereapueazu@campus.monlau.com', '$2y$10$i.DZ45viuN1dfBQ0hxEHYOZ2XQ.VyJlTYXuWI3iZsAEOUVUWlk2Sy', 12, 2, 30, 'active', NULL, '2025-02-26 14:38:37', '2025-03-04 17:34:23'),
(186, 'Jose Maria Alborch ', 'josealbvaq@campus.monlau.com', '$2y$10$o9bylvkoC/ac3Mc3v8Q48u.kLANXuoAproEBK4Xyb8uU8uGKgqVWS', 12, 2, 44, 'active', NULL, '2025-02-26 14:39:50', '2025-04-08 16:20:15'),
(187, 'victor', 'victormanjor@campus.monlau.com', '$2y$10$hTtpe9kAyF4/5vStZDguBup83ibNzbbEEJsxUmT6o.VNyuS1n4rOW', 12, 2, 26, 'active', NULL, '2025-02-26 14:39:59', '2025-02-26 14:48:16'),
(188, 'Pol Fernández', 'polfercer@campus.monlau.com', '$2y$10$l6BRxkZpa9z.WqNXgk5MKOnubOTZt20WGGCWhbAjZLrh6z5ZXSKX6', 12, 2, 30, 'active', NULL, '2025-02-26 14:40:10', '2025-03-10 15:04:41'),
(189, 'Alex Arredondo', 'alexarralc@campus.monlau.com', '$2y$10$2a4UJuTf9i5itvQmadmAUeA9B1t5u.YEWnvM3mmC03MA1p/kBexPq', 12, 2, 59, 'active', NULL, '2025-02-26 14:40:39', '2025-03-10 15:31:22'),
(190, 'Lika', 'likaapr@campus.monlau.com', '$2y$10$URwgsTk1Z0NgfeKOOtbnCehEhbm5HbLjHeaPiYxYP4GfS3p6NAzLC', 12, 2, 44, 'active', NULL, '2025-02-26 14:41:08', '2025-02-26 15:56:04'),
(191, 'Mireia Arnaiz', 'mireiaarnpuc@campus.monlau.com', '$2y$10$biyeEsp9nigEnlyDvnnZ9ulGFBAmQYOAlZXDzBQVthQBVrWfaOO7G', 12, 2, 30, 'active', NULL, '2025-02-26 14:41:31', '2025-03-21 16:56:33'),
(192, 'Genis', 'genisbelado@campus.monlau.com', '$2y$10$j.xrnX1LEClztCw61f/iXOUEQjkAGhvIaIrauR8Xf7q/MhRWJOwBS', 12, 2, 59, 'active', NULL, '2025-02-26 14:41:34', '2025-03-04 18:01:13'),
(193, 'Adrian', 'Adrianmannei@campus.monlau.com', '$2y$10$q8.ElsMO3CNETA/6hpBkIucpb3MXaUlsYZOKqwQ2n08eZb/xBnPfC', 12, 2, 58, 'active', NULL, '2025-02-26 14:41:46', '2025-02-26 16:06:20'),
(194, 'Tamar', 'tamarzurashvili@campus.monlau.com', '$2y$10$jQnxN6p3wpr63a3.IXtLxOLyxcSfNI0HlSt3GJL1Zssp77H7BIa7O', 12, 2, 30, 'active', NULL, '2025-02-26 14:42:47', '2025-03-04 17:00:12'),
(195, 'Alex Lancharro', 'alexlanfru@campus.monlau.com', '$2y$10$MmOzF.qHoYXfUL.kdRa.HuEx/4D/cr.sVJo7DimE0iL6QhyjFmsue', 12, 2, 26, 'active', NULL, '2025-02-26 14:42:48', '2025-05-14 13:59:42'),
(196, 'Artur', 'arturlacogn@campus.monlau.com', '$2y$10$cz96igAvaP9kC/dZc4vE4OvVSKkJMGOAvv4hKLC4i4wrvmhXyEcny', 12, 2, 59, 'active', NULL, '2025-02-26 14:43:03', '2025-05-07 13:32:36'),
(197, 'alex fernandez lopez', 'alexferlop@campus.monlau.com', '$2y$10$/1jVVgFsNzdIlOJQrqoxBuaBmnyE67Rvgh5GaoyVJNRnRmUta63RW', 12, 2, 26, 'active', NULL, '2025-02-26 14:43:37', '2025-02-28 17:29:23'),
(198, 'David', 'davidbelbae@campus.monlau.com', '$2y$10$fcE.0kF5nyPi.ORZb1Ay7ObmXzTeblmd18iVE2Ck172.YpO9fhVbu', 12, 2, 59, 'active', NULL, '2025-02-26 14:43:57', '2025-04-22 15:56:12'),
(199, 'judit ', 'juditmuntab@campus.monlau.com', '$2y$10$sDq.HGWUiIi8En/NQMNAu.oU9.UQuCBx6YYaM2brM3l..De/E0wTO', 12, 2, 57, 'active', NULL, '2025-02-26 14:44:19', '2025-03-20 17:44:27'),
(200, 'Pol Hernández', 'polhermes@campus.monlau.com', '$2y$10$ZZqm0OKgKCd5mBBCCCQpZeW2y7A0L8JOyVT4jgvtPG6fC.L9O/O2C', 12, 2, 56, 'active', NULL, '2025-02-26 14:44:21', '2025-03-11 19:58:09'),
(201, 'Jose', 'joseheragu@campus.monlau.com', '$2y$10$VA8o/upu/FY41PgfBjsLY.ML8ziR4u/dZCN7mgPKyBP.l1RDtTZ4u', 12, 2, 58, 'active', NULL, '2025-02-26 14:46:04', '2025-03-26 14:54:44'),
(202, 'Jeremy Sandoval', 'jeremysanrub@campus.monlau.com', '$2y$10$vJHQErrELHERc5lUfUUha.bT5WeqyY5SyFP5ghMMGp.5XDniwZ9ta', 12, 2, 58, 'active', NULL, '2025-02-26 14:49:08', '2025-03-24 15:22:20'),
(203, 'Sara González', 'saragoncas@campus.monlau.com', '$2y$10$Ckb7GMTPH9NiKQnfOj07UOK1UNZvfswQs180nv4Eb9gywCg20uU4O', 12, 2, 58, 'active', NULL, '2025-02-26 14:53:06', '2025-04-29 15:47:24'),
(204, 'Ismael', 'ismaelfruhat@campus.monlau.com', '$2y$10$OfzUH19VOYtt0yBA7Csgde/Z//V8DcUpcfdd2WFKudE4kHDCb3f.u', 12, 2, 52, 'active', NULL, '2025-02-26 16:04:26', '2025-02-26 16:08:50'),
(205, 'Daniela Valencia', 'danielavalpaz@campus.monlau.com', '$2y$10$8Mezmqa5XHKRKCXK8X1rKeOip5vticcTbmWd05bcX6zxotOj7wnH2', 12, 2, 27, 'active', NULL, '2025-02-26 16:05:27', '2025-02-26 16:09:34'),
(206, 'Victor Cortés Albaladejo', 'victorcoralb@campus.monlau.com', '$2y$10$mWVvzuSGiZe0EYtgX9rThOafwSk9TzqTwU58n4qu0HvQT3vRiPaDu', 12, 2, 60, 'active', NULL, '2025-02-26 16:05:57', '2025-03-14 11:30:04'),
(207, 'Xavier Atarés Varo', 'xavieratavat@campus.monlau.com', '$2y$10$17f3y2aoHqVlQH1VHWpB4ekfsuj1cPAkliYO46Qui1amrChvR7ydi', 12, 2, NULL, 'active', NULL, '2025-02-26 16:13:55', '2025-02-26 16:35:11'),
(208, 'Xavier Atarés Varo', 'xavieratavar@campus.monlau.com', '$2y$10$gtww..hkx5XxOz173OPF1OfX/9o03fIFIeCooQxUArbbZ7zwwRDNW', 12, 2, 60, 'active', NULL, '2025-02-26 16:16:36', '2025-03-14 11:40:46'),
(209, 'Hugo Pecero Pérez', 'hugopecper@campus.monlau.com', '$2y$10$g0dBEDj0yZ8GOfvuv6NctezKNt87BKNUdABNeeci74yau6UWymNkq', 12, 2, 51, 'active', NULL, '2025-02-26 16:43:16', '2025-03-04 17:58:43'),
(210, 'vadim', 'vadimvov@monlau.com', '$2y$10$fuAmYpyvUoWRZ1a3UN8SbuxoQBUHKy6FXtI7UCJiipgMVh3QaEPZi', 12, 2, 42, 'active', NULL, '2025-02-26 16:43:29', '2025-03-19 15:17:46'),
(211, 'Carla', 'carlacosrei@campus.monlau.com', '$2y$10$ES.1Rox/hR3Mtq48PyzhuO07OQ850A.T2XMKSu6aTNdrlMZY2gkr.', 12, 2, 54, 'active', NULL, '2025-02-26 16:44:01', '2025-03-17 15:31:47'),
(212, 'Yang Li', 'liyan@campus.monlua.com', '$2y$10$WXuWl6p8ciMKPtMhpMZLiONIlWu0FbKtO479LvTyvO5uoI7oE3FBi', 12, 2, NULL, 'active', NULL, '2025-02-26 16:44:08', '2025-02-26 16:44:32'),
(213, 'Núria Sánchez Guitart', 'nuriasangui@campus.monlau.com', '$2y$10$NDpxfh7aJj7Jf.aO2LQsJOSpIWRVS1DNfMGE82tMmKpuIKI2NtaOW', 12, 2, 50, 'active', NULL, '2025-02-26 16:44:09', '2025-02-26 18:02:14'),
(214, 'Lucía Pérez', 'luciapermun@campus.monlau.com', '$2y$10$T1JKF22EWMlx.q2K/kMJHOFSPDS/7Vg9YZswD.P3aYfzCjyV3rOCm', 12, 2, 50, 'active', NULL, '2025-02-26 16:44:19', '2025-02-28 16:00:56'),
(215, 'Gonzalo Quero Burgos', 'gonzaloquebur@campus.monlau.com', '$2y$10$pgsfzFmwtgeVVdUw1cB8aeFCq6zhzVegdz.eS8IwuJrd8hA9y47ta', 12, 2, 32, 'active', NULL, '2025-02-26 16:44:26', '2025-03-04 15:04:08'),
(216, 'Ivet Martinez', 'ivetmarllo@campus.monlau.com', '$2y$10$YiFxZLl7ozUjauSF/R5GHuYIJQBjm2SImnJFGpbrEqb7SEUSzUs.K', 12, 2, 54, 'active', NULL, '2025-02-26 16:44:33', '2025-03-14 18:06:34'),
(217, 'Axel Cabanillas', 'axelcabven@campus.monlau.com', '$2y$10$cBNGh18Vr2j80XwlHn03H.73wXMqL.k8vsSe9brKEitHBiiMZZkyG', 12, 2, 53, 'active', NULL, '2025-02-26 16:44:39', '2025-03-19 17:11:57'),
(218, 'Aleix Aguilera Torres', 'aleixagutor@alumno.monlau.com', '$2y$10$7HmOMEfD5f4cM0jHimgGuOIao0nrKPo7Ri0PPE9/qU5ox2eneSO..', 12, 2, 42, 'active', NULL, '2025-02-26 16:44:51', '2025-04-19 10:35:39'),
(219, 'Liam', 'liamrubtej@campus.monlau.com', '$2y$10$hnJqA4nuwZJ0go.XdfhiM.8XD5xpHm7TtDWfidNq4I/6uFhTtuvne', 12, 2, 45, 'active', NULL, '2025-02-26 16:44:53', '2025-03-04 16:17:12'),
(220, 'Bruno', 'brunoalecar@campus.monlau.com', '$2y$10$xrksJr6sqTE91Gp8NBWqBeIGWqwFSb186y8K3SkcmCSADn2cnufoa', 12, 2, 45, 'active', NULL, '2025-02-26 16:44:54', '2025-03-19 14:53:56'),
(221, 'Paula ', 'paulaloprod@campus.monlau.com', '$2y$10$DGx8vLNjajcmz//.uNoV4O8m4akkAU7iYVO/0rLqpCUx49PSkFXhy', 12, 2, 54, 'active', NULL, '2025-02-26 16:45:09', '2025-03-14 14:49:27'),
(222, 'Valentina Florez', 'valentinaarrflo@campus.monlau.com', '$2y$10$jxxosFfmHgMz5hBETqgic.eU1xe3jg9WRNcI6EXDIrLFC4ROWwzS2', 12, 2, 54, 'active', NULL, '2025-02-26 16:45:17', '2025-03-04 15:06:00'),
(223, 'Marcos Rodriguez', 'marcosrodpal@monlau.com', '$2y$10$n3ntEXw8fLbs7VvJzlo5bOhXg6AWichCv8QGIJkbOTXt4vjX5tBq.', 12, 2, 28, 'active', NULL, '2025-02-26 16:45:30', '2025-02-26 18:08:57'),
(224, 'Yannick', 'yannickbaa@campus.monlau.com', '$2y$10$F13n8QXF3eJ306Jvltx0zuWr80YaJEfd0K4XgDUWUNmeLyf5tsH6u', 12, 2, 50, 'active', NULL, '2025-02-26 16:45:36', '2025-03-04 16:15:14'),
(225, 'Joel Aznar', 'joelazncha@campus.monlau.com', '$2y$10$LVf925tE6Pexgmo/LtZTle5sp.F3JIBJKZc7ZeeU9D556RZ5/sCwy', 12, 2, 28, 'active', NULL, '2025-02-26 16:45:49', '2025-03-04 14:58:01'),
(226, 'Gisela', 'giselagimmur@campus.monlau.com', '$2y$10$CEXrtxuzxjIiyLzMqHgSvejH263QkVrnnID8Ju3YNGn4OYELjiSLK', 12, 2, 32, 'active', NULL, '2025-02-26 16:45:58', '2025-03-04 15:37:24'),
(227, 'Alexis', 'alexisgondim@campus.monlau.com', '$2y$10$7GbJwtVolk/mtdgkEZVZuucmfNDcN2wuopgjbQJTaaHpzNnR31cx6', 12, 2, 51, 'active', NULL, '2025-02-26 16:46:20', '2025-03-19 17:29:34'),
(228, 'Héctor', 'hectorpalcas@campus.monlau.com', '$2y$10$9L33QPrtKCDD4AGlsOr2H.B1obotkOCGwkpn.SN4SRNnYEzgVR0JC', 12, 2, 51, 'active', NULL, '2025-02-26 16:46:25', '2025-03-19 17:43:34'),
(229, 'Oscar Mas', 'oscarmassol@campus.monlau.com', '$2y$10$7KoDXBi8OLZFTaWJ.l78eeN033tgUCra7EXWdYLWI1xaX2qoLtOBe', 12, 2, 28, 'active', NULL, '2025-02-26 16:47:59', '2025-03-19 17:33:57'),
(230, 'Jorge Caballero', 'jorgecabtar@campus.monlau.com', '$2y$10$1OSoPZjeEj6VdTKRM0HyyuPEnibts4hYF2f1H4CtpePVG0FZw6u66', 12, 2, 32, 'active', NULL, '2025-02-27 17:39:44', '2025-03-04 16:52:04'),
(231, 'Marcos Humanes Poderoso', 'marcoshumpod@campus.monlau.com', '$2y$10$Y/msaHEE9AItn/ij.sZso.DxFG.f6XtMRz/Rk9wCgFD4LufSfbPpW', 12, 2, 32, 'active', NULL, '2025-02-27 17:40:01', '2025-03-04 15:21:39'),
(232, 'Andreu', 'andreuholdie@campus.monlau.com', '$2y$10$DODS0IoyY7HCdW35Bhmvq.ITEiRzBV5Na1zkZnB83nkmGltdNwQjC', 12, 2, 26, 'active', NULL, '2025-03-04 17:16:30', '2025-03-10 16:01:02'),
(233, 'ARNAU', 'arnaubargui@campus.monlau.com', '$2y$10$Db2mUWRW5I07InstidTdtOk7NGq/qmbFgcTdDx/i.QlwbXm0CX5I.', 12, 2, NULL, 'pending', NULL, '2025-03-19 17:09:00', '2025-03-19 17:09:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_cart_products`
--

CREATE TABLE `user_cart_products` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `wholesaler_product_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `user_cart_products`
--

INSERT INTO `user_cart_products` (`id`, `user_id`, `product_id`, `wholesaler_product_id`, `amount`) VALUES
(552, 21, 196, NULL, 1),
(553, 21, 200, NULL, 1),
(554, 21, 87, NULL, 1),
(555, 21, 13, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(80) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `usages` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `verification_codes`
--

INSERT INTO `verification_codes` (`id`, `code`, `center_id`, `role_id`, `usages`, `created_at`, `updated_at`) VALUES
(18, '343370', 2, 12, 1, '2024-01-11 14:59:27', '2024-01-11 14:59:27'),
(19, '126815', 2, 12, 1, '2024-01-11 14:59:51', '2024-01-11 14:59:51'),
(23, '217056', 2, 11, 1, '2024-01-11 15:33:57', '2024-01-11 15:33:57'),
(24, '183731', 2, 11, 1, '2024-01-11 15:34:18', '2024-01-11 15:34:18'),
(25, '771701', 3, 11, 1, '2024-01-11 20:30:35', '2024-01-11 20:30:35'),
(26, '954436', 2, 12, 10, '2024-01-23 15:16:28', '2025-02-26 16:16:36'),
(27, '381854', 2, 12, 43, '2024-01-31 17:37:50', '2025-03-04 17:16:30'),
(34, '831329', 2, 11, 4, '2024-02-01 15:15:59', '2025-02-26 09:09:08'),
(37, '429296', 3, 12, 61, '2024-02-07 14:25:05', '2024-02-11 00:21:57'),
(38, '118164', 2, 12, 4, '2025-01-28 15:42:49', '2025-01-28 15:42:49'),
(39, '917121', 2, 12, 1, '2025-02-25 17:03:25', '2025-02-25 17:03:25'),
(40, '729818', 2, 12, 2, '2025-02-25 17:04:19', '2025-02-25 17:04:19'),
(41, '482578', 2, 12, 1, '2025-02-25 17:05:03', '2025-02-25 17:05:03'),
(42, '445731', 2, 12, 28, '2025-02-25 17:05:39', '2025-02-25 17:05:39'),
(43, '489592', 2, 11, 25, '2025-02-26 09:07:06', '2025-02-26 09:07:06'),
(44, '777779', 2, 12, 4, '2025-02-26 13:09:23', '2025-03-19 17:09:00'),
(45, '183762', 2, 12, 2, '2025-02-26 14:53:57', '2025-02-26 14:53:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wholesalers`
--

CREATE TABLE `wholesalers` (
  `id` int(11) NOT NULL,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cif` varchar(100) DEFAULT NULL,
  `social_denomination` varchar(100) DEFAULT NULL,
  `transport` double DEFAULT 0,
  `location` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `icon` longtext DEFAULT NULL,
  `disccount` double DEFAULT 0,
  `payment_days` int(11) DEFAULT 7,
  `country` varchar(100) DEFAULT NULL,
  `tax` int(11) DEFAULT 0,
  `sector_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `wholesalers`
--

INSERT INTO `wholesalers` (`id`, `center_id`, `name`, `cif`, `social_denomination`, `transport`, `location`, `city`, `icon`, `disccount`, `payment_days`, `country`, `tax`, `sector_id`, `created_at`, `updated_at`) VALUES
(3, 2, 'Mariscos Recio', 'G823476234', 'Mariscos Recio S.L', 9.6, 'Contubernio, 49', 'Madrid', 'YiUUGT1Zmt00obUcqk69mn5TWTnABIkvM3wPgHfk.jpg', 0, 7, 'España', 0, NULL, '2023-11-27 15:34:47', '2023-11-27 18:07:37'),
(4, 2, 'Distribuciones Esteso', 'F284958458', 'Distribuciones Esteso S.L', 2.4, 'Plaza la Cazoleta', 'Lima', 'vihAjbaun0sv4hRlTMdGkTIo4pCc75adAXJ81vKQ.jpg', 1.8, 30, 'Perú', 1, NULL, '2023-11-27 15:42:15', '2023-11-27 18:07:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wholesaler_products`
--

CREATE TABLE `wholesaler_products` (
  `id` int(11) NOT NULL,
  `wholesaler_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` double DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `image` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `is_office_related` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Indica si el producto está relacionado con entorno de oficina',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wholesaler_products`
--

INSERT INTO `wholesaler_products` (`id`, `wholesaler_id`, `company_id`, `category_id`, `name`, `reference`, `description`, `price`, `stock`, `image`, `status`, `is_office_related`, `created_at`, `updated_at`) VALUES
(1, 4, 3, NULL, 'dsa', 'dsa', 'dsa', 1, 999998, NULL, 'active', 1, '2025-05-27 19:23:34', '2025-05-27 19:23:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wholesaler_product_categories`
--

CREATE TABLE `wholesaler_product_categories` (
  `id` int(11) NOT NULL,
  `wholesaler_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wholesaler_sector`
--

CREATE TABLE `wholesaler_sector` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sector_name` varchar(100) NOT NULL COMMENT 'Sector o especialización del mayorista',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_announcements_user_id` (`user_id`);

--
-- Indices de la tabla `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_companies_center_id` (`center_id`);

--
-- Indices de la tabla `company_employees`
--
ALTER TABLE `company_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_employees_company_id` (`company_id`),
  ADD KEY `fk_company_employees_user_id` (`user_id`);

--
-- Indices de la tabla `company_market`
--
ALTER TABLE `company_market`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_market_company_id` (`company_id`);

--
-- Indices de la tabla `company_teachers`
--
ALTER TABLE `company_teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_companies_teachers_user_id` (`user_id`),
  ADD KEY `fk_companies_teachers_company_id` (`company_id`);

--
-- Indices de la tabla `company_wholesalers`
--
ALTER TABLE `company_wholesalers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_wholesalers_company_id` (`company_id`),
  ADD KEY `fk_company_wholesalers_wholesaler_id` (`wholesaler_id`);

--
-- Indices de la tabla `delivery_notes`
--
ALTER TABLE `delivery_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_notes_number_unique` (`number`),
  ADD KEY `delivery_notes_order_id_foreign` (`order_id`),
  ADD KEY `delivery_notes_company_id_foreign` (`company_id`),
  ADD KEY `delivery_notes_wholesaler_id_foreign` (`wholesaler_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_number_unique` (`number`),
  ADD KEY `invoices_order_id_foreign` (`order_id`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_wholesaler_id_foreign` (`wholesaler_id`);

--
-- Indices de la tabla `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mails_sender_id_foreign` (`sender_id`);

--
-- Indices de la tabla `mails_users`
--
ALTER TABLE `mails_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mails_users_message_id_foreign` (`message_id`),
  ADD KEY `mails_users_recipient_id_foreign` (`recipient_id`);

--
-- Indices de la tabla `mail_attachments`
--
ALTER TABLE `mail_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_attachments_mail_id_foreign` (`mail_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_seller_company_id` (`seller_company_id`),
  ADD KEY `fk_orders_buyer_company_id` (`buyer_company_id`),
  ADD KEY `fk_orders_user_id` (`user_id`),
  ADD KEY `orders_wholesaler_id_foreign` (`wholesaler_id`);

--
-- Indices de la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_products_order_id` (`order_id`),
  ADD KEY `fk_order_products_product_id` (`product_id`),
  ADD KEY `order_products_wholesaler_product_id_foreign` (`wholesaler_product_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `pending_wholesaler_deliveries`
--
ALTER TABLE `pending_wholesaler_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pending_wholesaler_deliveries_order_id_foreign` (`order_id`),
  ADD KEY `pending_wholesaler_deliveries_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_company_id` (`company_id`),
  ADD KEY `fk_products_category_id` (`category_id`);

--
-- Indices de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_categories_company_id` (`company_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `fk_users_role_id` (`role_id`),
  ADD KEY `fk_users_center_id` (`center_id`);

--
-- Indices de la tabla `user_cart_products`
--
ALTER TABLE `user_cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_cart_products_users_user_id` (`user_id`),
  ADD KEY `fk_user_cart_products_products_product_id` (`product_id`),
  ADD KEY `user_cart_products_wholesaler_product_id_foreign` (`wholesaler_product_id`);

--
-- Indices de la tabla `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_verification_codes_center_id` (`center_id`),
  ADD KEY `fk_verification_codes_role_id` (`role_id`);

--
-- Indices de la tabla `wholesalers`
--
ALTER TABLE `wholesalers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wholesaler_centers_center_id` (`center_id`),
  ADD KEY `wholesalers_sector_id_foreign` (`sector_id`);

--
-- Indices de la tabla `wholesaler_products`
--
ALTER TABLE `wholesaler_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wholesaler_products_wholesaler_id` (`wholesaler_id`),
  ADD KEY `fk_wholesaler_products_category_id` (`category_id`),
  ADD KEY `wholesaler_products_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `wholesaler_product_categories`
--
ALTER TABLE `wholesaler_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wholesaler_product_categories_wholesaler_id` (`wholesaler_id`),
  ADD KEY `fk_wholesaler_product_categories_product_category_id` (`product_category_id`);

--
-- Indices de la tabla `wholesaler_sector`
--
ALTER TABLE `wholesaler_sector`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wholesaler_sector_sector_name_unique` (`sector_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `centers`
--
ALTER TABLE `centers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `company_employees`
--
ALTER TABLE `company_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT de la tabla `company_market`
--
ALTER TABLE `company_market`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `company_teachers`
--
ALTER TABLE `company_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `company_wholesalers`
--
ALTER TABLE `company_wholesalers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `delivery_notes`
--
ALTER TABLE `delivery_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mails_users`
--
ALTER TABLE `mails_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mail_attachments`
--
ALTER TABLE `mail_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT de la tabla `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1104;

--
-- AUTO_INCREMENT de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de la tabla `pending_wholesaler_deliveries`
--
ALTER TABLE `pending_wholesaler_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT de la tabla `user_cart_products`
--
ALTER TABLE `user_cart_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1186;

--
-- AUTO_INCREMENT de la tabla `verification_codes`
--
ALTER TABLE `verification_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `wholesalers`
--
ALTER TABLE `wholesalers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `wholesaler_products`
--
ALTER TABLE `wholesaler_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `wholesaler_product_categories`
--
ALTER TABLE `wholesaler_product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wholesaler_sector`
--
ALTER TABLE `wholesaler_sector`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announcements_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `fk_companies_center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `company_employees`
--
ALTER TABLE `company_employees`
  ADD CONSTRAINT `fk_company_employees_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_company_employees_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `company_market`
--
ALTER TABLE `company_market`
  ADD CONSTRAINT `fk_company_market_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `company_teachers`
--
ALTER TABLE `company_teachers`
  ADD CONSTRAINT `fk_companies_teachers_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_companies_teachers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `company_wholesalers`
--
ALTER TABLE `company_wholesalers`
  ADD CONSTRAINT `fk_company_wholesalers_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_company_wholesalers_wholesaler_id` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesalers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `delivery_notes`
--
ALTER TABLE `delivery_notes`
  ADD CONSTRAINT `delivery_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_notes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_notes_wholesaler_id_foreign` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesalers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_wholesaler_id_foreign` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesalers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mails`
--
ALTER TABLE `mails`
  ADD CONSTRAINT `mails_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mails_users`
--
ALTER TABLE `mails_users`
  ADD CONSTRAINT `mails_users_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `mails` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mails_users_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mail_attachments`
--
ALTER TABLE `mail_attachments`
  ADD CONSTRAINT `mail_attachments_mail_id_foreign` FOREIGN KEY (`mail_id`) REFERENCES `mails` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_buyer_company_id` FOREIGN KEY (`buyer_company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_seller_company_id` FOREIGN KEY (`seller_company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_wholesaler_id_foreign` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesalers` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `fk_order_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_products_wholesaler_product_id_foreign` FOREIGN KEY (`wholesaler_product_id`) REFERENCES `wholesaler_products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pending_wholesaler_deliveries`
--
ALTER TABLE `pending_wholesaler_deliveries`
  ADD CONSTRAINT `pending_wholesaler_deliveries_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pending_wholesaler_deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_products_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `fk_product_categories_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_cart_products`
--
ALTER TABLE `user_cart_products`
  ADD CONSTRAINT `fk_user_cart_products_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_cart_products_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_cart_products_wholesaler_product_id_foreign` FOREIGN KEY (`wholesaler_product_id`) REFERENCES `wholesaler_products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD CONSTRAINT `fk_verification_codes_center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_verification_codes_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `wholesalers`
--
ALTER TABLE `wholesalers`
  ADD CONSTRAINT `fk_wholesaler_centers_center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wholesalers_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `wholesaler_sector` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `wholesaler_products`
--
ALTER TABLE `wholesaler_products`
  ADD CONSTRAINT `fk_wholesaler_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wholesaler_products_wholesaler_id` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesalers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wholesaler_products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `wholesaler_product_categories`
--
ALTER TABLE `wholesaler_product_categories`
  ADD CONSTRAINT `fk_wholesaler_product_categories_product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wholesaler_product_categories_wholesaler_id` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesalers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
