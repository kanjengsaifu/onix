-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2015 at 02:05 PM
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
  `kode_conto` varchar(5) NOT NULL,
  `lokasi` int(11) DEFAULT NULL,
  `tanggal_terima` date NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `id_petugas` varchar(20) DEFAULT NULL COMMENT 'yang menerima',
  `id_lab` varchar(3) NOT NULL,
  `biaya` int(11) DEFAULT NULL,
  `id_pemohon` int(11) DEFAULT NULL,
  `preparasi` tinyint(1) DEFAULT NULL,
  `estimasi_time` int(11) NOT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `tanggal_selesai` datetime NOT NULL,
  `id_analisis_tracking` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id`, `nomor_analisis`, `jenis_conto`, `jumlah_conto`, `kode_conto`, `lokasi`, `tanggal_terima`, `tanggal_daftar`, `id_petugas`, `id_lab`, `biaya`, `id_pemohon`, `preparasi`, `estimasi_time`, `is_selesai`, `tanggal_selesai`, `id_analisis_tracking`, `created_date`, `updated_date`) VALUES
(1, '20150300001', 'Batuan', 3, 'WDD', 296, '2015-04-25', '2015-04-25', '1', 'kml', 605000, 2, 1, 2000700, 0, '0000-00-00 00:00:00', 6, '2015-04-25 13:01:03', '2015-04-25 06:03:06'),
(2, '20150200001', 'Batuan', 3, 'E', 224, '2015-04-25', '2015-04-25', '1', 'knl', 0, 3, 1, 1136700, 0, '0000-00-00 00:00:00', 17, '2015-04-25 13:38:13', '2015-04-25 06:39:15'),
(3, '20150200004', 'Batuan', 3, 'WBB', 274, '2015-04-25', '2015-04-25', '1', 'kml', 160000, 3, 1, 2000700, 0, '0000-00-00 00:00:00', 25, '2015-04-25 20:28:45', '2015-04-25 13:30:55'),
(4, '20150300004', 'Batuan', 4, 'WDD', 216, '2015-04-29', '2015-04-29', '1', 'kml', 290000, 2, 1, 2000700, 0, '0000-00-00 00:00:00', 32, '2015-04-29 12:56:04', '2015-04-29 06:11:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_parameter`
--

INSERT INTO `analisis_parameter` (`id`, `id_analisis`, `id_type_analisis_parameter`, `satuan`, `id_metoda`, `basis`, `harga`) VALUES
(1, 1, 6, '%', NULL, NULL, 25000),
(2, 1, 2, 'ppm', NULL, NULL, 30000),
(3, 1, 10, 'ppm', NULL, NULL, 75000),
(4, 1, 13, 'ppm', NULL, NULL, 0),
(5, 1, 23, 'ppm', NULL, NULL, 60000),
(6, 1, 28, 'ppm', NULL, NULL, 60000),
(7, 1, 24, 'ppb', NULL, NULL, 30000),
(8, 1, 26, 'ppm', NULL, NULL, 60000),
(9, 1, 25, 'ppm', NULL, NULL, 175000),
(10, 1, 27, 'ppm', NULL, NULL, 60000),
(11, 1, 29, 'ppm', NULL, NULL, 30000),
(12, 2, 32, '%', NULL, NULL, 0),
(13, 2, 33, 'g/cm3', NULL, NULL, 0),
(14, 3, 6, '%', NULL, NULL, 25000),
(15, 3, 2, 'ppb', NULL, NULL, 30000),
(16, 3, 8, 'ppm', NULL, NULL, 75000),
(17, 3, 13, 'ppm', NULL, NULL, 0),
(18, 3, 24, 'ppm', NULL, NULL, 30000),
(19, 4, 6, 'ppm', NULL, NULL, 25000),
(20, 4, 5, 'ppm', NULL, NULL, 25000),
(21, 4, 7, 'ppm', NULL, NULL, 75000),
(22, 4, 10, 'ppm', NULL, NULL, 75000),
(23, 4, 13, 'ppb', NULL, NULL, 0),
(24, 4, 28, 'ppm', NULL, NULL, 60000),
(25, 4, 29, 'ppm', NULL, NULL, 30000);

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_tracking`
--

INSERT INTO `analisis_tracking` (`id`, `id_analisis`, `id_kegiatan`, `id_petugas`, `created_date`, `updated_date`) VALUES
(1, 1, 1, 1, '2015-04-25 13:01:04', '2015-04-25 06:01:04'),
(2, 1, 2, 9, '2015-04-25 13:01:40', '2015-04-25 06:01:40'),
(3, 1, 3, 9, '2015-04-25 13:01:43', '2015-04-25 06:01:43'),
(4, 1, 4, 9, '2015-04-25 13:01:44', '2015-04-25 06:01:44'),
(5, 1, 5, 5, '2015-04-25 13:03:00', '2015-04-25 06:03:00'),
(6, 1, 6, 5, '2015-04-25 13:03:06', '2015-04-25 06:03:06'),
(7, 1, 7, 5, '2015-04-25 13:03:12', '2015-04-25 06:03:12'),
(8, 1, 17, 5, '2015-04-25 13:04:41', '2015-04-25 06:04:41'),
(9, 1, 14, 5, '2015-04-25 13:04:42', '2015-04-25 06:04:42'),
(10, 1, 19, 5, '2015-04-25 13:04:44', '2015-04-25 06:04:44'),
(11, 1, 18, 5, '2015-04-25 13:04:46', '2015-04-25 06:04:46'),
(12, 2, 1, 1, '2015-04-25 13:38:13', '2015-04-25 06:38:13'),
(13, 2, 2, 9, '2015-04-25 13:38:36', '2015-04-25 06:38:36'),
(14, 2, 3, 9, '2015-04-25 13:38:48', '2015-04-25 06:38:48'),
(15, 2, 4, 9, '2015-04-25 13:38:55', '2015-04-25 06:38:55'),
(16, 2, 5, 6, '2015-04-25 13:39:13', '2015-04-25 06:39:13'),
(17, 2, 6, 6, '2015-04-25 13:39:15', '2015-04-25 06:39:15'),
(18, 2, 20, 6, '2015-04-25 13:46:05', '2015-04-25 06:46:05'),
(19, 2, 21, 6, '2015-04-25 13:46:06', '2015-04-25 06:46:06'),
(20, 3, 1, 1, '2015-04-25 20:28:45', '2015-04-25 13:28:45'),
(21, 3, 2, 9, '2015-04-25 20:29:44', '2015-04-25 13:29:44'),
(22, 3, 3, 9, '2015-04-25 20:29:46', '2015-04-25 13:29:46'),
(23, 3, 4, 9, '2015-04-25 20:29:48', '2015-04-25 13:29:48'),
(24, 3, 5, 5, '2015-04-25 20:30:40', '2015-04-25 13:30:40'),
(25, 3, 6, 5, '2015-04-25 20:30:55', '2015-04-25 13:30:55'),
(26, 3, 7, 5, '2015-04-25 20:31:02', '2015-04-25 13:31:02'),
(27, 4, 1, 1, '2015-04-29 12:56:04', '2015-04-29 05:56:04'),
(28, 4, 2, 9, '2015-04-29 13:05:20', '2015-04-29 06:05:20'),
(29, 4, 3, 9, '2015-04-29 13:05:36', '2015-04-29 06:05:36'),
(30, 4, 4, 9, '2015-04-29 13:06:19', '2015-04-29 06:06:19'),
(31, 4, 5, 5, '2015-04-29 13:09:27', '2015-04-29 06:09:27'),
(32, 4, 6, 5, '2015-04-29 13:11:22', '2015-04-29 06:11:22'),
(33, 4, 7, 5, '2015-04-29 13:12:03', '2015-04-29 06:12:03'),
(34, 4, 17, 5, '2015-04-29 13:12:18', '2015-04-29 06:12:18');

-- --------------------------------------------------------

--
-- Table structure for table `analisis_type_analisis`
--

CREATE TABLE IF NOT EXISTS `analisis_type_analisis` (
`id` int(11) NOT NULL,
  `id_analisis` varchar(12) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_type_analisis`
--

INSERT INTO `analisis_type_analisis` (`id`, `id_analisis`, `id_type_analisis`, `harga`) VALUES
(1, '1', '21', 0),
(2, '1', '22', 0),
(3, '1', '23', 0),
(4, '1', '24', 0),
(5, '1', '32', 0),
(6, '2', '33', 0),
(7, '2', '34', 0),
(8, '3', '21', 0),
(9, '3', '22', 0),
(10, '3', '23', 0),
(11, '3', '24', 0),
(12, '4', '21', 0),
(13, '4', '22', 0),
(14, '4', '23', 0),
(15, '4', '24', 0),
(16, '4', '32', 0);

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
('b20b134f158ce5a080bd429cb3f8bf84', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1430289755, 'a:6:{s:9:"user_data";s:0:"";s:11:"logged_user";s:5:"admin";s:11:"logged_name";s:12:"Tati Haryati";s:8:"komoditi";s:2:"tu";s:9:"logged_id";s:1:"1";s:9:"user_type";i:2;}'),
('be78d8d818ac31e514d17116c96cfb8b', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0', 1430289931, 'a:6:{s:9:"user_data";s:0:"";s:11:"logged_user";s:5:"logam";s:11:"logged_name";s:12:"Arief Wibowo";s:8:"komoditi";s:2:"lg";s:9:"logged_id";s:1:"5";s:9:"user_type";i:2;}');

-- --------------------------------------------------------

--
-- Table structure for table `conto`
--

CREATE TABLE IF NOT EXISTS `conto` (
`id` int(11) NOT NULL,
  `nomor_conto` varchar(11) NOT NULL COMMENT '0000-00-00000 <- nomor urut dari nomor analisis',
  `id_analisis` varchar(12) NOT NULL,
  `tanggal_proses` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nama_batuan` varchar(30) DEFAULT NULL,
  `berat` float NOT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `deskripsi` text,
  `id_petugas` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto`
--

INSERT INTO `conto` (`id`, `nomor_conto`, `id_analisis`, `tanggal_proses`, `nama_batuan`, `berat`, `is_selesai`, `deskripsi`, `id_petugas`, `created_date`, `updated_date`) VALUES
(106, '20150300001', '1', '2015-04-25 06:03:14', NULL, 0, 0, NULL, 5, '2015-04-25 13:03:14', '2015-04-25 06:03:14'),
(107, '20150200001', '2', '2015-04-25 06:39:37', NULL, 0, 0, NULL, 6, '2015-04-25 13:39:37', '2015-04-25 06:39:37'),
(108, '20150200002', '2', '2015-04-25 06:54:36', NULL, 0, 0, NULL, 6, '2015-04-25 13:54:36', '2015-04-25 06:54:36'),
(109, '20150200003', '2', '2015-04-25 06:54:38', NULL, 0, 0, NULL, 6, '2015-04-25 13:54:38', '2015-04-25 06:54:38'),
(110, '20150300002', '1', '2015-04-25 06:57:37', NULL, 0, 0, NULL, 5, '2015-04-25 13:57:37', '2015-04-25 06:57:37'),
(111, '20150300003', '1', '2015-04-25 06:57:39', NULL, 0, 0, NULL, 5, '2015-04-25 13:57:39', '2015-04-25 06:57:39'),
(112, '20150200004', '3', '2015-04-25 13:31:31', NULL, 0, 0, NULL, 5, '2015-04-25 20:31:31', '2015-04-25 13:31:31'),
(113, '20150200005', '3', '2015-04-25 13:32:07', NULL, 0, 0, NULL, 5, '2015-04-25 20:32:07', '2015-04-25 13:32:07'),
(114, '20150200006', '3', '2015-04-25 13:32:09', NULL, 0, 0, NULL, 5, '2015-04-25 20:32:09', '2015-04-25 13:32:09'),
(115, '20150300004', '4', '2015-04-29 06:11:52', NULL, 0, 0, NULL, 5, '2015-04-29 13:11:52', '2015-04-29 06:11:52'),
(116, '20150300005', '4', '2015-04-29 06:20:57', NULL, 0, 0, NULL, 5, '2015-04-29 13:20:57', '2015-04-29 06:20:57'),
(117, '20150300006', '4', '2015-04-29 06:21:00', NULL, 0, 0, NULL, 5, '2015-04-29 13:21:00', '2015-04-29 06:21:00'),
(118, '20150300007', '4', '2015-04-29 06:21:03', NULL, 0, 0, NULL, 5, '2015-04-29 13:21:03', '2015-04-29 06:21:03');

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
  `nilai` varchar(100) DEFAULT NULL,
  `d_mikroskopis` text,
  `komposisi` text,
  `id_petugas` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto_parameter`
--

INSERT INTO `conto_parameter` (`id`, `id_conto`, `id_analisis_parameter`, `nilai`, `satuan`, `id_metoda`, `deskripsi`) VALUES
(1, 106, 1, 55.8, NULL, NULL, NULL),
(2, 106, 2, 0, NULL, NULL, NULL),
(3, 106, 3, 0, NULL, NULL, NULL),
(4, 106, 4, 88.45, NULL, NULL, NULL),
(5, 106, 5, 0, NULL, NULL, NULL),
(6, 106, 6, 0, NULL, NULL, NULL),
(7, 106, 7, 0, NULL, NULL, NULL),
(8, 106, 8, 0, NULL, NULL, NULL),
(9, 106, 9, 0, NULL, NULL, NULL),
(10, 106, 10, 0, NULL, NULL, NULL),
(11, 106, 11, 0, NULL, NULL, NULL),
(12, 107, 12, 0, NULL, NULL, NULL),
(13, 107, 13, 0, NULL, NULL, NULL),
(14, 108, 12, 0, NULL, NULL, NULL),
(15, 108, 13, 0, NULL, NULL, NULL),
(16, 109, 12, 0, NULL, NULL, NULL),
(17, 109, 13, 0, NULL, NULL, NULL),
(18, 110, 1, 0, NULL, NULL, NULL),
(19, 110, 2, 0, NULL, NULL, NULL),
(20, 110, 3, 0, NULL, NULL, NULL),
(21, 110, 4, 0, NULL, NULL, NULL),
(22, 110, 5, 0, NULL, NULL, NULL),
(23, 110, 6, 0, NULL, NULL, NULL),
(24, 110, 7, 0, NULL, NULL, NULL),
(25, 110, 8, 0, NULL, NULL, NULL),
(26, 110, 9, 0, NULL, NULL, NULL),
(27, 110, 10, 0, NULL, NULL, NULL),
(28, 110, 11, 0, NULL, NULL, NULL),
(29, 111, 1, 0, NULL, NULL, NULL),
(30, 111, 2, 0, NULL, NULL, NULL),
(31, 111, 3, 0, NULL, NULL, NULL),
(32, 111, 4, 0, NULL, NULL, NULL),
(33, 111, 5, 0, NULL, NULL, NULL),
(34, 111, 6, 0, NULL, NULL, NULL),
(35, 111, 7, 0, NULL, NULL, NULL),
(36, 111, 8, 0, NULL, NULL, NULL),
(37, 111, 9, 0, NULL, NULL, NULL),
(38, 111, 10, 0, NULL, NULL, NULL),
(39, 111, 11, 54.69, NULL, NULL, NULL),
(40, 112, 14, 233, NULL, NULL, NULL),
(41, 112, 15, 35, NULL, NULL, NULL),
(42, 112, 16, 0, NULL, NULL, NULL),
(43, 112, 17, 45, NULL, NULL, NULL),
(44, 112, 18, 0, NULL, NULL, NULL),
(45, 113, 14, 0, NULL, NULL, NULL),
(46, 113, 15, 0, NULL, NULL, NULL),
(47, 113, 16, 0, NULL, NULL, NULL),
(48, 113, 17, 0, NULL, NULL, NULL),
(49, 113, 18, 0, NULL, NULL, NULL),
(50, 114, 14, 0, NULL, NULL, NULL),
(51, 114, 15, 0, NULL, NULL, NULL),
(52, 114, 16, 0, NULL, NULL, NULL),
(53, 114, 17, 0, NULL, NULL, NULL),
(54, 114, 18, 0, NULL, NULL, NULL),
(55, 115, 19, 23, NULL, NULL, NULL),
(56, 115, 20, 34, NULL, NULL, NULL),
(57, 115, 21, 0, NULL, NULL, NULL),
(58, 115, 22, 0, NULL, NULL, NULL),
(59, 115, 23, 67, NULL, NULL, NULL),
(60, 115, 24, 0, NULL, NULL, NULL),
(61, 115, 25, 0, NULL, NULL, NULL),
(62, 116, 19, 0, NULL, NULL, NULL),
(63, 116, 20, 0, NULL, NULL, NULL),
(64, 116, 21, 0, NULL, NULL, NULL),
(65, 116, 22, 0, NULL, NULL, NULL),
(66, 116, 23, 0, NULL, NULL, NULL),
(67, 116, 24, 0, NULL, NULL, NULL),
(68, 116, 25, 0, NULL, NULL, NULL),
(69, 117, 19, 0, NULL, NULL, NULL),
(70, 117, 20, 0, NULL, NULL, NULL),
(71, 117, 21, 0, NULL, NULL, NULL),
(72, 117, 22, 0, NULL, NULL, NULL),
(73, 117, 23, 0, NULL, NULL, NULL),
(74, 117, 24, 0, NULL, NULL, NULL),
(75, 117, 25, 0, NULL, NULL, NULL),
(76, 118, 19, 0, NULL, NULL, NULL),
(77, 118, 20, 0, NULL, NULL, NULL),
(78, 118, 21, 0, NULL, NULL, NULL),
(79, 118, 22, 0, NULL, NULL, NULL),
(80, 118, 23, 0, NULL, NULL, NULL),
(81, 118, 24, 0, NULL, NULL, NULL),
(82, 118, 25, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE IF NOT EXISTS `kabupaten` (
  `id_kabupaten` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(508, 32, 'Sijunjung');

-- --------------------------------------------------------

--
-- Table structure for table `kelengkapan_prosedur_kegiatan`
--

CREATE TABLE IF NOT EXISTS `kelengkapan_prosedur_kegiatan` (
`id` int(11) NOT NULL,
  `id_prosedur_kegiatan` int(11) NOT NULL,
  `id_kelengkapan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

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
(62, 174, 8);

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
-- Table structure for table `metoda`
--

CREATE TABLE IF NOT EXISTS `metoda` (
  `id_metoda` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_laboratorium` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metoda`
--

INSERT INTO `metoda` (`id_metoda`, `nama`, `id_laboratorium`) VALUES
('1', 'SNI 7574-2010', 'knl'),
('10', 'SNI 13-3607-1994', 'knl'),
('11', 'SNI 13-3496-1996', 'knl'),
('12', 'SNI 13-4698-1998', 'knl'),
('13', 'SNI 13-4699-1998', 'knl'),
('14', 'SNI 13-6336-2000', 'knl'),
('15', 'SNI 13-6337-2000', 'knl'),
('16', 'SNI 15-0449-1989', 'knl'),
('17', 'ASTM C 25-99', 'knl'),
('18', 'ASTM C1301-95 (Reapp 2009)', 'knl'),
('19', 'ASTM E 247-96-1998', 'knl'),
('2', 'SNI 1964-2008', 'knl'),
('20', 'ASTM D 4369.2013', 'knl'),
('21', 'ASTM E 507-1998', 'knl'),
('22', 'ASTM E 1081-95 a-1998', 'knl'),
('23', 'ASTM C 25-2006', 'knl'),
('24', 'ASTM C 25-2011', 'knl'),
('25', 'K-III-32.03-IKNL', 'knl'),
('26', 'KF-III.32.20-IKNL', 'knl'),
('27', 'KF-III.32.18-IKNL', 'knl'),
('28', 'KF-III-32-22-IKNL', 'knl'),
('29', 'BS-1916 Part 14:1963', 'knl'),
('3', 'SNI 1965-2008', 'knl'),
('30', 'Calculated', 'knl'),
('31', 'Mahon K.,Ellis, A.J., 1977', 'knl'),
('32', 'Galle & Runnel 28', 'knl'),
('33', 'Zeeman Mercury Spectrometer - RA 915+', 'knl'),
('34', 'Picarro L 2120 -i Isotopic H2O', 'knl'),
('35', 'PerkinEkmer Clarus 580 GC', 'knl'),
('36', 'IC- Dionex ICS-1600', 'knl'),
('37', 'Gravimetri', 'knl'),
('38', 'Titrimetri', 'knl'),
('39', 'Turbidimetri', 'knl'),
('4', 'SNI 06-2428-1991', 'knl'),
('40', 'Spektrometri', 'knl'),
('41', 'AAS', 'knl'),
('42', 'Penfield Test', 'knl'),
('43', 'pH Meter', 'knl'),
('44', 'SNI 06-6989-11-2004', 'kpb'),
('45', 'SNI 06-6989-12-2004', 'kpb'),
('46', 'SNI 06-6989-13-2004', 'kpb'),
('47', 'SNI 06-2603-1992', 'kpb'),
('48', 'SNI 06-2481-1991', 'kpb'),
('49', 'SNI 6989.34:2009', 'kpb'),
('5', 'SNI 06-2603-1992', 'knl'),
('50', 'SNI 06-2523-1991', 'kpb'),
('51', 'SNI 06-6989.56.2005', 'kpb'),
('52', 'SNI 06-2428-1991', 'kpb'),
('53', 'SNI 06-6989-54-1991', 'kpb'),
('54', 'SNI 06-2479-1991', 'kpb'),
('55', 'SNI 06-6989-30-2005', 'kpb'),
('56', 'SNI 06-6876-2002', 'kpb'),
('57', 'SNI 06-2482-1991', 'kpb'),
('58', 'SNI 6989.19-2009', 'kpb'),
('59', 'SNI 06-6875-2002', 'kpb'),
('6', 'SNI 06-6989-20-2004', 'knl'),
('60', 'SNI 1965-2008', 'kpb'),
('61', 'SNI 19-1604-1989', 'kpb'),
('62', 'Mahon, Ellis, A.J.1977', 'kpb'),
('63', 'Micro Plasma-Agilent 4100', 'kpb'),
('64', 'ASTM C25-2006', 'kpb'),
('65', 'Zeeman Mercury Spectrometer-RA 915+', 'kpb'),
('66', 'Picarro L 2120 -i Isotopic H2O', 'kpb'),
('67', 'PerkinEkmer Clarus 580 GC', 'kpb'),
('68', 'Calculated', 'kpb'),
('69', 'ASTM D 3173-03', 'kpb'),
('7', 'SNI 13-3494-1994', 'knl'),
('70', 'ASTM D 3174-04', 'kpb'),
('71', 'ASTM D 3175-02', 'kpb'),
('72', 'ASTM D 3172-04', 'kpb'),
('73', 'ASTM D 5865-04', 'kpb'),
('74', 'ASTM D 5373-02', 'kpb'),
('75', 'ASTM D 2013-03', 'kpb'),
('76', 'ASTM D 3302/D3302 M-10', 'kpb'),
('77', 'ASTM D 5142-04', 'kpb'),
('78', 'ASTM D 5372-02', 'kpb'),
('79', 'ASTM D 5865-10a', 'kpb'),
('8', 'SNI 13-3495-1994', 'knl'),
('80', 'ASTM D 409', 'kpb'),
('81', 'AS 1038.21.1.1-2002', 'kpb'),
('82', 'AS 1038.21.1.1.2002', 'kpb'),
('83', 'ISO 351 1996', 'kpb'),
('9', 'SNI 13-3497-1994', 'knl');

-- --------------------------------------------------------

--
-- Table structure for table `metoda_parameter`
--

CREATE TABLE IF NOT EXISTS `metoda_parameter` (
`_id` int(11) NOT NULL,
  `id_metoda` varchar(2) NOT NULL,
  `id_parameter` varchar(7) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metoda_parameter`
--

INSERT INTO `metoda_parameter` (`_id`, `id_metoda`, `id_parameter`) VALUES
(9, '1', '131'),
(17, '1', '132'),
(23, '1', '136'),
(27, '1', '137'),
(43, '1', '138'),
(31, '1', '142'),
(35, '1', '143'),
(57, '1', 'knlkm22'),
(60, '1', 'knlkm24'),
(49, '10', '144'),
(48, '12', '139'),
(47, '13', '140'),
(65, '14', '117'),
(66, '15', '117'),
(39, '16', '140'),
(8, '18', '131'),
(16, '18', '132'),
(5, '19', '181'),
(55, '2', 'knlkm26'),
(12, '20', '131'),
(20, '20', '132'),
(25, '20', '136'),
(29, '20', '137'),
(45, '20', '138'),
(41, '20', '140'),
(33, '20', '142'),
(37, '20', '143'),
(6, '20', '181'),
(11, '21', '131'),
(14, '22', '134'),
(51, '23', '146'),
(52, '24', '146'),
(58, '24', 'knlkm22'),
(61, '24', 'knlkm24'),
(2, '25', '181'),
(10, '26', '131'),
(18, '26', '132'),
(24, '26', '136'),
(28, '26', '137'),
(44, '26', '138'),
(40, '26', '140'),
(32, '26', '142'),
(36, '26', '143'),
(50, '26', '144'),
(4, '26', '181'),
(1, '27', '130'),
(15, '28', '133'),
(13, '29', '131'),
(21, '29', '132'),
(26, '29', '136'),
(30, '29', '137'),
(46, '29', '138'),
(42, '29', '140'),
(34, '29', '142'),
(38, '29', '143'),
(7, '29', '181'),
(56, '3', 'knlkm22'),
(59, '3', 'knlkm24'),
(19, '30', '132'),
(22, '30', '135'),
(53, '31', 'knlkm29'),
(54, '32', 'knlkm29'),
(64, '33', 'knlkm30'),
(111, '36', 'kpbak15'),
(117, '36', 'kpbak16'),
(114, '36', 'kpbak17'),
(86, '37', '120'),
(88, '37', '122'),
(90, '37', '127'),
(91, '37', '128'),
(76, '37', 'knlkm19'),
(78, '37', 'knlkm20'),
(83, '37', 'knlkm23'),
(84, '37', 'knlkm25'),
(87, '38', '121'),
(89, '38', '122'),
(74, '38', '145'),
(77, '39', 'knlkm19'),
(62, '4', 'knlkm28'),
(75, '40', '145'),
(80, '40', 'knlkm21'),
(79, '41', 'knlkm20'),
(81, '41', 'knlkm21'),
(82, '42', 'knlkm23'),
(85, '43', 'knlkm27'),
(92, '44', 'kpbak01'),
(93, '44', 'kpbak02'),
(122, '44', 'kpbth02'),
(94, '45', 'kpbak03'),
(98, '45', 'kpbak08'),
(100, '45', 'kpbak09'),
(120, '46', 'kpbak20'),
(121, '47', 'kpbak21'),
(95, '48', 'kpbak05'),
(96, '49', 'kpbak06'),
(157, '49', 'kpbut02'),
(3, '5', '181'),
(97, '50', 'kpbak07'),
(99, '51', 'kpbak08'),
(101, '51', 'kpbak09'),
(102, '52', 'kpbak10'),
(103, '52', 'kpbak11'),
(104, '52', 'kpbak13'),
(112, '52', 'kpbak17'),
(105, '53', 'kpbak13'),
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
(123, '65', 'kpbth01'),
(158, '65', 'kpbut02'),
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
(67, '7', '118'),
(156, '70', 'kpbut02'),
(69, '8', '123'),
(70, '8', '124'),
(71, '8', '125'),
(72, '8', '126'),
(73, '8', '127'),
(68, '9', '119');

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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

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
(201, 'knlbj01', 'Berat Jenis', '', '', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`id_pemohon`, `id_type_pemohon`, `nama`, `nama_sertifikat`, `alamat`, `deskripsi`, `username`, `password`, `pass_awal`) VALUES
(1, '01', 'Edi Suryadi Soegoto', 'Edi Suryadi Soegoto', 'Jl. Tubagus Smail No. 212 Bandung', '', 'EDI7', '11b3ea1f02af4696dd290df8dfcb2e0f2731276c', '76191827'),
(2, '03', 'Wahyu Djaya Diningrat', 'Wahyu Djaya Diningrat', 'Jl. Tubagus Smail No. 212 Bandung', '', 'WAHY81', 'c4999ba28e12dc7f5b333421fe463ffd8428a158', '7eeb88ac'),
(3, '02', 'Wendi Bunga Hasibuan', 'Wendi Bunga Hasibuan', 'Jl. Kapten Bucharoff No. 23 Medan', '', 'WEND47', '7897e5dddd008b1ffd193afaa3c767b8d687be1d', '5de1ab34');

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
  `username` varchar(12) NOT NULL,
  `password` varchar(49) NOT NULL,
  `pass_awal` varchar(9) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_login` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nip`, `nama`, `telepon`, `email`, `id_komoditi`, `username`, `password`, `pass_awal`, `admin`, `is_login`, `last_login`, `created_date`, `updated_date`) VALUES
(1, '01003658841253639', 'Tati Haryati', NULL, NULL, 'tu', 'admin', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 1, 0, '2015-04-29 13:10:05', '0000-00-00 00:00:00', '2015-04-29 06:10:11'),
(2, '1234567890123456789', 'Resmi Novianti', NULL, NULL, 'bb', 'batubara', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 1, '2015-03-26 15:20:21', '0000-00-00 00:00:00', '2015-03-26 08:20:21'),
(3, '1231297224974', 'Kepala Pusat', NULL, NULL, 'tu', 'kapus', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21'),
(4, '28934623764', 'Kasub Bidang Lab', NULL, NULL, 'tu', 'keplab', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21'),
(5, '48480048252136658', 'Arief Wibowo', NULL, NULL, 'lg', 'logam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 1, '2015-04-29 13:10:27', '0000-00-00 00:00:00', '2015-04-29 06:10:27'),
(6, '012536620211000114', 'Ane Yulian', NULL, NULL, 'nl', 'nonlogam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-04-25 13:39:03', '0000-00-00 00:00:00', '2015-04-25 06:57:12'),
(7, '2512335588141002629', 'Geanissa Handarini', NULL, NULL, 'pb', 'panasbumi', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-04-24 00:09:43', '0000-00-00 00:00:00', '2015-04-23 17:40:32'),
(8, '12312t318236', 'Kabid Sarana Teknik', NULL, NULL, 'tu', 'sartek', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21'),
(9, '01003651251253622', 'Wahyu Utama', '085722145866', 'wahyu.utama@gmail.com', 'pp', 'preparasi', '8cb2237d0679ca88db6464eac60da96345513964', '123', 0, 0, '2015-04-29 13:05:11', '2015-03-25 17:43:48', '2015-04-29 06:07:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preparasi`
--

INSERT INTO `preparasi` (`id`, `id_analisis`, `tanggal_masuk`, `tanggal_mulai`, `tanggal_selesai`, `jumlah_conto`, `id_petugas`, `status`, `created_date`, `updated_date`) VALUES
(1, 1, '2015-04-25 13:01:40', '2015-04-25 13:01:43', '2015-04-25 13:01:44', 0, 9, 3, '2015-04-25', '2015-04-25 06:01:44'),
(2, 2, '2015-04-25 13:38:35', '2015-04-25 13:38:48', '2015-04-25 13:38:55', 0, 9, 3, '2015-04-25', '2015-04-25 06:38:55'),
(3, 3, '2015-04-25 20:29:44', '2015-04-25 20:29:46', '2015-04-25 20:29:48', 0, 9, 3, '2015-04-25', '2015-04-25 13:29:48'),
(4, 4, '2015-04-29 13:05:20', '2015-04-29 13:05:36', '2015-04-29 13:06:18', 0, 9, 3, '2015-04-29', '2015-04-29 06:06:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

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
(21, 31, '', '', '', '2015-04-29 13:33:48', '2015-04-29 06:33:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;

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
(174, 21, 22, 3, 0, 0, 1, 50, 4, 18, 'Metode analisis yang digunakan adalah metode Zeemen', 6, '2015-04-29 13:43:49', '2015-04-29 06:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22, 'Menganalisis Udara dan Tanah');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18, 'Nilai ppb Hg');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_analisis`
--

INSERT INTO `type_analisis` (`id`, `id_type_analisis`, `nama`, `id_lab`, `deskripsi`, `harga`, `created_date`, `updated_date`) VALUES
(1, 'fmbab', 'Analisa Butir', 'FMB', '', 640000, '0000-00-00 00:00:00', '2015-04-13 16:57:41'),
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
(34, 'knlbj', 'Berat Jenis', 'knl', '', 0, '0000-00-00 00:00:00', '2015-04-25 06:33:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

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
(34, 21, 74, 0, '');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `analisis_tracking`
--
ALTER TABLE `analisis_tracking`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `analisis_type_analisis`
--
ALTER TABLE `analisis_type_analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `conto`
--
ALTER TABLE `conto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `conto_detail_fisika`
--
ALTER TABLE `conto_detail_fisika`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conto_parameter`
--
ALTER TABLE `conto_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `kelengkapan_prosedur_kegiatan`
--
ALTER TABLE `kelengkapan_prosedur_kegiatan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `metoda_parameter`
--
ALTER TABLE `metoda_parameter`
MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `pemohon`
--
ALTER TABLE `pemohon`
MODIFY `id_pemohon` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `preparasi`
--
ALTER TABLE `preparasi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prosedur`
--
ALTER TABLE `prosedur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `prosedur_kegiatan`
--
ALTER TABLE `prosedur_kegiatan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `ref_kegiatan`
--
ALTER TABLE `ref_kegiatan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `ref_kelengkapan`
--
ALTER TABLE `ref_kelengkapan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ref_keluaran`
--
ALTER TABLE `ref_keluaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
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
-- AUTO_INCREMENT for table `type_analisis`
--
ALTER TABLE `type_analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `type_analisis_parameter`
--
ALTER TABLE `type_analisis_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `analisis`
--
ALTER TABLE `analisis`
ADD CONSTRAINT `analisis_ibfk_2` FOREIGN KEY (`id_lab`) REFERENCES `laboratorium` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `analisis_ibfk_3` FOREIGN KEY (`lokasi`) REFERENCES `kabupaten` (`id_kabupaten`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `hasil_pemohon` FOREIGN KEY (`id_pemohon`) REFERENCES `pemohon` (`id_pemohon`);

--
-- Constraints for table `conto_detail_fisika`
--
ALTER TABLE `conto_detail_fisika`
ADD CONSTRAINT `conto_detail_fisika_ibfk_1` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conto_parameter`
--
ALTER TABLE `conto_parameter`
ADD CONSTRAINT `conto_parameter_ibfk_1` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kabupaten`
--
ALTER TABLE `kabupaten`
ADD CONSTRAINT `kabupaten_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id_provinsi`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `metoda_parameter`
--
ALTER TABLE `metoda_parameter`
ADD CONSTRAINT `metoda_parameter_ibfk_2` FOREIGN KEY (`id_metoda`) REFERENCES `metoda` (`id_metoda`);

--
-- Constraints for table `pemohon`
--
ALTER TABLE `pemohon`
ADD CONSTRAINT `pemohon_ibfk_1` FOREIGN KEY (`id_type_pemohon`) REFERENCES `type_pemohon` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
