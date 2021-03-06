-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 10, 2015 at 12:03 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `psdg`
--

-- --------------------------------------------------------

--
-- Table structure for table `analisis`
--

CREATE TABLE IF NOT EXISTS `analisis` (
`id` int(11) NOT NULL,
  `nomor_analisis` varchar(12) NOT NULL,
  `jenis_conto` varchar(30) NOT NULL,
  `jumlah_conto` int(11) NOT NULL,
  `lokasi` int(11) DEFAULT NULL,
  `tanggal_terima` date NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `tanggal_analisis` date NOT NULL,
  `tanggal_publish` date NOT NULL,
  `nomor_sertifikat` varchar(30) NOT NULL,
  `id_petugas` varchar(20) DEFAULT NULL COMMENT 'yang menerima',
  `id_lab` varchar(3) NOT NULL,
  `biaya` int(11) DEFAULT NULL,
  `id_pemohon` int(11) DEFAULT NULL,
  `preparasi` tinyint(1) DEFAULT NULL,
  `estimasi_time` int(11) NOT NULL,
  `estimasi_time_delay` int(11) NOT NULL,
  `estimasi_date` date NOT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `tanggal_selesai` datetime NOT NULL,
  `id_analisis_tracking` int(11) NOT NULL,
  `is_cancel` tinyint(4) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id`, `nomor_analisis`, `jenis_conto`, `jumlah_conto`, `lokasi`, `tanggal_terima`, `tanggal_daftar`, `tanggal_analisis`, `tanggal_publish`, `nomor_sertifikat`, `id_petugas`, `id_lab`, `biaya`, `id_pemohon`, `preparasi`, `estimasi_time`, `estimasi_time_delay`, `estimasi_date`, `is_selesai`, `tanggal_selesai`, `id_analisis_tracking`, `is_cancel`, `created_date`, `updated_date`) VALUES
(1, '20150300001', 'Batuan', 10, 164, '2015-08-06', '2015-08-06', '2015-08-06', '2015-08-06', '', '1', 'kml', 970000, 2, 1, 2000700, 0, '2015-08-31', 0, '0000-00-00 00:00:00', 10, 0, '2015-08-06 23:32:07', '2015-08-07 16:33:04'),
(2, '20150300011', 'Batuan', 10, 174, '2015-08-06', '2015-08-06', '2015-08-06', '2015-08-06', '', '1', 'kml', 970000, 2, 1, 2000700, 2000700, '2015-09-23', 0, '0000-00-00 00:00:00', 11, 0, '2015-08-06 23:33:55', '2015-08-07 16:34:13'),
(3, '20150700001', 'Batuan', 10, 187, '2015-08-06', '2015-08-06', '2015-08-06', '2015-08-06', '', '1', 'fmb', 3090000, 5, 1, 1396800, 0, '2015-08-24', 0, '0000-00-00 00:00:00', 3, 0, '2015-08-06 23:35:11', '2015-08-06 16:52:47'),
(4, '20150700011', 'Batubara', 10, 397, '2015-08-07', '2015-08-06', '2015-08-06', '2015-08-06', '', '1', 'fmb', 1715000, 5, 1, 3469500, 1396800, '2015-10-03', 0, '0000-00-00 00:00:00', 4, 0, '2015-08-06 23:35:54', '2015-08-06 16:35:55'),
(6, '20150700021', 'Batubara', 3, 511, '2015-08-07', '2015-08-07', '2015-08-07', '2015-08-07', '', '1', 'kbb', 0, 9, 1, 704700, 0, '2015-08-17', 1, '0000-00-00 00:00:00', 9, 0, '2015-08-07 22:31:12', '2015-08-07 16:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `analisis_parameter`
--

CREATE TABLE IF NOT EXISTS `analisis_parameter` (
`id` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `id_type_analisis_parameter` int(11) NOT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `id_metoda` varchar(11) DEFAULT NULL,
  `basis` varchar(10) DEFAULT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_parameter`
--

INSERT INTO `analisis_parameter` (`id`, `id_analisis`, `id_type_analisis_parameter`, `satuan`, `id_metoda`, `basis`, `harga`) VALUES
(1, 1, 29, NULL, NULL, NULL, 30000),
(2, 1, 30, NULL, NULL, NULL, 60000),
(3, 1, 94, NULL, NULL, NULL, 0),
(4, 1, 93, NULL, NULL, NULL, 0),
(5, 1, 106, NULL, NULL, NULL, 0),
(6, 1, 95, NULL, NULL, NULL, 0),
(7, 1, 7, NULL, NULL, NULL, 75000),
(8, 1, 101, NULL, NULL, NULL, 0),
(9, 1, 96, NULL, NULL, NULL, 0),
(10, 1, 10, NULL, NULL, NULL, 75000),
(11, 1, 97, NULL, NULL, NULL, 0),
(12, 1, 100, NULL, NULL, NULL, 0),
(13, 1, 8, NULL, NULL, NULL, 75000),
(14, 1, 98, NULL, NULL, NULL, 0),
(15, 1, 9, NULL, NULL, NULL, 75000),
(16, 1, 99, NULL, NULL, NULL, 0),
(17, 1, 104, NULL, NULL, NULL, 0),
(18, 1, 102, NULL, NULL, NULL, 0),
(19, 1, 103, NULL, NULL, NULL, 0),
(20, 1, 105, NULL, NULL, NULL, 0),
(21, 1, 14, NULL, NULL, NULL, 0),
(22, 1, 108, NULL, NULL, NULL, 0),
(23, 1, 13, NULL, NULL, NULL, 0),
(24, 1, 12, NULL, NULL, NULL, 0),
(25, 1, 15, NULL, NULL, NULL, 0),
(26, 1, 107, NULL, NULL, NULL, 0),
(27, 1, 6, NULL, NULL, NULL, 25000),
(28, 1, 34, NULL, NULL, NULL, 0),
(29, 1, 79, NULL, NULL, NULL, 0),
(30, 1, 1, NULL, NULL, NULL, 25000),
(31, 1, 81, NULL, NULL, NULL, 0),
(32, 1, 5, NULL, NULL, NULL, 25000),
(33, 1, 82, NULL, NULL, NULL, 0),
(34, 1, 2, NULL, NULL, NULL, 30000),
(35, 1, 3, NULL, NULL, NULL, 30000),
(36, 1, 86, NULL, NULL, NULL, 0),
(37, 1, 85, NULL, NULL, NULL, 0),
(38, 1, 87, NULL, NULL, NULL, 0),
(39, 1, 89, NULL, NULL, NULL, 0),
(40, 1, 88, NULL, NULL, NULL, 0),
(41, 1, 84, NULL, NULL, NULL, 0),
(42, 1, 83, NULL, NULL, NULL, 0),
(43, 1, 80, NULL, NULL, NULL, 0),
(44, 1, 92, NULL, NULL, NULL, 0),
(45, 1, 90, NULL, NULL, NULL, 0),
(46, 1, 91, NULL, NULL, NULL, 0),
(47, 1, 23, NULL, NULL, NULL, 60000),
(48, 1, 28, NULL, NULL, NULL, 60000),
(49, 1, 24, NULL, NULL, NULL, 30000),
(50, 1, 26, NULL, NULL, NULL, 60000),
(51, 1, 25, NULL, NULL, NULL, 175000),
(52, 1, 27, NULL, NULL, NULL, 60000),
(53, 2, 29, 'cal/gr', '82', NULL, 30000),
(54, 2, 30, 'meg%', '78', NULL, 60000),
(55, 2, 94, 'umhos/cm', '80', NULL, 0),
(56, 2, 93, NULL, NULL, NULL, 0),
(57, 2, 106, NULL, NULL, NULL, 0),
(58, 2, 95, NULL, NULL, NULL, 0),
(59, 2, 7, NULL, NULL, NULL, 75000),
(60, 2, 101, NULL, NULL, NULL, 0),
(61, 2, 96, NULL, NULL, NULL, 0),
(62, 2, 10, NULL, NULL, NULL, 75000),
(63, 2, 97, NULL, NULL, NULL, 0),
(64, 2, 100, NULL, NULL, NULL, 0),
(65, 2, 8, NULL, NULL, NULL, 75000),
(66, 2, 98, NULL, NULL, NULL, 0),
(67, 2, 9, NULL, NULL, NULL, 75000),
(68, 2, 99, NULL, NULL, NULL, 0),
(69, 2, 104, NULL, NULL, NULL, 0),
(70, 2, 102, NULL, NULL, NULL, 0),
(71, 2, 103, NULL, NULL, NULL, 0),
(72, 2, 105, NULL, NULL, NULL, 0),
(73, 2, 14, NULL, NULL, NULL, 0),
(74, 2, 108, NULL, NULL, NULL, 0),
(75, 2, 13, NULL, NULL, NULL, 0),
(76, 2, 12, NULL, NULL, NULL, 0),
(77, 2, 15, NULL, NULL, NULL, 0),
(78, 2, 107, NULL, NULL, NULL, 0),
(79, 2, 6, NULL, NULL, NULL, 25000),
(80, 2, 34, NULL, NULL, NULL, 0),
(81, 2, 79, NULL, NULL, NULL, 0),
(82, 2, 1, NULL, NULL, NULL, 25000),
(83, 2, 81, NULL, NULL, NULL, 0),
(84, 2, 5, NULL, NULL, NULL, 25000),
(85, 2, 82, NULL, NULL, NULL, 0),
(86, 2, 2, NULL, NULL, NULL, 30000),
(87, 2, 3, NULL, NULL, NULL, 30000),
(88, 2, 86, NULL, NULL, NULL, 0),
(89, 2, 85, NULL, NULL, NULL, 0),
(90, 2, 87, NULL, NULL, NULL, 0),
(91, 2, 89, NULL, NULL, NULL, 0),
(92, 2, 88, NULL, NULL, NULL, 0),
(93, 2, 84, NULL, NULL, NULL, 0),
(94, 2, 83, NULL, NULL, NULL, 0),
(95, 2, 80, NULL, NULL, NULL, 0),
(96, 2, 92, NULL, NULL, NULL, 0),
(97, 2, 90, NULL, NULL, NULL, 0),
(98, 2, 91, NULL, NULL, NULL, 0),
(99, 2, 23, NULL, NULL, NULL, 60000),
(100, 2, 28, NULL, NULL, NULL, 60000),
(101, 2, 24, NULL, NULL, NULL, 30000),
(102, 2, 26, NULL, NULL, NULL, 60000),
(103, 2, 25, NULL, NULL, NULL, 175000),
(104, 2, 27, NULL, NULL, NULL, 60000),
(115, 6, 179, '%', '76', 'ar', 0),
(116, 6, 170, '%', '-', 'adb', 0),
(117, 6, 171, '%', NULL, 'adb', 0),
(118, 6, 172, '%', NULL, 'adb', 0),
(119, 6, 174, 'cal/gr', '73', 'adb', 0),
(120, 6, 175, '%', NULL, 'adb', 0),
(121, 6, 178, '%', '75', 'ar', 0),
(122, 6, 176, '%', '83', 'adb', 0),
(123, 6, 161, '%', '78', 'daf', 0),
(124, 6, 160, '%', '78', 'daf', 0),
(125, 6, 162, '%', '78', 'daf', 0),
(126, 6, 163, '%', '78', 'daf', 0),
(127, 6, 164, '%', NULL, 'daf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `analisis_tracking`
--

CREATE TABLE IF NOT EXISTS `analisis_tracking` (
`id` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_tracking`
--

INSERT INTO `analisis_tracking` (`id`, `id_analisis`, `id_kegiatan`, `id_petugas`, `created_date`, `updated_date`) VALUES
(1, 1, 1, 1, '2015-08-06 23:32:10', '2015-08-06 16:32:10'),
(2, 2, 1, 1, '2015-08-06 23:33:57', '2015-08-06 16:33:57'),
(3, 3, 1, 1, '2015-08-06 23:35:12', '2015-08-06 16:35:12'),
(4, 4, 1, 1, '2015-08-06 23:35:55', '2015-08-06 16:35:55'),
(6, 6, 1, 1, '2015-08-07 22:31:13', '2015-08-07 15:31:13'),
(7, 6, 9, 2, '2015-08-07 22:43:23', '2015-08-07 15:43:23'),
(8, 6, 12, 2, '2015-08-07 23:29:32', '2015-08-07 16:29:32'),
(9, 6, 13, 1, '2015-08-07 23:30:58', '2015-08-07 16:30:58'),
(10, 1, 9, 1, '2015-08-07 23:33:04', '2015-08-07 16:33:04'),
(11, 2, 9, 1, '2015-08-07 23:34:13', '2015-08-07 16:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `analisis_type_analisis`
--

CREATE TABLE IF NOT EXISTS `analisis_type_analisis` (
`id` int(11) NOT NULL,
  `id_analisis` varchar(12) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `harga` int(11) NOT NULL,
  `is_prepared` tinyint(1) NOT NULL,
  `selesai_preparasi` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_type_analisis`
--

INSERT INTO `analisis_type_analisis` (`id`, `id_analisis`, `id_type_analisis`, `harga`, `is_prepared`, `selesai_preparasi`) VALUES
(1, '1', '32', 0, 0, NULL),
(2, '1', '22', 0, 0, NULL),
(3, '1', '23', 0, 0, NULL),
(4, '1', '21', 0, 0, NULL),
(5, '1', '24', 0, 0, NULL),
(6, '2', '32', 0, 0, NULL),
(7, '2', '22', 0, 0, NULL),
(8, '2', '23', 0, 0, NULL),
(9, '2', '21', 0, 0, NULL),
(10, '2', '24', 0, 0, NULL),
(11, '3', '5', 500000, 0, NULL),
(12, '3', '1', 640000, 0, NULL),
(13, '3', '10', 0, 0, NULL),
(14, '3', '2', 75000, 0, NULL),
(15, '3', '14', 350000, 0, NULL),
(16, '3', '3', 100000, 0, NULL),
(17, '3', '4', 0, 0, NULL),
(18, '3', '7', 515000, 0, NULL),
(19, '3', '6', 300000, 0, NULL),
(20, '3', '9', 610000, 0, NULL),
(21, '4', '5', 500000, 0, NULL),
(22, '4', '1', 640000, 0, NULL),
(23, '4', '4', 0, 0, NULL),
(24, '4', '36', 0, 0, NULL),
(25, '4', '8', 575000, 0, NULL),
(28, '6', '17', 0, 0, NULL),
(29, '6', '19', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('857df1fa0b10227fd3033f356c85776a', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0', 1438965167, 'a:6:{s:9:"user_data";s:0:"";s:11:"logged_user";s:5:"admin";s:11:"logged_name";s:10:"Firmansyah";s:8:"komoditi";s:2:"tu";s:9:"logged_id";s:1:"1";s:9:"user_type";i:2;}'),
('eba67bc2e4eb0ca9bf75330a18d203fd', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0', 1439139742, 'a:6:{s:9:"user_data";s:0:"";s:11:"logged_user";s:5:"admin";s:11:"logged_name";s:10:"Firmansyah";s:8:"komoditi";s:2:"tu";s:9:"logged_id";s:1:"1";s:9:"user_type";i:2;}');

-- --------------------------------------------------------

--
-- Table structure for table `conto`
--

CREATE TABLE IF NOT EXISTS `conto` (
`id` int(11) NOT NULL,
  `nomor_conto` varchar(11) NOT NULL COMMENT '0000-00-00000 <- nomor urut dari nomor analisis',
  `kode_conto` varchar(20) NOT NULL,
  `id_analisis` varchar(12) NOT NULL,
  `tanggal_proses` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nama_batuan` varchar(30) DEFAULT NULL,
  `berat` float NOT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `deskripsi` text,
  `id_petugas` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto`
--

INSERT INTO `conto` (`id`, `nomor_conto`, `kode_conto`, `id_analisis`, `tanggal_proses`, `nama_batuan`, `berat`, `is_selesai`, `deskripsi`, `id_petugas`, `created_date`, `updated_date`) VALUES
(11, '20150700011', '', '4', '2015-08-06 16:38:55', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(12, '20150700012', '', '4', '2015-08-06 16:38:55', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(13, '20150700013', '', '4', '2015-08-06 16:38:55', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(14, '20150700014', '', '4', '2015-08-06 16:38:56', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(15, '20150700015', '', '4', '2015-08-06 16:38:56', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(16, '20150700016', '', '4', '2015-08-06 16:38:56', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(17, '20150700017', '', '4', '2015-08-06 16:38:56', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(18, '20150700018', '', '4', '2015-08-06 16:38:57', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(19, '20150700019', '', '4', '2015-08-06 16:38:57', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(20, '20150700020', '', '4', '2015-08-06 16:38:57', NULL, 0, 0, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(21, '20150700001', 'KML-01', '3', '2015-08-06 16:39:07', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 16:39:07'),
(22, '20150700002', 'KML-02', '3', '2015-08-06 16:39:08', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(23, '20150700003', '', '3', '2015-08-06 16:39:08', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(24, '20150700004', '', '3', '2015-08-06 16:39:09', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(25, '20150700005', '', '3', '2015-08-06 16:39:09', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(26, '20150700006', '', '3', '2015-08-06 16:39:09', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(27, '20150700007', '', '3', '2015-08-06 16:39:10', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(28, '20150700008', '', '3', '2015-08-06 16:39:10', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(29, '20150700009', '', '3', '2015-08-06 16:39:11', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(30, '20150700010', '', '3', '2015-08-06 16:39:11', NULL, 0, 0, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(34, '20150700021', 'DB2 Canisra 11', '6', '2015-08-07 15:31:21', NULL, 0, 1, NULL, 1, '2015-08-07 22:31:21', '2015-08-07 15:31:21'),
(35, '20150700022', 'DB2 Canisra 2', '6', '2015-08-07 15:31:21', NULL, 0, 0, NULL, 1, '2015-08-07 22:31:21', '2015-08-07 15:31:21'),
(36, '20150700023', 'DB1 Canisra 5', '6', '2015-08-07 15:31:22', NULL, 0, 1, NULL, 1, '2015-08-07 22:31:22', '2015-08-07 15:31:22'),
(37, '20150300011', '', '2', '2015-08-07 16:34:32', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:32', '2015-08-07 16:34:32'),
(38, '20150300012', '', '2', '2015-08-07 16:34:34', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:34', '2015-08-07 16:34:34'),
(39, '20150300013', '', '2', '2015-08-07 16:34:36', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:36', '2015-08-07 16:34:36'),
(40, '20150300014', '', '2', '2015-08-07 16:34:38', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:38', '2015-08-07 16:34:38'),
(41, '20150300015', '', '2', '2015-08-07 16:34:40', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:40', '2015-08-07 16:34:40'),
(42, '20150300016', '', '2', '2015-08-07 16:34:43', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:43', '2015-08-07 16:34:43'),
(43, '20150300017', '', '2', '2015-08-07 16:34:45', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:45', '2015-08-07 16:34:45'),
(44, '20150300018', '', '2', '2015-08-07 16:34:47', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:47', '2015-08-07 16:34:47'),
(45, '20150300019', '', '2', '2015-08-07 16:34:49', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:49', '2015-08-07 16:34:49'),
(46, '20150300020', '', '2', '2015-08-07 16:34:51', NULL, 0, 0, NULL, 1, '2015-08-07 23:34:51', '2015-08-07 16:34:51'),
(47, '20150300001', '', '1', '2015-08-07 16:35:32', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:32', '2015-08-07 16:35:32'),
(48, '20150300002', '', '1', '2015-08-07 16:35:34', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:34', '2015-08-07 16:35:34'),
(49, '20150300003', '', '1', '2015-08-07 16:35:36', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:36', '2015-08-07 16:35:36'),
(50, '20150300004', '', '1', '2015-08-07 16:35:38', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:38', '2015-08-07 16:35:38'),
(51, '20150300005', '', '1', '2015-08-07 16:35:40', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:40', '2015-08-07 16:35:40'),
(52, '20150300006', '', '1', '2015-08-07 16:35:42', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:42', '2015-08-07 16:35:42'),
(53, '20150300007', '', '1', '2015-08-07 16:35:44', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:44', '2015-08-07 16:35:45'),
(54, '20150300008', '', '1', '2015-08-07 16:35:47', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:47', '2015-08-07 16:35:47'),
(55, '20150300009', '', '1', '2015-08-07 16:35:49', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:49', '2015-08-07 16:35:49'),
(56, '20150300010', '', '1', '2015-08-07 16:35:51', NULL, 0, 0, NULL, 1, '2015-08-07 23:35:51', '2015-08-07 16:35:51');

-- --------------------------------------------------------

--
-- Table structure for table `conto_detail_fisika`
--

CREATE TABLE IF NOT EXISTS `conto_detail_fisika` (
`id` int(11) NOT NULL,
  `id_conto` int(11) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `foto_1` varchar(100) NOT NULL,
  `foto_2` varchar(100) NOT NULL,
  `deskripsi_1` varchar(255) NOT NULL,
  `deskripsi_2` varchar(255) NOT NULL,
  `nilai` text,
  `d_mikroskopis` text,
  `komposisi` text,
  `id_petugas` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto_detail_fisika`
--

INSERT INTO `conto_detail_fisika` (`id`, `id_conto`, `id_type_analisis`, `foto_1`, `foto_2`, `deskripsi_1`, `deskripsi_2`, `nilai`, `d_mikroskopis`, `komposisi`, `id_petugas`, `created_date`, `updated_date`) VALUES
(1, 11, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(2, 11, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(3, 11, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(4, 11, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(5, 11, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(6, 12, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(7, 12, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(8, 12, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(9, 12, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(10, 12, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(11, 13, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(12, 13, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(13, 13, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:55', '2015-08-06 16:38:55'),
(14, 13, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(15, 13, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(16, 14, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(17, 14, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(18, 14, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(19, 14, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(20, 14, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(21, 15, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(22, 15, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(23, 15, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(24, 15, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(25, 15, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(26, 16, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(27, 16, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(28, 16, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(29, 16, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(30, 16, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(31, 17, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(32, 17, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(33, 17, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:56', '2015-08-06 16:38:56'),
(34, 17, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(35, 17, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(36, 18, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(37, 18, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(38, 18, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(39, 18, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(40, 18, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(41, 19, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(42, 19, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(43, 19, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(44, 19, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(45, 19, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(46, 20, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(47, 20, '36', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(48, 20, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(49, 20, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(50, 20, '8', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:38:57', '2015-08-06 16:38:57'),
(51, 21, '1', '', '', '', '', '{"sm":"17","m":"34","nm":"49","mineral":"4","komposisi_mineral":{"1":{"nama_mineral":"Magnetit","id":"1","sm":"0","m":"0","nm":"0"},"2":{"nama_mineral":"Ilmenit","id":"2","sm":"0","m":"0","nm":"0"},"29":{"nama_mineral":"Hematit","id":"29","sm":"0","m":"0","nm":"0"},"10":{"nama_mineral":"Epidot","id":"10","sm":"0","m":"0","nm":"0"},"6":{"nama_mineral":"Piroksen","id":"6","sm":"0","m":"0","nm":"0"},"30":{"nama_mineral":"Gamet","id":"30","sm":"0","m":"0","nm":"0"},"16":{"nama_mineral":"Pirit","id":"16","sm":"0","m":"0","nm":"0"},"17":{"nama_mineral":"Kalkopirit","id":"17","sm":"0","m":"0","nm":"0"},"3":{"nama_mineral":"Kuarsa","id":"3","sm":"0","m":"0","nm":"0"},"27":{"nama_mineral":"Leukosen","id":"27","sm":"0","m":"0","nm":"0"},"7":{"nama_mineral":"Zirkon","id":"7","sm":"0","m":"0","nm":"0"},"31":{"nama_mineral":"Markasit","id":"31","sm":"0","m":"0","nm":"0"},"32":{"nama_mineral":"Turmalin","id":"32","sm":"0","m":"0","nm":"0"},"33":{"nama_mineral":"Sinabar","id":"33","sm":"0","m":"0","nm":"0"},"41":{"nama_mineral":"Biotit","id":"41","sm":"0","m":"0","nm":"0"},"28":{"nama_mineral":"Rutil","id":"28","sm":"0","m":"0","nm":"0"},"43":{"nama_mineral":"Kasiterit","id":"43","sm":"0","m":"0","nm":"0"},"44":{"nama_mineral":"Apatit","id":"44","sm":"0","m":"0","nm":"0"},"45":{"nama_mineral":"Anatas","id":"45","sm":"0","m":"0","nm":"0"},"26":{"nama_mineral":"Lempung","id":"26","sm":"0","m":"0","nm":"0"},"5":{"nama_mineral":"Oksida Besi","id":"5","sm":"0","m":"0","nm":"0"},"46":{"nama_mineral":"Feldspar","id":"46","sm":"0","m":"0","nm":"0"},"47":{"nama_mineral":"Klorit","id":"47","sm":"0","m":"0","nm":"0"},"48":{"nama_mineral":"Monasit","id":"48","sm":"0","m":"0","nm":"0"},"9":{"nama_mineral":"Mika","id":"9","sm":"0","m":"0","nm":"0"},"8":{"nama_mineral":"Fragmen Batuan","id":"8","sm":"0","m":"0","nm":"0"},"49":{"nama_mineral":"Korundum","id":"49","sm":"0","m":"0","nm":"0"},"42":{"nama_mineral":"Barit","id":"42","sm":"0","m":"0","nm":"0"},"19":{"nama_mineral":"Malakit","id":"19","sm":"0","m":"0","nm":"0"}},"id":"51","id_conto":"21"}', NULL, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 17:01:16'),
(52, 21, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 16:39:07'),
(53, 21, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 16:39:07'),
(54, 21, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 16:39:07'),
(55, 21, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 16:39:07'),
(56, 21, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:07', '2015-08-06 16:39:07'),
(57, 21, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(58, 21, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(59, 21, '7', '', '', '', '', '{"deskripsi":"Isikan Deskripsi","mineral":"4","komposisi_mineral":{"4":{"nama_mineral":"Amfibol","id":"4","nilai":"23","keterangan":"Banyak"},"46":{"nama_mineral":"Feldspar","id":"46","nilai":"23","keterangan":"Sedikit"}},"id":"59","id_conto":"21"}', NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-07 14:35:35'),
(60, 21, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(61, 22, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(62, 22, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(63, 22, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(64, 22, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(65, 22, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(66, 22, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(67, 22, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(68, 22, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(69, 22, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(70, 22, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(71, 23, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(72, 23, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(73, 23, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(74, 23, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(75, 23, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:08', '2015-08-06 16:39:08'),
(76, 23, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(77, 23, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(78, 23, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(79, 23, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(80, 23, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(81, 24, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(82, 24, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(83, 24, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(84, 24, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(85, 24, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(86, 24, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(87, 24, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(88, 24, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(89, 24, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(90, 24, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(91, 25, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(92, 25, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(93, 25, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(94, 25, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(95, 25, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(96, 25, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(97, 25, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(98, 25, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(99, 25, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(100, 25, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:09', '2015-08-06 16:39:09'),
(101, 26, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(102, 26, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(103, 26, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(104, 26, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(105, 26, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(106, 26, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(107, 26, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(108, 26, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(109, 26, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(110, 26, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(111, 27, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(112, 27, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(113, 27, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(114, 27, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(115, 27, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(116, 27, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(117, 27, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(118, 27, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(119, 27, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(120, 27, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(121, 28, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(122, 28, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(123, 28, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:10', '2015-08-06 16:39:10'),
(124, 28, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(125, 28, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(126, 28, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(127, 28, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(128, 28, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(129, 28, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(130, 28, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(131, 29, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(132, 29, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(133, 29, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(134, 29, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(135, 29, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(136, 29, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(137, 29, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(138, 29, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(139, 29, '7', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(140, 29, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(141, 30, '1', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(142, 30, '10', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(143, 30, '14', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(144, 30, '2', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(145, 30, '3', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(146, 30, '4', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(147, 30, '5', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(148, 30, '6', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:11', '2015-08-06 16:39:11'),
(149, 30, '7', '', '', '', '', NULL, NULL, '2', 1, '2015-08-06 23:39:12', '2015-08-07 15:29:07'),
(150, 30, '9', '', '', '', '', NULL, NULL, NULL, 1, '2015-08-06 23:39:12', '2015-08-06 16:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `conto_parameter`
--

CREATE TABLE IF NOT EXISTS `conto_parameter` (
`id` int(11) NOT NULL,
  `id_conto` int(11) NOT NULL,
  `id_analisis_parameter` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `id_metoda` varchar(11) DEFAULT NULL,
  `deskripsi` text
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto_parameter`
--

INSERT INTO `conto_parameter` (`id`, `id_conto`, `id_analisis_parameter`, `nilai`, `satuan`, `id_metoda`, `deskripsi`) VALUES
(1, 31, 105, 0, NULL, NULL, NULL),
(2, 31, 106, 0, NULL, NULL, NULL),
(3, 31, 107, 0, NULL, NULL, NULL),
(4, 31, 108, 0, NULL, NULL, NULL),
(5, 31, 109, 0, NULL, NULL, NULL),
(6, 31, 110, 0, NULL, NULL, NULL),
(7, 31, 111, 0, NULL, NULL, NULL),
(8, 31, 112, 0, NULL, NULL, NULL),
(9, 31, 113, 0, NULL, NULL, NULL),
(10, 31, 114, 0, NULL, NULL, NULL),
(11, 32, 105, 0, NULL, NULL, NULL),
(12, 32, 106, 0, NULL, NULL, NULL),
(13, 32, 107, 0, NULL, NULL, NULL),
(14, 32, 108, 0, NULL, NULL, NULL),
(15, 32, 109, 0, NULL, NULL, NULL),
(16, 32, 110, 0, NULL, NULL, NULL),
(17, 32, 111, 0, NULL, NULL, NULL),
(18, 32, 112, 0, NULL, NULL, NULL),
(19, 32, 113, 0, NULL, NULL, NULL),
(20, 32, 114, 0, NULL, NULL, NULL),
(21, 33, 105, 0, NULL, NULL, NULL),
(22, 33, 106, 0, NULL, NULL, NULL),
(23, 33, 107, 0, NULL, NULL, NULL),
(24, 33, 108, 0, NULL, NULL, NULL),
(25, 33, 109, 0, NULL, NULL, NULL),
(26, 33, 110, 0, NULL, NULL, NULL),
(27, 33, 111, 0, NULL, NULL, NULL),
(28, 33, 112, 0, NULL, NULL, NULL),
(29, 33, 113, 0, NULL, NULL, NULL),
(30, 33, 114, 0, NULL, NULL, NULL),
(31, 34, 115, 22.69, NULL, NULL, NULL),
(32, 34, 116, 3.12, NULL, NULL, NULL),
(33, 34, 117, 11.84, NULL, NULL, NULL),
(34, 34, 118, 3.28, NULL, NULL, NULL),
(35, 34, 119, 539, NULL, NULL, NULL),
(36, 34, 120, 81.76, NULL, NULL, NULL),
(37, 34, 121, 20.2, NULL, NULL, NULL),
(38, 34, 122, 3.29, NULL, NULL, NULL),
(39, 34, 123, 0, NULL, NULL, NULL),
(40, 34, 124, 0, NULL, NULL, NULL),
(41, 34, 125, 0, NULL, NULL, NULL),
(42, 34, 126, 0, NULL, NULL, NULL),
(43, 34, 127, 0, NULL, NULL, NULL),
(44, 35, 115, 0, NULL, NULL, NULL),
(45, 35, 116, 0, NULL, NULL, NULL),
(46, 35, 117, 0, NULL, NULL, NULL),
(47, 35, 118, 0, NULL, NULL, NULL),
(48, 35, 119, 0, NULL, NULL, NULL),
(49, 35, 120, 0, NULL, NULL, NULL),
(50, 35, 121, 0, NULL, NULL, NULL),
(51, 35, 122, 0, NULL, NULL, NULL),
(52, 35, 123, 0, NULL, NULL, NULL),
(53, 35, 124, 0, NULL, NULL, NULL),
(54, 35, 125, 0, NULL, NULL, NULL),
(55, 35, 126, 0, NULL, NULL, NULL),
(56, 35, 127, 0, NULL, NULL, NULL),
(57, 36, 115, 0, NULL, NULL, NULL),
(58, 36, 116, 0, NULL, NULL, NULL),
(59, 36, 117, 44.95, NULL, NULL, NULL),
(60, 36, 118, 0, NULL, NULL, NULL),
(61, 36, 119, 0, NULL, NULL, NULL),
(62, 36, 120, 6.45, NULL, NULL, NULL),
(63, 36, 121, 0, NULL, NULL, NULL),
(64, 36, 122, 0, NULL, NULL, NULL),
(65, 36, 123, 0, NULL, NULL, NULL),
(66, 36, 124, 0, NULL, NULL, NULL),
(67, 36, 125, 1.21, NULL, NULL, NULL),
(68, 36, 126, 0, NULL, NULL, NULL),
(69, 36, 127, 0, NULL, NULL, NULL),
(70, 37, 53, 0, NULL, NULL, NULL),
(71, 37, 54, 0, NULL, NULL, NULL),
(72, 37, 55, 0, NULL, NULL, NULL),
(73, 37, 56, 0, NULL, NULL, NULL),
(74, 37, 57, 0, NULL, NULL, NULL),
(75, 37, 58, 0, NULL, NULL, NULL),
(76, 37, 59, 0, NULL, NULL, NULL),
(77, 37, 60, 0, NULL, NULL, NULL),
(78, 37, 61, 0, NULL, NULL, NULL),
(79, 37, 62, 0, NULL, NULL, NULL),
(80, 37, 63, 0, NULL, NULL, NULL),
(81, 37, 64, 0, NULL, NULL, NULL),
(82, 37, 65, 0, NULL, NULL, NULL),
(83, 37, 66, 0, NULL, NULL, NULL),
(84, 37, 67, 0, NULL, NULL, NULL),
(85, 37, 68, 0, NULL, NULL, NULL),
(86, 37, 69, 0, NULL, NULL, NULL),
(87, 37, 70, 0, NULL, NULL, NULL),
(88, 37, 71, 0, NULL, NULL, NULL),
(89, 37, 72, 0, NULL, NULL, NULL),
(90, 37, 73, 0, NULL, NULL, NULL),
(91, 37, 74, 0, NULL, NULL, NULL),
(92, 37, 75, 0, NULL, NULL, NULL),
(93, 37, 76, 0, NULL, NULL, NULL),
(94, 37, 77, 0, NULL, NULL, NULL),
(95, 37, 78, 0, NULL, NULL, NULL),
(96, 37, 79, 0, NULL, NULL, NULL),
(97, 37, 80, 0, NULL, NULL, NULL),
(98, 37, 81, 0, NULL, NULL, NULL),
(99, 37, 82, 0, NULL, NULL, NULL),
(100, 37, 83, 0, NULL, NULL, NULL),
(101, 37, 84, 0, NULL, NULL, NULL),
(102, 37, 85, 0, NULL, NULL, NULL),
(103, 37, 86, 0, NULL, NULL, NULL),
(104, 37, 87, 0, NULL, NULL, NULL),
(105, 37, 88, 0, NULL, NULL, NULL),
(106, 37, 89, 0, NULL, NULL, NULL),
(107, 37, 90, 0, NULL, NULL, NULL),
(108, 37, 91, 0, NULL, NULL, NULL),
(109, 37, 92, 0, NULL, NULL, NULL),
(110, 37, 93, 0, NULL, NULL, NULL),
(111, 37, 94, 0, NULL, NULL, NULL),
(112, 37, 95, 0, NULL, NULL, NULL),
(113, 37, 96, 0, NULL, NULL, NULL),
(114, 37, 97, 0, NULL, NULL, NULL),
(115, 37, 98, 0, NULL, NULL, NULL),
(116, 37, 99, 0, NULL, NULL, NULL),
(117, 37, 100, 0, NULL, NULL, NULL),
(118, 37, 101, 0, NULL, NULL, NULL),
(119, 37, 102, 0, NULL, NULL, NULL),
(120, 37, 103, 0, NULL, NULL, NULL),
(121, 37, 104, 0, NULL, NULL, NULL),
(122, 38, 53, 0, NULL, NULL, NULL),
(123, 38, 54, 0, NULL, NULL, NULL),
(124, 38, 55, 0, NULL, NULL, NULL),
(125, 38, 56, 0, NULL, NULL, NULL),
(126, 38, 57, 0, NULL, NULL, NULL),
(127, 38, 58, 0, NULL, NULL, NULL),
(128, 38, 59, 0, NULL, NULL, NULL),
(129, 38, 60, 0, NULL, NULL, NULL),
(130, 38, 61, 0, NULL, NULL, NULL),
(131, 38, 62, 0, NULL, NULL, NULL),
(132, 38, 63, 0, NULL, NULL, NULL),
(133, 38, 64, 0, NULL, NULL, NULL),
(134, 38, 65, 0, NULL, NULL, NULL),
(135, 38, 66, 0, NULL, NULL, NULL),
(136, 38, 67, 0, NULL, NULL, NULL),
(137, 38, 68, 0, NULL, NULL, NULL),
(138, 38, 69, 0, NULL, NULL, NULL),
(139, 38, 70, 0, NULL, NULL, NULL),
(140, 38, 71, 0, NULL, NULL, NULL),
(141, 38, 72, 0, NULL, NULL, NULL),
(142, 38, 73, 0, NULL, NULL, NULL),
(143, 38, 74, 0, NULL, NULL, NULL),
(144, 38, 75, 0, NULL, NULL, NULL),
(145, 38, 76, 0, NULL, NULL, NULL),
(146, 38, 77, 0, NULL, NULL, NULL),
(147, 38, 78, 0, NULL, NULL, NULL),
(148, 38, 79, 0, NULL, NULL, NULL),
(149, 38, 80, 0, NULL, NULL, NULL),
(150, 38, 81, 0, NULL, NULL, NULL),
(151, 38, 82, 0, NULL, NULL, NULL),
(152, 38, 83, 0, NULL, NULL, NULL),
(153, 38, 84, 0, NULL, NULL, NULL),
(154, 38, 85, 0, NULL, NULL, NULL),
(155, 38, 86, 0, NULL, NULL, NULL),
(156, 38, 87, 0, NULL, NULL, NULL),
(157, 38, 88, 0, NULL, NULL, NULL),
(158, 38, 89, 0, NULL, NULL, NULL),
(159, 38, 90, 0, NULL, NULL, NULL),
(160, 38, 91, 0, NULL, NULL, NULL),
(161, 38, 92, 0, NULL, NULL, NULL),
(162, 38, 93, 0, NULL, NULL, NULL),
(163, 38, 94, 0, NULL, NULL, NULL),
(164, 38, 95, 0, NULL, NULL, NULL),
(165, 38, 96, 0, NULL, NULL, NULL),
(166, 38, 97, 0, NULL, NULL, NULL),
(167, 38, 98, 0, NULL, NULL, NULL),
(168, 38, 99, 0, NULL, NULL, NULL),
(169, 38, 100, 0, NULL, NULL, NULL),
(170, 38, 101, 0, NULL, NULL, NULL),
(171, 38, 102, 0, NULL, NULL, NULL),
(172, 38, 103, 0, NULL, NULL, NULL),
(173, 38, 104, 0, NULL, NULL, NULL),
(174, 39, 53, 0, NULL, NULL, NULL),
(175, 39, 54, 0, NULL, NULL, NULL),
(176, 39, 55, 0, NULL, NULL, NULL),
(177, 39, 56, 0, NULL, NULL, NULL),
(178, 39, 57, 0, NULL, NULL, NULL),
(179, 39, 58, 0, NULL, NULL, NULL),
(180, 39, 59, 0, NULL, NULL, NULL),
(181, 39, 60, 0, NULL, NULL, NULL),
(182, 39, 61, 0, NULL, NULL, NULL),
(183, 39, 62, 0, NULL, NULL, NULL),
(184, 39, 63, 0, NULL, NULL, NULL),
(185, 39, 64, 0, NULL, NULL, NULL),
(186, 39, 65, 0, NULL, NULL, NULL),
(187, 39, 66, 0, NULL, NULL, NULL),
(188, 39, 67, 0, NULL, NULL, NULL),
(189, 39, 68, 0, NULL, NULL, NULL),
(190, 39, 69, 0, NULL, NULL, NULL),
(191, 39, 70, 0, NULL, NULL, NULL),
(192, 39, 71, 0, NULL, NULL, NULL),
(193, 39, 72, 0, NULL, NULL, NULL),
(194, 39, 73, 0, NULL, NULL, NULL),
(195, 39, 74, 0, NULL, NULL, NULL),
(196, 39, 75, 0, NULL, NULL, NULL),
(197, 39, 76, 0, NULL, NULL, NULL),
(198, 39, 77, 0, NULL, NULL, NULL),
(199, 39, 78, 0, NULL, NULL, NULL),
(200, 39, 79, 0, NULL, NULL, NULL),
(201, 39, 80, 0, NULL, NULL, NULL),
(202, 39, 81, 0, NULL, NULL, NULL),
(203, 39, 82, 0, NULL, NULL, NULL),
(204, 39, 83, 0, NULL, NULL, NULL),
(205, 39, 84, 0, NULL, NULL, NULL),
(206, 39, 85, 0, NULL, NULL, NULL),
(207, 39, 86, 0, NULL, NULL, NULL),
(208, 39, 87, 0, NULL, NULL, NULL),
(209, 39, 88, 0, NULL, NULL, NULL),
(210, 39, 89, 0, NULL, NULL, NULL),
(211, 39, 90, 0, NULL, NULL, NULL),
(212, 39, 91, 0, NULL, NULL, NULL),
(213, 39, 92, 0, NULL, NULL, NULL),
(214, 39, 93, 0, NULL, NULL, NULL),
(215, 39, 94, 0, NULL, NULL, NULL),
(216, 39, 95, 0, NULL, NULL, NULL),
(217, 39, 96, 0, NULL, NULL, NULL),
(218, 39, 97, 0, NULL, NULL, NULL),
(219, 39, 98, 0, NULL, NULL, NULL),
(220, 39, 99, 0, NULL, NULL, NULL),
(221, 39, 100, 0, NULL, NULL, NULL),
(222, 39, 101, 0, NULL, NULL, NULL),
(223, 39, 102, 0, NULL, NULL, NULL),
(224, 39, 103, 0, NULL, NULL, NULL),
(225, 39, 104, 0, NULL, NULL, NULL),
(226, 40, 53, 0, NULL, NULL, NULL),
(227, 40, 54, 0, NULL, NULL, NULL),
(228, 40, 55, 0, NULL, NULL, NULL),
(229, 40, 56, 0, NULL, NULL, NULL),
(230, 40, 57, 0, NULL, NULL, NULL),
(231, 40, 58, 0, NULL, NULL, NULL),
(232, 40, 59, 0, NULL, NULL, NULL),
(233, 40, 60, 0, NULL, NULL, NULL),
(234, 40, 61, 0, NULL, NULL, NULL),
(235, 40, 62, 0, NULL, NULL, NULL),
(236, 40, 63, 0, NULL, NULL, NULL),
(237, 40, 64, 0, NULL, NULL, NULL),
(238, 40, 65, 0, NULL, NULL, NULL),
(239, 40, 66, 0, NULL, NULL, NULL),
(240, 40, 67, 0, NULL, NULL, NULL),
(241, 40, 68, 0, NULL, NULL, NULL),
(242, 40, 69, 0, NULL, NULL, NULL),
(243, 40, 70, 0, NULL, NULL, NULL),
(244, 40, 71, 0, NULL, NULL, NULL),
(245, 40, 72, 0, NULL, NULL, NULL),
(246, 40, 73, 0, NULL, NULL, NULL),
(247, 40, 74, 0, NULL, NULL, NULL),
(248, 40, 75, 0, NULL, NULL, NULL),
(249, 40, 76, 0, NULL, NULL, NULL),
(250, 40, 77, 0, NULL, NULL, NULL),
(251, 40, 78, 0, NULL, NULL, NULL),
(252, 40, 79, 0, NULL, NULL, NULL),
(253, 40, 80, 0, NULL, NULL, NULL),
(254, 40, 81, 0, NULL, NULL, NULL),
(255, 40, 82, 0, NULL, NULL, NULL),
(256, 40, 83, 0, NULL, NULL, NULL),
(257, 40, 84, 0, NULL, NULL, NULL),
(258, 40, 85, 0, NULL, NULL, NULL),
(259, 40, 86, 0, NULL, NULL, NULL),
(260, 40, 87, 0, NULL, NULL, NULL),
(261, 40, 88, 0, NULL, NULL, NULL),
(262, 40, 89, 0, NULL, NULL, NULL),
(263, 40, 90, 0, NULL, NULL, NULL),
(264, 40, 91, 0, NULL, NULL, NULL),
(265, 40, 92, 0, NULL, NULL, NULL),
(266, 40, 93, 0, NULL, NULL, NULL),
(267, 40, 94, 0, NULL, NULL, NULL),
(268, 40, 95, 0, NULL, NULL, NULL),
(269, 40, 96, 0, NULL, NULL, NULL),
(270, 40, 97, 0, NULL, NULL, NULL),
(271, 40, 98, 0, NULL, NULL, NULL),
(272, 40, 99, 0, NULL, NULL, NULL),
(273, 40, 100, 0, NULL, NULL, NULL),
(274, 40, 101, 0, NULL, NULL, NULL),
(275, 40, 102, 0, NULL, NULL, NULL),
(276, 40, 103, 0, NULL, NULL, NULL),
(277, 40, 104, 0, NULL, NULL, NULL),
(278, 41, 53, 0, NULL, NULL, NULL),
(279, 41, 54, 0, NULL, NULL, NULL),
(280, 41, 55, 0, NULL, NULL, NULL),
(281, 41, 56, 0, NULL, NULL, NULL),
(282, 41, 57, 0, NULL, NULL, NULL),
(283, 41, 58, 0, NULL, NULL, NULL),
(284, 41, 59, 0, NULL, NULL, NULL),
(285, 41, 60, 0, NULL, NULL, NULL),
(286, 41, 61, 0, NULL, NULL, NULL),
(287, 41, 62, 0, NULL, NULL, NULL),
(288, 41, 63, 0, NULL, NULL, NULL),
(289, 41, 64, 0, NULL, NULL, NULL),
(290, 41, 65, 0, NULL, NULL, NULL),
(291, 41, 66, 0, NULL, NULL, NULL),
(292, 41, 67, 0, NULL, NULL, NULL),
(293, 41, 68, 0, NULL, NULL, NULL),
(294, 41, 69, 0, NULL, NULL, NULL),
(295, 41, 70, 0, NULL, NULL, NULL),
(296, 41, 71, 0, NULL, NULL, NULL),
(297, 41, 72, 0, NULL, NULL, NULL),
(298, 41, 73, 0, NULL, NULL, NULL),
(299, 41, 74, 0, NULL, NULL, NULL),
(300, 41, 75, 0, NULL, NULL, NULL),
(301, 41, 76, 0, NULL, NULL, NULL),
(302, 41, 77, 0, NULL, NULL, NULL),
(303, 41, 78, 0, NULL, NULL, NULL),
(304, 41, 79, 0, NULL, NULL, NULL),
(305, 41, 80, 0, NULL, NULL, NULL),
(306, 41, 81, 0, NULL, NULL, NULL),
(307, 41, 82, 0, NULL, NULL, NULL),
(308, 41, 83, 0, NULL, NULL, NULL),
(309, 41, 84, 0, NULL, NULL, NULL),
(310, 41, 85, 0, NULL, NULL, NULL),
(311, 41, 86, 0, NULL, NULL, NULL),
(312, 41, 87, 0, NULL, NULL, NULL),
(313, 41, 88, 0, NULL, NULL, NULL),
(314, 41, 89, 0, NULL, NULL, NULL),
(315, 41, 90, 0, NULL, NULL, NULL),
(316, 41, 91, 0, NULL, NULL, NULL),
(317, 41, 92, 0, NULL, NULL, NULL),
(318, 41, 93, 0, NULL, NULL, NULL),
(319, 41, 94, 0, NULL, NULL, NULL),
(320, 41, 95, 0, NULL, NULL, NULL),
(321, 41, 96, 0, NULL, NULL, NULL),
(322, 41, 97, 0, NULL, NULL, NULL),
(323, 41, 98, 0, NULL, NULL, NULL),
(324, 41, 99, 0, NULL, NULL, NULL),
(325, 41, 100, 0, NULL, NULL, NULL),
(326, 41, 101, 0, NULL, NULL, NULL),
(327, 41, 102, 0, NULL, NULL, NULL),
(328, 41, 103, 0, NULL, NULL, NULL),
(329, 41, 104, 0, NULL, NULL, NULL),
(330, 42, 53, 0, NULL, NULL, NULL),
(331, 42, 54, 0, NULL, NULL, NULL),
(332, 42, 55, 0, NULL, NULL, NULL),
(333, 42, 56, 0, NULL, NULL, NULL),
(334, 42, 57, 0, NULL, NULL, NULL),
(335, 42, 58, 0, NULL, NULL, NULL),
(336, 42, 59, 0, NULL, NULL, NULL),
(337, 42, 60, 0, NULL, NULL, NULL),
(338, 42, 61, 0, NULL, NULL, NULL),
(339, 42, 62, 0, NULL, NULL, NULL),
(340, 42, 63, 0, NULL, NULL, NULL),
(341, 42, 64, 0, NULL, NULL, NULL),
(342, 42, 65, 0, NULL, NULL, NULL),
(343, 42, 66, 0, NULL, NULL, NULL),
(344, 42, 67, 0, NULL, NULL, NULL),
(345, 42, 68, 0, NULL, NULL, NULL),
(346, 42, 69, 0, NULL, NULL, NULL),
(347, 42, 70, 0, NULL, NULL, NULL),
(348, 42, 71, 0, NULL, NULL, NULL),
(349, 42, 72, 0, NULL, NULL, NULL),
(350, 42, 73, 0, NULL, NULL, NULL),
(351, 42, 74, 0, NULL, NULL, NULL),
(352, 42, 75, 0, NULL, NULL, NULL),
(353, 42, 76, 0, NULL, NULL, NULL),
(354, 42, 77, 0, NULL, NULL, NULL),
(355, 42, 78, 0, NULL, NULL, NULL),
(356, 42, 79, 0, NULL, NULL, NULL),
(357, 42, 80, 0, NULL, NULL, NULL),
(358, 42, 81, 0, NULL, NULL, NULL),
(359, 42, 82, 0, NULL, NULL, NULL),
(360, 42, 83, 0, NULL, NULL, NULL),
(361, 42, 84, 0, NULL, NULL, NULL),
(362, 42, 85, 0, NULL, NULL, NULL),
(363, 42, 86, 0, NULL, NULL, NULL),
(364, 42, 87, 0, NULL, NULL, NULL),
(365, 42, 88, 0, NULL, NULL, NULL),
(366, 42, 89, 0, NULL, NULL, NULL),
(367, 42, 90, 0, NULL, NULL, NULL),
(368, 42, 91, 0, NULL, NULL, NULL),
(369, 42, 92, 0, NULL, NULL, NULL),
(370, 42, 93, 0, NULL, NULL, NULL),
(371, 42, 94, 0, NULL, NULL, NULL),
(372, 42, 95, 0, NULL, NULL, NULL),
(373, 42, 96, 0, NULL, NULL, NULL),
(374, 42, 97, 0, NULL, NULL, NULL),
(375, 42, 98, 0, NULL, NULL, NULL),
(376, 42, 99, 0, NULL, NULL, NULL),
(377, 42, 100, 0, NULL, NULL, NULL),
(378, 42, 101, 0, NULL, NULL, NULL),
(379, 42, 102, 0, NULL, NULL, NULL),
(380, 42, 103, 0, NULL, NULL, NULL),
(381, 42, 104, 0, NULL, NULL, NULL),
(382, 43, 53, 0, NULL, NULL, NULL),
(383, 43, 54, 0, NULL, NULL, NULL),
(384, 43, 55, 0, NULL, NULL, NULL),
(385, 43, 56, 0, NULL, NULL, NULL),
(386, 43, 57, 0, NULL, NULL, NULL),
(387, 43, 58, 0, NULL, NULL, NULL),
(388, 43, 59, 0, NULL, NULL, NULL),
(389, 43, 60, 0, NULL, NULL, NULL),
(390, 43, 61, 0, NULL, NULL, NULL),
(391, 43, 62, 0, NULL, NULL, NULL),
(392, 43, 63, 0, NULL, NULL, NULL),
(393, 43, 64, 0, NULL, NULL, NULL),
(394, 43, 65, 0, NULL, NULL, NULL),
(395, 43, 66, 0, NULL, NULL, NULL),
(396, 43, 67, 0, NULL, NULL, NULL),
(397, 43, 68, 0, NULL, NULL, NULL),
(398, 43, 69, 0, NULL, NULL, NULL),
(399, 43, 70, 0, NULL, NULL, NULL),
(400, 43, 71, 0, NULL, NULL, NULL),
(401, 43, 72, 0, NULL, NULL, NULL),
(402, 43, 73, 0, NULL, NULL, NULL),
(403, 43, 74, 0, NULL, NULL, NULL),
(404, 43, 75, 0, NULL, NULL, NULL),
(405, 43, 76, 0, NULL, NULL, NULL),
(406, 43, 77, 0, NULL, NULL, NULL),
(407, 43, 78, 0, NULL, NULL, NULL),
(408, 43, 79, 0, NULL, NULL, NULL),
(409, 43, 80, 0, NULL, NULL, NULL),
(410, 43, 81, 0, NULL, NULL, NULL),
(411, 43, 82, 0, NULL, NULL, NULL),
(412, 43, 83, 0, NULL, NULL, NULL),
(413, 43, 84, 0, NULL, NULL, NULL),
(414, 43, 85, 0, NULL, NULL, NULL),
(415, 43, 86, 0, NULL, NULL, NULL),
(416, 43, 87, 0, NULL, NULL, NULL),
(417, 43, 88, 0, NULL, NULL, NULL),
(418, 43, 89, 0, NULL, NULL, NULL),
(419, 43, 90, 0, NULL, NULL, NULL),
(420, 43, 91, 0, NULL, NULL, NULL),
(421, 43, 92, 0, NULL, NULL, NULL),
(422, 43, 93, 0, NULL, NULL, NULL),
(423, 43, 94, 0, NULL, NULL, NULL),
(424, 43, 95, 0, NULL, NULL, NULL),
(425, 43, 96, 0, NULL, NULL, NULL),
(426, 43, 97, 0, NULL, NULL, NULL),
(427, 43, 98, 0, NULL, NULL, NULL),
(428, 43, 99, 0, NULL, NULL, NULL),
(429, 43, 100, 0, NULL, NULL, NULL),
(430, 43, 101, 0, NULL, NULL, NULL),
(431, 43, 102, 0, NULL, NULL, NULL),
(432, 43, 103, 0, NULL, NULL, NULL),
(433, 43, 104, 0, NULL, NULL, NULL),
(434, 44, 53, 0, NULL, NULL, NULL),
(435, 44, 54, 0, NULL, NULL, NULL),
(436, 44, 55, 0, NULL, NULL, NULL),
(437, 44, 56, 0, NULL, NULL, NULL),
(438, 44, 57, 0, NULL, NULL, NULL),
(439, 44, 58, 0, NULL, NULL, NULL),
(440, 44, 59, 0, NULL, NULL, NULL),
(441, 44, 60, 0, NULL, NULL, NULL),
(442, 44, 61, 0, NULL, NULL, NULL),
(443, 44, 62, 0, NULL, NULL, NULL),
(444, 44, 63, 0, NULL, NULL, NULL),
(445, 44, 64, 0, NULL, NULL, NULL),
(446, 44, 65, 0, NULL, NULL, NULL),
(447, 44, 66, 0, NULL, NULL, NULL),
(448, 44, 67, 0, NULL, NULL, NULL),
(449, 44, 68, 0, NULL, NULL, NULL),
(450, 44, 69, 0, NULL, NULL, NULL),
(451, 44, 70, 0, NULL, NULL, NULL),
(452, 44, 71, 0, NULL, NULL, NULL),
(453, 44, 72, 0, NULL, NULL, NULL),
(454, 44, 73, 0, NULL, NULL, NULL),
(455, 44, 74, 0, NULL, NULL, NULL),
(456, 44, 75, 0, NULL, NULL, NULL),
(457, 44, 76, 0, NULL, NULL, NULL),
(458, 44, 77, 0, NULL, NULL, NULL),
(459, 44, 78, 0, NULL, NULL, NULL),
(460, 44, 79, 0, NULL, NULL, NULL),
(461, 44, 80, 0, NULL, NULL, NULL),
(462, 44, 81, 0, NULL, NULL, NULL),
(463, 44, 82, 0, NULL, NULL, NULL),
(464, 44, 83, 0, NULL, NULL, NULL),
(465, 44, 84, 0, NULL, NULL, NULL),
(466, 44, 85, 0, NULL, NULL, NULL),
(467, 44, 86, 0, NULL, NULL, NULL),
(468, 44, 87, 0, NULL, NULL, NULL),
(469, 44, 88, 0, NULL, NULL, NULL),
(470, 44, 89, 0, NULL, NULL, NULL),
(471, 44, 90, 0, NULL, NULL, NULL),
(472, 44, 91, 0, NULL, NULL, NULL),
(473, 44, 92, 0, NULL, NULL, NULL),
(474, 44, 93, 0, NULL, NULL, NULL),
(475, 44, 94, 0, NULL, NULL, NULL),
(476, 44, 95, 0, NULL, NULL, NULL),
(477, 44, 96, 0, NULL, NULL, NULL),
(478, 44, 97, 0, NULL, NULL, NULL),
(479, 44, 98, 0, NULL, NULL, NULL),
(480, 44, 99, 0, NULL, NULL, NULL),
(481, 44, 100, 0, NULL, NULL, NULL),
(482, 44, 101, 0, NULL, NULL, NULL),
(483, 44, 102, 0, NULL, NULL, NULL),
(484, 44, 103, 0, NULL, NULL, NULL),
(485, 44, 104, 0, NULL, NULL, NULL),
(486, 45, 53, 0, NULL, NULL, NULL),
(487, 45, 54, 0, NULL, NULL, NULL),
(488, 45, 55, 0, NULL, NULL, NULL),
(489, 45, 56, 0, NULL, NULL, NULL),
(490, 45, 57, 0, NULL, NULL, NULL),
(491, 45, 58, 0, NULL, NULL, NULL),
(492, 45, 59, 0, NULL, NULL, NULL),
(493, 45, 60, 0, NULL, NULL, NULL),
(494, 45, 61, 0, NULL, NULL, NULL),
(495, 45, 62, 0, NULL, NULL, NULL),
(496, 45, 63, 0, NULL, NULL, NULL),
(497, 45, 64, 0, NULL, NULL, NULL),
(498, 45, 65, 0, NULL, NULL, NULL),
(499, 45, 66, 0, NULL, NULL, NULL),
(500, 45, 67, 0, NULL, NULL, NULL),
(501, 45, 68, 0, NULL, NULL, NULL),
(502, 45, 69, 0, NULL, NULL, NULL),
(503, 45, 70, 0, NULL, NULL, NULL),
(504, 45, 71, 0, NULL, NULL, NULL),
(505, 45, 72, 0, NULL, NULL, NULL),
(506, 45, 73, 0, NULL, NULL, NULL),
(507, 45, 74, 0, NULL, NULL, NULL),
(508, 45, 75, 0, NULL, NULL, NULL),
(509, 45, 76, 0, NULL, NULL, NULL),
(510, 45, 77, 0, NULL, NULL, NULL),
(511, 45, 78, 0, NULL, NULL, NULL),
(512, 45, 79, 0, NULL, NULL, NULL),
(513, 45, 80, 0, NULL, NULL, NULL),
(514, 45, 81, 0, NULL, NULL, NULL),
(515, 45, 82, 0, NULL, NULL, NULL),
(516, 45, 83, 0, NULL, NULL, NULL),
(517, 45, 84, 0, NULL, NULL, NULL),
(518, 45, 85, 0, NULL, NULL, NULL),
(519, 45, 86, 0, NULL, NULL, NULL),
(520, 45, 87, 0, NULL, NULL, NULL),
(521, 45, 88, 0, NULL, NULL, NULL),
(522, 45, 89, 0, NULL, NULL, NULL),
(523, 45, 90, 0, NULL, NULL, NULL),
(524, 45, 91, 0, NULL, NULL, NULL),
(525, 45, 92, 0, NULL, NULL, NULL),
(526, 45, 93, 0, NULL, NULL, NULL),
(527, 45, 94, 0, NULL, NULL, NULL),
(528, 45, 95, 0, NULL, NULL, NULL),
(529, 45, 96, 0, NULL, NULL, NULL),
(530, 45, 97, 0, NULL, NULL, NULL),
(531, 45, 98, 0, NULL, NULL, NULL),
(532, 45, 99, 0, NULL, NULL, NULL),
(533, 45, 100, 0, NULL, NULL, NULL),
(534, 45, 101, 0, NULL, NULL, NULL),
(535, 45, 102, 0, NULL, NULL, NULL),
(536, 45, 103, 0, NULL, NULL, NULL),
(537, 45, 104, 0, NULL, NULL, NULL),
(538, 46, 53, 0, NULL, NULL, NULL),
(539, 46, 54, 0, NULL, NULL, NULL),
(540, 46, 55, 0, NULL, NULL, NULL),
(541, 46, 56, 0, NULL, NULL, NULL),
(542, 46, 57, 0, NULL, NULL, NULL),
(543, 46, 58, 0, NULL, NULL, NULL),
(544, 46, 59, 0, NULL, NULL, NULL),
(545, 46, 60, 0, NULL, NULL, NULL),
(546, 46, 61, 0, NULL, NULL, NULL),
(547, 46, 62, 0, NULL, NULL, NULL),
(548, 46, 63, 0, NULL, NULL, NULL),
(549, 46, 64, 0, NULL, NULL, NULL),
(550, 46, 65, 0, NULL, NULL, NULL),
(551, 46, 66, 0, NULL, NULL, NULL),
(552, 46, 67, 0, NULL, NULL, NULL),
(553, 46, 68, 0, NULL, NULL, NULL),
(554, 46, 69, 0, NULL, NULL, NULL),
(555, 46, 70, 0, NULL, NULL, NULL),
(556, 46, 71, 0, NULL, NULL, NULL),
(557, 46, 72, 0, NULL, NULL, NULL),
(558, 46, 73, 0, NULL, NULL, NULL),
(559, 46, 74, 0, NULL, NULL, NULL),
(560, 46, 75, 0, NULL, NULL, NULL),
(561, 46, 76, 0, NULL, NULL, NULL),
(562, 46, 77, 0, NULL, NULL, NULL),
(563, 46, 78, 0, NULL, NULL, NULL),
(564, 46, 79, 0, NULL, NULL, NULL),
(565, 46, 80, 0, NULL, NULL, NULL),
(566, 46, 81, 0, NULL, NULL, NULL),
(567, 46, 82, 0, NULL, NULL, NULL),
(568, 46, 83, 0, NULL, NULL, NULL),
(569, 46, 84, 0, NULL, NULL, NULL),
(570, 46, 85, 0, NULL, NULL, NULL),
(571, 46, 86, 0, NULL, NULL, NULL),
(572, 46, 87, 0, NULL, NULL, NULL),
(573, 46, 88, 0, NULL, NULL, NULL),
(574, 46, 89, 0, NULL, NULL, NULL),
(575, 46, 90, 0, NULL, NULL, NULL),
(576, 46, 91, 0, NULL, NULL, NULL),
(577, 46, 92, 0, NULL, NULL, NULL),
(578, 46, 93, 0, NULL, NULL, NULL),
(579, 46, 94, 0, NULL, NULL, NULL),
(580, 46, 95, 0, NULL, NULL, NULL),
(581, 46, 96, 0, NULL, NULL, NULL),
(582, 46, 97, 0, NULL, NULL, NULL),
(583, 46, 98, 0, NULL, NULL, NULL),
(584, 46, 99, 0, NULL, NULL, NULL),
(585, 46, 100, 0, NULL, NULL, NULL),
(586, 46, 101, 0, NULL, NULL, NULL),
(587, 46, 102, 0, NULL, NULL, NULL),
(588, 46, 103, 0, NULL, NULL, NULL),
(589, 46, 104, 0, NULL, NULL, NULL),
(590, 47, 1, 0, NULL, NULL, NULL),
(591, 47, 2, 0, NULL, NULL, NULL),
(592, 47, 3, 0, NULL, NULL, NULL),
(593, 47, 4, 0, NULL, NULL, NULL),
(594, 47, 5, 0, NULL, NULL, NULL),
(595, 47, 6, 0, NULL, NULL, NULL),
(596, 47, 7, 0, NULL, NULL, NULL),
(597, 47, 8, 0, NULL, NULL, NULL),
(598, 47, 9, 0, NULL, NULL, NULL),
(599, 47, 10, 0, NULL, NULL, NULL),
(600, 47, 11, 0, NULL, NULL, NULL),
(601, 47, 12, 0, NULL, NULL, NULL),
(602, 47, 13, 0, NULL, NULL, NULL),
(603, 47, 14, 0, NULL, NULL, NULL),
(604, 47, 15, 0, NULL, NULL, NULL),
(605, 47, 16, 0, NULL, NULL, NULL),
(606, 47, 17, 0, NULL, NULL, NULL),
(607, 47, 18, 0, NULL, NULL, NULL),
(608, 47, 19, 0, NULL, NULL, NULL),
(609, 47, 20, 0, NULL, NULL, NULL),
(610, 47, 21, 0, NULL, NULL, NULL),
(611, 47, 22, 0, NULL, NULL, NULL),
(612, 47, 23, 0, NULL, NULL, NULL),
(613, 47, 24, 0, NULL, NULL, NULL),
(614, 47, 25, 0, NULL, NULL, NULL),
(615, 47, 26, 0, NULL, NULL, NULL),
(616, 47, 27, 0, NULL, NULL, NULL),
(617, 47, 28, 0, NULL, NULL, NULL),
(618, 47, 29, 0, NULL, NULL, NULL),
(619, 47, 30, 0, NULL, NULL, NULL),
(620, 47, 31, 0, NULL, NULL, NULL),
(621, 47, 32, 0, NULL, NULL, NULL),
(622, 47, 33, 0, NULL, NULL, NULL),
(623, 47, 34, 0, NULL, NULL, NULL),
(624, 47, 35, 0, NULL, NULL, NULL),
(625, 47, 36, 0, NULL, NULL, NULL),
(626, 47, 37, 0, NULL, NULL, NULL),
(627, 47, 38, 0, NULL, NULL, NULL),
(628, 47, 39, 0, NULL, NULL, NULL),
(629, 47, 40, 0, NULL, NULL, NULL),
(630, 47, 41, 0, NULL, NULL, NULL),
(631, 47, 42, 0, NULL, NULL, NULL),
(632, 47, 43, 0, NULL, NULL, NULL),
(633, 47, 44, 0, NULL, NULL, NULL),
(634, 47, 45, 0, NULL, NULL, NULL),
(635, 47, 46, 0, NULL, NULL, NULL),
(636, 47, 47, 0, NULL, NULL, NULL),
(637, 47, 48, 0, NULL, NULL, NULL),
(638, 47, 49, 0, NULL, NULL, NULL),
(639, 47, 50, 0, NULL, NULL, NULL),
(640, 47, 51, 0, NULL, NULL, NULL),
(641, 47, 52, 0, NULL, NULL, NULL),
(642, 48, 1, 0, NULL, NULL, NULL),
(643, 48, 2, 0, NULL, NULL, NULL),
(644, 48, 3, 0, NULL, NULL, NULL),
(645, 48, 4, 0, NULL, NULL, NULL),
(646, 48, 5, 0, NULL, NULL, NULL),
(647, 48, 6, 0, NULL, NULL, NULL),
(648, 48, 7, 0, NULL, NULL, NULL),
(649, 48, 8, 0, NULL, NULL, NULL),
(650, 48, 9, 0, NULL, NULL, NULL),
(651, 48, 10, 0, NULL, NULL, NULL),
(652, 48, 11, 0, NULL, NULL, NULL),
(653, 48, 12, 0, NULL, NULL, NULL),
(654, 48, 13, 0, NULL, NULL, NULL),
(655, 48, 14, 0, NULL, NULL, NULL),
(656, 48, 15, 0, NULL, NULL, NULL),
(657, 48, 16, 0, NULL, NULL, NULL),
(658, 48, 17, 0, NULL, NULL, NULL),
(659, 48, 18, 0, NULL, NULL, NULL),
(660, 48, 19, 0, NULL, NULL, NULL),
(661, 48, 20, 0, NULL, NULL, NULL),
(662, 48, 21, 0, NULL, NULL, NULL),
(663, 48, 22, 0, NULL, NULL, NULL),
(664, 48, 23, 0, NULL, NULL, NULL),
(665, 48, 24, 0, NULL, NULL, NULL),
(666, 48, 25, 0, NULL, NULL, NULL),
(667, 48, 26, 0, NULL, NULL, NULL),
(668, 48, 27, 0, NULL, NULL, NULL),
(669, 48, 28, 0, NULL, NULL, NULL),
(670, 48, 29, 0, NULL, NULL, NULL),
(671, 48, 30, 0, NULL, NULL, NULL),
(672, 48, 31, 0, NULL, NULL, NULL),
(673, 48, 32, 0, NULL, NULL, NULL),
(674, 48, 33, 0, NULL, NULL, NULL),
(675, 48, 34, 0, NULL, NULL, NULL),
(676, 48, 35, 0, NULL, NULL, NULL),
(677, 48, 36, 0, NULL, NULL, NULL),
(678, 48, 37, 0, NULL, NULL, NULL),
(679, 48, 38, 0, NULL, NULL, NULL),
(680, 48, 39, 0, NULL, NULL, NULL),
(681, 48, 40, 0, NULL, NULL, NULL),
(682, 48, 41, 0, NULL, NULL, NULL),
(683, 48, 42, 0, NULL, NULL, NULL),
(684, 48, 43, 0, NULL, NULL, NULL),
(685, 48, 44, 0, NULL, NULL, NULL),
(686, 48, 45, 0, NULL, NULL, NULL),
(687, 48, 46, 0, NULL, NULL, NULL),
(688, 48, 47, 0, NULL, NULL, NULL),
(689, 48, 48, 0, NULL, NULL, NULL),
(690, 48, 49, 0, NULL, NULL, NULL),
(691, 48, 50, 0, NULL, NULL, NULL),
(692, 48, 51, 0, NULL, NULL, NULL),
(693, 48, 52, 0, NULL, NULL, NULL),
(694, 49, 1, 0, NULL, NULL, NULL),
(695, 49, 2, 0, NULL, NULL, NULL),
(696, 49, 3, 0, NULL, NULL, NULL),
(697, 49, 4, 0, NULL, NULL, NULL),
(698, 49, 5, 0, NULL, NULL, NULL),
(699, 49, 6, 0, NULL, NULL, NULL),
(700, 49, 7, 0, NULL, NULL, NULL),
(701, 49, 8, 0, NULL, NULL, NULL),
(702, 49, 9, 0, NULL, NULL, NULL),
(703, 49, 10, 0, NULL, NULL, NULL),
(704, 49, 11, 0, NULL, NULL, NULL),
(705, 49, 12, 0, NULL, NULL, NULL),
(706, 49, 13, 0, NULL, NULL, NULL),
(707, 49, 14, 0, NULL, NULL, NULL),
(708, 49, 15, 0, NULL, NULL, NULL),
(709, 49, 16, 0, NULL, NULL, NULL),
(710, 49, 17, 0, NULL, NULL, NULL),
(711, 49, 18, 0, NULL, NULL, NULL),
(712, 49, 19, 0, NULL, NULL, NULL),
(713, 49, 20, 0, NULL, NULL, NULL),
(714, 49, 21, 0, NULL, NULL, NULL),
(715, 49, 22, 0, NULL, NULL, NULL),
(716, 49, 23, 0, NULL, NULL, NULL),
(717, 49, 24, 0, NULL, NULL, NULL),
(718, 49, 25, 0, NULL, NULL, NULL),
(719, 49, 26, 0, NULL, NULL, NULL),
(720, 49, 27, 0, NULL, NULL, NULL),
(721, 49, 28, 0, NULL, NULL, NULL),
(722, 49, 29, 0, NULL, NULL, NULL),
(723, 49, 30, 0, NULL, NULL, NULL),
(724, 49, 31, 0, NULL, NULL, NULL),
(725, 49, 32, 0, NULL, NULL, NULL),
(726, 49, 33, 0, NULL, NULL, NULL),
(727, 49, 34, 0, NULL, NULL, NULL),
(728, 49, 35, 0, NULL, NULL, NULL),
(729, 49, 36, 0, NULL, NULL, NULL),
(730, 49, 37, 0, NULL, NULL, NULL),
(731, 49, 38, 0, NULL, NULL, NULL),
(732, 49, 39, 0, NULL, NULL, NULL),
(733, 49, 40, 0, NULL, NULL, NULL),
(734, 49, 41, 0, NULL, NULL, NULL),
(735, 49, 42, 0, NULL, NULL, NULL),
(736, 49, 43, 0, NULL, NULL, NULL),
(737, 49, 44, 0, NULL, NULL, NULL),
(738, 49, 45, 0, NULL, NULL, NULL),
(739, 49, 46, 0, NULL, NULL, NULL),
(740, 49, 47, 0, NULL, NULL, NULL),
(741, 49, 48, 0, NULL, NULL, NULL),
(742, 49, 49, 0, NULL, NULL, NULL),
(743, 49, 50, 0, NULL, NULL, NULL),
(744, 49, 51, 0, NULL, NULL, NULL),
(745, 49, 52, 0, NULL, NULL, NULL),
(746, 50, 1, 0, NULL, NULL, NULL),
(747, 50, 2, 0, NULL, NULL, NULL),
(748, 50, 3, 0, NULL, NULL, NULL),
(749, 50, 4, 0, NULL, NULL, NULL),
(750, 50, 5, 0, NULL, NULL, NULL),
(751, 50, 6, 0, NULL, NULL, NULL),
(752, 50, 7, 0, NULL, NULL, NULL),
(753, 50, 8, 0, NULL, NULL, NULL),
(754, 50, 9, 0, NULL, NULL, NULL),
(755, 50, 10, 0, NULL, NULL, NULL),
(756, 50, 11, 0, NULL, NULL, NULL),
(757, 50, 12, 0, NULL, NULL, NULL),
(758, 50, 13, 0, NULL, NULL, NULL),
(759, 50, 14, 0, NULL, NULL, NULL),
(760, 50, 15, 0, NULL, NULL, NULL),
(761, 50, 16, 0, NULL, NULL, NULL),
(762, 50, 17, 0, NULL, NULL, NULL),
(763, 50, 18, 0, NULL, NULL, NULL),
(764, 50, 19, 0, NULL, NULL, NULL),
(765, 50, 20, 0, NULL, NULL, NULL),
(766, 50, 21, 0, NULL, NULL, NULL),
(767, 50, 22, 0, NULL, NULL, NULL),
(768, 50, 23, 0, NULL, NULL, NULL),
(769, 50, 24, 0, NULL, NULL, NULL),
(770, 50, 25, 0, NULL, NULL, NULL),
(771, 50, 26, 0, NULL, NULL, NULL),
(772, 50, 27, 0, NULL, NULL, NULL),
(773, 50, 28, 0, NULL, NULL, NULL),
(774, 50, 29, 0, NULL, NULL, NULL),
(775, 50, 30, 0, NULL, NULL, NULL),
(776, 50, 31, 0, NULL, NULL, NULL),
(777, 50, 32, 0, NULL, NULL, NULL),
(778, 50, 33, 0, NULL, NULL, NULL),
(779, 50, 34, 0, NULL, NULL, NULL),
(780, 50, 35, 0, NULL, NULL, NULL),
(781, 50, 36, 0, NULL, NULL, NULL),
(782, 50, 37, 0, NULL, NULL, NULL),
(783, 50, 38, 0, NULL, NULL, NULL),
(784, 50, 39, 0, NULL, NULL, NULL),
(785, 50, 40, 0, NULL, NULL, NULL),
(786, 50, 41, 0, NULL, NULL, NULL),
(787, 50, 42, 0, NULL, NULL, NULL),
(788, 50, 43, 0, NULL, NULL, NULL),
(789, 50, 44, 0, NULL, NULL, NULL),
(790, 50, 45, 0, NULL, NULL, NULL),
(791, 50, 46, 0, NULL, NULL, NULL),
(792, 50, 47, 0, NULL, NULL, NULL),
(793, 50, 48, 0, NULL, NULL, NULL),
(794, 50, 49, 0, NULL, NULL, NULL),
(795, 50, 50, 0, NULL, NULL, NULL),
(796, 50, 51, 0, NULL, NULL, NULL),
(797, 50, 52, 0, NULL, NULL, NULL),
(798, 51, 1, 0, NULL, NULL, NULL),
(799, 51, 2, 0, NULL, NULL, NULL),
(800, 51, 3, 0, NULL, NULL, NULL),
(801, 51, 4, 0, NULL, NULL, NULL),
(802, 51, 5, 0, NULL, NULL, NULL),
(803, 51, 6, 0, NULL, NULL, NULL),
(804, 51, 7, 0, NULL, NULL, NULL),
(805, 51, 8, 0, NULL, NULL, NULL),
(806, 51, 9, 0, NULL, NULL, NULL),
(807, 51, 10, 0, NULL, NULL, NULL),
(808, 51, 11, 0, NULL, NULL, NULL),
(809, 51, 12, 0, NULL, NULL, NULL),
(810, 51, 13, 0, NULL, NULL, NULL),
(811, 51, 14, 0, NULL, NULL, NULL),
(812, 51, 15, 0, NULL, NULL, NULL),
(813, 51, 16, 0, NULL, NULL, NULL),
(814, 51, 17, 0, NULL, NULL, NULL),
(815, 51, 18, 0, NULL, NULL, NULL),
(816, 51, 19, 0, NULL, NULL, NULL),
(817, 51, 20, 0, NULL, NULL, NULL),
(818, 51, 21, 0, NULL, NULL, NULL),
(819, 51, 22, 0, NULL, NULL, NULL),
(820, 51, 23, 0, NULL, NULL, NULL),
(821, 51, 24, 0, NULL, NULL, NULL),
(822, 51, 25, 0, NULL, NULL, NULL),
(823, 51, 26, 0, NULL, NULL, NULL),
(824, 51, 27, 0, NULL, NULL, NULL),
(825, 51, 28, 0, NULL, NULL, NULL),
(826, 51, 29, 0, NULL, NULL, NULL),
(827, 51, 30, 0, NULL, NULL, NULL),
(828, 51, 31, 0, NULL, NULL, NULL),
(829, 51, 32, 0, NULL, NULL, NULL),
(830, 51, 33, 0, NULL, NULL, NULL),
(831, 51, 34, 0, NULL, NULL, NULL),
(832, 51, 35, 0, NULL, NULL, NULL),
(833, 51, 36, 0, NULL, NULL, NULL),
(834, 51, 37, 0, NULL, NULL, NULL),
(835, 51, 38, 0, NULL, NULL, NULL),
(836, 51, 39, 0, NULL, NULL, NULL),
(837, 51, 40, 0, NULL, NULL, NULL),
(838, 51, 41, 0, NULL, NULL, NULL),
(839, 51, 42, 0, NULL, NULL, NULL),
(840, 51, 43, 0, NULL, NULL, NULL),
(841, 51, 44, 0, NULL, NULL, NULL),
(842, 51, 45, 0, NULL, NULL, NULL),
(843, 51, 46, 0, NULL, NULL, NULL),
(844, 51, 47, 0, NULL, NULL, NULL),
(845, 51, 48, 0, NULL, NULL, NULL),
(846, 51, 49, 0, NULL, NULL, NULL),
(847, 51, 50, 0, NULL, NULL, NULL),
(848, 51, 51, 0, NULL, NULL, NULL),
(849, 51, 52, 0, NULL, NULL, NULL),
(850, 52, 1, 0, NULL, NULL, NULL),
(851, 52, 2, 0, NULL, NULL, NULL),
(852, 52, 3, 0, NULL, NULL, NULL),
(853, 52, 4, 0, NULL, NULL, NULL),
(854, 52, 5, 0, NULL, NULL, NULL),
(855, 52, 6, 0, NULL, NULL, NULL),
(856, 52, 7, 0, NULL, NULL, NULL),
(857, 52, 8, 0, NULL, NULL, NULL),
(858, 52, 9, 0, NULL, NULL, NULL),
(859, 52, 10, 0, NULL, NULL, NULL),
(860, 52, 11, 0, NULL, NULL, NULL),
(861, 52, 12, 0, NULL, NULL, NULL),
(862, 52, 13, 0, NULL, NULL, NULL),
(863, 52, 14, 0, NULL, NULL, NULL),
(864, 52, 15, 0, NULL, NULL, NULL),
(865, 52, 16, 0, NULL, NULL, NULL),
(866, 52, 17, 0, NULL, NULL, NULL),
(867, 52, 18, 0, NULL, NULL, NULL),
(868, 52, 19, 0, NULL, NULL, NULL),
(869, 52, 20, 0, NULL, NULL, NULL),
(870, 52, 21, 0, NULL, NULL, NULL),
(871, 52, 22, 0, NULL, NULL, NULL),
(872, 52, 23, 0, NULL, NULL, NULL),
(873, 52, 24, 0, NULL, NULL, NULL),
(874, 52, 25, 0, NULL, NULL, NULL),
(875, 52, 26, 0, NULL, NULL, NULL),
(876, 52, 27, 0, NULL, NULL, NULL),
(877, 52, 28, 0, NULL, NULL, NULL),
(878, 52, 29, 0, NULL, NULL, NULL),
(879, 52, 30, 0, NULL, NULL, NULL),
(880, 52, 31, 0, NULL, NULL, NULL),
(881, 52, 32, 0, NULL, NULL, NULL),
(882, 52, 33, 0, NULL, NULL, NULL),
(883, 52, 34, 0, NULL, NULL, NULL),
(884, 52, 35, 0, NULL, NULL, NULL),
(885, 52, 36, 0, NULL, NULL, NULL),
(886, 52, 37, 0, NULL, NULL, NULL),
(887, 52, 38, 0, NULL, NULL, NULL),
(888, 52, 39, 0, NULL, NULL, NULL),
(889, 52, 40, 0, NULL, NULL, NULL),
(890, 52, 41, 0, NULL, NULL, NULL),
(891, 52, 42, 0, NULL, NULL, NULL),
(892, 52, 43, 0, NULL, NULL, NULL),
(893, 52, 44, 0, NULL, NULL, NULL),
(894, 52, 45, 0, NULL, NULL, NULL),
(895, 52, 46, 0, NULL, NULL, NULL),
(896, 52, 47, 0, NULL, NULL, NULL),
(897, 52, 48, 0, NULL, NULL, NULL),
(898, 52, 49, 0, NULL, NULL, NULL),
(899, 52, 50, 0, NULL, NULL, NULL),
(900, 52, 51, 0, NULL, NULL, NULL),
(901, 52, 52, 0, NULL, NULL, NULL),
(902, 53, 1, 0, NULL, NULL, NULL),
(903, 53, 2, 0, NULL, NULL, NULL),
(904, 53, 3, 0, NULL, NULL, NULL),
(905, 53, 4, 0, NULL, NULL, NULL),
(906, 53, 5, 0, NULL, NULL, NULL),
(907, 53, 6, 0, NULL, NULL, NULL),
(908, 53, 7, 0, NULL, NULL, NULL),
(909, 53, 8, 0, NULL, NULL, NULL),
(910, 53, 9, 0, NULL, NULL, NULL),
(911, 53, 10, 0, NULL, NULL, NULL),
(912, 53, 11, 0, NULL, NULL, NULL),
(913, 53, 12, 0, NULL, NULL, NULL),
(914, 53, 13, 0, NULL, NULL, NULL),
(915, 53, 14, 0, NULL, NULL, NULL),
(916, 53, 15, 0, NULL, NULL, NULL),
(917, 53, 16, 0, NULL, NULL, NULL),
(918, 53, 17, 0, NULL, NULL, NULL),
(919, 53, 18, 0, NULL, NULL, NULL),
(920, 53, 19, 0, NULL, NULL, NULL),
(921, 53, 20, 0, NULL, NULL, NULL),
(922, 53, 21, 0, NULL, NULL, NULL),
(923, 53, 22, 0, NULL, NULL, NULL),
(924, 53, 23, 0, NULL, NULL, NULL),
(925, 53, 24, 0, NULL, NULL, NULL),
(926, 53, 25, 0, NULL, NULL, NULL),
(927, 53, 26, 0, NULL, NULL, NULL),
(928, 53, 27, 0, NULL, NULL, NULL),
(929, 53, 28, 0, NULL, NULL, NULL),
(930, 53, 29, 0, NULL, NULL, NULL),
(931, 53, 30, 0, NULL, NULL, NULL),
(932, 53, 31, 0, NULL, NULL, NULL),
(933, 53, 32, 0, NULL, NULL, NULL),
(934, 53, 33, 0, NULL, NULL, NULL),
(935, 53, 34, 0, NULL, NULL, NULL),
(936, 53, 35, 0, NULL, NULL, NULL),
(937, 53, 36, 0, NULL, NULL, NULL),
(938, 53, 37, 0, NULL, NULL, NULL),
(939, 53, 38, 0, NULL, NULL, NULL),
(940, 53, 39, 0, NULL, NULL, NULL),
(941, 53, 40, 0, NULL, NULL, NULL),
(942, 53, 41, 0, NULL, NULL, NULL),
(943, 53, 42, 0, NULL, NULL, NULL),
(944, 53, 43, 0, NULL, NULL, NULL),
(945, 53, 44, 0, NULL, NULL, NULL),
(946, 53, 45, 0, NULL, NULL, NULL),
(947, 53, 46, 0, NULL, NULL, NULL),
(948, 53, 47, 0, NULL, NULL, NULL),
(949, 53, 48, 0, NULL, NULL, NULL),
(950, 53, 49, 0, NULL, NULL, NULL),
(951, 53, 50, 0, NULL, NULL, NULL),
(952, 53, 51, 0, NULL, NULL, NULL),
(953, 53, 52, 0, NULL, NULL, NULL),
(954, 54, 1, 0, NULL, NULL, NULL),
(955, 54, 2, 0, NULL, NULL, NULL),
(956, 54, 3, 0, NULL, NULL, NULL),
(957, 54, 4, 0, NULL, NULL, NULL),
(958, 54, 5, 0, NULL, NULL, NULL),
(959, 54, 6, 0, NULL, NULL, NULL),
(960, 54, 7, 0, NULL, NULL, NULL),
(961, 54, 8, 0, NULL, NULL, NULL),
(962, 54, 9, 0, NULL, NULL, NULL),
(963, 54, 10, 0, NULL, NULL, NULL),
(964, 54, 11, 0, NULL, NULL, NULL),
(965, 54, 12, 0, NULL, NULL, NULL),
(966, 54, 13, 0, NULL, NULL, NULL),
(967, 54, 14, 0, NULL, NULL, NULL),
(968, 54, 15, 0, NULL, NULL, NULL),
(969, 54, 16, 0, NULL, NULL, NULL),
(970, 54, 17, 0, NULL, NULL, NULL),
(971, 54, 18, 0, NULL, NULL, NULL),
(972, 54, 19, 0, NULL, NULL, NULL),
(973, 54, 20, 0, NULL, NULL, NULL),
(974, 54, 21, 0, NULL, NULL, NULL),
(975, 54, 22, 0, NULL, NULL, NULL),
(976, 54, 23, 0, NULL, NULL, NULL),
(977, 54, 24, 0, NULL, NULL, NULL),
(978, 54, 25, 0, NULL, NULL, NULL),
(979, 54, 26, 0, NULL, NULL, NULL),
(980, 54, 27, 0, NULL, NULL, NULL),
(981, 54, 28, 0, NULL, NULL, NULL),
(982, 54, 29, 0, NULL, NULL, NULL),
(983, 54, 30, 0, NULL, NULL, NULL),
(984, 54, 31, 0, NULL, NULL, NULL),
(985, 54, 32, 0, NULL, NULL, NULL),
(986, 54, 33, 0, NULL, NULL, NULL),
(987, 54, 34, 0, NULL, NULL, NULL),
(988, 54, 35, 0, NULL, NULL, NULL),
(989, 54, 36, 0, NULL, NULL, NULL),
(990, 54, 37, 0, NULL, NULL, NULL),
(991, 54, 38, 0, NULL, NULL, NULL),
(992, 54, 39, 0, NULL, NULL, NULL),
(993, 54, 40, 0, NULL, NULL, NULL),
(994, 54, 41, 0, NULL, NULL, NULL),
(995, 54, 42, 0, NULL, NULL, NULL),
(996, 54, 43, 0, NULL, NULL, NULL),
(997, 54, 44, 0, NULL, NULL, NULL),
(998, 54, 45, 0, NULL, NULL, NULL),
(999, 54, 46, 0, NULL, NULL, NULL),
(1000, 54, 47, 0, NULL, NULL, NULL),
(1001, 54, 48, 0, NULL, NULL, NULL),
(1002, 54, 49, 0, NULL, NULL, NULL),
(1003, 54, 50, 0, NULL, NULL, NULL),
(1004, 54, 51, 0, NULL, NULL, NULL),
(1005, 54, 52, 0, NULL, NULL, NULL),
(1006, 55, 1, 0, NULL, NULL, NULL),
(1007, 55, 2, 0, NULL, NULL, NULL),
(1008, 55, 3, 0, NULL, NULL, NULL),
(1009, 55, 4, 0, NULL, NULL, NULL),
(1010, 55, 5, 0, NULL, NULL, NULL),
(1011, 55, 6, 0, NULL, NULL, NULL),
(1012, 55, 7, 0, NULL, NULL, NULL),
(1013, 55, 8, 0, NULL, NULL, NULL),
(1014, 55, 9, 0, NULL, NULL, NULL),
(1015, 55, 10, 0, NULL, NULL, NULL),
(1016, 55, 11, 0, NULL, NULL, NULL),
(1017, 55, 12, 0, NULL, NULL, NULL),
(1018, 55, 13, 0, NULL, NULL, NULL),
(1019, 55, 14, 0, NULL, NULL, NULL),
(1020, 55, 15, 0, NULL, NULL, NULL),
(1021, 55, 16, 0, NULL, NULL, NULL),
(1022, 55, 17, 0, NULL, NULL, NULL),
(1023, 55, 18, 0, NULL, NULL, NULL),
(1024, 55, 19, 0, NULL, NULL, NULL),
(1025, 55, 20, 0, NULL, NULL, NULL),
(1026, 55, 21, 0, NULL, NULL, NULL),
(1027, 55, 22, 0, NULL, NULL, NULL),
(1028, 55, 23, 0, NULL, NULL, NULL),
(1029, 55, 24, 0, NULL, NULL, NULL),
(1030, 55, 25, 0, NULL, NULL, NULL),
(1031, 55, 26, 0, NULL, NULL, NULL),
(1032, 55, 27, 0, NULL, NULL, NULL),
(1033, 55, 28, 0, NULL, NULL, NULL),
(1034, 55, 29, 0, NULL, NULL, NULL),
(1035, 55, 30, 0, NULL, NULL, NULL),
(1036, 55, 31, 0, NULL, NULL, NULL),
(1037, 55, 32, 0, NULL, NULL, NULL),
(1038, 55, 33, 0, NULL, NULL, NULL),
(1039, 55, 34, 0, NULL, NULL, NULL),
(1040, 55, 35, 0, NULL, NULL, NULL),
(1041, 55, 36, 0, NULL, NULL, NULL),
(1042, 55, 37, 0, NULL, NULL, NULL),
(1043, 55, 38, 0, NULL, NULL, NULL),
(1044, 55, 39, 0, NULL, NULL, NULL),
(1045, 55, 40, 0, NULL, NULL, NULL),
(1046, 55, 41, 0, NULL, NULL, NULL),
(1047, 55, 42, 0, NULL, NULL, NULL),
(1048, 55, 43, 0, NULL, NULL, NULL),
(1049, 55, 44, 0, NULL, NULL, NULL),
(1050, 55, 45, 0, NULL, NULL, NULL),
(1051, 55, 46, 0, NULL, NULL, NULL),
(1052, 55, 47, 0, NULL, NULL, NULL),
(1053, 55, 48, 0, NULL, NULL, NULL),
(1054, 55, 49, 0, NULL, NULL, NULL),
(1055, 55, 50, 0, NULL, NULL, NULL),
(1056, 55, 51, 0, NULL, NULL, NULL),
(1057, 55, 52, 0, NULL, NULL, NULL),
(1058, 56, 1, 0, NULL, NULL, NULL),
(1059, 56, 2, 0, NULL, NULL, NULL),
(1060, 56, 3, 0, NULL, NULL, NULL),
(1061, 56, 4, 0, NULL, NULL, NULL),
(1062, 56, 5, 0, NULL, NULL, NULL),
(1063, 56, 6, 0, NULL, NULL, NULL),
(1064, 56, 7, 0, NULL, NULL, NULL),
(1065, 56, 8, 0, NULL, NULL, NULL),
(1066, 56, 9, 0, NULL, NULL, NULL),
(1067, 56, 10, 0, NULL, NULL, NULL),
(1068, 56, 11, 0, NULL, NULL, NULL),
(1069, 56, 12, 0, NULL, NULL, NULL),
(1070, 56, 13, 0, NULL, NULL, NULL),
(1071, 56, 14, 0, NULL, NULL, NULL),
(1072, 56, 15, 0, NULL, NULL, NULL),
(1073, 56, 16, 0, NULL, NULL, NULL),
(1074, 56, 17, 0, NULL, NULL, NULL),
(1075, 56, 18, 0, NULL, NULL, NULL),
(1076, 56, 19, 0, NULL, NULL, NULL),
(1077, 56, 20, 0, NULL, NULL, NULL),
(1078, 56, 21, 0, NULL, NULL, NULL),
(1079, 56, 22, 0, NULL, NULL, NULL),
(1080, 56, 23, 0, NULL, NULL, NULL),
(1081, 56, 24, 0, NULL, NULL, NULL),
(1082, 56, 25, 0, NULL, NULL, NULL),
(1083, 56, 26, 0, NULL, NULL, NULL),
(1084, 56, 27, 0, NULL, NULL, NULL),
(1085, 56, 28, 0, NULL, NULL, NULL),
(1086, 56, 29, 0, NULL, NULL, NULL),
(1087, 56, 30, 0, NULL, NULL, NULL),
(1088, 56, 31, 0, NULL, NULL, NULL),
(1089, 56, 32, 0, NULL, NULL, NULL),
(1090, 56, 33, 0, NULL, NULL, NULL),
(1091, 56, 34, 0, NULL, NULL, NULL),
(1092, 56, 35, 0, NULL, NULL, NULL),
(1093, 56, 36, 0, NULL, NULL, NULL),
(1094, 56, 37, 0, NULL, NULL, NULL),
(1095, 56, 38, 0, NULL, NULL, NULL),
(1096, 56, 39, 0, NULL, NULL, NULL),
(1097, 56, 40, 0, NULL, NULL, NULL),
(1098, 56, 41, 0, NULL, NULL, NULL),
(1099, 56, 42, 0, NULL, NULL, NULL),
(1100, 56, 43, 0, NULL, NULL, NULL),
(1101, 56, 44, 0, NULL, NULL, NULL),
(1102, 56, 45, 0, NULL, NULL, NULL),
(1103, 56, 46, 0, NULL, NULL, NULL),
(1104, 56, 47, 0, NULL, NULL, NULL),
(1105, 56, 48, 0, NULL, NULL, NULL),
(1106, 56, 49, 0, NULL, NULL, NULL),
(1107, 56, 50, 0, NULL, NULL, NULL),
(1108, 56, 51, 0, NULL, NULL, NULL),
(1109, 56, 52, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE IF NOT EXISTS `kabupaten` (
`id_kabupaten` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id_kabupaten`, `id_provinsi`, `nama`) VALUES
(1, 1, 'Aceh Barat'),
(2, 1, 'Aceh Barat Daya'),
(3, 1, 'Aceh Besar'),
(4, 1, 'Aceh Jaya'),
(5, 1, 'Aceh Selatan'),
(6, 1, 'Aceh Singkil'),
(7, 1, 'Aceh Tamiang'),
(8, 1, 'Aceh Tengah'),
(9, 1, 'Aceh Tenggara'),
(10, 1, 'Aceh Timur'),
(11, 1, 'Aceh Utara'),
(12, 32, 'Agam'),
(13, 23, 'Alor'),
(14, 24, 'Asmat'),
(15, 2, 'Badung'),
(16, 14, 'Balangan'),
(17, 10, 'Bandung'),
(18, 10, 'Bandung Barat'),
(19, 29, 'Banggai'),
(20, 3, 'Bangka'),
(21, 3, 'Bangka Barat'),
(22, 3, 'Bangka Selatan'),
(23, 3, 'Bangka Tengah'),
(24, 12, 'Bangkalan'),
(25, 2, 'Bangli'),
(26, 14, 'Banjar'),
(27, 11, 'Banjarnegara'),
(28, 28, 'Bantaeng'),
(29, 6, 'Bantul'),
(30, 33, 'Banyuasin'),
(31, 11, 'Banyumas'),
(32, 12, 'Banyuwangi'),
(33, 15, 'Barito Selatan'),
(34, 15, 'Barito Timur'),
(35, 15, 'Barito Utara'),
(36, 15, 'Baritokuala'),
(37, 28, 'Barru'),
(38, 11, 'Batang'),
(39, 9, 'Batanghari'),
(40, 34, 'Batubara'),
(41, 10, 'Bekasi'),
(42, 3, 'Belitung'),
(43, 3, 'Belitung Timur'),
(44, 23, 'Belu'),
(45, 1, 'Bener Meriah'),
(46, 13, 'Bengkayang'),
(47, 5, 'Bengkulu Selatan'),
(48, 16, 'Berau'),
(49, 24, 'Biaknumfor'),
(50, 22, 'Bima'),
(51, 18, 'Bintan'),
(52, 1, 'Bireuen'),
(53, 12, 'Blitar'),
(54, 11, 'Blora'),
(55, 8, 'Boalemo'),
(56, 10, 'Bogor'),
(57, 12, 'Bojonegoro'),
(58, 31, 'Bolaangmongondow'),
(59, 31, 'Bolaangmongondow Selatan'),
(60, 31, 'Bolaangmongondow Timur'),
(61, 31, 'Bolaangmongondow Utara'),
(62, 30, 'Bombana'),
(63, 12, 'Bondowoso'),
(64, 28, 'Bone'),
(65, 8, 'Bonebolango'),
(66, 24, 'Bovendigoel'),
(67, 11, 'Boyolali'),
(68, 11, 'Brebes'),
(69, 2, 'Buleleng'),
(70, 28, 'Bulukumba'),
(71, 9, 'Bungo'),
(72, 29, 'Buol'),
(73, 30, 'Buton'),
(74, 10, 'Ciamis'),
(75, 10, 'Cianjur'),
(76, 11, 'Cilacap'),
(77, 10, 'Cirebon'),
(78, 34, 'Dairi'),
(79, 34, 'Deliserdang'),
(80, 11, 'Demak'),
(81, 32, 'Dharmasraya'),
(82, 22, 'Dompu'),
(83, 33, 'Empat Lawang'),
(84, 23, 'Ende'),
(85, 28, 'Enrekang'),
(86, 25, 'Fak-Fak'),
(87, 23, 'Flores Timur'),
(88, 10, 'Garut'),
(89, 1, 'Gayo Lues'),
(90, 2, 'Gianyar'),
(91, 8, 'Gorontalo'),
(92, 8, 'Gorontalo Utara'),
(93, 28, 'Gowa'),
(94, 12, 'Gresik'),
(95, 11, 'Grobogan'),
(96, 6, 'Gunungkidul'),
(97, 15, 'Gunungmas'),
(98, 21, 'Halmahera Barat'),
(99, 21, 'Halmahera Selatan'),
(100, 21, 'Halmahera Tengah'),
(101, 21, 'Halmahera Timur'),
(102, 21, 'Halmahera Utara'),
(103, 14, 'Hulusungai Selatan'),
(104, 14, 'Hulusungai Tengah'),
(105, 14, 'Hulusungai Utara'),
(106, 34, 'Humbang Hasundutan'),
(107, 26, 'Indragiri Hilir'),
(108, 26, 'Indragiri Hulu'),
(109, 10, 'Indramayu'),
(110, 24, 'Jayapura'),
(111, 12, 'Jember'),
(112, 2, 'Jembrana'),
(113, 28, 'Jeneponto'),
(114, 11, 'Jepara'),
(115, 12, 'Jombang'),
(116, 25, 'Kaimana'),
(117, 26, 'Kampar'),
(118, 15, 'Kapuas'),
(119, 13, 'Kapuas Hulu'),
(120, 11, 'Karanganyar'),
(121, 2, 'Karangasem'),
(122, 10, 'Karawang'),
(123, 18, 'Karimun'),
(124, 34, 'Karo'),
(125, 15, 'Katingan'),
(126, 5, 'Kaur'),
(127, 11, 'Kebumen'),
(128, 12, 'Kediri'),
(129, 24, 'Keerom'),
(130, 11, 'Kendal'),
(131, 5, 'Kepahiang'),
(132, 20, 'Kepulauan Aru'),
(133, 32, 'Kepulauan Mentawai'),
(134, 21, 'Pulau Morotai'),
(135, 31, 'Kepulauan Sangihe'),
(136, 7, 'ADM Kepulauan Seribu'),
(137, 31, 'Kep. Siau Tagulandang Biaro'),
(138, 31, 'Kepulauan Talaud'),
(139, 24, 'Kepulauan Yapen'),
(140, 11, 'Klaten'),
(141, 2, 'Klungkung'),
(142, 30, 'Kolaka'),
(143, 30, 'Kolaka Utara'),
(144, 30, 'Konawe'),
(145, 30, 'Konawe Selatan'),
(146, 30, 'Konawe Utara'),
(147, 20, 'Kota Ambon'),
(148, 16, 'Kota Balikpapan'),
(149, 1, 'Kota Banda Aceh'),
(150, 19, 'Kota Bandarlampung'),
(151, 10, 'Kota Bandung'),
(152, 10, 'Kota Banjar'),
(153, 14, 'Kota Banjarbaru'),
(154, 14, 'Kota Banjarmasin'),
(155, 18, 'Kota Batam'),
(156, 12, 'Kota Batu'),
(157, 30, 'Kota Bau-Bau'),
(158, 10, 'Kota Bekasi'),
(159, 5, 'Kota Bengkulu'),
(160, 22, 'Kota Bima'),
(161, 34, 'Kota Binjai'),
(162, 31, 'Kota Bitung'),
(163, 12, 'Kota Blitar'),
(164, 10, 'Kota Bogor'),
(165, 16, 'Kota Bontang'),
(166, 32, 'Kota Bukittinggi'),
(167, 4, 'Kota Cilegon'),
(168, 10, 'Kota Cimahi'),
(169, 10, 'Kota Cirebon'),
(170, 2, 'Kota Denpasar'),
(171, 10, 'Kota Depok'),
(172, 8, 'Kota Gorontalo'),
(173, 7, 'Kota ADM Jakarta Barat'),
(174, 7, 'Kota ADM Jakarta Pusat'),
(175, 7, 'Kota ADM Jakarta Selatan'),
(176, 7, 'Kota ADM Jakarta Timur'),
(177, 7, 'Kota ADM Jakarta Utara'),
(178, 9, 'Kota Jambi'),
(179, 24, 'Kota Jayapura'),
(180, 12, 'Kota Kediri'),
(181, 30, 'Kota Kendari'),
(182, 31, 'Kota Kotamobagu'),
(183, 23, 'Kota Kupang'),
(184, 1, 'Kota Langsa'),
(185, 1, 'Kota Lhokseumawe'),
(186, 33, 'Kota Lubuklinggau'),
(187, 12, 'Kota Madiun'),
(188, 11, 'Kota Magelang'),
(189, 28, 'Kota Makassar'),
(190, 12, 'Kota Malang'),
(191, 31, 'Kota Manado'),
(192, 22, 'Kota Mataram'),
(193, 34, 'Kota Medan'),
(194, 19, 'Kota Metro'),
(195, 12, 'Kota Mojokerto'),
(196, 32, 'Kota Padang'),
(197, 32, 'Kota Padangpanjang'),
(198, 33, 'Kota Pagaralam'),
(199, 15, 'Kota Palangkaraya'),
(200, 33, 'Kota Palembang'),
(201, 28, 'Kota Palopo'),
(202, 29, 'Kota Palu'),
(203, 3, 'Kota Pangkalpinang'),
(204, 28, 'Kota Pare-Pare'),
(205, 32, 'Kota Pariaman'),
(206, 12, 'Kota Pasuruan'),
(207, 32, 'Kota Payakumbuh'),
(208, 11, 'Kota Pekalongan'),
(209, 26, 'Kota Pekanbaru'),
(210, 34, 'Kota Pematangsiantar'),
(211, 13, 'Kota Pontianak'),
(212, 33, 'Kota Prabumulih'),
(213, 12, 'Kota Probolinggo'),
(214, 1, 'Kota Sabang'),
(215, 11, 'Kota Salatiga'),
(216, 16, 'Kota Samarinda'),
(217, 11, 'Kota Semarang'),
(218, 4, 'Kota Serang'),
(219, 34, 'Kota Sibolga'),
(220, 13, 'Kota Singkawang'),
(221, 32, 'Kota Solok'),
(222, 25, 'Kota Sorong'),
(223, 1, 'Kota Subulussalam'),
(224, 10, 'Kota Sukabumi'),
(225, 12, 'Kota Surabaya'),
(226, 11, 'Kota Surakarta'),
(227, 4, 'Kota Tengerang'),
(228, 34, 'Kota Tanjungbalai'),
(229, 18, 'Kota Tanjungpinang'),
(230, 17, 'Kota Tarakan'),
(231, 10, 'Kota Tasikmalaya'),
(232, 34, 'Kota Tebingtinggi'),
(233, 11, 'Kota Tegal'),
(234, 21, 'Kota Ternate'),
(235, 21, 'Kota Tidore Kepulauan'),
(236, 31, 'Kota Tomohon'),
(237, 6, 'Kota Yogyakarta'),
(238, 14, 'Kotabaru'),
(239, 15, 'Kotawaringin Barat'),
(240, 15, 'Kotawaringin Timur'),
(241, 26, 'Kuantan Singingi'),
(242, 13, 'Kuburaya'),
(243, 11, 'Kudus'),
(244, 6, 'Kulonprogo'),
(245, 10, 'Kuningan'),
(246, 16, 'Kutai Barat'),
(247, 16, 'Kutai Kartanegara'),
(248, 16, 'Kutai Timur'),
(249, 33, 'Lahat'),
(250, 15, 'Lamandau'),
(251, 12, 'Lamongan'),
(252, 19, 'Lampung Barat'),
(253, 19, 'Lampung Tengah'),
(254, 19, 'Lampung Timur'),
(255, 13, 'Landak'),
(256, 34, 'Langkat'),
(257, 4, 'Lebak'),
(258, 5, 'Lebong'),
(259, 23, 'Lembata'),
(260, 32, 'Limapuluhkoto'),
(261, 18, 'Lingga'),
(262, 22, 'Lombok Tengah'),
(263, 22, 'Lombok Timur'),
(264, 12, 'Lumajang'),
(265, 28, 'Luwu'),
(266, 28, 'Luwu Timur'),
(267, 28, 'Luwu Utara'),
(268, 12, 'Madiun'),
(269, 11, 'Magelang'),
(270, 12, 'Magetan'),
(271, 10, 'Majalengka'),
(272, 27, 'Majene'),
(273, 12, 'Malang'),
(274, 17, 'Malinau'),
(275, 20, 'Maluku Tengah'),
(276, 27, 'Mamasa'),
(277, 27, 'Mamuju'),
(278, 27, 'Mamuju Utara'),
(279, 31, 'Mandailing Natal'),
(280, 23, 'Manggarai Barat'),
(281, 25, 'Manokwari'),
(282, 24, 'Mappi'),
(283, 28, 'Maros'),
(284, 13, 'Melawai'),
(285, 9, 'Merangin'),
(286, 24, 'Merauke'),
(287, 24, 'Mimika'),
(288, 31, 'Minahasa'),
(289, 31, 'Minahasa Selatan'),
(290, 31, 'Minahasa Tenggara'),
(291, 31, 'Minahasa Utara'),
(292, 12, 'Mojokerto'),
(293, 29, 'Morowali'),
(294, 33, 'Muaraenim'),
(295, 9, 'Muarojambi'),
(296, 5, 'Muko-Muko'),
(297, 15, 'Murungraya'),
(298, 33, 'Musibanyuasin'),
(299, 33, 'Musirawas'),
(300, 1, 'Nagan Raya'),
(301, 24, 'Nduga'),
(302, 12, 'Nganjuk'),
(303, 12, 'Ngawi'),
(304, 17, 'Nunukan'),
(305, 33, 'Ogan Ilir'),
(306, 33, 'Ogan Komering Ilir'),
(307, 33, 'Ogan Komering Ulu'),
(308, 33, 'Ogan Komering Ulu Selatan'),
(309, 33, 'Ogan Komering Ulu Timur'),
(310, 12, 'Pacitan'),
(311, 32, 'Padangpariaman'),
(312, 32, 'Pakpakbharat'),
(313, 12, 'Pamekasan'),
(314, 4, 'Pandeglang'),
(315, 28, 'Pangkajene Kepulauan'),
(316, 32, 'Pasaman'),
(317, 32, 'Pasaman Barat'),
(318, 16, 'Paser'),
(319, 12, 'Pasuruan'),
(320, 11, 'Pati'),
(321, 24, 'Pegununganbintang'),
(322, 11, 'Pekalongan'),
(323, 26, 'Pelalawan'),
(324, 11, 'Pemalang'),
(325, 16, 'Penajam Pser Utara'),
(326, 32, 'Pesisir Selatan'),
(327, 1, 'Pidie'),
(328, 1, 'Pidie Jaya'),
(329, 28, 'Pinrang'),
(330, 8, 'Pahuwato'),
(331, 27, 'Polewali Mandar'),
(332, 12, 'Ponorogo'),
(333, 13, 'Pontianak'),
(334, 29, 'Poso'),
(335, 12, 'Probolinggo'),
(336, 15, 'Pulangpisau'),
(337, 11, 'Purbalingga'),
(338, 10, 'Purwakarta'),
(339, 11, 'Purworejo'),
(340, 25, 'Rajaampat'),
(341, 5, 'Rejanglebong'),
(342, 11, 'Rembang'),
(343, 26, 'Rokan Hilir'),
(344, 26, 'Rokan Hulu'),
(345, 23, 'Rote Ndao'),
(346, 13, 'Sambas'),
(347, 34, 'Samosir'),
(348, 12, 'Sampang'),
(349, 13, 'Sanggau'),
(350, 24, 'Sarmi'),
(351, 9, 'Sarolangun'),
(352, 13, 'Sekadau'),
(353, 28, 'Selayar'),
(354, 5, 'Seluma'),
(355, 11, 'Semarang'),
(356, 20, 'Seram Bagian Barat'),
(357, 20, 'Seram Bagian Timur'),
(358, 4, 'Serang'),
(359, 34, 'Serdang Begadai'),
(360, 15, 'Seruyan'),
(361, 26, 'Siak'),
(362, 28, 'Sidenrengrappang'),
(363, 12, 'Sidoarjo'),
(364, 23, 'Sikka'),
(365, 34, 'Simalungun'),
(366, 1, 'Simeulue'),
(367, 28, 'Sinjai'),
(368, 13, 'Sintang'),
(369, 12, 'Situbondo'),
(370, 6, 'Sleman'),
(371, 32, 'Solok'),
(372, 32, 'Solok Selatan'),
(373, 28, 'Soppeng'),
(374, 11, 'Sragen'),
(375, 10, 'Subang'),
(376, 10, 'Sukabumi'),
(377, 15, 'Sukamara'),
(378, 11, 'Sukoharjo'),
(379, 23, 'Sumba Timur'),
(380, 22, 'Sumbawa'),
(381, 22, 'Sumbawa Barat'),
(382, 10, 'Sumedang'),
(383, 12, 'Sumenep'),
(384, 24, 'Supiori'),
(385, 14, 'Tabalong'),
(386, 2, 'Tabanan'),
(387, 28, 'Takalar'),
(388, 14, 'Tanahbumbu'),
(389, 32, 'Tanahdatar'),
(390, 14, 'Tanahlaut'),
(391, 9, 'Tanjungjabung Barat'),
(392, 9, 'Tanjungjabung Timur'),
(393, 34, 'Tapanuli Tengah'),
(394, 34, 'Tapanuli Utara'),
(395, 14, 'Tapin'),
(396, 10, 'Tasikmalaya'),
(397, 9, 'Tebo'),
(398, 11, 'Tegal'),
(399, 25, 'Telukbintuni'),
(400, 25, 'Telukwondama'),
(401, 11, 'Temanggung'),
(402, 23, 'Timor Tengah Selatan'),
(403, 23, 'Timor Tengah Utara'),
(404, 31, 'Tobasamosir'),
(405, 29, 'Tojounauna'),
(406, 24, 'Tolikara'),
(407, 29, 'Tolitoli'),
(408, 12, 'Trenggalek'),
(409, 12, 'Tuban'),
(410, 12, 'Tulungagung'),
(411, 28, 'Wajo'),
(412, 30, 'Wakatobi'),
(413, 11, 'Wonogiri'),
(414, 11, 'Wonosobo'),
(415, 24, 'Yahukimo'),
(416, 31, 'Nias'),
(417, 31, 'Nias Utara'),
(418, 31, 'Nias Selatan'),
(419, 31, 'Kota Gunung Sitoli'),
(420, 31, 'Nias Barat'),
(421, 31, 'Kota Padangsidimpuan'),
(422, 31, 'Padang Lawas'),
(423, 31, 'Padang Lawas Utara'),
(424, 31, 'Tapanuli Selatan'),
(425, 31, 'Labuhanbatu Selatan'),
(426, 31, 'Labuhanbatu'),
(427, 31, 'Labuhanbatu Utara'),
(428, 31, 'Asahan'),
(429, 19, 'Lampung Utara'),
(430, 19, 'Waykanan'),
(431, 19, 'Tulang Bawang Barat'),
(432, 19, 'Tulang Bawang'),
(433, 19, 'Mesuji'),
(434, 4, 'Kota Tangerang Selatan'),
(435, 4, 'Tangerang'),
(436, 13, 'Ketapang'),
(437, 13, 'Kayong Utara'),
(438, 26, 'Kepulauan Meranti'),
(439, 26, 'Bengkalis'),
(440, 26, 'Kota Dumai'),
(441, 17, 'Bulungan'),
(442, 17, 'Tana Tidung'),
(443, 22, 'Lombok Barat'),
(444, 22, 'Lombok Utara'),
(445, 23, 'Nagekeo'),
(446, 23, 'Ngada'),
(447, 23, 'Manggarai Timur'),
(448, 23, 'Manggarai'),
(449, 23, 'Sumba Barat'),
(450, 23, 'Sumba Barat Daya'),
(451, 23, 'Sumba Tengah'),
(452, 30, 'Muna'),
(453, 30, 'Buton Utara'),
(454, 9, 'Kota Sungaipenuh'),
(455, 9, 'Kerinci'),
(456, 19, 'Pringsewu'),
(457, 19, 'Tanggamus'),
(458, 19, 'Lampung Selatan'),
(459, 19, 'Pesawaran'),
(460, 18, 'Natuna'),
(461, 18, 'Kepulauan Anambas'),
(462, 29, 'Parigimoutong'),
(463, 29, 'Donggala'),
(464, 29, 'Sigi'),
(465, 20, 'Buru Selatan'),
(466, 20, 'Buru'),
(467, 23, 'Sabu Raijua'),
(468, 23, 'Kupang'),
(469, 20, 'Maluku Barat Daya'),
(470, 20, 'Maluku Tenggara Barat'),
(471, 20, 'Kota Tual'),
(472, 20, 'Maluku Tenggara'),
(473, 25, 'Tambrauw'),
(474, 25, 'Sorong'),
(475, 25, 'Maybrat'),
(476, 25, 'Sorong Selatan'),
(477, 24, 'Dogiyai'),
(478, 24, 'Nabire'),
(479, 24, 'Deiyai'),
(480, 24, 'Puncak Jaya'),
(481, 24, 'Puncak'),
(482, 24, 'Lanny Jaya'),
(483, 24, 'Mamberamo Tengah'),
(484, 24, 'Jayawijaya'),
(485, 24, 'Yalimo'),
(486, 24, 'Mamberamo Raya'),
(487, 24, 'Waropen'),
(488, 24, 'Paniai'),
(489, 24, 'Intan Jaya'),
(490, 5, 'Bengkulu Tengah'),
(491, 5, 'Bengkulu Utara'),
(492, 28, 'Tana Toraja'),
(493, 28, 'Toraja Utara'),
(494, 10, 'Pangandaran'),
(495, 23, 'Malaka'),
(496, 16, 'Mahakam Ulu'),
(497, 30, 'Kolaka Timur'),
(498, 21, 'Pulau Taliabu'),
(499, 21, 'Kepulauan Sula'),
(500, 29, 'Banggai Laut'),
(501, 29, 'Banggai Kepulauan'),
(502, 25, 'Pegunungan Arfak'),
(503, 33, 'Penukal Abab Lematang Ilir'),
(504, 19, 'Pesisir Barat'),
(505, 27, 'Mamuju Tengah'),
(506, 25, 'Manokwari Selatan'),
(507, 32, 'Kota Sawahlunto'),
(508, 32, 'Sijunjung'),
(510, 0, 'Melbourne'),
(511, 33, 'Suban');

-- --------------------------------------------------------

--
-- Table structure for table `kelengkapan_prosedur_kegiatan`
--

CREATE TABLE IF NOT EXISTS `kelengkapan_prosedur_kegiatan` (
`id` int(11) NOT NULL,
  `id_prosedur_kegiatan` int(11) NOT NULL,
  `id_kelengkapan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelengkapan_prosedur_kegiatan`
--

INSERT INTO `kelengkapan_prosedur_kegiatan` (`id`, `id_prosedur_kegiatan`, `id_kelengkapan`) VALUES
(11, 6, 2),
(12, 6, 3),
(18, 9, 5),
(19, 9, 6),
(20, 9, 7),
(21, 10, 1),
(22, 10, 4),
(23, 11, 2),
(24, 12, 3),
(25, 13, 1),
(26, 13, 4),
(28, 15, 1),
(29, 16, 1),
(30, 17, 1),
(32, 19, 1),
(33, 20, 1),
(34, 21, 2),
(35, 22, 2),
(36, 22, 9),
(37, 23, 1),
(38, 23, 4),
(39, 24, 5),
(40, 24, 6),
(41, 24, 7),
(42, 25, 2),
(43, 26, 3),
(44, 27, 1),
(45, 27, 4),
(47, 29, 1),
(48, 30, 1),
(49, 31, 1),
(50, 32, 1),
(51, 33, 1),
(52, 34, 2),
(53, 35, 8),
(54, 36, 10),
(55, 63, 8),
(56, 77, 8),
(57, 104, 8),
(58, 131, 8),
(59, 132, 8),
(60, 146, 8),
(61, 160, 8),
(62, 174, 8),
(64, 189, 8),
(66, 204, 8),
(67, 218, 8),
(68, 219, 8),
(69, 233, 8),
(70, 234, 8),
(71, 248, 8),
(72, 249, 8),
(73, 263, 8),
(74, 264, 8),
(75, 278, 8),
(76, 279, 8),
(77, 293, 8),
(78, 294, 8),
(79, 308, 8),
(80, 309, 8),
(81, 323, 8),
(82, 324, 8),
(83, 325, 8),
(84, 326, 8),
(85, 340, 8),
(86, 341, 8),
(87, 355, 8),
(88, 369, 8),
(89, 383, 8),
(90, 397, 8),
(91, 411, 8),
(92, 503, 8),
(93, 504, 9),
(94, 505, 9),
(95, 506, 9),
(96, 507, 9),
(97, 508, 9),
(98, 509, 9),
(99, 510, 9),
(100, 511, 9);

-- --------------------------------------------------------

--
-- Table structure for table `komoditi`
--

CREATE TABLE IF NOT EXISTS `komoditi` (
  `id_komoditi` varchar(2) NOT NULL,
  `nama` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komoditi`
--

INSERT INTO `komoditi` (`id_komoditi`, `nama`) VALUES
('bb', 'batubara'),
('lg', 'logam'),
('nl', 'non logam'),
('pb', 'panas bumi'),
('pp', 'Preparasi'),
('pw', 'Previewer'),
('tu', 'Tata Usaha');

-- --------------------------------------------------------

--
-- Table structure for table `laboratorium`
--

CREATE TABLE IF NOT EXISTS `laboratorium` (
  `id_lab` varchar(3) NOT NULL,
  `id_komoditi` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table analisis';

--
-- Dumping data for table `laboratorium`
--

INSERT INTO `laboratorium` (`id_lab`, `id_komoditi`, `nama`) VALUES
('fbb', 'bb', 'Fisika Batubara & Material Organik'),
('fmb', 'bb', 'Fisika Mineral dan Batubara'),
('kbb', 'bb', 'Kimia Batubara & Material Organik'),
('kgb', 'bb', 'Gambut'),
('kml', 'lg', 'Kimia Mineral Logam'),
('knl', 'nl', 'Kimia Mineral Bukan Logam'),
('kpb', 'pb', 'Lab Panas Bumi');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
`id` int(11) NOT NULL,
  `message_from` int(11) NOT NULL,
  `message_to` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `attachment` text NOT NULL,
  `reply_to` int(11) DEFAULT NULL,
  `is_readed` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `metoda`
--

CREATE TABLE IF NOT EXISTS `metoda` (
`id_metoda` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_laboratorium` varchar(3) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metoda`
--

INSERT INTO `metoda` (`id_metoda`, `nama`, `id_laboratorium`, `created_date`, `updated_date`) VALUES
(1, 'SNI 7574-2010', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(2, 'SNI 1964-2008', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(3, 'SNI 1965-2008', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(4, 'SNI 06-2428-1991', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(5, 'SNI 06-2603-1992', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(6, 'SNI 06-6989-20-2004', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(7, 'SNI 13-3494-1994', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(8, 'SNI 13-3495-1994', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(9, 'SNI 13-3497-1994', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(10, 'SNI 13-3607-1994', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(11, 'SNI 13-3496-1996', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(12, 'SNI 13-4698-1998', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(13, 'SNI 13-4699-1998', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(14, 'SNI 13-6336-2000', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(15, 'SNI 13-6337-2000', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(16, 'SNI 15-0449-1989', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(17, 'ASTM C 25-99', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(18, 'ASTM C1301-95 (Reapp 2009)', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(19, 'ASTM E 247-96-1998', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(20, 'ASTM D 4369.2013', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(21, 'ASTM E 507-1998', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(22, 'ASTM E 1081-95 a-1998', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(23, 'ASTM C 25-2006', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(24, 'ASTM C 25-2011', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(25, 'K-III-32.03-IKNL', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(26, 'KF-III.32.20-IKNL', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(27, 'KF-III.32.18-IKNL', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(28, 'KF-III-32-22-IKNL', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(29, 'BS-1916 Part 14:1963', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(30, 'Calculated', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(31, 'Mahon K.,Ellis, A.J., 1977', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(32, 'Galle & Runnel 28', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(33, 'Zeeman Mercury Spectrometer - RA 915+', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(34, 'Picarro L 2120 -i Isotopic H2O', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(35, 'PerkinEkmer Clarus 580 GC', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(36, 'IC- Dionex ICS-1600', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(37, 'Gravimetri', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(38, 'Titrimetri', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(39, 'Turbidimetri', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(40, 'Spektrometri', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(41, 'AAS', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(42, 'Penfield Test', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(43, 'pH Meter', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(44, 'SNI 06-6989-11-2004', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(45, 'SNI 06-6989-12-2004', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(46, 'SNI 06-6989-13-2004', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(47, 'SNI 06-2603-1992', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(48, 'SNI 06-2481-1991', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(49, 'SNI 6989.34:2009', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(50, 'SNI 06-2523-1991', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(51, 'SNI 06-6989.56.2005', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(52, 'SNI 06-2428-1991', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(53, 'SNI 06-6989-54-1991', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(54, 'SNI 06-2479-1991', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(55, 'SNI 06-6989-30-2005', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(56, 'SNI 06-6876-2002', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(57, 'SNI 06-2482-1991', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(58, 'SNI 6989.19-2009', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(59, 'SNI 06-6875-2002', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(60, 'SNI 1965-2008', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(61, 'SNI 19-1604-1989', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(62, 'Mahon, Ellis, A.J.1977', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(63, 'Micro Plasma-Agilent 4100', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(64, 'ASTM C25-2006', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(65, 'Flame Photometri', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(66, 'Picarro L 2120 -i Isotopic H2O', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(67, 'PerkinEkmer Clarus 580 GC', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(68, 'Calculated', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(69, 'ASTM D 3173-03', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(70, 'ASTM D 3174-04', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(71, 'ASTM D 3175-02', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(72, 'ASTM D 3172-04', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(73, 'ASTM D 5865-04', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(74, 'ASTM D 5373-02', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(75, 'ASTM D 2013-03', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(76, 'ASTM D 3302/D3302 M-10', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(77, 'ASTM D 5142-04', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(78, 'ASTM D 5372-02', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(79, 'ASTM D 5865-10a', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(80, 'ASTM D 409', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(81, 'AS 1038.21.1.1-2002', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(82, 'AS 1038.21.1.1.2002', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(83, 'ISO 351 1996', 'kpb', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(84, 'XRF', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(85, 'Volumetri', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(86, 'Hg Analyzer', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(87, 'Viscometer', 'knl', '0000-00-00 00:00:00', '2015-08-04 13:30:31'),
(88, 'mamang', 'fbb', '2015-08-04 20:43:02', '2015-08-06 07:11:58');

-- --------------------------------------------------------

--
-- Table structure for table `metoda_parameter`
--

CREATE TABLE IF NOT EXISTS `metoda_parameter` (
`_id` int(11) NOT NULL,
  `id_metoda` varchar(2) NOT NULL,
  `id_parameter` varchar(7) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metoda_parameter`
--

INSERT INTO `metoda_parameter` (`_id`, `id_metoda`, `id_parameter`) VALUES
(57, '1', 'knlkm22'),
(60, '1', 'knlkm24'),
(55, '2', 'knlkm26'),
(58, '24', 'knlkm22'),
(61, '24', 'knlkm24'),
(56, '3', 'knlkm22'),
(59, '3', 'knlkm24'),
(53, '31', 'knlkm29'),
(54, '32', 'knlkm29'),
(64, '33', 'knlkm30'),
(111, '36', 'kpbak15'),
(117, '36', 'kpbak16'),
(114, '36', 'kpbak17'),
(280, '37', '120'),
(282, '37', '121'),
(291, '37', '127'),
(293, '37', '128'),
(162, '37', '130'),
(166, '37', '131'),
(238, '37', '146'),
(241, '37', '147'),
(244, '37', '148'),
(247, '37', '150'),
(248, '37', '151'),
(250, '37', '152'),
(251, '37', '153'),
(252, '37', '154'),
(253, '37', '159'),
(256, '37', '160'),
(265, '37', '181'),
(270, '37', '199'),
(76, '37', 'knlkm19'),
(78, '37', 'knlkm20'),
(83, '37', 'knlkm23'),
(84, '37', 'knlkm25'),
(278, '38', '118'),
(279, '38', '119'),
(281, '38', '120'),
(283, '38', '121'),
(288, '38', '125'),
(175, '38', '132'),
(177, '38', '133'),
(180, '38', '134'),
(187, '38', '135'),
(193, '38', '136'),
(199, '38', '137'),
(207, '38', '138'),
(209, '38', '139'),
(215, '38', '140'),
(232, '38', '144'),
(234, '38', '145'),
(254, '38', '159'),
(257, '38', '160'),
(259, '38', '177'),
(271, '38', '199'),
(276, '38', '202'),
(240, '39', '146'),
(242, '39', '147'),
(77, '39', 'knlkm19'),
(62, '4', 'knlkm28'),
(277, '40', '117'),
(163, '40', '130'),
(167, '40', '131'),
(174, '40', '132'),
(179, '40', '134'),
(186, '40', '135'),
(206, '40', '138'),
(214, '40', '140'),
(218, '40', '141'),
(231, '40', '144'),
(233, '40', '145'),
(239, '40', '146'),
(246, '40', '149'),
(266, '40', '181'),
(275, '40', '202'),
(80, '40', 'knlkm21'),
(161, '41', '130'),
(165, '41', '131'),
(173, '41', '132'),
(178, '41', '134'),
(185, '41', '135'),
(192, '41', '136'),
(198, '41', '137'),
(205, '41', '138'),
(213, '41', '140'),
(225, '41', '142'),
(228, '41', '143'),
(243, '41', '148'),
(245, '41', '149'),
(264, '41', '181'),
(79, '41', 'knlkm20'),
(81, '41', 'knlkm21'),
(249, '42', '151'),
(296, '42', '96'),
(82, '42', 'knlkm23'),
(290, '43', '126'),
(269, '43', '197'),
(85, '43', 'knlkm27'),
(92, '44', 'kpbak01'),
(93, '44', 'kpbak02'),
(122, '44', 'kpbth02'),
(94, '45', 'kpbak03'),
(98, '45', 'kpbak08'),
(100, '45', 'kpbak09'),
(120, '46', 'kpbak20'),
(299, '47', '96'),
(121, '47', 'kpbak21'),
(95, '48', 'kpbak05'),
(96, '49', 'kpbak06'),
(157, '49', 'kpbut02'),
(97, '50', 'kpbak07'),
(99, '51', 'kpbak08'),
(101, '51', 'kpbak09'),
(102, '52', 'kpbak10'),
(103, '52', 'kpbak11'),
(104, '52', 'kpbak13'),
(112, '52', 'kpbak17'),
(105, '53', 'kpbak13'),
(298, '54', '96'),
(107, '54', 'kpbak14'),
(108, '55', 'kpbak14'),
(137, '55', 'kpbgs11'),
(109, '56', 'kpbak14'),
(110, '57', 'kpbak15'),
(113, '58', 'kpbak17'),
(136, '58', 'kpbgs10'),
(115, '59', 'kpbak16'),
(63, '6', 'knlkm28'),
(124, '60', 'kpbth03'),
(135, '61', 'kpbgs09'),
(118, '62', 'kpbak18'),
(119, '62', 'kpbak19'),
(125, '62', 'kpbut01'),
(106, '63', 'kpbak13'),
(116, '64', 'kpbak16'),
(226, '65', '142'),
(229, '65', '143'),
(123, '65', 'kpbth01'),
(158, '65', 'kpbut02'),
(297, '66', '96'),
(126, '66', 'kpbia01'),
(127, '66', 'kpbia02'),
(128, '67', 'kpbgs01'),
(129, '67', 'kpbgs02'),
(130, '67', 'kpbgs03'),
(131, '67', 'kpbgs04'),
(132, '67', 'kpbgs05'),
(133, '67', 'kpbgs06'),
(134, '67', 'kpbgs07'),
(142, '67', 'kpbgs08'),
(141, '68', 'kpbak04'),
(140, '68', 'kpbak12'),
(138, '68', 'kpbgs12'),
(156, '70', 'kpbut02'),
(294, '73', '50'),
(300, '75', '207'),
(302, '76', '44'),
(303, '78', '58'),
(304, '78', '59'),
(305, '78', '60'),
(306, '78', '61'),
(292, '8', '127'),
(307, '80', '52'),
(295, '81', '51'),
(301, '83', '208'),
(164, '84', '130'),
(168, '84', '131'),
(176, '84', '132'),
(188, '84', '135'),
(194, '84', '136'),
(200, '84', '137'),
(208, '84', '138'),
(219, '84', '141'),
(227, '84', '142'),
(230, '84', '143'),
(267, '84', '181'),
(285, '85', '122'),
(255, '85', '159'),
(258, '85', '160'),
(272, '85', '199'),
(268, '86', '196'),
(286, '87', '123'),
(287, '87', '124');

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
`id` int(11) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `deskripsi` text NOT NULL,
  `satuan` varchar(8) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id`, `id_parameter`, `nama`, `deskripsi`, `satuan`, `harga`) VALUES
(1, 'fmbab01', 'Ratio', '', '%', 0),
(2, 'fmbab02', 'Magnetit', '', '%', 0),
(3, 'fmbab03', 'Ilmenit', '', '%', 0),
(4, 'fmbab04', 'Hematit', '', '%', 0),
(6, 'fmbab06', 'Amfibol', '', '%', 0),
(7, 'fmbab07', 'Piroksen', '', '%', 0),
(9, 'fmbab09', 'Pirit', '', '%', 0),
(10, 'fmbab10', 'Kalkopirit', '', '%', 0),
(11, 'fmbab11', 'Leukosen', '', '%', 0),
(12, 'fmbab12', 'Zirkon', '', '%', 0),
(13, 'fmbab13', 'Kasiterit', '', '%', 0),
(14, 'fmbab14', 'Rutil', '', '%', 0),
(15, 'fmbab15', 'Oksida Besi', '', '%', 0),
(16, 'fmbab16', 'Kromit', 'Analisa Butir-Ayak', '%', 0),
(17, 'fmbab17', 'Garnet', 'Analisa Butir-Ayak', '%', 0),
(18, 'fmbab18', 'Korundum', 'Analisa Butir-Ayak', '%', 0),
(19, 'fmbab19', 'Markasit', 'Analisa Butir-Ayak', '%', 0),
(20, 'fmbab20', 'Turmalin', 'Analisa Butir-Ayak', '%', 0),
(21, 'fmbab21', 'Sinabar', 'Analisa Butir-Ayak', '%', 0),
(22, 'fmbab22', 'Argentit', 'Analisa Butir-Ayak', '%', 0),
(23, 'fmbab23', 'Barit', 'Analisa Butir-Ayak', '%', 0),
(24, 'fmbab24', 'Apatit', 'Analisa Butir-Ayak', '%', 0),
(25, 'fmbab25', 'Anatas', 'Analisa Butir-Ayak', '%', 0),
(26, 'fmbab26', 'FR.Batuan', 'Analisa Butir-Ayak', '%', 0),
(27, 'fmbab27', 'Emas', 'Analisa Butir-Ayak', '%', 0),
(28, 'fmbab28', 'Biotit', 'Analisa Butir-Ayak', '%', 0),
(29, 'fmbbb01', 'AKMPR', 'Analisis Komposisi Maseral dan Penentuan Reflektan', '', 0),
(30, 'fmbpb01', 'Plagioklas', 'Deskripsi Petrografi Batuan dilengkapi dengan Interpretasi Mineral Ubahan', '%', 0),
(31, 'fmbpb02', 'Kuarsa', '', '%', 0),
(32, 'fmbpb03', 'Epidot', '', '%', 0),
(33, 'fmbpb04', 'Mineral Opak/Oksida Besi', '', '%', 0),
(34, 'fmbpb05', 'Lempung', '', '%', 0),
(35, 'fmbpb06', 'Klorit', '', '%', 0),
(36, 'fmbpb07', 'Karbonat', '', '%', 0),
(37, 'fmbpb08', 'Masadasar', '', '%', 0),
(38, 'fmbpb09', 'Fragmen Fosil', '', '%', 0),
(39, 'fmbpb10', 'Dolomit', '', '%', 0),
(40, 'kbbak01', 'Form of Sulfur', '', '%', 0),
(42, 'kbbak03', 'Chlorine', '', '%', 0),
(43, 'kbbak04', 'TOC (Total Organic Carbon)', '', '%', 0),
(44, 'kbbap01', 'Total Moisture', '', '%', 100000),
(45, 'kbbap02', 'Moisture', '', '%', 100000),
(47, 'kbbap04', 'Volatile Matter', '', '%', 100000),
(48, 'kbbap05', 'Fixed Carbon', '', '%', 100000),
(49, 'kbbap06', 'Analisa Abu', '', '%', 100000),
(50, 'kbbas01', 'Calorific Value', '', 'Cal/gr', 0),
(51, 'kbbas02', 'True Specific Gravity', '', '', 0),
(52, 'kbbas03', 'HGI', '', '', 0),
(53, 'kbbas04', 'Swelling Index', '', '', 0),
(54, 'kbbas05', 'Gray King Coke', '', '', 0),
(55, 'kbbas06', 'Titik Leleh Abu', '', 'C', 0),
(56, 'kbbas07', 'HGI (Hard Groved Index)', '', '', 0),
(57, 'kbbas08', 'Sifat Muai (Dilatometer)', '', '%', 0),
(58, 'kbbau01', 'Karbon / C', '', '%', 280000),
(59, 'kbbau02', 'Hidrogen / H', '', '%', 280000),
(60, 'kbbau03', 'Nitrogen / N', '', '%', 280000),
(61, 'kbbau04', 'Oksigen / O', '', '%', 0),
(62, 'kbbau05', 'Sulfur / S', '', '%', 0),
(64, 'kmkgb02', 'BD', '', '', 0),
(65, 'kmkgb03', 'LS', '', '%', 0),
(66, 'kmkgb04', 'RM', '', '%', 0),
(67, 'kmkgb05', 'VM', '', '%', 0),
(68, 'kmkgb06', 'ASH', '', '%', 0),
(69, 'kmkgb07', 'FC', '', '%', 0),
(70, 'kmkgb08', 'M', '', '%', 0),
(71, 'kmkgb09', 'S', '', '%', 0),
(73, 'kmlaa03', 'Cu', '', 'ppm', 25000),
(74, 'kmlaa04', 'Pb', '', 'ppm', 25000),
(75, 'kmlaa05', 'Zn', '', 'ppm', 25000),
(76, 'kmlaa06', 'Ag', '', 'ppm', 25000),
(78, 'kmlaa08', 'Ni', '', 'ppm', 25000),
(80, 'kmlaa10', 'Cr', '', 'ppm', 25000),
(81, 'kmlaa11', 'Mn', '', 'ppm', 25000),
(84, 'kmlaa14', 'Bi', '', 'ppm', 30000),
(85, 'kmlaa15', 'Cd', '', 'ppm', 30000),
(86, 'kmlau01', 'Fire Essay', '', 'ppm', 30000),
(87, 'kmlau02', 'Aqua Regia', '', 'ppm', 30000),
(88, 'kmlcp01', 'Y', '', '', 75000),
(89, 'kmlcp02', 'Zr', '', '', 75000),
(90, 'kmlcp03', 'Nb', '', '', 75000),
(91, 'kmlcp04', 'La', '', '', 75000),
(92, 'kmlcp05', 'Ce', '', '', 75000),
(93, 'kmlcp06', 'Nd', '', '', 75000),
(94, 'kmlcp07', 'Pm', '', '', 75000),
(95, 'kmlcp08', 'Sm', '', '', 75000),
(96, 'kmlcp09', 'Eu', '', '', 75000),
(97, 'kmlcp10', 'Gd', '', '', 75000),
(98, 'kmlcp11', 'Tb', '', '', 75000),
(99, 'kmlcp12', 'Dy', '', '', 75000),
(100, 'kmlcp13', 'Ho', '', '', 75000),
(101, 'kmlcp14', 'Er', '', '', 75000),
(102, 'kmlcp15', 'Tm', '', '', 75000),
(103, 'kmlcp16', 'Yb', '', '', 75000),
(104, 'kmlcp17', 'Lu', '', '', 75000),
(106, 'kmlkl02', 'Sn', '', 'ppm', 0),
(107, 'kmlkl03', 'W', '', 'ppm', 0),
(108, 'kmlkl04', 'Sb', '', 'ppm', 0),
(109, 'kmlkl05', 'Mo', '', 'ppm', 0),
(110, 'kmlkl06', 'V', '', '', 0),
(116, 'kmlmp07', 'Sr', '', 'ppb', 60000),
(117, 'knlfs01', 'Bleaching Test', '', '', 0),
(118, 'knlfs02', 'KTK/CEC', '', '', 0),
(119, 'knlfs03', 'Methylene Blue Test', '', '', 0),
(120, 'knlfs04', 'Blast Test', '', '', 0),
(121, 'knlfs05', 'Crucible Test', '', '', 0),
(122, 'knlfs06', 'Drilling Mud Test (Swelling)', '', '', 0),
(123, 'knlfs07', 'Drilling Mud Test (Viskositas Relatif)', '', '', 0),
(124, 'knlfs08', 'Drilling Mud Test (Viskositas Absolut)', '', '', 0),
(125, 'knlfs09', 'Drilling Mud Test (CEC, Ca &Mg)', '', '', 0),
(126, 'knlfs10', 'Drilling Mud Test (pH)', '', '', 0),
(127, 'knlfs11', 'Kadar Pasir', '', '', 0),
(128, 'knlfs12', 'Kadar Air (Moisture)', '', '', 0),
(130, 'knlkm02', 'SiO2 Reaktif', '', '%', 0),
(131, 'knlkm03', 'Al2O3', '', '%', 0),
(132, 'knlkm04', 'Fe2O3', '', '%', 0),
(133, 'knlkm05', 'FeO', '', '%', 0),
(134, 'knlkm06', 'Fetotal', '', '%', 0),
(135, 'knlkm07', 'Fe3O4', '', '%', 0),
(136, 'knlkm08', 'CaO', '', '%', 0),
(137, 'knlkm09', 'MgO', '', '%', 0),
(138, 'knlkm10', 'MnO', '', '%', 0),
(139, 'knlkm11', 'MnO2', '', '%', 0),
(140, 'knlkm12', 'Mntotal', '', '%', 0),
(141, 'knlkm13', 'TiO2', '', '%', 0),
(142, 'knlkm14', 'Na2O', '', '%', 0),
(143, 'knlkm15', 'K2O', '', '%', 0),
(144, 'knlkm16', 'P2O5', '', '%', 0),
(145, 'knlkm17', 'Ptotal', '', '%', 0),
(146, 'knlkm18', 'SO3', '', '%', 0),
(147, 'knlkm19', 'Stotal', '', '%', 0),
(148, 'knlkm20', 'BaO', '', '%', 0),
(149, 'knlkm21', 'Cr2O3', '', '%', 0),
(150, 'knlkm22', 'H2O-', '', '%', 0),
(151, 'knlkm23', 'H2O+', '', '%', 0),
(152, 'knlkm24', 'HD', '', '%', 0),
(153, 'knlkm25', 'BV', '', '%', 0),
(154, 'knlkm26', 'BJ/SG', '', '%', 0),
(159, 'knlkm31', 'MgCO3', '', '%', 0),
(160, 'knlkm32', 'CaCO3', '', '%', 0),
(162, 'kpbak02', 'DHL', '', 'mg/L', 0),
(163, 'kpbak03', 'TDS', '', 'mg/L', 0),
(164, 'kpbak04', 'SiO', '', 'mg/L', 0),
(165, 'kpbak05', 'B', '', 'mg/L', 0),
(166, 'kpbak06', 'Al', '', 'mg/L', 0),
(167, 'kpbak07', 'Fe', '', 'mg/L', 0),
(168, 'kpbak08', 'Ca', '', 'mg/L', 0),
(169, 'kpbak09', 'Mg', '', 'mg/L', 0),
(170, 'kpbak10', 'Na', '', 'mg/L', 0),
(171, 'kpbak11', 'K', '', 'mg/L', 0),
(172, 'kpbak12', 'Li', '', 'mg/L', 0),
(173, 'kpbak13', 'As', '', 'mg/L', 0),
(175, 'kpbak15', 'F', '', 'mg/L', 0),
(176, 'kpbak16', 'SO4', '', 'mg/L', 0),
(177, 'kpbak17', 'CI', '', 'mg/L', 0),
(178, 'kpbak18', 'HCO3', '', 'mg/L', 0),
(179, 'kpbak19', 'CO3', '', 'ppb', 0),
(180, 'kpbak20', 'TSS', '', 'ppb', 0),
(181, 'kpbak21', 'SiO2', '', 'ppb', 0),
(182, 'kpbgs01', 'H2', '', '% mol', 0),
(183, 'kpbgs02', 'O2', '', '% mol', 0),
(184, 'kpbgs03', 'Ar', '', '% mol', 0),
(185, 'kpbgs04', 'N2', '', '% mol', 0),
(186, 'kpbgs05', 'CH4', '', '% mol', 0),
(187, 'kpbgs06', 'CO', '', '% mol', 0),
(188, 'kpbgs07', 'He', '', '% mol', 0),
(190, 'kpbgs09', 'H2S', '', '% mol', 0),
(191, 'kpbgs10', 'HCI', '', '% mol', 0),
(192, 'kpbgs11', 'NH4', '', '% mol', 0),
(193, 'kpbgs12', 'H2O', '', '% mol', 0),
(194, 'kpbia01', 'd(18O_16O)', '', '%o', 0),
(195, 'kpbia02', 'd(D_H)', '', '%o', 0),
(196, 'kpbth01', 'Hg', '', 'ppb', 0),
(197, 'kpbth02', 'pH', '', '', 0),
(198, 'kpbth03', 'H20-', '', '%', 0),
(199, 'kpbut01', 'CO2', '', '%', 0),
(200, 'kpbut02', 'silica', '', 'Kg', 18000),
(201, 'knlbj01', 'Berat Jenis', '', '', 0),
(202, '', 'P2O5 cas', '', '', 0),
(203, '', 'Analisa Partial (Pelarutan dgn HNO3 50%)', '', '', 0),
(204, '', 'Analisa Total (Pelarutan dgn HF/HCLO4)', '', '', 0),
(205, '', 'Pr', '', '', 0),
(206, '', 'Ta', '', '', 0),
(207, '', 'Free Moisture', '', '', 0),
(208, '', 'Total Sulphur', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pemohon`
--

CREATE TABLE IF NOT EXISTS `pemohon` (
`id_pemohon` int(11) NOT NULL,
  `id_type_pemohon` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nama_sertifikat` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(49) NOT NULL,
  `pass_awal` varchar(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`id_pemohon`, `id_type_pemohon`, `nama`, `nama_sertifikat`, `alamat`, `deskripsi`, `username`, `password`, `pass_awal`) VALUES
(1, '01', 'Edi Suryadi Soegoto', 'Edi Suryadi Soegoto', 'Jl. Tubagus Smail No. 212 Bandung', '', 'EDI7', '11b3ea1f02af4696dd290df8dfcb2e0f2731276c', '76191827'),
(2, '03', 'Wahyu Djaya Diningrat', 'Wahyu Djaya Diningrat', 'Jl. Tubagus Smail No. 212 Bandung', '', 'WAHY81', 'c4999ba28e12dc7f5b333421fe463ffd8428a158', '7eeb88ac'),
(3, '02', 'Wendi Bunga Hasibuan', 'Wendi Bunga Hasibuan', 'Jl. Kapten Bucharoff No. 23 Medan', '', 'WEND47', '7897e5dddd008b1ffd193afaa3c767b8d687be1d', '5de1ab34'),
(4, '08', 'Bambang Sitanggang', 'Bambang Sitanggang', 'Kp. Sirnagalih No. 23 Bandung', '', 'BAMB82', '91328cdeb6f10738911d2b00fb3a9cbcdfb83d7d', '6e3ed4f1'),
(5, '07', 'Ahmad Kosasih', 'PT. GEOTHERMAL ABADI', 'Jl. Rasuna Said No. 55 Jakarta', '', 'FULA93', '4aba40472fedaf6c92d17b210f5ecaf41284d5db', '8a0d8400'),
(6, '06', 'Guruh Sarwono', 'Guruh Sarwono', 'Jl. Tubagus Smail No. 212 Bandung', '', 'GURU68', 'cfe0f9d6ac9f27e9c118bfd0ef329cfacad385d8', 'e8dc6e15'),
(7, '03', 'ir. lili', 'lili', '-', '', 'IR.4', '8c23412f8bf11d8c0643e79cd5874a9f1fe19c2f', '63896376'),
(8, '03', 'nova', 'nova', 'diponrgor', '', 'NOVA76', '35d6f9c0f4e13d9f8f2391e5b4cc153f62593cb3', 'f856694c'),
(9, '07', 'Fanfan', 'Lab. Ventilasi dan Lingkungan ', 'Jl. Ganesa 10 Bandung', '', 'FANF16', '61739d1c98adcb113ceedf66daa5d3d8f2a2b29c', '99ccbabc');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE IF NOT EXISTS `petugas` (
`id_petugas` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL COMMENT 'Nomor Induk Pegawai',
  `nama` varchar(30) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_komoditi` varchar(2) NOT NULL COMMENT 'bagian',
  `bagian` varchar(20) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(49) NOT NULL,
  `pass_awal` varchar(9) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_login` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nip`, `nama`, `telepon`, `email`, `id_komoditi`, `bagian`, `username`, `password`, `pass_awal`, `admin`, `is_login`, `last_login`, `created_date`, `updated_date`) VALUES
(1, '01003658841253639', 'Firmansyah', '085722145866', 'dadangdudung@gmail.com', 'tu', '', 'admin', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 1, 1, '2015-08-10 00:02:42', '0000-00-00 00:00:00', '2015-08-09 17:02:42'),
(2, '1234567890123456789', 'Boy Jati Asmara', '', '', 'bb', '', 'batubara', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-08-07 23:31:52', '0000-00-00 00:00:00', '2015-08-07 16:32:15'),
(3, '1231297224974', 'Kepala Pusat', NULL, NULL, 'pw', 'Kepala Pusat', 'kapus', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-07-29 02:28:09', '0000-00-00 00:00:00', '2015-07-28 19:28:24'),
(4, '28934623764', 'Kasub Bidang Lab', NULL, NULL, 'pw', 'Kepala Laboratorium', 'kalab', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-06-04 03:17:04'),
(5, '48480048252136658', 'Zaenal Arief', NULL, NULL, 'lg', '', 'logam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-08-07 23:32:19', '0000-00-00 00:00:00', '2015-08-07 16:32:47'),
(6, '012536620211000114', 'Abdurrahman', NULL, NULL, 'nl', '', 'nonlogam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-06-03 21:24:06', '0000-00-00 00:00:00', '2015-06-03 14:24:12'),
(7, '2512335588141002629', 'Airlangga Kusuma', NULL, NULL, 'pb', '', 'panasbumi', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 1, '2015-07-29 10:16:38', '0000-00-00 00:00:00', '2015-07-29 03:16:38'),
(8, '12312t318236', 'Kabid Sarana Teknik', NULL, NULL, 'pw', '', 'sartek', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-07-08 02:09:49', '0000-00-00 00:00:00', '2015-07-07 19:10:39'),
(9, '01003651251253622', 'Muhammad Ridwan', '085722145866', 'wahyu.utama@gmail.com', 'pp', '', 'preparasi', '8cb2237d0679ca88db6464eac60da96345513964', '123', 0, 0, '2015-08-03 15:42:24', '2015-03-25 17:43:48', '2015-08-03 08:45:39'),
(10, '12518651', 'Danang', '08272254896', 'maman@gmail.com', 'tu', '123', 'DANATU53', '00baa07ff4e556fae9c026aecad7ab17109fb9b0', '3e5bfa14', 0, 0, '0000-00-00 00:00:00', '2015-06-04 09:56:17', '2015-06-04 02:56:17'),
(11, '158332545597856', 'Dzaki Alwan', '08574457889', 'jaki@gmail.com', 'pp', 'Pembuangan', 'DZAK65', '2bf4007007517e7e5507b8019c5dc3f097fd3728', '8ac95d11', 0, 0, '0000-00-00 00:00:00', '2015-07-01 15:47:32', '2015-07-01 08:47:32'),
(12, '01222323', 'Asep Lubis', '085755245699', 'asep.L123@gmail.com', 'tu', 'Admin', 'ASEP8', '36fcfd2110a7782e2813fde2be822c5d73df80fc', '5c252b28', 0, 0, '2015-07-29 02:20:00', '2015-07-29 01:37:55', '2015-07-28 19:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `preparasi`
--

CREATE TABLE IF NOT EXISTS `preparasi` (
`id` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `jumlah_conto` int(11) NOT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:pending, 1: terima, 2: proses, 3: selesai',
  `created_date` date NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preparasi`
--

INSERT INTO `preparasi` (`id`, `id_analisis`, `tanggal_masuk`, `tanggal_mulai`, `tanggal_selesai`, `jumlah_conto`, `id_petugas`, `status`, `created_date`, `updated_date`) VALUES
(1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, '2015-08-06', '2015-08-06 16:32:10'),
(2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, '2015-08-06', '2015-08-06 16:33:57'),
(3, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, '2015-08-06', '2015-08-06 16:35:12'),
(4, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, '2015-08-06', '2015-08-06 16:35:55'),
(6, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, '2015-08-07', '2015-08-07 15:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `prosedur`
--

CREATE TABLE IF NOT EXISTS `prosedur` (
`id` int(11) NOT NULL,
  `id_type_analisis` int(11) NOT NULL,
  `keterangan_total_waktu` varchar(255) NOT NULL,
  `keterangan_prosedur` text NOT NULL,
  `keterangan` text NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prosedur`
--

INSERT INTO `prosedur` (`id`, `id_type_analisis`, `keterangan_total_waktu`, `keterangan_prosedur`, `keterangan`, `created_date`, `updated_date`) VALUES
(1, 1, '', '', '', '2015-04-14 11:16:46', '2015-04-14 04:17:02'),
(3, 2, '', '', '', '2015-04-14 11:33:19', '2015-04-14 04:33:19'),
(4, 21, 'Total waktu untuk analisis conto dengan menggunakan instrumen AAS adalah 9 hari dengan kapasitas 50 conto untuk conto dalam keadaan kering dan 10 hari dengan kapasitas 50 conto untuk contoh dalam keadaan basah.', '1. Penyerahan conto dan formulir analisisBagian administrasi laboratorium menerima dan mencatat mengenai conto dari customer. Menjelaskan mengenai syarat - syarat analisis conto, terutama mengenai berat minimal dan jenis conto ( batuan, endapan sungai, pasir, tanah, bijih, atau konsentrat). Kemudian mendistribusikan kepada bagian preparasi. 2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayananBagian preparasi melakukan pendataan mengenai jumlah conto yang diterima, kode conto, dan unsur yang akan dianalisis. 3. Preparasi contoPreparasi conto dilakukan dengan menghaluskan conto, kemudian conto dikemas untuk selanjutnya diserahkan kepada analis.4. Menyerahkan conto dari lab. Preparasi ke lab. AnalisisPada saat penyerahan conto dari preparasi ke lab.analisis, dilakukan pengecekan mengenai jumlah conto yang diterima serta unsur yang akan dianalisis.5. Mengidentifikasi parameter analisisAnalis melakukan identifikasi dari conto mengenai unsur (kandungan) yang akan dianalisis.6. Memasukkan data analisis di buku induk serta aplikasi pelayananAnalis memasukkan data mengenai conto berupa no analisis, kode conto serta unsur yang akan dianalisis ke dalam buku induk dan aplikasi pelayanan.7. Menganalisis conto dengan menggunakan instrumen AAS.Proses analisa meliputi penimbangan conto, pelarutan conto, pembuatan larutan standar, dan analisa dengan menggunakan AAS.8. Mengolah data analisaAnalis melakukan pengolahan data hasil analisa dengan menggunakan AAS, apabila terdapat hasil yang over maka akan dilakukan pengenceran terhadap sampel.9. Memasukkan data hasil analisis ke lembar hasil analisisAnalis memindahkan data hasil analisis ke lembar hasil analisis. Pada proses ini dilakukan perhitungan apabila terdapat faktor pengenceran pada conto.10. Mengecek hasil  analisis Penyelia melakukan pengecekan terhadap hasil analisis. Apabila terdapat kesalahan pada hasil analisis, penyelia akan mengembalikan hasil analisis kepada analis untuk dilakukan perbaikan.11. Memasukkan hasil analisis global ke buku induk serta aplikasi pelayanan.Jika tidak terdapat kesalahan pada hasil analisis, penyelia memasukkan hasil analisis global ke buku induk serta aplikasi layanan.12. Pengecekan global hasil analisisManajer teknik melakukan pengecekan global terhadap hasil analisis, apabila terdapat penyimpangan pada hasil analisis, manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak. 13. Menyerahkan hasil analisis ke bagian administrasiLaboratorium akan menyerahkan hasil analisis kepada bagian administrasi. Bagian administrasi membuat sertifikat hasil analisis laboratorium.', '1. Total waktu untuk analisis conto dengan menggunakan instrumen AAS adalah 9 hari dengan kapasitas 50 conto untuk conto dalam keadaan kering dan 10 hari dengan kapasitas 50 conto untuk contoh dalam keadaan basah.\n2. Pada analisis dengan menggunakan instrumen AAS, jumlah unsur yang dianalisis tidak mempengaruhi waktu analisis ( tidak ada penambahan atau pengurangan waktu analisis).\n3. Analisis minimal 4 unsur / conto.', '2015-04-14 11:34:08', '2015-04-16 08:29:27'),
(5, 22, 'Total waktu untuk analisis contoh dengan menggunakan instrumen ICP-MS adalah 24 hari dengan kapasitas 50 conto untuk conto dalam keadaan kering dan 25 hari dengan kapasitas 50 conto untuk conto dalam keadaan basah.', '1. Penyerahan conto dan formulir analisis\nBagian administrasi laboratorium menerima dan mencatat mengenai conto dari customer. Menjelaskan mengenai syarat - syarat analisis conto, terutama mengenai berat minimal dan jenis conto ( batuan, endapan sungai, pasir, tanah, bijih, atau konsentrat). Kemudian mendistribusikan kepada bagian preparasi. \n2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayanan\nBagian preparasi melakukan pendataan mengenai jumlah conto yang diterima, kode conto, dan unsur yang akan dianalisis. \n3. Preparasi conto\nPreparasi conto dilakukan dengan menghaluskan conto, kemudian conto dikemas untuk selanjutnya diserahkan kepada analis.\n4. Menyerahkan conto dari lab. Preparasi ke lab. Analisis\nPada saat penyerahan conto dari preparasi ke lab.analisis, dilakukan pengecekan mengenai jumlah conto yang diterima serta unsur yang akan dianalisis.\n5. Mengidentifikasi parameter analisis\nAnalis melakukan identifikasi dari conto mengenai unsur (kandungan) yang akan dianalisis.\n6. Memasukkan data analisis di buku induk serta aplikasi pelayanan\nAnalis memasukkan data mengenai conto berupa no analisis, kode conto serta unsur yang akan dianalisis ke dalam buku induk dan aplikasi pelayanan.\n7. Menganalisis conto dengan menggunakan instrumen ICP-MS.\nProses analisa meliputi penimbangan conto, pelarutan conto, pembuatan larutan standar, dan analisa dengan menggunakan ICP-MS.\n8. Mengolah data analisa\nAnalis melakukan pengolahan data hasil analisa dengan menggunakan ICP-MS, apabila terdapat hasil yang  over  maka akan dilakukan pengenceran terhadap sampel.\n9. Memasukkan data hasil analisis ke lembar hasil analisis\nAnalis memindahkan data hasil analisis ke lembar hasil analisis. Pada proses ini dilakukan perhitungan apabila terdapat faktor pengenceran pada conto.\n10. Mengecek hasil  analisis \nPenyelia melakukan pengecekan terhadap hasil analisis. Apabila terdapat kesalahan pada hasil analisis, penyelia akan mengembalikan hasil analisis kepada analis untuk dilakukan perbaikan.\n11. Memasukkan hasil analisis global ke buku induk serta aplikasi pelayanan.\nJika tidak terdapat kesalahan pada hasil analisis, penyelia memasukkan hasil analisis global ke buku induk serta aplikasi layanan.\n\n12. Pengecekan global hasil analisis\nManajer teknik melakukan pengecekan global terhadap hasil analisis, apabila terdapat penyimpangan pada hasil analisis, manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak. \n13. Menyerahkan hasil analisis ke bagian administrasi\nLaboratorium akan menyerahkan hasil analisis kepada bagian administrasi. Bagian administrasi membuat sertifikat hasil analisis laboratorium.', '1. Total waktu untuk analisis contoh dengan menggunakan instrumen ICP-MS adalah 24 hari dengan kapasitas 50 conto untuk conto dalam keadaan kering dan 25 hari dengan kapasitas 50 conto untuk conto dalam keadaan basah.\n2. Pada analisis dengan menggunakan instrumen ICP-MS, jumlah unsur yang dianalisis  tidak mempengaruhi waktu analisis ( tidak ada penambahan atau pengurangan waktu analisis).\n3. Analisis minimal 5 conto , untuk analisis logam tanah  jarang (4 unsur/ conto ).', '2015-04-16 14:39:59', '2015-04-16 08:13:47'),
(13, 30, '', '', '', '2015-04-23 23:27:48', '2015-04-23 16:27:48'),
(14, 27, '', '', '', '2015-04-23 23:35:25', '2015-04-23 16:35:25'),
(15, 23, '', '', '', '2015-04-24 21:28:45', '2015-04-24 14:28:45'),
(16, 32, '', '', '', '2015-04-25 00:09:36', '2015-04-24 17:09:36'),
(17, 24, '', '', '', '2015-04-25 00:09:45', '2015-04-24 17:09:45'),
(18, 33, '', '', '', '2015-04-25 13:26:40', '2015-04-25 06:26:40'),
(19, 34, '', '', '', '2015-04-25 13:35:22', '2015-04-25 06:35:22'),
(20, 17, '', '', '', '2015-04-29 13:31:07', '2015-04-29 06:31:07'),
(21, 31, '', '', '', '2015-04-29 13:33:48', '2015-04-29 06:33:48'),
(22, 5, '', '', '', '2015-04-30 13:33:05', '2015-04-30 06:33:05'),
(23, 3, '', '', '', '2015-05-06 10:50:28', '2015-05-06 03:50:28'),
(24, 10, '', '\n1. Menerima conto\nBagian adminstrasi menerima conto dari pelanggan dan mengidentifikasi jenis serta jumlah conto kemudian bagian administrasi mengeluarkan formulir tugas preparasi serta formulir tugas analisa yang selanjutnya akan diserahkan ke bagian preparasi serta analisis. Setelah selesai melakukan identifikasi serta administrasi lainnya bagian administrasi laboratotium menyerahkan conto yang akan di analisis ke laboratorium preparasi.  \n2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayanan\nPreparator melakukan identifikasi conto berupa jenis conto serta jumlah conto yang diterima dari bagian administrasi, kemudian preparator memasukkan data conto ke buku induk conto serta aplikasi pelayanan laboratorium.    \n3. Preparasi conto\nPreparasi conto dilakukan dengan cara menggerus conto kering hingga berukuran 10 mesh menggunakan crusher kemudian dilakukan pengemasan untuk selanjutnya conto akan diserahkan ke laboratorium analisis. Untuk conto basah harus dikeringkan dahulu dengaan cara diangin-anginkan, tidak boleh menggunakaan oven. \n4. Menyerahkan conto dari lab. Preparasi ke lab. Analisa\nPada saat menyerahkan conto dari lab. Preparasi ke lab. Analisa dilakukan pengecekan jumlah conto yang akan dianalisa. \n5. Memasukkan parameter analisis di buku induk serta aplikasi pelayanan\nAnalis melakukan pengecekan analisis yang akan dilakukan di formulir tugas analisa serta menuliskan data conto ke dalam buku induk conto berupa nomor analisa dan jumlah conto.\n6. Menganalisis  conto Retsort dengan Fischer Assay\nProses analisis Retort  meliputi penimbangan conto sebanyak 100 gram kemudian dianalisa menggunakan instumentasi Fischer Assay.\n7. Mengolah data analisis\nMengolah data analisis dilakukan dengan mengukur hasil retorting. \n8. Memasukkan data hasil analisis ke lembar hasil analisis\nHasil analisis dituliskan ke lembar hasil analisis oleh analis \n9. Mengecek hasil analisis\nHasil analisis kemudian di cek oleh penyelia\n10. Memasukan hasil analisis  global ke buku induk serta aplikasi pelayanan\nSetelah hasil di cek oleh penyelia selanjutnya penyelia memasukan hasil analisis ke buku induk conto serta ke aplikasi pelayanan  \n11. Pengecekan global hasil analisis\nPengecekan hasil global analisis dilakukan oleh Manajer Teknik sebelum hasil di serahkan ke bagian administrasi\n12. Menyerahkan hasil analis ke bagian administrasi\nMenyerahkan hasil analisis dari lab. Analisis ke administrasi sebagai bahan pembuatan sertifikat ', '', '2015-05-06 10:53:17', '2015-05-06 03:58:50'),
(25, 36, '', '', '', '2015-05-06 11:00:07', '2015-05-06 04:00:07'),
(26, 6, '', '\n1. Menerima conto\nBagian adminstrasi menerima conto dari pelanggan dan mengidentifikasi jenis serta jumlah conto kemudian bagian administrasi mengeluarkan formulir tugas preparasi serta formulir tugas analisa yang selanjutnya akan diserahkan ke bagian preparasi serta analisis. Setelah selesai melakukan identifikasi serta administrasi lainnya bagian administrasi laboratotium menyerahkan conto yang akan di analisis ke laboratorium preparasi.  \n2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayanan\nPreparator melakukan identifikasi conto berupa jenis conto serta jumlah conto yang diterima dari bagian administrasi, kemudian preparator memasukkan data conto ke buku induk conto serta aplikasi pelayanan laboratorium.    \n3. Preparasi conto\nPreparasi conto dilakukan dengan cara mendulang bila belum berbentuk konsentrat, kemudian di pisahkan secara separasi magnet dan ditimbang dan pengemasan untuk selanjutnya conto akan diserahkan ke laboratorium analisis. Untuk conto basah harus dikeringkan dahulu dengan menggunakaan oven. \n4. Menyerahkan conto dari lab. Preparasi ke lab. Analisa\nPada saat menyerahkan conto dari lab. Preparasi ke lab. Analisa dilakukan pengecekan jumlah conto yang akan dianalisa. \n5. Memasukkan parameter analisis di buku induk serta aplikasi pelayanan\nAnalis melakukan pengecekan analisis yang akan dilakukan di formulir tugas analisa serta menuliskan data conto ke dalam buku induk conto berupa nomor analisa dan jumlah conto.\n6. Menganalisis  conto Mineralogi Butir\nProses analisis mineralogi butir  meliputi pendeskripsian jenis mineral dan prosentase keterdapatannya dengan Mikroskop Stereo binokuler Zeiss Discovery V.20\n7. Mengolah data analisis\nMengolah data analisis dilakukan dengan merangkum  hasil pendeskripsian dan komposisi. \n8. Memasukkan data hasil analisis ke lembar hasil analisis\nHasil analisis dituliskan ke lembar hasil analisis oleh analis \n9. Mengecek hasil analisis\nHasil analisis kemudian di cek oleh penyelia\n10. Memasukan hasil analisis  global ke buku induk serta aplikasi pelayanan\nSetelah hasil di cek oleh penyelia selanjutnya penyelia memasukan hasil analisis ke buku induk conto serta ke aplikasi pelayanan  \n11. Pengecekan global hasil analisis\nPengecekan hasil global analisis dilakukan oleh Manajer Teknik sebelum hasil di serahkan ke bagian administrasi\n12. Menyerahkan hasil analis ke bagian administrasi\nMenyerahkan hasil analisis dari lab. Analisis ke administrasi sebagai bahan pembuatan sertifikat ', '', '2015-05-06 11:03:46', '2015-05-06 04:08:08'),
(27, 7, '', '', '', '2015-05-06 11:10:08', '2015-05-06 04:10:08'),
(28, 9, '', 'Keterangan prosedur SOP Pelayanan :\n1. Menerima conto\nBagian adminstrasi menerima conto dari pelanggan dan mengidentifikasi jenis serta jumlah conto kemudian bagian administrasi mengeluarkan formulir tugas preparasi serta formulir tugas analisa yang selanjutnya akan diserahkan ke bagian preparasi serta analisis. Setelah selesai melakukan identifikasi serta administrasi lainnya bagian administrasi laboratotium menyerahkan conto yang akan di analisis ke laboratorium preparasi.  \n2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayanan\nPreparator melakukan identifikasi conto berupa jenis conto serta jumlah conto yang diterima dari bagian administrasi, kemudian preparator memasukkan data conto ke buku induk conto serta aplikasi pelayanan laboratorium.    \n3. Preparasi conto\nPreparasi conto dilakukan dengan cara memotong conto dan ditempelkan di plate kaca kemudian ditipiskan hingga ketebalan 0,03 mm  d dan pengemasan untuk selanjutnya conto akan diserahkan ke laboratorium analisis. Untuk conto basah harus dikeringkan dahulu dengan menggunakaan oven. \n4. Menyerahkan conto dari lab. Preparasi ke lab. Analisa\nPada saat menyerahkan conto dari lab. Preparasi ke lab. Analisa dilakukan pengecekan jumlah conto yang akan dianalisa. \n5. Memasukkan parameter analisis di buku induk serta aplikasi pelayanan\nAnalis melakukan pengecekan analisis yang akan dilakukan di formulir tugas analisa serta menuliskan data conto ke dalam buku induk conto berupa nomor analisa dan jumlah conto.\n6. Menganalisis  conto Petrografi Batuan\nProses analisis Petrografi Batuan meliputi pendeskripsian jenis mineral dan tekstur serta struktur kemudain di tentukan nama batuannya mikroskop Polarisasi Zeiss axio Imager a2m..\n7. Mengolah data analisis\nMengolah data analisis dilakukan dengan merangkum  hasil pendeskripsian dan penentuan nama batuan. \n8. Memasukkan data hasil analisis ke lembar hasil analisis\nHasil analisis dituliskan ke lembar hasil analisis oleh analis \n9. Mengecek hasil analisis\nHasil analisis kemudian di cek oleh penyelia\n10. Memasukan hasil analisis  global ke buku induk serta aplikasi pelayanan\nSetelah hasil di cek oleh penyelia selanjutnya penyelia memasukan hasil analisis ke buku induk conto serta ke aplikasi pelayanan  \n11. Pengecekan global hasil analisis\nPengecekan hasil global analisis dilakukan oleh Manajer Teknik sebelum hasil di serahkan ke bagian administrasi\n12. Menyerahkan hasil analis ke bagian administrasi\nMenyerahkan hasil analisis dari lab. Analisis ke administrasi sebagai bahan pembuatan sertifikat ', '', '2015-05-06 11:13:04', '2015-05-06 04:15:47'),
(29, 37, '', 'Keterangan prosedur SOP Pelayanan :\n1. Menerima conto\nBagian adminstrasi menerima conto dari pelanggan dan mengidentifikasi jenis serta jumlah conto kemudian bagian administrasi mengeluarkan formulir tugas preparasi serta formulir tugas analisa yang selanjutnya akan diserahkan ke bagian preparasi serta analisis. Setelah selesai melakukan identifikasi serta administrasi lainnya bagian administrasi laboratotium menyerahkan conto yang akan di analisis ke laboratorium preparasi.  \n2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayanan\nPreparator melakukan identifikasi conto berupa jenis conto serta jumlah conto yang diterima dari bagian administrasi, kemudian preparator memasukkan data conto ke buku induk conto serta aplikasi pelayanan laboratorium.    \n3. Preparasi conto\nPreparasi conto dilakukan dengan cara menggerus conto kering hingga berukuran 10 mesh menggunakan crusher kemudian dicetak dengan menggunakan resin dan dilakukan pemolesan sampai halus dan pengemasan untuk selanjutnya conto akan diserahkan ke laboratorium analisis. Untuk conto basah harus dikeringkan dahulu dengan menggunakaan oven. \n4. Menyerahkan conto dari lab. Preparasi ke lab. Analisa\nPada saat menyerahkan conto dari lab. Preparasi ke lab. Analisa dilakukan pengecekan jumlah conto yang akan dianalisa. \n5. Memasukkan parameter analisis di buku induk serta aplikasi pelayanan\nAnalis melakukan pengecekan analisis yang akan dilakukan di formulir tugas analisa serta menuliskan data conto ke dalam buku induk conto berupa nomor analisa dan jumlah conto.\n6. Menganalisis  conto Petrografi Material Organik (PMO)\nProses analisis PMO meliputi penimbangan penempelan dengan lilin pada plate kaca, pengukuran reflektansi vitrinit dan penghitungan komposisi mienral organik maupun mineral matter nya dengan mikroskop Polarisasi Zeiss axio Imager a2m..\n7. Mengolah data analisis\nMengolah data analisis dilakukan dengan merangkum nilai reflektansi vitrinit dan digolongkan dalamkategori batubara menurut Stach dan penghitungan komposisi.. \n8. Memasukkan data hasil analisis ke lembar hasil analisis\nHasil analisis dituliskan ke lembar hasil analisis oleh analis \n9. Mengecek hasil analisis\nHasil analisis kemudian di cek oleh penyelia\n10. Memasukan hasil analisis  global ke buku induk serta aplikasi pelayanan\nSetelah hasil di cek oleh penyelia selanjutnya penyelia memasukan hasil analisis ke buku induk conto serta ke aplikasi pelayanan  \n11. Pengecekan global hasil analisis\nPengecekan hasil global analisis dilakukan oleh Manajer Teknik sebelum hasil di serahkan ke bagian administrasi\n12. Menyerahkan hasil analis ke bagian administrasi\nMenyerahkan hasil analisis dari lab. Analisis ke administrasi sebagai bahan pembuatan sertifikat ', '', '2015-05-06 11:18:24', '2015-05-06 04:21:46'),
(30, 11, '', '', '', '2015-05-06 11:22:03', '2015-05-06 04:22:03'),
(31, 12, '', '', '', '2015-05-06 11:24:25', '2015-05-06 04:24:25'),
(32, 14, '', 'Keterangan prosedur SOP Pelayanan :\n1. Menerima conto\nBagian adminstrasi menerima conto dari pelanggan dan mengidentifikasi jenis serta jumlah conto kemudian bagian administrasi mengeluarkan formulir tugas preparasi serta formulir tugas analisa yang selanjutnya akan diserahkan ke bagian preparasi serta analisis. Setelah selesai melakukan identifikasi serta administrasi lainnya bagian administrasi laboratotium menyerahkan conto yang akan di analisis ke laboratorium preparasi.  \n2. Memasukkan data preparasi di buku induk serta ke aplikasi pelayanan\nPreparator melakukan identifikasi conto berupa jenis conto serta jumlah conto yang diterima dari bagian administrasi, kemudian preparator memasukkan data conto ke buku induk conto serta aplikasi pelayanan laboratorium.    \n3. Preparasi conto\nPreparasi conto dilakukan dengan cara menggerus conto kering hingga berukuran 200 mesh menggunakan crusher kemudian dilakukan pengemasan untuk selanjutnya conto akan diserahkan ke laboratorium analisis. Untuk conto basah dikeringkan dahulu dengan oven. \n4. Menyerahkan conto dari lab. Preparasi ke lab. Analisa\nPada saat menyerahkan conto dari lab. Preparasi ke lab. Analisa dilakukan pengecekan jumlah conto yang akan dianalisa. \n5. Memasukkan parameter analisis di buku induk serta aplikasi pelayanan\nAnalis melakukan pengecekan analisis yang akan dilakukan di formulir tugas analisa serta menuliskan data conto ke dalam buku induk conto berupa nomor analisa dan jumlah conto.\n6. Menganalisis  conto X-Ray Difraction (XRD)\nProses analisis XRD meliputi penempatan conto ke dalam sampel holder kemudian dianalisa menggunakan instumentasi XRD Shimadzu 7800D.\n7. Mengolah data analisis\nMengolah data analisis dilakukan dengan menginterpretasi jenis mineral dari grafik. \n8. Memasukkan data hasil analisis ke lembar hasil analisis\nHasil analisis dituliskan ke lembar hasil analisis oleh analis \n9. Mengecek hasil analisis\nHasil analisis kemudian di cek oleh penyelia\n10. Memasukan hasil analisis  global ke buku induk serta aplikasi pelayanan\nSetelah hasil di cek oleh penyelia selanjutnya penyelia memasukan hasil analisis ke buku induk conto serta ke aplikasi pelayanan  \n11. Pengecekan global hasil analisis\nPengecekan hasil global analisis dilakukan oleh Manajer Teknik sebelum hasil di serahkan ke bagian administrasi\n12. Menyerahkan hasil analis ke bagian administrasi\nMenyerahkan hasil analisis dari lab. Analisis ke administrasi sebagai bahan pembuatan sertifikat ', '', '2015-05-06 11:26:19', '2015-05-06 04:28:03'),
(33, 4, '', '', '', '2015-05-06 11:50:41', '2015-05-06 04:50:41'),
(34, 8, '', '', '', '2015-05-06 11:55:53', '2015-05-06 04:55:53'),
(35, 13, '', '', '', '2015-05-06 11:59:19', '2015-05-06 04:59:19'),
(36, 28, '', '', '', '2015-05-13 12:34:46', '2015-05-13 05:34:46'),
(37, 29, '', '', '', '2015-05-13 12:35:05', '2015-05-13 05:35:05'),
(38, 15, '', '', '', '2015-05-15 03:49:52', '2015-05-14 20:49:52'),
(39, 16, '', '', '', '2015-05-15 03:50:10', '2015-05-14 20:50:10'),
(40, 19, '', '', '', '2015-05-15 03:50:44', '2015-05-14 20:50:44'),
(41, 18, '', '', '', '2015-05-15 03:50:51', '2015-05-14 20:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `prosedur_kegiatan`
--

CREATE TABLE IF NOT EXISTS `prosedur_kegiatan` (
`id` int(11) NOT NULL,
  `id_prosedur` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_pelaksana` int(11) NOT NULL COMMENT '1: pengadministrasi 2: preparator 3: ananlis 4: penyelia 5: manager teknik',
  `prosedur_khusus` tinyint(1) NOT NULL DEFAULT '0',
  `waktu` int(11) NOT NULL,
  `is_perhari` tinyint(1) NOT NULL DEFAULT '0',
  `jumlah_conto` int(11) NOT NULL,
  `hari` int(11) NOT NULL,
  `id_keluaran` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `order_no` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prosedur_kegiatan`
--

INSERT INTO `prosedur_kegiatan` (`id`, `id_prosedur`, `id_kegiatan`, `id_pelaksana`, `prosedur_khusus`, `waktu`, `is_perhari`, `jumlah_conto`, `hari`, `id_keluaran`, `keterangan`, `order_no`, `created_date`, `updated_date`) VALUES
(6, 4, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-15 00:57:22', '2015-04-16 08:34:52'),
(9, 4, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-15 01:45:38', '2015-04-16 08:35:01'),
(10, 4, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-15 02:02:30', '2015-04-16 08:35:12'),
(11, 4, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-16 10:32:14', '2015-04-16 08:35:49'),
(12, 4, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-16 10:41:06', '2015-04-16 08:35:53'),
(13, 4, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-16 10:41:42', '2015-04-16 08:35:55'),
(15, 4, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-16 10:44:04', '2015-04-21 04:08:40'),
(16, 4, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-16 10:44:41', '2015-04-21 04:08:40'),
(17, 4, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-16 10:46:53', '2015-04-21 04:08:40'),
(19, 4, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-16 10:48:24', '2015-04-16 08:36:35'),
(20, 4, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-16 10:48:58', '2015-04-16 08:37:10'),
(21, 4, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-16 10:49:34', '2015-04-16 08:37:11'),
(22, 5, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-16 14:44:24', '2015-04-21 04:11:25'),
(23, 5, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima', 1, '2015-04-16 14:45:03', '2015-04-21 04:11:25'),
(24, 5, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto\n', 2, '2015-04-16 14:55:53', '2015-04-21 04:11:25'),
(25, 5, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-16 15:01:52', '2015-04-21 04:11:25'),
(26, 5, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis\n', 4, '2015-04-16 15:03:59', '2015-04-21 04:11:26'),
(27, 5, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-16 15:04:51', '2015-04-21 04:11:26'),
(29, 5, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-16 15:08:18', '2015-04-21 04:11:33'),
(30, 5, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia\n', 8, '2015-04-16 15:09:54', '2015-04-21 04:11:32'),
(31, 5, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-16 15:10:49', '2015-04-21 04:11:32'),
(32, 5, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-16 15:11:40', '2015-04-21 04:11:32'),
(33, 5, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakan akan dilakukan analisis ulang atau tidak.', 11, '2015-04-16 15:12:09', '2015-04-21 04:11:32'),
(34, 5, 13, 5, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-16 15:12:42', '2015-04-21 04:11:32'),
(35, 4, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-04-21 11:08:14', '2015-04-21 04:30:56'),
(36, 5, 14, 3, 1, 0, 1, 50, 20, 8, 'Unsur yang dianalisa dengan menggunakan ICP-MS adalah Ce, Y, La, Sm, Gd, Sc, Tb, Eu, Nd, Lu, Yb, Ta, Nb, Dy, Ho, Pr, Tm, Yb, dan Er.', 6, '2015-04-21 11:11:16', '2015-04-21 04:30:59'),
(50, 13, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-23 23:27:48', '2015-04-23 16:27:48'),
(53, 13, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 2, '2015-04-23 23:27:48', '2015-04-23 17:07:13'),
(54, 13, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 3, '2015-04-23 23:27:48', '2015-04-23 17:07:12'),
(55, 13, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 4, '2015-04-23 23:27:48', '2015-04-23 17:07:12'),
(57, 13, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 6, '2015-04-23 23:27:49', '2015-04-23 17:07:13'),
(58, 13, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 7, '2015-04-23 23:27:49', '2015-04-23 17:07:13'),
(59, 13, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 8, '2015-04-23 23:27:49', '2015-04-23 17:07:13'),
(60, 13, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 9, '2015-04-23 23:27:49', '2015-04-23 17:07:13'),
(61, 13, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 10, '2015-04-23 23:27:49', '2015-04-23 17:07:13'),
(62, 13, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 11, '2015-04-23 23:27:49', '2015-04-23 17:07:13'),
(63, 13, 15, 3, 1, 0, 1, 50, 5, 13, 'Metode analisis yang digunakan adalah metode gravimetri', 5, '2015-04-23 23:31:38', '2015-04-23 17:07:12'),
(64, 14, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-23 23:35:25', '2015-04-23 16:35:25'),
(67, 14, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 1, '2015-04-23 23:35:25', '2015-04-23 17:06:46'),
(68, 14, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 2, '2015-04-23 23:35:26', '2015-04-23 17:06:46'),
(69, 14, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 3, '2015-04-23 23:35:26', '2015-04-23 17:06:46'),
(71, 14, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 5, '2015-04-23 23:35:26', '2015-04-23 17:06:46'),
(72, 14, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 6, '2015-04-23 23:35:26', '2015-04-23 17:06:46'),
(73, 14, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 7, '2015-04-23 23:35:26', '2015-04-23 17:06:46'),
(74, 14, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 8, '2015-04-23 23:35:26', '2015-04-24 18:00:32'),
(75, 14, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 9, '2015-04-23 23:35:26', '2015-04-24 18:00:34'),
(76, 14, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 10, '2015-04-23 23:35:26', '2015-04-24 18:00:37'),
(77, 14, 16, 3, 1, 0, 1, 5, 10, 14, 'Analisis dilakukan secara konvensional dan instrumentasi', 4, '2015-04-23 23:38:49', '2015-04-23 17:06:46'),
(91, 15, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-24 21:34:42', '2015-04-24 18:00:39'),
(92, 15, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-24 21:34:42', '2015-04-24 18:00:44'),
(93, 15, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(94, 15, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(95, 15, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(96, 15, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(98, 15, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(99, 15, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(100, 15, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(101, 15, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(102, 15, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(103, 15, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-24 21:34:42', '2015-04-24 14:34:42'),
(104, 15, 17, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan metode kolorimetri adalah Mo, Sb, As, Sn, W, dan V', 6, '2015-04-24 21:40:36', '2015-04-24 18:23:05'),
(105, 16, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(106, 16, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(107, 16, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(108, 16, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(109, 16, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(110, 16, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-04-25 01:05:13', '2015-04-24 18:21:25'),
(112, 16, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(113, 16, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-25 01:05:13', '2015-04-24 18:05:13'),
(114, 16, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-25 01:05:14', '2015-04-24 18:05:14'),
(115, 16, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-25 01:05:14', '2015-04-24 18:05:14'),
(116, 16, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-25 01:05:14', '2015-04-24 18:05:14'),
(117, 16, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-25 01:05:14', '2015-04-24 18:05:14'),
(118, 17, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(119, 17, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(120, 17, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(121, 17, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(122, 17, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(123, 17, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(125, 17, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(126, 17, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(127, 17, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(128, 17, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(129, 17, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(130, 17, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-25 01:05:29', '2015-04-24 18:05:29'),
(131, 16, 18, 3, 1, 0, 1, 50, 10, 16, 'Untuk penggunaan metode fire assay disarankan yang mempunyai kandungan Au yang tinggi. ', 5, '2015-04-25 01:21:12', '2015-04-24 18:29:44'),
(132, 17, 19, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan MP', 6, '2015-04-25 01:27:23', '2015-04-24 18:32:12'),
(133, 18, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(134, 18, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(135, 18, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(136, 18, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(137, 18, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(138, 18, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(140, 18, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(141, 18, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(142, 18, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(143, 18, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(144, 18, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(145, 18, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-25 13:26:45', '2015-04-25 06:26:45'),
(146, 18, 20, 3, 1, 0, 1, 5, 10, 13, 'Metode analisis yang digunakan adalah metode gravimetri/ Penfield Test', 6, '2015-04-25 13:30:21', '2015-04-25 06:45:33'),
(147, 19, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(148, 19, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(149, 19, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(150, 19, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(151, 19, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(152, 19, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(154, 19, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(155, 19, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(156, 19, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(157, 19, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-25 13:35:24', '2015-04-25 06:35:24'),
(158, 19, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-25 13:35:25', '2015-04-25 06:35:25'),
(159, 19, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-25 13:35:25', '2015-04-25 06:35:25'),
(160, 19, 21, 3, 1, 0, 1, 20, 2, 17, 'Metode analisis yang digunakan adalah metode gravimetri', 6, '2015-04-25 13:36:41', '2015-04-25 06:45:23'),
(161, 21, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-29 13:34:20', '2015-04-29 06:45:10'),
(162, 21, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-04-29 13:34:20', '2015-04-29 06:45:10'),
(163, 21, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(164, 21, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(165, 21, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(166, 21, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(168, 21, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(169, 21, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(170, 21, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(171, 21, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(172, 21, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(173, 21, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-04-29 13:34:20', '2015-04-29 06:34:20'),
(174, 21, 22, 3, 1, 0, 1, 50, 4, 18, 'Metode analisis yang digunakan adalah metode Zeemen', 6, '2015-04-29 13:43:49', '2015-05-13 05:37:04'),
(175, 22, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-04-30 13:33:11', '2015-04-30 06:33:11'),
(176, 22, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-04-30 13:33:11', '2015-05-22 04:38:43'),
(178, 22, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-04-30 13:33:11', '2015-05-22 04:38:43'),
(179, 22, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-04-30 13:33:11', '2015-05-22 04:38:39'),
(180, 22, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-04-30 13:33:11', '2015-05-22 04:38:39'),
(182, 22, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-04-30 13:33:11', '2015-05-22 04:38:39'),
(183, 22, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-04-30 13:33:11', '2015-05-22 04:38:39'),
(184, 22, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-04-30 13:33:11', '2015-05-22 04:38:35'),
(185, 22, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-04-30 13:33:11', '2015-05-22 04:38:35'),
(186, 22, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-04-30 13:33:12', '2015-05-22 04:38:35'),
(187, 22, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-04-30 13:33:12', '2015-05-22 04:38:35'),
(189, 22, 24, 3, 1, 0, 1, 10, 3, 19, 'Analisis dilakukan dengan Mikroskop Stereo binokuler Zeiss Discovery V.20', 7, '2015-04-30 13:36:27', '2015-05-22 04:38:39'),
(190, 24, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 10:53:22', '2015-05-06 03:53:22'),
(191, 24, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 10:53:22', '2015-05-22 04:37:18'),
(193, 24, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 10:53:22', '2015-05-22 04:37:14'),
(194, 24, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 10:53:22', '2015-05-22 04:37:14'),
(195, 24, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 10:53:22', '2015-05-22 04:37:14'),
(197, 24, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 10:53:22', '2015-05-22 04:37:09'),
(198, 24, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 10:53:22', '2015-05-22 04:37:09'),
(199, 24, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 10:53:22', '2015-05-22 04:37:09'),
(200, 24, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 10:53:22', '2015-05-22 04:37:05'),
(201, 24, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 10:53:22', '2015-05-22 04:37:05'),
(202, 24, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 10:53:23', '2015-05-22 04:37:05'),
(204, 24, 26, 3, 1, 0, 1, 6, 1, 20, 'Analisis dilakukan dengan alat Fischer Assay', 7, '2015-05-06 10:57:46', '2015-05-22 04:37:09'),
(205, 25, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:00:09', '2015-05-06 04:00:09'),
(206, 25, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:00:09', '2015-05-06 04:00:09'),
(208, 25, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:00:09', '2015-05-06 04:00:09'),
(209, 25, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:00:09', '2015-05-06 04:00:09'),
(210, 25, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:00:09', '2015-05-06 04:00:09'),
(212, 25, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:00:09', '2015-05-06 04:00:09'),
(213, 25, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:00:09', '2015-05-06 04:02:49'),
(214, 25, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:00:09', '2015-05-06 04:02:49'),
(215, 25, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:00:09', '2015-05-06 04:02:49'),
(216, 25, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:00:09', '2015-05-06 04:02:49'),
(217, 25, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:00:09', '2015-05-06 04:02:49'),
(218, 25, 3, 2, 0, 0, 1, 1, 2, 4, 'Jika conto masih berupa tailing/tanah/batuan, perlu dilakukan proses dulang, dengan waktu preparasi > 2 hari', 2, '2015-05-06 11:01:13', '2015-05-06 04:02:36'),
(219, 25, 27, 3, 0, 0, 1, 1, 2, 9, 'Analisis dilakukan dengan Mikroskop dan Linkam', 6, '2015-05-06 11:02:24', '2015-05-06 04:03:21'),
(220, 26, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:03:49', '2015-05-06 04:03:49'),
(221, 26, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:03:49', '2015-05-06 04:03:49'),
(223, 26, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:03:49', '2015-05-06 04:03:49'),
(224, 26, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:03:49', '2015-05-06 04:03:49'),
(225, 26, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:03:49', '2015-05-06 04:03:49'),
(227, 26, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:03:49', '2015-05-06 04:03:49'),
(228, 26, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:03:49', '2015-05-06 04:07:44'),
(229, 26, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:03:49', '2015-05-06 04:07:44'),
(230, 26, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:03:49', '2015-05-06 04:07:44'),
(231, 26, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:03:49', '2015-05-06 04:07:44'),
(232, 26, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:03:49', '2015-05-06 04:07:44'),
(233, 26, 3, 3, 0, 0, 1, 10, 2, 4, 'Jika conto masih berupa tailing/tanah/batuan, perlu dilakukan proses dulang, dengan waktu preparasi > 2 hari\n', 2, '2015-05-06 11:06:02', '2015-05-06 04:07:33'),
(234, 26, 28, 3, 1, 0, 1, 10, 1, 21, 'Analisis dilakukan dengan Mikroskop Stereo binokuler Zeiss Discovery V.20', 6, '2015-05-06 11:07:23', '2015-05-06 05:33:35'),
(235, 27, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:10:16', '2015-05-06 04:10:16'),
(236, 27, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 11:10:16', '2015-05-22 05:43:32'),
(238, 27, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 11:10:16', '2015-05-22 05:43:29'),
(239, 27, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 11:10:16', '2015-05-22 05:43:29'),
(240, 27, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 11:10:16', '2015-05-22 05:43:29'),
(242, 27, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 11:10:16', '2015-05-22 05:43:29'),
(243, 27, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 11:10:16', '2015-05-22 05:43:29'),
(244, 27, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 11:10:16', '2015-05-22 05:43:25'),
(245, 27, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 11:10:17', '2015-05-22 05:43:25'),
(246, 27, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 11:10:17', '2015-05-22 05:43:25'),
(247, 27, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 11:10:17', '2015-05-22 05:43:25'),
(248, 27, 3, 2, 0, 0, 1, 3, 2, 4, 'Jika conto batuan rapuh, proses preparasi > 2 hari.\nSayatan Poles Bijih\n', 3, '2015-05-06 11:11:06', '2015-05-22 05:43:32'),
(249, 27, 29, 3, 1, 0, 1, 3, 2, 22, 'Analisis dilakukan dengan Mikroskop Polarisasi Zeizz Imager.A2m', 7, '2015-05-06 11:12:15', '2015-05-22 05:43:29'),
(250, 28, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:13:05', '2015-05-06 04:13:05'),
(251, 28, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 11:13:05', '2015-05-22 05:45:22'),
(253, 28, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 11:13:05', '2015-05-22 05:45:19'),
(254, 28, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 11:13:05', '2015-05-22 05:45:19'),
(255, 28, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 11:13:05', '2015-05-22 05:45:19'),
(257, 28, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 11:13:06', '2015-05-22 05:45:15'),
(258, 28, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 11:13:06', '2015-05-22 05:45:15'),
(259, 28, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 11:13:06', '2015-05-22 05:45:15'),
(260, 28, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 11:13:06', '2015-05-22 05:45:10'),
(261, 28, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 11:13:06', '2015-05-22 05:45:10'),
(262, 28, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 11:13:06', '2015-05-22 05:45:10'),
(263, 28, 3, 2, 0, 0, 1, 3, 2, 4, 'Jika conto batuan lepas-lepas/tidak segar, proses preparasi > 2 hari.\nSayatan Tipis', 3, '2015-05-06 11:13:46', '2015-05-22 05:45:19'),
(264, 28, 30, 3, 1, 0, 1, 3, 2, 23, 'Analisis dilakukan dengan Mikroskop Polarisasi Zeizz Imager.A2m', 7, '2015-05-06 11:14:55', '2015-05-22 05:45:19'),
(265, 29, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:18:26', '2015-05-06 04:18:26'),
(266, 29, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:18:26', '2015-05-06 04:18:26'),
(268, 29, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:18:26', '2015-05-06 04:18:26'),
(269, 29, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:18:26', '2015-05-06 04:18:26'),
(270, 29, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:18:26', '2015-05-06 04:18:26'),
(272, 29, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:18:26', '2015-05-06 04:21:36'),
(273, 29, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:18:26', '2015-05-06 04:21:36'),
(274, 29, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:18:26', '2015-05-06 04:21:36'),
(275, 29, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:18:26', '2015-05-06 04:21:36'),
(276, 29, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:18:26', '2015-05-06 04:21:36'),
(277, 29, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:18:26', '2015-05-06 04:21:37'),
(278, 29, 3, 2, 0, 0, 1, 3, 2, 4, 'Jika conto dalam keadaan basah, proses preparasi > 2 hari', 2, '2015-05-06 11:18:57', '2015-05-06 04:21:23'),
(279, 29, 31, 3, 0, 0, 1, 3, 2, 24, 'Analisis dilakukan dengan Mikroskop Reflektan Zeizz Imager.A2m\n', 6, '2015-05-06 11:21:11', '2015-05-06 04:21:36'),
(280, 30, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:22:06', '2015-05-06 04:22:06'),
(281, 30, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 11:22:06', '2015-05-22 05:51:53'),
(283, 30, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 11:22:06', '2015-05-22 05:51:53'),
(284, 30, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 11:22:06', '2015-05-22 05:51:53'),
(285, 30, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 11:22:06', '2015-05-22 05:51:53'),
(287, 30, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 11:22:06', '2015-05-22 05:51:50'),
(288, 30, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 11:22:06', '2015-05-22 05:51:50'),
(289, 30, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 11:22:06', '2015-05-22 05:51:50'),
(290, 30, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 11:22:06', '2015-05-22 05:51:46'),
(291, 30, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 11:22:06', '2015-05-22 05:51:46'),
(292, 30, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 11:22:06', '2015-05-22 05:51:46'),
(293, 30, 3, 2, 0, 0, 1, 5, 2, 4, 'Conto basah preparasi bisa lebih 2 hari', 3, '2015-05-06 11:23:19', '2015-05-22 05:51:53'),
(294, 30, 32, 3, 1, 0, 1, 5, 4, 9, 'Analisis dilakukan dengan alat SEM FEI Inspect S50\n ', 7, '2015-05-06 11:23:48', '2015-05-22 05:51:50'),
(295, 31, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:24:27', '2015-05-06 04:24:27'),
(296, 31, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 11:24:27', '2015-05-22 05:50:35'),
(298, 31, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 11:24:27', '2015-05-22 05:50:35'),
(299, 31, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 11:24:27', '2015-05-22 05:50:35'),
(300, 31, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 11:24:27', '2015-05-22 05:50:35'),
(302, 31, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 11:24:27', '2015-05-22 05:50:31'),
(303, 31, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 11:24:27', '2015-05-22 05:50:31'),
(304, 31, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 11:24:27', '2015-05-22 05:50:31'),
(305, 31, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 11:24:27', '2015-05-22 05:50:31'),
(306, 31, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 11:24:28', '2015-05-22 05:50:26'),
(307, 31, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 11:24:28', '2015-05-22 05:50:26'),
(308, 31, 3, 2, 0, 0, 1, 6, 1, 4, 'Conto basah preparasi bisa lebih 10 hari, dikarenakan tidak boleh di keringkan dengan oven', 3, '2015-05-06 11:24:59', '2015-05-22 05:50:35'),
(309, 31, 33, 3, 1, 0, 1, 6, 2, 9, 'Analisis dilakukan dengan Instruments Division SRA (Weatherford)\n', 7, '2015-05-06 11:25:43', '2015-05-22 05:50:31'),
(310, 32, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:26:20', '2015-05-06 04:26:20'),
(311, 32, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:26:20', '2015-05-06 04:26:20'),
(313, 32, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:26:21', '2015-05-06 04:26:21'),
(314, 32, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:26:21', '2015-05-06 04:26:21'),
(315, 32, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:26:21', '2015-05-06 04:26:21'),
(317, 32, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:26:21', '2015-05-06 04:27:52'),
(318, 32, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:26:21', '2015-05-06 04:27:52'),
(319, 32, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:26:21', '2015-05-06 04:27:52'),
(320, 32, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:26:21', '2015-05-06 04:27:52'),
(321, 32, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:26:21', '2015-05-06 04:27:52'),
(322, 32, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:26:21', '2015-05-06 04:27:52'),
(323, 32, 3, 3, 0, 0, 1, 5, 1, 4, ' Jika conto dalam keadaan basah, waktu preparasi > 1 hari\n', 2, '2015-05-06 11:26:55', '2015-05-06 04:27:46'),
(324, 32, 34, 3, 1, 0, 1, 5, 2, 10, 'Analisis dilakukan dengan alat Shimadzu 7800D', 6, '2015-05-06 11:27:37', '2015-05-06 05:34:54'),
(325, 22, 3, 2, 0, 0, 1, 10, 3, 4, 'Jika conto masih berupa tailing/tanah/batuan, perlu dilakukan proses dulang, dengan waktu > 3 hari', 3, '2015-05-06 11:29:11', '2015-05-22 04:38:43'),
(326, 24, 3, 2, 0, 0, 1, 6, 4, 4, 'Jika conto masih basah, waktu preparasi  > 4 hari', 3, '2015-05-06 11:30:17', '2015-05-22 04:37:18'),
(327, 1, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:42:02', '2015-05-06 04:42:02'),
(328, 1, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 11:42:02', '2015-05-22 04:43:53'),
(330, 1, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 11:42:02', '2015-05-22 04:43:51'),
(331, 1, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 11:42:02', '2015-05-22 04:43:51'),
(332, 1, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 11:42:03', '2015-05-22 04:43:51'),
(334, 1, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 11:42:03', '2015-05-22 04:43:51'),
(335, 1, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 11:42:03', '2015-05-22 04:43:46'),
(336, 1, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 11:42:03', '2015-05-22 04:43:46'),
(337, 1, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 11:42:03', '2015-05-22 04:43:46'),
(338, 1, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 11:42:03', '2015-05-22 04:43:46'),
(339, 1, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 11:42:03', '2015-05-22 04:43:46'),
(340, 1, 3, 2, 0, 0, 1, 3, 2, 4, '', 3, '2015-05-06 11:42:41', '2015-05-22 04:43:51'),
(341, 1, 35, 3, 1, 0, 1, 3, 2, 9, '', 7, '2015-05-06 11:44:13', '2015-05-22 04:43:51'),
(342, 23, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:45:49', '2015-05-06 04:45:49'),
(343, 23, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:45:49', '2015-05-06 04:45:49'),
(344, 23, 3, 2, 0, 0, 1, 3, 2, 4, '', 2, '2015-05-06 11:45:49', '2015-05-06 04:47:58'),
(345, 23, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:45:49', '2015-05-06 04:45:49'),
(346, 23, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:45:49', '2015-05-06 04:45:49'),
(347, 23, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:45:49', '2015-05-06 04:45:49'),
(349, 23, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:45:49', '2015-05-06 04:45:49'),
(350, 23, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:45:49', '2015-05-06 04:46:48'),
(351, 23, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:45:49', '2015-05-06 04:46:48'),
(352, 23, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:45:49', '2015-05-06 04:46:48'),
(353, 23, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:45:49', '2015-05-06 04:46:48'),
(354, 23, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:45:49', '2015-05-06 04:46:48'),
(355, 23, 36, 3, 1, 0, 1, 3, 2, 9, '', 6, '2015-05-06 11:46:38', '2015-05-06 05:32:59'),
(356, 3, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:48:31', '2015-05-06 04:48:31'),
(357, 3, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:48:31', '2015-05-06 04:48:31'),
(358, 3, 3, 2, 0, 0, 1, 3, 2, 4, '', 2, '2015-05-06 11:48:31', '2015-05-06 04:50:07'),
(359, 3, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:48:31', '2015-05-06 04:48:31'),
(360, 3, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:48:31', '2015-05-06 04:48:31'),
(361, 3, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:48:31', '2015-05-06 04:48:31'),
(363, 3, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:48:31', '2015-05-06 04:48:31'),
(364, 3, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:48:32', '2015-05-06 04:48:32'),
(365, 3, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:48:32', '2015-05-06 04:48:32'),
(366, 3, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:48:32', '2015-05-06 04:48:32'),
(367, 3, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:48:32', '2015-05-06 04:48:32'),
(368, 3, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:48:32', '2015-05-06 04:48:32'),
(369, 3, 37, 3, 1, 0, 1, 3, 2, 9, '', 6, '2015-05-06 11:49:13', '2015-05-06 05:15:37'),
(370, 33, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:52:53', '2015-05-06 04:52:53'),
(371, 33, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:52:53', '2015-05-06 04:52:53'),
(372, 33, 3, 2, 0, 0, 1, 3, 2, 4, '', 2, '2015-05-06 11:52:53', '2015-05-06 04:54:46'),
(373, 33, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:52:53', '2015-05-06 04:52:53'),
(374, 33, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(375, 33, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(377, 33, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(378, 33, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(379, 33, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(380, 33, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(381, 33, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(382, 33, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:52:54', '2015-05-06 04:52:54'),
(383, 33, 38, 3, 1, 0, 1, 3, 2, 9, '', 6, '2015-05-06 11:53:52', '2015-05-06 05:33:12'),
(384, 34, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:55:57', '2015-05-06 04:55:57'),
(385, 34, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 2, '2015-05-06 11:55:57', '2015-05-22 05:48:54'),
(386, 34, 3, 2, 0, 0, 1, 3, 2, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 3, '2015-05-06 11:55:57', '2015-05-22 05:48:54'),
(387, 34, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 4, '2015-05-06 11:55:57', '2015-05-22 05:48:54'),
(388, 34, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 5, '2015-05-06 11:55:58', '2015-05-22 05:48:54'),
(389, 34, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 6, '2015-05-06 11:55:58', '2015-05-22 05:48:54'),
(391, 34, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 8, '2015-05-06 11:55:58', '2015-05-22 05:48:51');
INSERT INTO `prosedur_kegiatan` (`id`, `id_prosedur`, `id_kegiatan`, `id_pelaksana`, `prosedur_khusus`, `waktu`, `is_perhari`, `jumlah_conto`, `hari`, `id_keluaran`, `keterangan`, `order_no`, `created_date`, `updated_date`) VALUES
(392, 34, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 9, '2015-05-06 11:55:58', '2015-05-22 05:48:51'),
(393, 34, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 10, '2015-05-06 11:55:58', '2015-05-22 05:48:51'),
(394, 34, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 11, '2015-05-06 11:55:58', '2015-05-22 05:48:51'),
(395, 34, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 12, '2015-05-06 11:55:58', '2015-05-22 05:48:47'),
(396, 34, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 13, '2015-05-06 11:55:58', '2015-05-22 05:48:47'),
(397, 34, 39, 3, 1, 0, 1, 3, 2, 9, '', 7, '2015-05-06 11:56:53', '2015-05-22 05:48:51'),
(398, 35, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(399, 35, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(400, 35, 3, 2, 0, 0, 1, 3, 2, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-06 11:59:20', '2015-05-06 05:00:46'),
(401, 35, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(402, 35, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(403, 35, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(405, 35, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(406, 35, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(407, 35, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-06 11:59:20', '2015-05-06 04:59:20'),
(408, 35, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-06 11:59:21', '2015-05-06 04:59:21'),
(409, 35, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-06 11:59:21', '2015-05-06 04:59:21'),
(410, 35, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-06 11:59:21', '2015-05-06 04:59:21'),
(411, 35, 40, 3, 1, 0, 1, 3, 2, 9, '', 6, '2015-05-06 12:00:03', '2015-05-06 05:34:48'),
(412, 36, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(413, 36, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(414, 36, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(415, 36, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(416, 36, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(417, 36, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(418, 36, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-05-13 12:34:48', '2015-05-13 05:34:53'),
(419, 36, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-13 12:34:48', '2015-05-13 05:34:48'),
(420, 36, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-13 12:34:49', '2015-05-13 05:34:49'),
(421, 36, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-13 12:34:49', '2015-05-13 05:34:49'),
(422, 36, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-13 12:34:49', '2015-05-13 05:34:49'),
(423, 36, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-13 12:34:49', '2015-05-13 05:34:49'),
(424, 36, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-13 12:34:49', '2015-05-13 05:34:49'),
(425, 37, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-13 12:35:07', '2015-05-13 05:35:07'),
(426, 37, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(427, 37, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(428, 37, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(429, 37, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(430, 37, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(431, 37, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-05-13 12:35:08', '2015-05-13 05:35:12'),
(432, 37, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(433, 37, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(434, 37, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(435, 37, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(436, 37, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(437, 37, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-13 12:35:08', '2015-05-13 05:35:08'),
(438, 38, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(439, 38, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(440, 38, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(441, 38, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(442, 38, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(443, 38, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(445, 38, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-15 03:49:54', '2015-05-15 08:58:17'),
(446, 38, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-15 03:49:54', '2015-05-15 08:58:17'),
(447, 38, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-15 03:49:54', '2015-05-15 08:57:55'),
(448, 38, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-15 03:49:54', '2015-05-15 08:57:56'),
(449, 38, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(450, 38, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-15 03:49:54', '2015-05-14 20:49:54'),
(451, 39, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(452, 39, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(453, 39, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(454, 39, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(455, 39, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(456, 39, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(457, 39, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-05-15 03:50:11', '2015-05-14 20:50:16'),
(458, 39, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(459, 39, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-15 03:50:11', '2015-05-14 20:50:11'),
(460, 39, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-15 03:50:12', '2015-05-14 20:50:12'),
(461, 39, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-15 03:50:12', '2015-05-14 20:50:12'),
(462, 39, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-15 03:50:12', '2015-05-14 20:50:12'),
(463, 39, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-15 03:50:12', '2015-05-14 20:50:12'),
(464, 20, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(465, 20, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(466, 20, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(467, 20, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(468, 20, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(469, 20, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(470, 20, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-05-15 03:50:29', '2015-05-14 20:50:33'),
(471, 20, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(472, 20, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(473, 20, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(474, 20, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(475, 20, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(476, 20, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-15 03:50:29', '2015-05-14 20:50:29'),
(477, 40, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-15 03:50:45', '2015-05-14 20:50:45'),
(478, 40, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-15 03:50:45', '2015-05-14 20:50:45'),
(479, 40, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(480, 40, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(481, 40, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(482, 40, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(483, 40, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-05-15 03:50:46', '2015-05-14 20:50:49'),
(484, 40, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(485, 40, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(486, 40, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(487, 40, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(488, 40, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(489, 40, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-15 03:50:46', '2015-05-14 20:50:46'),
(490, 41, 1, 1, 0, 15, 0, 0, 0, 1, 'Berat conto yang diterima minimal 5 gram', 0, '2015-05-15 03:50:52', '2015-05-14 20:50:52'),
(491, 41, 2, 2, 0, 15, 0, 0, 0, 3, 'Melakukan pengecekan terhadap jumlah conto dan kode conto yang diterima\n', 1, '2015-05-15 03:50:52', '2015-05-14 20:50:52'),
(492, 41, 3, 2, 0, 0, 1, 50, 3, 4, 'Contoh sampel basah waktu preparasi 4 hari / 50 conto', 2, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(493, 41, 4, 3, 0, 10, 0, 0, 0, 5, 'Dilakukan pengecekan terhadap jumlah sampel yang diterima dengan yang tercantum di kartu', 3, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(494, 41, 5, 3, 0, 10, 0, 0, 0, 6, 'Conto sampel yang diterima diidentifikasi berdasarkan parameter yang akan dinalisis', 4, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(495, 41, 6, 3, 0, 10, 0, 0, 0, 7, 'Data disesuaikan dengan yang terdapat pada formulir', 5, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(496, 41, 7, 3, 1, 0, 1, 50, 5, 8, 'Unsur yang dianalisis dengan menggunakan AAS adalah Cu, Pb, Zn, Ag, Co, Ni, Mn, Li, K, Fe, Cr, dan Sb.', 6, '2015-05-15 03:50:53', '2015-05-14 20:50:55'),
(497, 41, 8, 3, 0, 45, 0, 0, 0, 9, 'Analis melakukan pengolahan data hasil analisis', 7, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(498, 41, 9, 3, 0, 15, 0, 0, 0, 10, 'Data hasil analisis dipindahkan ke dalam lembar analisis untuk selanjutnya dilakukan pengecekan oleh penyelia', 8, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(499, 41, 10, 4, 0, 30, 0, 0, 0, 10, 'Penyelia melakukan pengecekan hasil analisis yang dilakukan oleh analis', 9, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(500, 41, 11, 4, 0, 30, 0, 0, 0, 11, 'Setelah melakukan pengecekan data hasil analisis, penyelia memasukkan data hasil analisis', 10, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(501, 41, 12, 5, 0, 30, 0, 0, 0, 11, 'Manajer teknik akan memutuskan apakah akan dilakukan analisis ulang atau tidak.', 11, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(502, 41, 13, 1, 0, 15, 0, 0, 0, 12, 'Pembuatan sertifikat hasil analisis dilakukan oleh bagian administrasi lab.', 12, '2015-05-15 03:50:53', '2015-05-14 20:50:53'),
(503, 38, 41, 3, 1, 0, 1, 10, 3, 9, '', 6, '2015-05-15 15:56:25', '2015-05-15 08:58:17'),
(504, 24, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 06:36:53', '2015-05-22 04:37:18'),
(505, 22, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 06:38:30', '2015-05-22 04:38:43'),
(506, 1, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 06:43:41', '2015-05-22 04:43:53'),
(507, 27, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 07:43:19', '2015-05-22 05:43:32'),
(508, 28, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 07:45:05', '2015-05-22 05:45:22'),
(509, 34, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 07:48:43', '2015-05-22 05:48:54'),
(510, 31, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 07:50:22', '2015-05-22 05:50:35'),
(511, 30, 42, 2, 0, 15, 0, 0, 0, 2, '', 1, '2015-05-22 07:51:41', '2015-05-22 05:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
`id_provinsi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama`) VALUES
(0, 'Lainnya'),
(1, 'Aceh'),
(2, 'Bali'),
(3, 'Kep. Bangka Belitung'),
(4, 'Banten'),
(5, 'Bengkulu'),
(6, 'DI Yogyakarta'),
(7, 'DKI Jakarta'),
(8, 'Gorontalo'),
(9, 'Jambi'),
(10, 'Jawa Barat'),
(11, 'Jawa Tengah'),
(12, 'Jawa Timur'),
(13, 'Kalimantan Barat'),
(14, 'Kalimantan Selatan'),
(15, 'Kalimantan Tengah'),
(16, 'Kalimantan Timur'),
(17, 'Kalimantan Utara'),
(18, 'Kep. Riau'),
(19, 'Lampung'),
(20, 'Maluku'),
(21, 'Maluku Utara'),
(22, 'Nusa Tenggara Barat'),
(23, 'Nusa Tenggara Timur'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kegiatan`
--

CREATE TABLE IF NOT EXISTS `ref_kegiatan` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kegiatan`
--

INSERT INTO `ref_kegiatan` (`id`, `deskripsi`) VALUES
(1, 'Penyerahan conto dan formulir analisis'),
(2, 'Memasukan data preparasi di buku induk serta ke aplikasi pelayanan'),
(3, 'Preparasi conto '),
(4, 'Menyerahkan conto ke lab. Analisis'),
(5, 'Mengdidentifikasi parameter analisis'),
(6, 'Memasukan data analisis di buku induk serta aplikasi pelayanan'),
(7, 'Menganalisis conto dengan menggunakan instrumen AAS'),
(8, 'Mengolah data analisis'),
(9, 'Memasukkan data hasil analisis ke lembar hasil analisis'),
(10, 'Mengecek hasil analisis '),
(11, 'Memasukkan hasil analisis global ke buku induk serta aplikasi pelayanan'),
(12, 'Pengecekan global hasil analisis'),
(13, 'Menyerahkan hasil analisis ke bagian administrasi'),
(14, 'Menganalisis conto dengan menggunakan instrumen ICP'),
(15, 'Menganalisis air kelembaban conto tanah\r\n'),
(16, 'Menganalisis air panas bumi\r\n'),
(17, 'Menganalisis contoh dengan menggunakan metode Kolorimetri'),
(18, 'Menganalisis conto dengan menggunakan instrumen AU\r\n'),
(19, 'Menganalisis contoh dengan menggunakan metode MP'),
(20, 'Analisis Air Kristal contoh batuan (H2O+) '),
(21, 'Analisis berat jenis conto batuan (BJ/SG)'),
(22, 'Menganalisis Udara dan Tanah'),
(24, 'Analisis Ayak'),
(26, 'Analisis Retort'),
(27, 'Analisis Inklusi Fluida'),
(28, 'Analisis Mineralogi Butir'),
(29, 'Analisis Minegrafi'),
(30, 'Analisis Petrografi'),
(31, 'Analisis Petrografi Mineral Organik'),
(32, 'Analisis SEM'),
(33, 'Analisis SRA'),
(34, 'Analisis XRD'),
(35, 'Analisis Butir'),
(36, 'Analisis Derajat Kemagnetan'),
(37, 'Analisis Berat Jenis'),
(38, 'Analisis Identifkasi Mineral'),
(39, 'Analisis Komposisi Maseral dan Reflektan'),
(40, 'Analisis Kuat Tekan dan Berat Jenis'),
(41, 'Menganalisis conto dengan menggunakan Analisis Abu'),
(42, 'Mengidentifikasi jenis conto');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kelengkapan`
--

CREATE TABLE IF NOT EXISTS `ref_kelengkapan` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kelengkapan`
--

INSERT INTO `ref_kelengkapan` (`id`, `deskripsi`) VALUES
(1, 'Alat Tulis Kantor'),
(2, 'Buku Ekspedisi'),
(3, 'Formulir Tugas Analisis'),
(4, 'Perangkat Komputer dan pencetaknya'),
(5, 'Crusher'),
(6, 'Ball Mill'),
(7, 'Thema Mill\r\n'),
(8, 'Sarana dan Prasarana Laboratorium'),
(9, 'Formulir Tugas Preparasi\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `ref_keluaran`
--

CREATE TABLE IF NOT EXISTS `ref_keluaran` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_keluaran`
--

INSERT INTO `ref_keluaran` (`id`, `deskripsi`) VALUES
(1, 'Teridentifikasi jumlah dan jenis conto'),
(2, 'Kesesuaian jumlah dan jenis conto'),
(3, 'Tersedianya data preparasi\r\n'),
(4, 'Conto siap analisis'),
(5, 'Jumlah conto yang akan di analisis'),
(6, 'Analisis yang akan dilakukan'),
(7, 'Tersedianya data analisis'),
(8, 'Hasil analisis yang didapat berupa ppm.'),
(9, 'Nilai hasil analisis/parameter '),
(10, 'Nilai hasil/parameter '),
(11, 'Nilai hasil analisis global'),
(12, 'Pembuatan sertifikat hasil analisis'),
(13, 'Nilai % H2O+'),
(14, 'Nilai pH, DHL/ EC, TDS, SiO2, B, Al3+, Fe2+, Ca2+, Mg2+, Na+, K+, Li+, As3+, NH4+,  F-, Cl-, SO42-, HCO3-, dan CO32-'),
(16, 'Hasil analisis yang didapat berupa ppb.'),
(17, 'Nilai BJ/SG'),
(18, 'Nilai ppb Hg'),
(19, 'Deskripsi jenis mineral \r\nPersentase  kehadiran mineral setiap ukuran fraksi \r\nFotomikrografi\r\n'),
(20, 'Nilai Kandungan air dan minyak, Berat Jenis Conto'),
(21, 'Deskripsi Jenis Mineral, Persentase kehadiral mineral (komposisi)'),
(22, 'Deskripsi petrografi mineral bijih,\r\nPersentase  kehadiran mineral bijih,\r\nParagenesa mineralisasi,\r\nFotomikrografi'),
(23, 'Deskripsi mineral,\r\nPersentase  kehadiran mineral (komposisi),\r\nFotomikrografi,\r\nNama batuan'),
(24, 'Deskripsi jenis material organik,\r\nNilai Reflektan\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `ref_mineral`
--

CREATE TABLE IF NOT EXISTS `ref_mineral` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_mineral`
--

INSERT INTO `ref_mineral` (`id`, `deskripsi`) VALUES
(4, 'Amfibol'),
(45, 'Anatas'),
(44, 'Apatit'),
(42, 'Barit'),
(41, 'Biotit'),
(10, 'Epidot'),
(46, 'Feldspar'),
(8, 'Fragmen Batuan'),
(30, 'Gamet'),
(29, 'Hematit'),
(25, 'Homblende'),
(20, 'Hydrous Iron Oxides'),
(12, 'Illite'),
(2, 'Ilmenit'),
(17, 'Kalkopirit'),
(18, 'Kalkosit'),
(24, 'Kalsedoni'),
(13, 'Kaolinite'),
(43, 'Kasiterit'),
(47, 'Klorit'),
(49, 'Korundum'),
(3, 'Kuarsa'),
(26, 'Lempung'),
(27, 'Leukosen'),
(1, 'Magnetit'),
(19, 'Malakit'),
(31, 'Markasit'),
(9, 'Mika'),
(48, 'Monasit'),
(15, 'Natroalunite'),
(5, 'Oksida Besi'),
(16, 'Pirit'),
(6, 'Piroksen'),
(23, 'Plagioklas'),
(14, 'Pyrophyllite'),
(11, 'Quartz'),
(28, 'Rutil'),
(33, 'Sinabar'),
(32, 'Turmalin'),
(7, 'Zirkon');

-- --------------------------------------------------------

--
-- Table structure for table `ref_pelaksana`
--

CREATE TABLE IF NOT EXISTS `ref_pelaksana` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_pelaksana`
--

INSERT INTO `ref_pelaksana` (`id`, `deskripsi`) VALUES
(1, 'Pengadministrasi'),
(2, 'Preparator'),
(3, 'Analis'),
(4, 'Penyelia'),
(5, 'Manager Teknik');

-- --------------------------------------------------------

--
-- Table structure for table `ref_satuan`
--

CREATE TABLE IF NOT EXISTS `ref_satuan` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_satuan`
--

INSERT INTO `ref_satuan` (`id`, `deskripsi`) VALUES
(1, '%'),
(2, '‰'),
(3, '‰ mol'),
(4, 'umhos/cm'),
(5, 'ppm (mg/L)'),
(6, 'ppm'),
(7, 'ppb'),
(8, 'ppt'),
(9, 'g/cm3'),
(10, 'meg%'),
(11, 'cal/gr'),
(12, '°C');

-- --------------------------------------------------------

--
-- Table structure for table `ref_template`
--

CREATE TABLE IF NOT EXISTS `ref_template` (
`id` int(11) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `json` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_template`
--

INSERT INTO `ref_template` (`id`, `deskripsi`, `json`) VALUES
(1, 'komposisi_mineral_fmbab', '[{"nama_mineral":"Magnetit","id":"1"},{"nama_mineral":"Ilmenit","id":"2"},{"nama_mineral":"Hematit","id":"29"},{"nama_mineral":"Epidot","id":"10"},{"nama_mineral":"Piroksen","id":"6"},{"nama_mineral":"Gamet","id":"30"},{"nama_mineral":"Pirit","id":"16"},{"nama_mineral":"Kalkopirit","id":"17"},{"nama_mineral":"Kuarsa","id":"3"},{"nama_mineral":"Leukosen","id":"27"},{"nama_mineral":"Zirkon","id":"7"},{"nama_mineral":"Markasit","id":"31"},{"nama_mineral":"Turmalin","id":"32"},{"nama_mineral":"Sinabar","id":"33"},{"nama_mineral":"Biotit","id":"41"},{"nama_mineral":"Rutil","id":"28"},{"nama_mineral":"Kasiterit","id":"43"},{"nama_mineral":"Apatit","id":"44"},{"nama_mineral":"Anatas","id":"45"},{"nama_mineral":"Lempung","id":"26"},{"nama_mineral":"Oksida Besi","id":"5"},{"nama_mineral":"Feldspar","id":"46"},{"nama_mineral":"Klorit","id":"47"},{"nama_mineral":"Monasit","id":"48"},{"nama_mineral":"Mika","id":"9"},{"nama_mineral":"Fragmen Batuan","id":"8"},{"nama_mineral":"Korundum","id":"49"},{"nama_mineral":"Barit","id":"42"},{"nama_mineral":"Malakit","id":"19"}]'),
(2, 'komposisi_mineral_fmbma', '[{"nama_mineral":"Magnetit","id":"1"},{"nama_mineral":"Ilmenit","id":"2"},{"nama_mineral":"Piroksen","id":"6"},{"nama_mineral":"Epidot","id":"10"},{"nama_mineral":"Amfibol","id":"4"},{"nama_mineral":"Kuarsa","id":"3"},{"nama_mineral":"Homblende","id":"25"},{"nama_mineral":"Oksida Besi","id":"5"},{"nama_mineral":"Lempung","id":"26"},{"nama_mineral":"Leukosen","id":"27"},{"nama_mineral":"Rutil","id":"28"},{"nama_mineral":"Fragmen Batuan","id":"8"},{"nama_mineral":"Zirkon","id":"7"}]');

-- --------------------------------------------------------

--
-- Table structure for table `type_analisis`
--

CREATE TABLE IF NOT EXISTS `type_analisis` (
`id` int(11) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_lab` varchar(3) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_analisis`
--

INSERT INTO `type_analisis` (`id`, `id_type_analisis`, `nama`, `id_lab`, `deskripsi`, `harga`, `created_date`, `updated_date`) VALUES
(1, 'fmbab', 'Analisis Butir', 'FMB', '', 640000, '0000-00-00 00:00:00', '2015-04-30 06:38:10'),
(2, 'fmbbj', 'Berat Jenis', 'FMB', '', 75000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(3, 'fmbdk', 'Derajat Kemagnetan', 'FMB', '', 100000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(4, 'fmbim', 'Identifikasi Mineral', 'FMB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(5, 'fmbma', 'Analisis Ayak', 'FMB', '', 500000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(6, 'fmbmb', 'Mineralogi Butir', 'FMB', '', 300000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(7, 'fmbmn', 'Mineragrafi', 'FMB', '', 515000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(8, 'fmbmr', 'Komposisi Maseral & Reflektan', 'FMB', '', 575000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(9, 'fmbpb', 'Petrografi Batuan', 'FMB', '', 610000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(10, 'fmbrt', 'Analisis Retort', 'FMB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(11, 'fmbse', 'SEM(Scanning Electron Microscopy) & EDS', 'FMB', '', 750000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(12, 'fmbsr', 'SRA (Source Rock Analysis)', 'FMB', '', 1500000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(13, 'fmbuf', 'Kuat Tekan dan Berat Jenis', 'FMB', '', 600000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(14, 'fmbxr', 'Bulk', 'FMB', '', 350000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(15, 'kbbaa', 'Analisis Abu', 'KBB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(16, 'kbbak', 'Analisis Kimia (Batubara)', 'KBB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(17, 'kbbap', 'Analisis Proksimat', 'KBB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(18, 'kbbas', 'Analisis Sifat Fisik', 'KBB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(19, 'kbbau', 'Analisis Ultimate', 'KBB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(20, 'kmkgb', 'Gambut', 'KGB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(21, 'kmlaa', 'Mineral Logam AAS', 'KML', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(22, 'kmlcp', 'ICP', 'KML', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(23, 'kmlkl', 'Kolorimetri', 'KML', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(24, 'kmlmp', 'MP', 'KML', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(25, 'knlfs', 'Fisika', 'KNL', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(26, 'knlkm', 'Kimia', 'KNL', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(27, 'kpbak', 'Analisis Air', 'KPB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(28, 'kpbgs', 'Analisis Gas', 'KPB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(29, 'kpbia', 'Analisis Isotop Air', 'KPB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(30, 'kpbth', 'Analisis Tanah', 'KPB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(31, 'kpbut', 'Analisis Udara Tanah', 'KPB', '', 0, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
(32, 'kmlau', 'Au', 'kml', '', 0, '2015-04-16 11:39:19', '2015-04-16 04:39:19'),
(33, 'knlak', 'Air Kristal', 'knl', '', 0, '2015-04-25 13:26:14', '2015-04-25 06:26:14'),
(34, 'knlbj', 'Berat Jenis', 'knl', '', 0, '0000-00-00 00:00:00', '2015-04-25 06:33:55'),
(35, 'KNLBV', 'Berat Volume Conto Batuan', 'knl', '', 75000, '2015-04-29 19:52:12', '2015-04-29 12:52:12'),
(36, 'fmbif', 'Inklusi Fluida', 'fmb', '', 0, '2015-05-06 11:00:05', '2015-05-06 04:00:05'),
(37, 'fbbpo', 'Petrografi Mineral Organik', 'fbb', '', 0, '2015-05-06 11:18:22', '2015-05-06 04:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `type_analisis_parameter`
--

CREATE TABLE IF NOT EXISTS `type_analisis_parameter` (
`id` int(11) NOT NULL,
  `id_type_analisis` int(11) NOT NULL,
  `id_parameter` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_analisis_parameter`
--

INSERT INTO `type_analisis_parameter` (`id`, `id_type_analisis`, `id_parameter`, `harga`, `satuan`) VALUES
(1, 21, 76, 25000, 'ppm'),
(2, 21, 84, 30000, 'ppm'),
(3, 21, 85, 30000, 'ppm'),
(4, 21, 77, 25000, 'ppm'),
(5, 21, 80, 25000, 'ppm'),
(6, 21, 73, 25000, 'ppm'),
(7, 22, 92, 75000, ''),
(8, 22, 99, 75000, ''),
(9, 22, 101, 75000, ''),
(10, 22, 96, 75000, ''),
(11, 23, 105, 0, 'ppm'),
(12, 23, 109, 0, 'ppm'),
(13, 23, 108, 0, 'ppm'),
(14, 23, 106, 0, 'ppm'),
(15, 23, 110, 0, 'ppm'),
(16, 23, 72, 0, 'ppm'),
(23, 24, 80, 60000, 'ppm'),
(24, 24, 166, 30000, '%'),
(25, 24, 169, 175000, 'ppb'),
(26, 24, 168, 60000, 'ppb'),
(27, 24, 170, 60000, 'ppb'),
(28, 24, 116, 60000, 'ppb'),
(29, 32, 86, 30000, 'ppm'),
(30, 32, 87, 60000, 'ppm'),
(31, 26, 147, 0, '%'),
(32, 33, 151, 0, ''),
(33, 34, 201, 0, ''),
(34, 21, 74, 0, ''),
(35, 26, 181, 0, ''),
(36, 26, 130, 0, ''),
(37, 26, 131, 0, ''),
(38, 26, 132, 0, ''),
(39, 26, 135, 0, ''),
(40, 26, 133, 0, ''),
(41, 26, 134, 0, ''),
(42, 26, 136, 0, ''),
(43, 26, 137, 0, ''),
(44, 26, 138, 0, ''),
(45, 26, 139, 0, ''),
(46, 26, 140, 0, ''),
(47, 26, 141, 0, ''),
(48, 26, 142, 0, ''),
(49, 26, 143, 0, ''),
(50, 26, 144, 0, ''),
(51, 26, 202, 0, ''),
(52, 26, 145, 0, ''),
(53, 26, 146, 0, ''),
(54, 26, 148, 0, ''),
(55, 26, 149, 0, ''),
(56, 26, 150, 0, ''),
(57, 26, 151, 0, ''),
(58, 26, 152, 0, ''),
(59, 26, 153, 0, ''),
(60, 26, 154, 0, ''),
(61, 26, 197, 0, ''),
(62, 26, 177, 0, ''),
(63, 26, 199, 0, ''),
(64, 26, 159, 0, ''),
(65, 26, 160, 0, ''),
(66, 26, 196, 0, ''),
(67, 25, 117, 0, ''),
(68, 25, 118, 0, ''),
(69, 25, 119, 0, ''),
(70, 25, 120, 0, ''),
(71, 25, 121, 0, ''),
(72, 25, 122, 0, ''),
(73, 25, 123, 0, ''),
(74, 25, 124, 0, ''),
(75, 25, 125, 0, ''),
(76, 25, 126, 0, ''),
(77, 25, 127, 0, ''),
(78, 25, 128, 0, ''),
(79, 21, 75, 0, ''),
(80, 21, 187, 0, ''),
(81, 21, 78, 0, ''),
(82, 21, 81, 0, ''),
(83, 21, 172, 0, ''),
(84, 21, 171, 0, ''),
(85, 21, 167, 0, ''),
(86, 21, 116, 0, ''),
(87, 21, 168, 0, ''),
(88, 21, 170, 0, ''),
(89, 21, 169, 0, ''),
(90, 21, 203, 0, ''),
(91, 21, 204, 0, ''),
(92, 21, 196, 0, ''),
(93, 22, 89, 0, ''),
(94, 22, 88, 0, ''),
(95, 22, 91, 0, ''),
(96, 22, 95, 0, ''),
(97, 22, 97, 0, ''),
(98, 22, 100, 0, ''),
(99, 22, 102, 0, ''),
(100, 22, 98, 0, ''),
(101, 22, 93, 0, ''),
(102, 22, 104, 0, ''),
(103, 22, 205, 0, ''),
(104, 22, 103, 0, ''),
(105, 22, 206, 0, ''),
(106, 22, 90, 0, ''),
(107, 23, 173, 0, ''),
(108, 23, 107, 0, ''),
(109, 27, 197, 0, ''),
(110, 27, 166, 0, ''),
(111, 27, 170, 0, ''),
(112, 27, 192, 0, ''),
(113, 27, 165, 0, ''),
(114, 27, 162, 0, ''),
(115, 27, 167, 0, ''),
(116, 27, 171, 0, ''),
(117, 27, 175, 0, ''),
(118, 27, 178, 0, ''),
(119, 27, 163, 0, ''),
(120, 27, 168, 0, ''),
(121, 27, 172, 0, ''),
(122, 27, 176, 0, ''),
(123, 27, 179, 0, ''),
(124, 27, 181, 0, ''),
(125, 27, 169, 0, ''),
(126, 27, 173, 0, ''),
(127, 27, 177, 0, ''),
(128, 30, 199, 0, ''),
(129, 30, 196, 0, ''),
(130, 30, 150, 0, ''),
(131, 31, 199, 0, ''),
(132, 31, 196, 0, ''),
(133, 31, 150, 0, ''),
(134, 29, 194, 0, ''),
(135, 29, 195, 0, ''),
(136, 28, 199, 0, ''),
(137, 28, 187, 0, ''),
(138, 28, 190, 0, ''),
(139, 28, 182, 0, ''),
(140, 28, 185, 0, ''),
(141, 28, 183, 0, ''),
(142, 28, 184, 0, ''),
(143, 28, 186, 0, ''),
(144, 28, 177, 0, ''),
(145, 28, 192, 0, ''),
(146, 28, 150, 0, ''),
(152, 16, 40, 0, ''),
(153, 16, 199, 0, ''),
(154, 16, 42, 0, ''),
(160, 19, 59, 0, ''),
(161, 19, 58, 0, ''),
(162, 19, 60, 0, ''),
(163, 19, 61, 0, ''),
(164, 19, 62, 0, ''),
(165, 18, 50, 0, ''),
(166, 18, 51, 0, ''),
(167, 18, 52, 0, ''),
(168, 18, 53, 0, ''),
(169, 15, 49, 0, ''),
(170, 17, 45, 0, ''),
(171, 17, 47, 0, ''),
(172, 17, 48, 0, ''),
(174, 17, 50, 0, ''),
(175, 17, 68, 0, ''),
(176, 17, 208, 0, ''),
(178, 17, 207, 0, ''),
(179, 17, 44, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `type_pemohon`
--

CREATE TABLE IF NOT EXISTS `type_pemohon` (
  `id` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_pemohon`
--

INSERT INTO `type_pemohon` (`id`, `nama`) VALUES
('01', 'Konservasi'),
('02', 'Mineral Bukan Logam'),
('03', 'Mineral Logam'),
('04', 'Energi Fosil'),
('05', 'Panas Bumi'),
('06', 'Mahasiswa'),
('07', 'Pihak Ke 3'),
('08', 'Bawah Permukaan'),
('09', 'Informasi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analisis`
--
ALTER TABLE `analisis`
 ADD PRIMARY KEY (`id`), ADD KEY `id_pengirim` (`id_pemohon`), ADD KEY `id_lab` (`id_lab`), ADD KEY `id_pegawai` (`id_petugas`), ADD KEY `lokasi` (`lokasi`), ADD KEY `id_pemohon` (`id_pemohon`), ADD KEY `id_analisis_tracking` (`id_analisis_tracking`);

--
-- Indexes for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
 ADD PRIMARY KEY (`id`), ADD KEY `id_parameter` (`id_type_analisis_parameter`), ADD KEY `id_metoda` (`id_metoda`), ADD KEY `id_metoda_2` (`id_metoda`), ADD KEY `id_analisis` (`id_analisis`);

--
-- Indexes for table `analisis_tracking`
--
ALTER TABLE `analisis_tracking`
 ADD PRIMARY KEY (`id`), ADD KEY `id_analisis` (`id_analisis`,`id_kegiatan`,`id_petugas`);

--
-- Indexes for table `analisis_type_analisis`
--
ALTER TABLE `analisis_type_analisis`
 ADD PRIMARY KEY (`id`), ADD KEY `id_analisis` (`id_analisis`,`id_type_analisis`), ADD KEY `id_analisis_2` (`id_analisis`), ADD KEY `id_analisis_3` (`id_analisis`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `conto`
--
ALTER TABLE `conto`
 ADD PRIMARY KEY (`id`), ADD KEY `id_analisis` (`id_analisis`), ADD KEY `id_conto` (`nomor_conto`), ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `conto_detail_fisika`
--
ALTER TABLE `conto_detail_fisika`
 ADD PRIMARY KEY (`id`), ADD KEY `id_conto` (`id_conto`), ADD KEY `id_type_analisis` (`id_type_analisis`), ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `conto_parameter`
--
ALTER TABLE `conto_parameter`
 ADD PRIMARY KEY (`id`), ADD KEY `id_proses_analisis` (`id_conto`), ADD KEY `id_parameter` (`id_analisis_parameter`), ADD KEY `id_metoda` (`id_metoda`), ADD KEY `id_metoda_2` (`id_metoda`), ADD KEY `id_conto` (`id_conto`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
 ADD PRIMARY KEY (`id_kabupaten`), ADD KEY `id_provinsi` (`id_provinsi`);

--
-- Indexes for table `kelengkapan_prosedur_kegiatan`
--
ALTER TABLE `kelengkapan_prosedur_kegiatan`
 ADD PRIMARY KEY (`id`), ADD KEY `id_type_analisis_activity` (`id_prosedur_kegiatan`,`id_kelengkapan`);

--
-- Indexes for table `komoditi`
--
ALTER TABLE `komoditi`
 ADD PRIMARY KEY (`id_komoditi`);

--
-- Indexes for table `laboratorium`
--
ALTER TABLE `laboratorium`
 ADD PRIMARY KEY (`id_lab`), ADD UNIQUE KEY `nama` (`nama`), ADD KEY `id_komoditi` (`id_komoditi`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
 ADD PRIMARY KEY (`id`), ADD KEY `from` (`message_from`,`message_to`);

--
-- Indexes for table `metoda`
--
ALTER TABLE `metoda`
 ADD PRIMARY KEY (`id_metoda`), ADD KEY `id_laboratorium` (`id_laboratorium`);

--
-- Indexes for table `metoda_parameter`
--
ALTER TABLE `metoda_parameter`
 ADD PRIMARY KEY (`_id`), ADD KEY `id_metoda` (`id_metoda`,`id_parameter`), ADD KEY `id_parameter` (`id_parameter`);

--
-- Indexes for table `parameter`
--
ALTER TABLE `parameter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemohon`
--
ALTER TABLE `pemohon`
 ADD PRIMARY KEY (`id_pemohon`), ADD KEY `id_type_pemohon` (`id_type_pemohon`), ADD KEY `id_type_pemohon_2` (`id_type_pemohon`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
 ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `preparasi`
--
ALTER TABLE `preparasi`
 ADD PRIMARY KEY (`id`), ADD KEY `id_analisis` (`id_analisis`), ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `prosedur`
--
ALTER TABLE `prosedur`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_type_analisis` (`id_type_analisis`);

--
-- Indexes for table `prosedur_kegiatan`
--
ALTER TABLE `prosedur_kegiatan`
 ADD PRIMARY KEY (`id`), ADD KEY `id_type_analisis` (`id_prosedur`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
 ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `ref_kegiatan`
--
ALTER TABLE `ref_kegiatan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_kelengkapan`
--
ALTER TABLE `ref_kelengkapan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_keluaran`
--
ALTER TABLE `ref_keluaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_mineral`
--
ALTER TABLE `ref_mineral`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `deskripsi` (`deskripsi`);

--
-- Indexes for table `ref_pelaksana`
--
ALTER TABLE `ref_pelaksana`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_satuan`
--
ALTER TABLE `ref_satuan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_template`
--
ALTER TABLE `ref_template`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_analisis`
--
ALTER TABLE `type_analisis`
 ADD PRIMARY KEY (`id`), ADD KEY `id_lab` (`id_lab`);

--
-- Indexes for table `type_analisis_parameter`
--
ALTER TABLE `type_analisis_parameter`
 ADD PRIMARY KEY (`id`), ADD KEY `id_type_analisis` (`id_type_analisis`,`id_parameter`);

--
-- Indexes for table `type_pemohon`
--
ALTER TABLE `type_pemohon`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analisis`
--
ALTER TABLE `analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `analisis_tracking`
--
ALTER TABLE `analisis_tracking`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `analisis_type_analisis`
--
ALTER TABLE `analisis_type_analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `conto`
--
ALTER TABLE `conto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `conto_detail_fisika`
--
ALTER TABLE `conto_detail_fisika`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `conto_parameter`
--
ALTER TABLE `conto_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1110;
--
-- AUTO_INCREMENT for table `kabupaten`
--
ALTER TABLE `kabupaten`
MODIFY `id_kabupaten` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=512;
--
-- AUTO_INCREMENT for table `kelengkapan_prosedur_kegiatan`
--
ALTER TABLE `kelengkapan_prosedur_kegiatan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `metoda`
--
ALTER TABLE `metoda`
MODIFY `id_metoda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `metoda_parameter`
--
ALTER TABLE `metoda_parameter`
MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=308;
--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209;
--
-- AUTO_INCREMENT for table `pemohon`
--
ALTER TABLE `pemohon`
MODIFY `id_pemohon` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `preparasi`
--
ALTER TABLE `preparasi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `prosedur`
--
ALTER TABLE `prosedur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `prosedur_kegiatan`
--
ALTER TABLE `prosedur_kegiatan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=512;
--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
MODIFY `id_provinsi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `ref_kegiatan`
--
ALTER TABLE `ref_kegiatan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `ref_kelengkapan`
--
ALTER TABLE `ref_kelengkapan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ref_keluaran`
--
ALTER TABLE `ref_keluaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `ref_mineral`
--
ALTER TABLE `ref_mineral`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `ref_pelaksana`
--
ALTER TABLE `ref_pelaksana`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ref_satuan`
--
ALTER TABLE `ref_satuan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ref_template`
--
ALTER TABLE `ref_template`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `type_analisis`
--
ALTER TABLE `type_analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `type_analisis_parameter`
--
ALTER TABLE `type_analisis_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=180;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `analisis`
--
ALTER TABLE `analisis`
ADD CONSTRAINT `analisis_ibfk_2` FOREIGN KEY (`id_lab`) REFERENCES `laboratorium` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `hasil_pemohon` FOREIGN KEY (`id_pemohon`) REFERENCES `pemohon` (`id_pemohon`);

--
-- Constraints for table `kelengkapan_prosedur_kegiatan`
--
ALTER TABLE `kelengkapan_prosedur_kegiatan`
ADD CONSTRAINT `kelengkapan_prosedur_kegiatan_ibfk_1` FOREIGN KEY (`id_prosedur_kegiatan`) REFERENCES `prosedur_kegiatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laboratorium`
--
ALTER TABLE `laboratorium`
ADD CONSTRAINT `laboratorium_ibfk_1` FOREIGN KEY (`id_komoditi`) REFERENCES `komoditi` (`id_komoditi`);

--
-- Constraints for table `metoda`
--
ALTER TABLE `metoda`
ADD CONSTRAINT `metoda_ibfk_1` FOREIGN KEY (`id_laboratorium`) REFERENCES `laboratorium` (`id_lab`);

--
-- Constraints for table `pemohon`
--
ALTER TABLE `pemohon`
ADD CONSTRAINT `pemohon_ibfk_1` FOREIGN KEY (`id_type_pemohon`) REFERENCES `type_pemohon` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
