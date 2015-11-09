-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2015 at 05:21 PM
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
  `id_analisis` varchar(12) NOT NULL COMMENT 'nomor analisis',
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
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `tanggal_selesai` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id`, `id_analisis`, `nomor_analisis`, `jenis_conto`, `jumlah_conto`, `kode_conto`, `lokasi`, `tanggal_terima`, `tanggal_daftar`, `id_petugas`, `id_lab`, `biaya`, `id_pemohon`, `preparasi`, `is_selesai`, `tanggal_selesai`, `created_date`, `updated_date`) VALUES
(6, 'bb001fmb1014', '20140700001', 'batuan', 1, 'TU/V', 123, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 4, 0, 1, '0000-00-00 00:00:00', '2014-10-23 00:11:31', '2015-03-17 16:28:16'),
(7, 'bb002fmb1014', '20140100002', 'batuan', 2, '18-C', 376, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 5, 0, 1, '0000-00-00 00:00:00', '2014-10-23 00:52:34', '2015-03-17 16:28:16'),
(8, 'bb003fmb1014', '20140100004', 'batuan', 1, 'KT14', 436, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 3, 0, 1, '0000-00-00 00:00:00', '2014-10-23 00:56:39', '2015-03-17 16:28:16'),
(9, 'bb004fmb1014', '20140700005', 'konsentrat dulang', 1, 'MB/DI', 323, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 4, 0, 0, '0000-00-00 00:00:00', '2014-10-23 01:29:04', '2015-03-17 16:28:16'),
(10, 'bb005fmb1014', '20140200006', 'batuan', 1, 'BTN', 277, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 6, 0, 0, '0000-00-00 00:00:00', '2014-10-23 01:38:04', '2015-03-17 16:28:16'),
(11, 'bb006fmb1014', '20140100007', 'batuan', 1, 'TT14', 5, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 5, 0, 1, '0000-00-00 00:00:00', '2014-10-23 22:17:41', '2015-03-17 16:28:16'),
(12, 'bb007fmb1014', '20140200008', 'batuan', 1, '14 KD', 351, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 6, 0, 1, '0000-00-00 00:00:00', '2014-10-23 22:23:21', '2015-03-17 16:28:16'),
(13, 'bb008fmb1014', '20140800009', 'batubara', 2, 'BR', 304, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 2, 0, 0, '0000-00-00 00:00:00', '2014-10-23 22:31:17', '2015-03-17 16:28:16'),
(14, 'bb009fmb1014', '20140700011', 'batuan', 5, 'LP', 372, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 4, 0, 1, '0000-00-00 00:00:00', '2014-10-23 22:33:57', '2015-03-17 16:28:16'),
(15, 'bb010fmb1014', '20140100016', 'batuan', 7, 'KT14', 436, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 5, 0, 1, '0000-00-00 00:00:00', '2014-10-23 22:38:47', '2015-03-17 16:28:16'),
(16, 'bb011fmb1014', '20140800023', 'konsentrat dulang', 1, '07/PC', 465, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 2, 0, 1, '0000-00-00 00:00:00', '2014-10-23 22:54:41', '2015-03-17 16:28:16'),
(17, 'bb012fmb1014', '20140800024', 'batuan', 1, 'TST', 448, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 2, 0, 1, '0000-00-00 00:00:00', '2014-10-24 00:00:46', '2015-03-17 16:28:16'),
(19, 'nl001knl1014', '20140200001', 'perlit', 5, 'CRC', 385, '2014-10-25', '2014-10-25', '01003658841253639', 'knl', 0, 6, 0, 1, '0000-00-00 00:00:00', '2014-10-25 13:07:28', '2015-03-17 16:28:16'),
(20, 'pb001kpb1014', '20140700001', 'air', 1, 'AR-PB', 392, '2014-10-25', '2014-10-25', '01003658841253639', 'kpb', 0, 4, 0, 1, '0000-00-00 00:00:00', '2014-10-25 14:14:13', '2015-03-17 16:28:16'),
(21, 'bb013fmb1014', '20140100025', 'Batubara', 3, 'KSD', 250, '2014-10-10', '2014-10-25', '01003658841253639', 'fmb', 0, 5, 1, 0, '0000-00-00 00:00:00', '2014-10-25 23:39:13', '2015-03-17 16:28:16'),
(22, 'lg002kml1014', '20140100011', 'Logam', 3, 'POS', 274, '2014-10-10', '2014-10-26', '01003658841253639', 'kml', 0, 3, 1, 1, '0000-00-00 00:00:00', '2014-10-26 01:12:21', '2015-03-17 16:28:16'),
(23, 'lg003kml1014', '20140800004', 'Batuan', 10, 'SRR', 304, '2014-10-09', '2014-10-26', '01003658841253639', 'kml', 0, 2, 1, 1, '0000-00-00 00:00:00', '2014-10-26 01:18:12', '2015-03-17 16:28:16'),
(24, 'bb014fmb1014', '20140700028', 'pasir', 3, 'asd', 274, '2014-10-10', '2014-10-26', '01003658841253639', 'fmb', 0, 4, 1, 0, '0000-00-00 00:00:00', '2014-10-26 15:14:28', '2015-03-17 16:28:16'),
(25, 'bb015fmb1014', '20140700031', 'Batuan', 3, 'KLM', 1, '1980-01-01', '2014-10-26', '01003658841253639', 'fmb', 32000000, 4, 1, 0, '0000-00-00 00:00:00', '2014-10-26 18:10:45', '2015-03-17 16:28:16'),
(28, 'bb016kbb1114', '20140800001', 'batubara', 1, 'FR', 287, '2014-11-07', '2014-11-20', '01003658841253639', 'kbb', 0, 2, 0, 1, '0000-00-00 00:00:00', '2014-11-20 13:55:11', '2015-03-17 16:28:16'),
(38, '', '20150800001', 'Batuan', 3, 'BCK', 88, '2015-03-18', '2015-03-17', '1', 'kml', 265000, 2, 1, 0, '0000-00-00 00:00:00', '2015-03-17 20:02:37', '2015-03-18 07:03:28'),
(39, '', '20150800004', 'Batuan', 3, 'BCK', 325, '2015-03-18', '2015-03-18', '1', 'kml', 380000, 2, 0, 0, '0000-00-00 00:00:00', '2015-03-18 08:03:44', '2015-03-18 07:03:44'),
(42, '', '20150800007', 'Batuan', 3, 'ESS', 172, '2015-03-20', '2015-03-19', '1', 'knl', 280000, 2, 1, 0, '0000-00-00 00:00:00', '2015-03-19 21:12:28', '2015-03-19 20:12:28'),
(43, '', '20150700001', 'Batuan', 2, 'BCK', 21, '2015-03-20', '2015-03-19', '1', 'knl', 0, 4, 1, 0, '0000-00-00 00:00:00', '2015-03-19 21:24:39', '2015-03-19 20:24:39'),
(50, '', '20150800010', 'Batuan', 3, 'BCKJ', 22, '2015-03-20', '2015-03-19', '1', 'fmb', 5575000, 2, 1, 0, '0000-00-00 00:00:00', '2015-03-19 23:28:26', '2015-03-19 22:28:26'),
(51, '', '20150800013', 'Air', 3, 'PRX', 91, '2015-03-24', '2015-03-24', '1', 'knl', 0, 2, 1, 0, '0000-00-00 00:00:00', '2015-03-24 20:36:46', '2015-03-24 13:36:46');

-- --------------------------------------------------------

--
-- Table structure for table `analisis_parameter`
--

CREATE TABLE IF NOT EXISTS `analisis_parameter` (
`id` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `id_metoda` varchar(11) DEFAULT NULL,
  `basis` varchar(10) DEFAULT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_parameter`
--

INSERT INTO `analisis_parameter` (`id`, `id_analisis`, `id_parameter`, `satuan`, `id_metoda`, `basis`, `harga`) VALUES
(31, 39, 'kmlcp07', '‰', NULL, '', 75000),
(32, 39, 'kmlcp15', '‰', NULL, '', 75000),
(33, 39, 'kmlaa07', 'meg%', NULL, '', 25000),
(34, 39, 'kmlaa17', '‰', NULL, '', 30000),
(35, 39, 'kmlmp06', 'ppm', NULL, '', 60000),
(36, 39, 'kmlkl03', 'ppm', NULL, '', 0),
(37, 39, 'kmlcp01', 'ppm', NULL, '', 75000),
(38, 39, 'kmlcp12', 'g/cm3', NULL, '', 75000),
(39, 1, 'kmlaa04', NULL, NULL, '', 25000),
(40, 1, 'kmlaa15', NULL, NULL, '', 30000),
(41, 1, 'kmlmp04', NULL, NULL, '', 175000),
(42, 1, 'kmlkl02', NULL, NULL, '', 0),
(49, 42, 'knlkm04', '%', NULL, NULL, 120000),
(50, 42, 'knlkm25', NULL, NULL, NULL, 10000),
(51, 42, 'knlkm27', NULL, NULL, NULL, 50000),
(52, 42, 'knlfs03', NULL, NULL, NULL, 40000),
(53, 42, 'knlfs09', NULL, NULL, NULL, 60000),
(54, 43, 'knlkm01', '‰', '25', NULL, 0),
(55, 43, 'knlkm08', '%', '1', NULL, 0),
(56, 43, 'knlkm15', 'ppm (mg/L)', '1', NULL, 0),
(57, 43, 'knlkm18', 'ppb', '23', NULL, 0),
(58, 43, 'knlkm25', 'g/cm3', '37', NULL, 0),
(59, 43, 'knlfs03', 'meg%', '9', NULL, 0),
(60, 51, 'knlkm03', '%', '20', NULL, 0),
(61, 51, 'knlkm04', NULL, '30', NULL, 0),
(62, 51, 'knlkm06', NULL, '22', NULL, 0),
(63, 51, 'knlkm13', NULL, '26', NULL, 0),
(64, 51, 'knlkm15', NULL, '20', NULL, 0),
(65, 51, 'knlkm17', NULL, '38', NULL, 0),
(66, 51, 'knlkm19', NULL, '39', NULL, 0),
(67, 51, 'knlkm21', NULL, '41', NULL, 0),
(68, 51, 'knlkm22', 'ppb', '1', NULL, 0),
(69, 51, 'knlkm25', NULL, '37', NULL, 0),
(70, 51, 'knlfs01', NULL, '14', NULL, 0),
(71, 51, 'knlfs04', NULL, '38', NULL, 0),
(72, 51, 'knlfs09', NULL, '8', NULL, 0),
(73, 51, 'knlfs10', NULL, '8', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `analisis_type_analisis`
--

CREATE TABLE IF NOT EXISTS `analisis_type_analisis` (
`id` int(11) NOT NULL,
  `id_analisis` varchar(12) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis_type_analisis`
--

INSERT INTO `analisis_type_analisis` (`id`, `id_analisis`, `id_type_analisis`, `harga`) VALUES
(1, 'bb001fmb1014', 'fmbbj', 0),
(2, 'bb002fmb1014', 'fmbuf', 0),
(3, 'bb003fmb1014', 'fmbmn', 0),
(4, 'bb004fmb1014', 'fmbab', 0),
(5, 'bb005fmb1014', 'fmbdk', 0),
(6, 'bb006fmb1014', 'fmbpb', 0),
(7, 'bb007fmb1014', 'fmbrt', 0),
(8, 'bb008fmb1014', 'fmbmr', 0),
(9, 'bb009fmb1014', 'fmbsr', 0),
(10, 'bb010fmb1014', 'fmbxr', 0),
(11, 'bb011fmb1014', 'fmbab', 0),
(12, 'bb012fmb1014', 'fmbdk', 0),
(13, 'bb013fmb1014', 'fmbma', 0),
(14, 'bb014fmb1014', 'fmbim', 0),
(15, 'bb015fmb1014', 'fmbse', 0),
(52, '50', 'fmbpb', 610000),
(53, '50', 'fmbmr', 575000),
(54, '50', 'fmbrt', 0),
(55, '50', 'fmbxr', 350000),
(56, '50', 'fmbuf', 600000),
(57, '50', 'fmbmn', 515000),
(58, '50', 'fmbma', 500000),
(59, '50', 'fmbim', 0),
(60, '50', 'fmbbj', 75000),
(61, '50', 'fmbdk', 100000),
(62, '50', 'fmbse', 750000),
(63, '50', 'fmbsr', 1500000);

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
('9b06b7f450064b06ce40dea561d0e118', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0', 1427278729, 'a:6:{s:9:"user_data";s:0:"";s:11:"logged_user";s:5:"admin";s:11:"logged_name";s:12:"Tati Haryati";s:8:"komoditi";s:2:"tu";s:9:"logged_id";s:1:"1";s:9:"user_type";i:2;}'),
('b5c161dfa12e8fcb97759250b3625816', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0', 1427209400, 'a:6:{s:9:"user_data";s:0:"";s:11:"logged_user";s:8:"nonlogam";s:11:"logged_name";s:10:"Ane Yulian";s:8:"komoditi";s:2:"nl";s:9:"logged_id";s:1:"6";s:9:"user_type";i:2;}');

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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto`
--

INSERT INTO `conto` (`id`, `nomor_conto`, `id_analisis`, `tanggal_proses`, `nama_batuan`, `berat`, `is_selesai`, `deskripsi`, `id_petugas`, `created_date`, `updated_date`) VALUES
(12, '20140700001', 'bb001fmb1014', '2014-10-22 17:12:15', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '20140100002', 'bb002fmb1014', '2014-10-22 17:52:53', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '20140100003', 'bb002fmb1014', '2014-10-22 17:53:12', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '20140100004', 'bb003fmb1014', '2014-10-22 17:56:49', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '20140700005', 'bb004fmb1014', '2014-10-22 18:29:13', '0', 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '20140200006', 'bb005fmb1014', '2014-10-22 18:38:51', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '20140100007', 'bb006fmb1014', '2014-10-23 15:18:15', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '20140200008', 'bb007fmb1014', '2014-10-23 15:23:31', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '20140800009', 'bb008fmb1014', '2014-10-23 15:31:26', '0', 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '20140700011', 'bb009fmb1014', '2014-10-23 15:34:06', '0', 0, 1, 'Conto Batubara daerah mimika Papua barat sangat tipis', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '20140700012', 'bb009fmb1014', '2014-10-23 15:34:47', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '20140700013', 'bb009fmb1014', '2014-10-23 15:35:23', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '20140700014', 'bb009fmb1014', '2014-10-23 15:36:01', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '20140700015', 'bb009fmb1014', '2014-10-23 15:36:04', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '20140100016', 'bb010fmb1014', '2014-10-23 15:38:56', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '20140100017', 'bb010fmb1014', '2014-10-23 15:39:30', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '20140100018', 'bb010fmb1014', '2014-10-23 15:39:42', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '20140100019', 'bb010fmb1014', '2014-10-23 15:40:05', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '20140100020', 'bb010fmb1014', '2014-10-23 15:40:19', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '20140100021', 'bb010fmb1014', '2014-10-23 15:40:33', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '20140100022', 'bb010fmb1014', '2014-10-23 15:40:49', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '20140800023', 'bb011fmb1014', '2014-10-23 15:54:56', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '20140800024', 'bb012fmb1014', '2014-10-23 17:00:55', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '20140200001', 'nl001knl1014', '2014-10-25 06:07:29', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '20140200002', 'nl001knl1014', '2014-10-25 06:11:18', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '20140200003', 'nl001knl1014', '2014-10-25 06:11:39', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '20140200004', 'nl001knl1014', '2014-10-25 06:11:49', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '20140200005', 'nl001knl1014', '2014-10-25 06:12:16', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '20140700001', 'pb001kpb1014', '2014-10-25 07:14:13', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '20140100025', 'bb013fmb1014', '2014-10-25 16:40:27', '0', 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '20140100011', 'lg002kml1014', '2014-10-25 18:12:21', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '20140100012', 'lg002kml1014', '2014-10-25 18:13:00', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '20140100013', 'lg002kml1014', '2014-10-25 18:13:04', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '20140800004', 'lg003kml1014', '2014-10-25 18:18:12', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '20140800005', 'lg003kml1014', '2014-10-25 18:18:25', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '20140800006', 'lg003kml1014', '2014-10-25 18:18:31', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '20140800007', 'lg003kml1014', '2014-10-25 18:18:34', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '20140800008', 'lg003kml1014', '2014-10-25 18:18:37', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '20140800009', 'lg003kml1014', '2014-10-25 18:18:42', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '20140800010', 'lg003kml1014', '2014-10-25 18:18:46', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, '20140800011', 'lg003kml1014', '2014-10-25 18:18:50', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '20140800012', 'lg003kml1014', '2014-10-25 18:18:54', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '20140800013', 'lg003kml1014', '2014-10-25 18:18:57', NULL, 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '20140700028', 'bb014fmb1014', '2014-10-26 08:14:56', '0', 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '20140700031', 'bb015fmb1014', '2014-10-26 11:10:55', '0', 0, 0, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '20140800001', 'bb016kbb1114', '2014-11-20 06:55:12', NULL, 0, 1, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '20150800004', '39', '2015-03-18 02:29:35', NULL, 0, 0, NULL, 5, '2015-03-18 09:29:35', '2015-03-18 08:29:35'),
(78, '20150800005', '39', '2015-03-18 02:30:21', NULL, 0, 0, NULL, 5, '2015-03-18 09:30:21', '2015-03-18 08:30:21'),
(79, '20150800006', '39', '2015-03-18 02:30:24', NULL, 0, 0, NULL, 5, '2015-03-18 09:30:24', '2015-03-18 08:30:24'),
(85, '20150700001', '43', '2015-03-19 14:56:28', NULL, 0, 0, NULL, 6, '2015-03-19 21:56:28', '2015-03-19 20:56:28'),
(86, '20150800007', '42', '2015-03-19 15:00:18', NULL, 0, 0, NULL, 6, '2015-03-19 22:00:18', '2015-03-19 21:00:18'),
(87, '20150100001', '46', '2015-03-19 15:44:09', NULL, 0, 0, NULL, 2, '2015-03-19 22:44:09', '2015-03-19 21:44:09'),
(88, '20150700002', '43', '2015-03-22 17:58:55', NULL, 0, 0, NULL, 6, '2015-03-23 00:58:55', '2015-03-22 17:58:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto_detail_fisika`
--

INSERT INTO `conto_detail_fisika` (`id`, `id_conto`, `id_type_analisis`, `foto_1`, `foto_2`, `deskripsi_1`, `deskripsi_2`, `nilai`, `d_mikroskopis`, `komposisi`, `id_petugas`, `created_date`, `updated_date`) VALUES
(28, 12, 'fmbbj', '', '', '', '', '["2.42"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(29, 13, 'fmbuf', '', '', '', '', '["497","5.33"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(30, 14, 'fmbuf', '', '', '', '', '["495","4.56"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(31, 15, 'fmbmn', '15311.jpg', '15312.jpg', 'fotomikrograf sayatan poles pirit dan nampak sedikit inklusi kalkopirit', 'fotomikrograf sayatan poles pirit dan nampak tersebar dalam massa batuan', NULL, 'sayatan poles batuan di bawah mikroskop cahaya oantul, mineral logam yang teridentifikasi adalah pirit dan kallopirit berbutir halus hingga kurang lebih >1 mm, dengan bentuk subhedral hingga anhedral.\n\nParagenesa :\nPirit\n    Kalkopirit\n                                 Hidrous Iron Oxide', 'Pirit (7), Kalkopirit(0.5), Hidrous Iron Oxide(1)', 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(32, 16, 'fmbab', '16321.jpg', '16322.jpg', 'Butiran mineral Linemit', 'Butiran Emas', NULL, 'Dibawah mikroskop stero binokuler', 'Magnetit|2.443|Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nIllemit|3.22|Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(33, 17, 'fmbdk', '', '', '', '', '["1.17"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(34, 18, 'fmbpb', '18341.jpg', '18342.jpg', 'Mikro diorit terubah disusun oleh plagioklas piroksen dan mineral opak, tampak plagioklas sebagian terubah kuat ke serisit, klorit dan epidot; piroksen terubah ke klorit dan epidot, sedangkan sebagian klorit mengisi celah-celah/rongga-rongga antar mineral', 'Mikro diorit terubah disusun oleh plagioklas piroksen dan mineral opak, tampak plagioklas sebagian terubah kuat ke serisit, klorit dan epidot; piroksen terubah ke klorit dan epidot, sedangkan sebagian klorit mengisi celah-celah/rongga-rongga antar mineral', NULL, 'Di dalam sayatan tipis batuan ini menunjukkan tekstur hipidiomorfik granular, berbutir halus hingga berukuran 1 mm, bentuk butir anhedral-subhedral, disusun oleh plagioklas, piroksen dan mineral opak serta mineral-mineral sekunder. Terdapat klorit mengisi celah-celah/rongga antar mineral dan epidot mengisi rekahan-rekahan halus.\n\nPlagioklas, tak berwarna, agak kusam, berbutir halus hingga berukuran 1 mm, bentuk butir anhedral-subhedral, menunjukkan relik-relik kembar, beberapa plagioklas berzona, umumnya terubah kuat ke serisit, klorit dan sedikit epidot.\n\nPiroksen, berwarna hijau pucat, berbutir halus hingga berukuran hingga 1mm, bentuk butir anhedral-subhedral, beberapa individu mempunyai kembar, menunjukkan pleokroisme lemah, terubah ke klorit, epidot, dan karbonat. \n\nMineral Opak, berwarna hitam, kedap cahaya, berbutir halus hingga berukuran 0,25 mm, bentuk anhedral, umumnya terdapat menyebar dalam jumlah sedikit. \n\nKlorit, berwarna hijau pucat, berbutir halus berupa agregat-agregat berserabut, sebagian terdapat mengisi celah-celah/rongga-rongga antar mineral, sedangkan epidot membentuk urat-urat halus. \n', 'Plagioklas (40), Piroksen (12),  Mineral opak (1), Serisit (35), Klorit (10), Epidot (2), Karbonat (tr)', 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(35, 19, 'fmbrt', '', '', '', '', '{"k_air":"70","k_minyak":"","sg_batuan":"2.10","sg_minyak":""}', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(36, 20, 'fmbmr', '', '', '', '', '["BB","0.26","0.24-0.30","0.01","30","88","0.3","1.2","6.7","1.5","2.3"]', 'Batubara kurang pekat di daerah papua barat.', 'Conto Batubara daerah mimika, papua merukakan batubara berperingkat rendah (lingit_. Mikrolitotipe dari batubara adalah vitrite', 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(37, 21, 'fmbsr', '', '', '', '', '[["0.22","0.62","0.32"],"0.3","414.7","204","105"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(38, 22, 'fmbsr', '', '', '', '', '[["0.21","0.60","0.32"],"0.45","361.5","134","71"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(39, 23, 'fmbsr', '', '', '', '', '[["0.17","0.50","0.52"],"0.06","478.4","891","932"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(40, 24, 'fmbsr', '', '', '', '', '[["0.13","0.47","0.44"],"0.62","406.7","75","71"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(41, 25, 'fmbsr', '', '', '', '', '[["0.18","0.51","0.52"],"0.27","333.2","190","195"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(42, 26, 'fmbxr', '', '', '', '', '["Quartz, Illite "]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(43, 27, 'fmbxr', '', '', '', '', '["\\tQuartz, Kaolinite, Pyrophyllite "]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(44, 28, 'fmbxr', '', '', '', '', '["\\tQuartz, Illite "]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(45, 29, 'fmbxr', '', '', '', '', '["\\tQuartz, Kaolinite, Illite "]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(46, 30, 'fmbxr', '', '', '', '', '["\\tQuartz, Kaolinite, Illite, Clinochlore"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(47, 31, 'fmbxr', '', '', '', '', '["Natroalunite"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(48, 32, 'fmbxr', '', '', '', '', '["Quartz, Kaolinite, Illite "]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(49, 33, 'fmbab', '33491.jpg', '33492.jpg', 'Butiran mineral Mika, abu-abu, coklat, pipih, sangat lunak, Oksida besi, coklat kemerahan, kusam, Ilmenit, hitam, kilap metalik, Amfibol, hitam, bentuk prismatik.', 'Butiran mineral Mika, abu-abu, coklat, pipih, sangat lunak, Kuarsa, putih, transparan, Pirit, kuning metalik (terselimuti oksida besi kemerahan), Zirkon, tidak berwarna, prismatik, Turmalin, hijau botol, bentuk tabular.', NULL, 'Di bawah Mikroskop Stereo Binokuler.', 'NO. NAMA MINERAL % KETERANGAN\n1 Kuarsa 78.38 Tidak berwarna, putih, kekuningan, transparan, kilap kaca, bentuk butir menyudut tanggung, hadir dalam jumlah paling dominan.\n2 Magnetit 0.15 Berwarna hitam, kilap metalik – agak kusam, bentuk butir menyudut tanggung – membundar tanggung, bersifat ‘strong', 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(50, 34, 'fmbdk', '', '', '', '', '["57.5"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(51, 51, 'fmbma', '51511.jpg', '', 'Dibawah mikroskop Binokuler teridentifikasi mineral seperti magnetit, limenit, kuarsa', '', NULL, NULL, 'magnetit+425 10.67\n', 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(52, 65, 'fmbim', '', '', '', '', NULL, NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06'),
(53, 66, 'fmbse', '66531.jpg', '66532.jpg', '', '', '["60.85","70.82","39.15","29.75","Correction","ZAF"]', NULL, NULL, 0, '0000-00-00 00:00:00', '2015-03-17 11:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `conto_parameter`
--

CREATE TABLE IF NOT EXISTS `conto_parameter` (
`id` int(11) NOT NULL,
  `id_conto` int(11) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  `nilai` float NOT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `id_metoda` varchar(11) DEFAULT NULL,
  `deskripsi` text
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto_parameter`
--

INSERT INTO `conto_parameter` (`id`, `id_conto`, `id_parameter`, `nilai`, `satuan`, `id_metoda`, `deskripsi`) VALUES
(141, 45, 'knlkm01', 10.5, '%', '5', NULL),
(142, 45, 'knlkm02', 12.5, '% mol', '27', NULL),
(143, 45, 'knlkm03', 12, '%', '1', NULL),
(144, 45, 'knlkm04', 12.5, 'ppm', '30', NULL),
(145, 45, 'knlkm05', 10.5, 'ppt', '28', NULL),
(146, 45, 'knlkm24', 0.54, 'ppb', '28', NULL),
(147, 45, 'knlkm26', 52.5, 'ppb', '28', NULL),
(148, 45, 'knlkm28', 12.55, 'umhos/cm', '28', NULL),
(149, 46, 'knlkm01', 34, '‰', '5', NULL),
(150, 46, 'knlkm02', 34, 'ppm', '27', NULL),
(151, 46, 'knlkm03', 45, 'ppm', '1', NULL),
(152, 46, 'knlkm04', 45, 'ppm', '30', NULL),
(153, 46, 'knlkm05', 2.2, 'ppm', '28', NULL),
(154, 46, 'knlkm24', 0, NULL, '28', NULL),
(155, 46, 'knlkm26', 0, NULL, '28', NULL),
(156, 46, 'knlkm28', 0, NULL, '28', NULL),
(157, 47, 'knlkm01', 0, NULL, '5', NULL),
(158, 47, 'knlkm02', 0, NULL, '27', NULL),
(159, 47, 'knlkm03', 0, NULL, '1', NULL),
(160, 47, 'knlkm04', 0, NULL, '30', NULL),
(161, 47, 'knlkm05', 0, NULL, '28', NULL),
(162, 47, 'knlkm24', 0, NULL, '28', NULL),
(163, 47, 'knlkm26', 0, NULL, '28', NULL),
(164, 47, 'knlkm28', 0, NULL, '28', NULL),
(165, 48, 'knlkm01', 0, NULL, '5', NULL),
(166, 48, 'knlkm02', 0, NULL, '27', NULL),
(167, 48, 'knlkm03', 0, NULL, '1', NULL),
(168, 48, 'knlkm04', 0, NULL, '30', NULL),
(169, 48, 'knlkm05', 0, NULL, '28', NULL),
(170, 48, 'knlkm24', 0, NULL, '28', NULL),
(171, 48, 'knlkm26', 0, NULL, '28', NULL),
(172, 48, 'knlkm28', 25.55, 'umhos/cm', '28', NULL),
(173, 49, 'knlkm01', 25.15, '%', '5', NULL),
(174, 49, 'knlkm02', 0, NULL, '27', NULL),
(175, 49, 'knlkm03', 0, NULL, '1', NULL),
(176, 49, 'knlkm04', 0, NULL, '30', NULL),
(177, 49, 'knlkm05', 0, NULL, '28', NULL),
(178, 49, 'knlkm24', 0, NULL, '28', NULL),
(179, 49, 'knlkm26', 0, NULL, '28', NULL),
(180, 49, 'knlkm28', 25.12, 'umhos/cm', '28', NULL),
(181, 50, 'kpbia01', 12.5, '%', '66', NULL),
(182, 50, 'kpbia02', 25.5, '%', '66', NULL),
(183, 52, 'kmlcp01', 0, '%', '0', NULL),
(184, 52, 'kmlcp05', 0, '%', '0', NULL),
(185, 52, 'kmlcp08', 0, '%', '0', NULL),
(186, 52, 'kmlcp11', 0, '%', '0', NULL),
(187, 52, 'kmlcp14', 0, '%', '0', NULL),
(188, 52, 'kmlcp16', 0, '%', '0', NULL),
(189, 52, 'kmlaa05', 0, '%', '0', NULL),
(190, 52, 'kmlaa08', 0, '%', '0', NULL),
(191, 52, 'kmlaa10', 0, '%', '0', NULL),
(192, 52, 'kmlaa14', 0, '%', '0', NULL),
(193, 52, 'kmlaa15', 0, '%', '0', NULL),
(194, 52, 'kmlmp03', 0, '%', '0', NULL),
(195, 52, 'kmlmp06', 0, '%', '0', NULL),
(196, 52, 'kmlkl02', 0, '%', '0', NULL),
(197, 52, 'kmlkl05', 0, '%', '0', NULL),
(198, 53, 'kmlcp01', 0, '%', '0', NULL),
(199, 53, 'kmlcp05', 0, '%', '0', NULL),
(200, 53, 'kmlcp08', 0, '%', '0', NULL),
(201, 53, 'kmlcp11', 0, '%', '0', NULL),
(202, 53, 'kmlcp14', 0, '%', '0', NULL),
(203, 53, 'kmlcp16', 0, '%', '0', NULL),
(204, 53, 'kmlaa05', 0, '%', '0', NULL),
(205, 53, 'kmlaa08', 0, '%', '0', NULL),
(206, 53, 'kmlaa10', 0, '%', '0', NULL),
(207, 53, 'kmlaa14', 0, '%', '0', NULL),
(208, 53, 'kmlaa15', 0, '%', '0', NULL),
(209, 53, 'kmlmp03', 0, '%', '0', NULL),
(210, 53, 'kmlmp06', 0, '%', '0', NULL),
(211, 53, 'kmlkl02', 0, '%', '0', NULL),
(212, 53, 'kmlkl05', 0, '%', '0', NULL),
(213, 54, 'kmlcp01', 0, '%', '0', NULL),
(214, 54, 'kmlcp05', 0, '%', '0', NULL),
(215, 54, 'kmlcp08', 0, '%', '0', NULL),
(216, 54, 'kmlcp11', 0, '%', '0', NULL),
(217, 54, 'kmlcp14', 0, '%', '0', NULL),
(218, 54, 'kmlcp16', 0, '%', '0', NULL),
(219, 54, 'kmlaa05', 0, '%', '0', NULL),
(220, 54, 'kmlaa08', 0, '%', '0', NULL),
(221, 54, 'kmlaa10', 0, '%', '0', NULL),
(222, 54, 'kmlaa14', 0, '%', '0', NULL),
(223, 54, 'kmlaa15', 0, '%', '0', NULL),
(224, 54, 'kmlmp03', 0, '%', '0', NULL),
(225, 54, 'kmlmp06', 0, '%', '0', NULL),
(226, 54, 'kmlkl02', 0, '%', '0', NULL),
(227, 54, 'kmlkl05', 0, '%', '0', NULL),
(228, 55, 'kmlcp03', 0, '%', '0', NULL),
(229, 55, 'kmlcp07', 0, '%', '0', NULL),
(230, 55, 'kmlcp11', 0, '%', '0', NULL),
(231, 55, 'kmlcp13', 0, '%', '0', NULL),
(232, 55, 'kmlcp16', 0, '%', '0', NULL),
(233, 55, 'kmlaa06', 0, '%', '0', NULL),
(234, 55, 'kmlaa09', 0, '%', '0', NULL),
(235, 55, 'kmlaa11', 0, '%', '0', NULL),
(236, 55, 'kmlaa14', 0, '%', '0', NULL),
(237, 55, 'kmlaa16', 0, '%', '0', NULL),
(238, 55, 'kmlmp03', 0, '%', '0', NULL),
(239, 55, 'kmlmp06', 0, '%', '0', NULL),
(240, 55, 'kmlkl01', 0, '%', '0', NULL),
(241, 55, 'kmlkl03', 0, '%', '0', NULL),
(242, 55, 'kmlkl05', 0, '%', '0', NULL),
(243, 56, 'kmlcp03', 0, '%', '0', NULL),
(244, 56, 'kmlcp07', 0, '%', '0', NULL),
(245, 56, 'kmlcp11', 0, '%', '0', NULL),
(246, 56, 'kmlcp13', 0, '%', '0', NULL),
(247, 56, 'kmlcp16', 0, '%', '0', NULL),
(248, 56, 'kmlaa06', 0, '%', '0', NULL),
(249, 56, 'kmlaa09', 0, '%', '0', NULL),
(250, 56, 'kmlaa11', 0, '%', '0', NULL),
(251, 56, 'kmlaa14', 0, '%', '0', NULL),
(252, 56, 'kmlaa16', 0, '%', '0', NULL),
(253, 56, 'kmlmp03', 0, '%', '0', NULL),
(254, 56, 'kmlmp06', 0, '%', '0', NULL),
(255, 56, 'kmlkl01', 0, '%', '0', NULL),
(256, 56, 'kmlkl03', 0, '%', '0', NULL),
(257, 56, 'kmlkl05', 0, '%', '0', NULL),
(258, 57, 'kmlcp03', 0, '%', '0', NULL),
(259, 57, 'kmlcp07', 0, '%', '0', NULL),
(260, 57, 'kmlcp11', 0, '%', '0', NULL),
(261, 57, 'kmlcp13', 0, '%', '0', NULL),
(262, 57, 'kmlcp16', 0, '%', '0', NULL),
(263, 57, 'kmlaa06', 0, '%', '0', NULL),
(264, 57, 'kmlaa09', 0, '%', '0', NULL),
(265, 57, 'kmlaa11', 0, '%', '0', NULL),
(266, 57, 'kmlaa14', 0, '%', '0', NULL),
(267, 57, 'kmlaa16', 0, '%', '0', NULL),
(268, 57, 'kmlmp03', 0, '%', '0', NULL),
(269, 57, 'kmlmp06', 0, '%', '0', NULL),
(270, 57, 'kmlkl01', 0, '%', '0', NULL),
(271, 57, 'kmlkl03', 0, '%', '0', NULL),
(272, 57, 'kmlkl05', 0, '%', '0', NULL),
(273, 58, 'kmlcp03', 0, '%', '0', NULL),
(274, 58, 'kmlcp07', 0, '%', '0', NULL),
(275, 58, 'kmlcp11', 0, '%', '0', NULL),
(276, 58, 'kmlcp13', 0, '%', '0', NULL),
(277, 58, 'kmlcp16', 0, '%', '0', NULL),
(278, 58, 'kmlaa06', 0, '%', '0', NULL),
(279, 58, 'kmlaa09', 0, '%', '0', NULL),
(280, 58, 'kmlaa11', 0, '%', '0', NULL),
(281, 58, 'kmlaa14', 0, '%', '0', NULL),
(282, 58, 'kmlaa16', 0, '%', '0', NULL),
(283, 58, 'kmlmp03', 0, '%', '0', NULL),
(284, 58, 'kmlmp06', 0, '%', '0', NULL),
(285, 58, 'kmlkl01', 0, '%', '0', NULL),
(286, 58, 'kmlkl03', 0, '%', '0', NULL),
(287, 58, 'kmlkl05', 0, '%', '0', NULL),
(288, 59, 'kmlcp03', 0, '%', '0', NULL),
(289, 59, 'kmlcp07', 0, '%', '0', NULL),
(290, 59, 'kmlcp11', 0, '%', '0', NULL),
(291, 59, 'kmlcp13', 0, '%', '0', NULL),
(292, 59, 'kmlcp16', 0, '%', '0', NULL),
(293, 59, 'kmlaa06', 0, '%', '0', NULL),
(294, 59, 'kmlaa09', 0, '%', '0', NULL),
(295, 59, 'kmlaa11', 0, '%', '0', NULL),
(296, 59, 'kmlaa14', 0, '%', '0', NULL),
(297, 59, 'kmlaa16', 0, '%', '0', NULL),
(298, 59, 'kmlmp03', 0, '%', '0', NULL),
(299, 59, 'kmlmp06', 0, '%', '0', NULL),
(300, 59, 'kmlkl01', 0, '%', '0', NULL),
(301, 59, 'kmlkl03', 0, '%', '0', NULL),
(302, 59, 'kmlkl05', 0, '%', '0', NULL),
(303, 60, 'kmlcp03', 0, '%', '0', NULL),
(304, 60, 'kmlcp07', 0, '%', '0', NULL),
(305, 60, 'kmlcp11', 0, '%', '0', NULL),
(306, 60, 'kmlcp13', 0, '%', '0', NULL),
(307, 60, 'kmlcp16', 0, '%', '0', NULL),
(308, 60, 'kmlaa06', 0, '%', '0', NULL),
(309, 60, 'kmlaa09', 0, '%', '0', NULL),
(310, 60, 'kmlaa11', 0, '%', '0', NULL),
(311, 60, 'kmlaa14', 0, '%', '0', NULL),
(312, 60, 'kmlaa16', 0, '%', '0', NULL),
(313, 60, 'kmlmp03', 0, '%', '0', NULL),
(314, 60, 'kmlmp06', 0, '%', '0', NULL),
(315, 60, 'kmlkl01', 0, '%', '0', NULL),
(316, 60, 'kmlkl03', 0, '%', '0', NULL),
(317, 60, 'kmlkl05', 0, '%', '0', NULL),
(318, 61, 'kmlcp03', 0, '%', '0', NULL),
(319, 61, 'kmlcp07', 0, '%', '0', NULL),
(320, 61, 'kmlcp11', 0, '%', '0', NULL),
(321, 61, 'kmlcp13', 0, '%', '0', NULL),
(322, 61, 'kmlcp16', 0, '%', '0', NULL),
(323, 61, 'kmlaa06', 0, '%', '0', NULL),
(324, 61, 'kmlaa09', 0, '%', '0', NULL),
(325, 61, 'kmlaa11', 0, '%', '0', NULL),
(326, 61, 'kmlaa14', 0, '%', '0', NULL),
(327, 61, 'kmlaa16', 0, '%', '0', NULL),
(328, 61, 'kmlmp03', 0, '%', '0', NULL),
(329, 61, 'kmlmp06', 0, '%', '0', NULL),
(330, 61, 'kmlkl01', 0, '%', '0', NULL),
(331, 61, 'kmlkl03', 0, '%', '0', NULL),
(332, 61, 'kmlkl05', 0, '%', '0', NULL),
(333, 62, 'kmlcp03', 0, '%', '0', NULL),
(334, 62, 'kmlcp07', 0, '%', '0', NULL),
(335, 62, 'kmlcp11', 0, '%', '0', NULL),
(336, 62, 'kmlcp13', 0, '%', '0', NULL),
(337, 62, 'kmlcp16', 0, '%', '0', NULL),
(338, 62, 'kmlaa06', 0, '%', '0', NULL),
(339, 62, 'kmlaa09', 0, '%', '0', NULL),
(340, 62, 'kmlaa11', 0, '%', '0', NULL),
(341, 62, 'kmlaa14', 0, '%', '0', NULL),
(342, 62, 'kmlaa16', 0, '%', '0', NULL),
(343, 62, 'kmlmp03', 0, '%', '0', NULL),
(344, 62, 'kmlmp06', 0, '%', '0', NULL),
(345, 62, 'kmlkl01', 0, '%', '0', NULL),
(346, 62, 'kmlkl03', 0, '%', '0', NULL),
(347, 62, 'kmlkl05', 0, '%', '0', NULL),
(348, 63, 'kmlcp03', 0, '%', '0', NULL),
(349, 63, 'kmlcp07', 0, '%', '0', NULL),
(350, 63, 'kmlcp11', 0, '%', '0', NULL),
(351, 63, 'kmlcp13', 0, '%', '0', NULL),
(352, 63, 'kmlcp16', 0, '%', '0', NULL),
(353, 63, 'kmlaa06', 0, '%', '0', NULL),
(354, 63, 'kmlaa09', 0, '%', '0', NULL),
(355, 63, 'kmlaa11', 0, '%', '0', NULL),
(356, 63, 'kmlaa14', 0, '%', '0', NULL),
(357, 63, 'kmlaa16', 0, '%', '0', NULL),
(358, 63, 'kmlmp03', 0, '%', '0', NULL),
(359, 63, 'kmlmp06', 0, '%', '0', NULL),
(360, 63, 'kmlkl01', 0, '%', '0', NULL),
(361, 63, 'kmlkl03', 0, '%', '0', NULL),
(362, 63, 'kmlkl05', 0, '%', '0', NULL),
(363, 64, 'kmlcp03', 0, '%', '0', NULL),
(364, 64, 'kmlcp07', 0, '%', '0', NULL),
(365, 64, 'kmlcp11', 0, '%', '0', NULL),
(366, 64, 'kmlcp13', 0, '%', '0', NULL),
(367, 64, 'kmlcp16', 0, '%', '0', NULL),
(368, 64, 'kmlaa06', 0, '%', '0', NULL),
(369, 64, 'kmlaa09', 0, '%', '0', NULL),
(370, 64, 'kmlaa11', 0, '%', '0', NULL),
(371, 64, 'kmlaa14', 0, '%', '0', NULL),
(372, 64, 'kmlaa16', 0, '%', '0', NULL),
(373, 64, 'kmlmp03', 0, '%', '0', NULL),
(374, 64, 'kmlmp06', 0, '%', '0', NULL),
(375, 64, 'kmlkl01', 0, '%', '0', NULL),
(376, 64, 'kmlkl03', 0, '%', '0', NULL),
(377, 64, 'kmlkl05', 0, '%', '0', NULL),
(388, 69, 'kbbap01', 32.12, '%', 'ar', NULL),
(389, 69, 'kbbap02', 42.87, '%', 'ar', NULL),
(390, 69, 'kbbap03', 23.51, '%', 'adb', NULL),
(391, 69, 'kbbap04', 36.48, '%', 'daf', NULL),
(392, 69, 'kbbak02', 63.69, '%', 'adb', NULL),
(393, 69, 'kbbak03', 3.43, '%', 'adb', NULL),
(394, 77, 'kmlcp07', 4.5, NULL, NULL, NULL),
(395, 77, 'kmlcp15', 5, NULL, NULL, NULL),
(396, 77, 'kmlaa07', 0, NULL, NULL, NULL),
(397, 77, 'kmlaa17', 0, NULL, NULL, NULL),
(398, 77, 'kmlmp06', 0, NULL, NULL, NULL),
(399, 77, 'kmlkl03', 0, NULL, NULL, NULL),
(400, 77, 'kmlcp01', 0, NULL, NULL, NULL),
(401, 77, 'kmlcp12', 0, NULL, NULL, NULL),
(402, 78, 'kmlcp07', 0, NULL, NULL, NULL),
(403, 78, 'kmlcp15', 0, NULL, NULL, NULL),
(404, 78, 'kmlaa07', 0, NULL, NULL, NULL),
(405, 78, 'kmlaa17', 0, NULL, NULL, NULL),
(406, 78, 'kmlmp06', 0, NULL, NULL, NULL),
(407, 78, 'kmlkl03', 0, NULL, NULL, NULL),
(408, 78, 'kmlcp01', 0, NULL, NULL, NULL),
(409, 78, 'kmlcp12', 0, NULL, NULL, NULL),
(422, 85, 'knlkm01', 0, NULL, NULL, NULL),
(423, 85, 'knlkm08', 0, NULL, NULL, NULL),
(424, 85, 'knlkm15', 0, NULL, NULL, NULL),
(425, 85, 'knlkm18', 0, NULL, NULL, NULL),
(426, 85, 'knlkm25', 0, NULL, NULL, NULL),
(427, 85, 'knlfs03', 0, NULL, NULL, NULL),
(428, 86, 'knlkm04', 0, NULL, NULL, NULL),
(429, 86, 'knlkm25', 0, NULL, NULL, NULL),
(430, 86, 'knlkm27', 0, NULL, NULL, NULL),
(431, 86, 'knlfs03', 0, NULL, NULL, NULL),
(432, 86, 'knlfs09', 0, NULL, NULL, NULL),
(433, 88, 'knlkm01', 0, NULL, NULL, NULL),
(434, 88, 'knlkm08', 0, NULL, NULL, NULL),
(435, 88, 'knlkm15', 0, NULL, NULL, NULL),
(436, 88, 'knlkm18', 0, NULL, NULL, NULL),
(437, 88, 'knlkm25', 0, NULL, NULL, NULL),
(438, 88, 'knlfs03', 0, NULL, NULL, NULL);

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
(9, '1', 'knlkm03'),
(17, '1', 'knlkm04'),
(23, '1', 'knlkm08'),
(27, '1', 'knlkm09'),
(43, '1', 'knlkm10'),
(31, '1', 'knlkm14'),
(35, '1', 'knlkm15'),
(57, '1', 'knlkm22'),
(60, '1', 'knlkm24'),
(49, '10', 'knlkm16'),
(48, '12', 'knlkm11'),
(47, '13', 'knlkm12'),
(65, '14', 'knlfs01'),
(66, '15', 'knlfs01'),
(39, '16', 'knlkm13'),
(8, '18', 'knlkm03'),
(16, '18', 'knlkm04'),
(5, '19', 'knlkm01'),
(55, '2', 'knlkm26'),
(6, '20', 'knlkm01'),
(12, '20', 'knlkm03'),
(20, '20', 'knlkm04'),
(25, '20', 'knlkm08'),
(29, '20', 'knlkm09'),
(45, '20', 'knlkm10'),
(41, '20', 'knlkm13'),
(33, '20', 'knlkm14'),
(37, '20', 'knlkm15'),
(11, '21', 'knlkm03'),
(14, '22', 'knlkm06'),
(51, '23', 'knlkm18'),
(52, '24', 'knlkm18'),
(58, '24', 'knlkm22'),
(61, '24', 'knlkm24'),
(2, '25', 'knlkm01'),
(4, '26', 'knlkm01'),
(10, '26', 'knlkm03'),
(18, '26', 'knlkm04'),
(24, '26', 'knlkm08'),
(28, '26', 'knlkm09'),
(44, '26', 'knlkm10'),
(40, '26', 'knlkm13'),
(32, '26', 'knlkm14'),
(36, '26', 'knlkm15'),
(50, '26', 'knlkm16'),
(1, '27', 'knlkm02'),
(15, '28', 'knlkm05'),
(7, '29', 'knlkm01'),
(13, '29', 'knlkm03'),
(21, '29', 'knlkm04'),
(26, '29', 'knlkm08'),
(30, '29', 'knlkm09'),
(46, '29', 'knlkm10'),
(42, '29', 'knlkm13'),
(34, '29', 'knlkm14'),
(38, '29', 'knlkm15'),
(56, '3', 'knlkm22'),
(59, '3', 'knlkm24'),
(19, '30', 'knlkm04'),
(22, '30', 'knlkm07'),
(53, '31', 'knlkm29'),
(54, '32', 'knlkm29'),
(64, '33', 'knlkm30'),
(111, '36', 'kpbak15'),
(117, '36', 'kpbak16'),
(114, '36', 'kpbak17'),
(86, '37', 'knlfs04'),
(88, '37', 'knlfs05'),
(90, '37', 'knlfs11'),
(91, '37', 'knlfs12'),
(76, '37', 'knlkm19'),
(78, '37', 'knlkm20'),
(83, '37', 'knlkm23'),
(84, '37', 'knlkm25'),
(87, '38', 'knlfs04'),
(89, '38', 'knlfs05'),
(74, '38', 'knlkm17'),
(77, '39', 'knlkm19'),
(62, '4', 'knlkm28'),
(75, '40', 'knlkm17'),
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
(3, '5', 'knlkm01'),
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
(67, '7', 'knlfs02'),
(156, '70', 'kpbut02'),
(69, '8', 'knlfs06'),
(70, '8', 'knlfs07'),
(71, '8', 'knlfs08'),
(72, '8', 'knlfs09'),
(73, '8', 'knlfs10'),
(68, '9', 'knlfs03');

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
  `id_parameter` varchar(7) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `deskripsi` text NOT NULL,
  `satuan` varchar(8) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id_parameter`, `nama`, `id_type_analisis`, `deskripsi`, `satuan`, `harga`) VALUES
('fmbab01', 'Ratio', 'fmbab', '', '%', 0),
('fmbab02', 'Magnetit', 'fmbab', '', '%', 0),
('fmbab03', 'Ilmenit', 'fmbab', '', '%', 0),
('fmbab04', 'Hematit', 'fmbab', '', '%', 0),
('fmbab05', 'Epidot', 'fmbab', '', '%', 0),
('fmbab06', 'Amfibol', 'fmbab', '', '%', 0),
('fmbab07', 'Piroksen', 'fmbab', '', '%', 0),
('fmbab08', 'Kuarsa', 'fmbab', '', '%', 0),
('fmbab09', 'Pirit', 'fmbab', '', '%', 0),
('fmbab10', 'Kalkopirit', 'fmbab', '', '%', 0),
('fmbab11', 'Leukosen', 'fmbab', '', '%', 0),
('fmbab12', 'Zirkon', 'fmbab', '', '%', 0),
('fmbab13', 'Kasiterit', 'fmbab', '', '%', 0),
('fmbab14', 'Rutil', 'fmbab', '', '%', 0),
('fmbab15', 'Oksida Besi', 'fmbab', '', '%', 0),
('fmbab16', 'Kromit', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab17', 'Garnet', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab18', 'Korundum', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab19', 'Markasit', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab20', 'Turmalin', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab21', 'Sinabar', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab22', 'Argentit', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab23', 'Barit', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab24', 'Apatit', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab25', 'Anatas', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab26', 'FR.Batuan', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab27', 'Emas', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbab28', 'Biotit', 'fmbab', 'Analisa Butir-Ayak', '%', 0),
('fmbbb01', 'AKMPR', 'fmbbb', 'Analisis Komposisi Maseral dan Penentuan Reflektan', '', 0),
('fmbpb01', 'Plagioklas', 'fmbpb', 'Deskripsi Petrografi Batuan dilengkapi dengan Interpretasi Mineral Ubahan', '%', 0),
('fmbpb02', 'Kuarsa', 'fmbpb', '', '%', 0),
('fmbpb03', 'Epidot', 'fmbpb', '', '%', 0),
('fmbpb04', 'Mineral Opak/Oksida Besi', 'fmbpb', '', '%', 0),
('fmbpb05', 'Lempung', 'fmbpb', '', '%', 0),
('fmbpb06', 'Klorit', 'fmbpb', '', '%', 0),
('fmbpb07', 'Karbonat', 'fmbpb', '', '%', 0),
('fmbpb08', 'Masadasar', 'fmbpb', '', '%', 0),
('fmbpb09', 'Fragmen Fosil', 'fmbpb', '', '%', 0),
('fmbpb10', 'Dolomit', 'fmbpb', '', '%', 0),
('kbbak01', 'Form of Sulfur', 'kbbak', '', '%', 0),
('kbbak02', 'CO2', 'kbbak', '', '%', 0),
('kbbak03', 'Chlorine', 'kbbak', '', '%', 0),
('kbbak04', 'TOC (Total Organic Carbon)', 'kbbak', '', '%', 0),
('kbbap01', 'Total Moisture', 'kbbap', '', '%', 100000),
('kbbap02', 'Moisture', 'kbbap', '', '%', 100000),
('kbbap03', 'Ash', 'kbbap', '', '%', 100000),
('kbbap04', 'Volatile Matter', 'kbbap', '', '%', 100000),
('kbbap05', 'Fixed Carbon', 'kbbap', '', '%', 100000),
('kbbap06', 'Analisa Abu', 'kbbap', '', '%', 100000),
('kbbas01', 'Calorific Value', 'kbbas', '', 'Cal/gr', 0),
('kbbas02', 'True Specific Gravity', 'kbbas', '', '', 0),
('kbbas03', 'HGI', 'kbbas', '', '', 0),
('kbbas04', 'Swelling Index', 'kbbas', '', '', 0),
('kbbas05', 'Gray King Coke', 'kbbas', '', '', 0),
('kbbas06', 'Titik Leleh Abu', 'kbbas', '', 'C', 0),
('kbbas07', 'HGI (Hard Groved Index)', 'kbbas', '', '', 0),
('kbbas08', 'Sifat Muai (Dilatometer)', 'kbbas', '', '%', 0),
('kbbau01', 'Karbon / C', 'kbbau', '', '%', 280000),
('kbbau02', 'Hidrogen / H', 'kbbau', '', '%', 280000),
('kbbau03', 'Nitrogen / N', 'kbbau', '', '%', 280000),
('kbbau04', 'Oksigen / O', 'kbbau', '', '%', 0),
('kbbau05', 'Sulfur / S', 'kbbau', '', '%', 0),
('kmkgb01', 'pH', 'kmkgb', '', '', 0),
('kmkgb02', 'BD', 'kmkgb', '', '', 0),
('kmkgb03', 'LS', 'kmkgb', '', '%', 0),
('kmkgb04', 'RM', 'kmkgb', '', '%', 0),
('kmkgb05', 'VM', 'kmkgb', '', '%', 0),
('kmkgb06', 'ASH', 'kmkgb', '', '%', 0),
('kmkgb07', 'FC', 'kmkgb', '', '%', 0),
('kmkgb08', 'M', 'kmkgb', '', '%', 0),
('kmkgb09', 'S', 'kmkgb', '', '%', 0),
('kmkgb10', 'W', 'kmkgb', '', 'Cal/gr', 0),
('kmlaa03', 'Cu', 'kmlaa', '', 'ppm', 25000),
('kmlaa04', 'Pb', 'kmlaa', '', 'ppm', 25000),
('kmlaa05', 'Zn', 'kmlaa', '', 'ppm', 25000),
('kmlaa06', 'Ag', 'kmlaa', '', 'ppm', 25000),
('kmlaa07', 'Co', 'kmlaa', '', 'ppm', 25000),
('kmlaa08', 'Ni', 'kmlaa', '', 'ppm', 25000),
('kmlaa09', 'Fe', 'kmlaa', '', 'ppm', 25000),
('kmlaa10', 'Cr', 'kmlaa', '', 'ppm', 25000),
('kmlaa11', 'Mn', 'kmlaa', '', 'ppm', 25000),
('kmlaa12', 'Li', 'kmlaa', '', 'ppm', 30000),
('kmlaa13', 'K', 'kmlaa', '', 'ppm', 30000),
('kmlaa14', 'Bi', 'kmlaa', '', 'ppm', 30000),
('kmlaa15', 'Cd', 'kmlaa', '', 'ppm', 30000),
('kmlaa16', 'Au (Fire Assay)', 'kmlaa', '', 'ppm', 30000),
('kmlaa17', 'Au (Aqua Regia)', 'kmlaa', '', 'ppm', 30000),
('kmlcp01', 'Y', 'kmlcp', '', '', 75000),
('kmlcp02', 'Zr', 'kmlcp', '', '', 75000),
('kmlcp03', 'Nb', 'kmlcp', '', '', 75000),
('kmlcp04', 'La', 'kmlcp', '', '', 75000),
('kmlcp05', 'Ce', 'kmlcp', '', '', 75000),
('kmlcp06', 'Nd', 'kmlcp', '', '', 75000),
('kmlcp07', 'Pm', 'kmlcp', '', '', 75000),
('kmlcp08', 'Sm', 'kmlcp', '', '', 75000),
('kmlcp09', 'Eu', 'kmlcp', '', '', 75000),
('kmlcp10', 'Gd', 'kmlcp', '', '', 75000),
('kmlcp11', 'Tb', 'kmlcp', '', '', 75000),
('kmlcp12', 'Dy', 'kmlcp', '', '', 75000),
('kmlcp13', 'Ho', 'kmlcp', '', '', 75000),
('kmlcp14', 'Er', 'kmlcp', '', '', 75000),
('kmlcp15', 'Tm', 'kmlcp', '', '', 75000),
('kmlcp16', 'Yb', 'kmlcp', '', '', 75000),
('kmlcp17', 'Lu', 'kmlcp', '', '', 75000),
('kmlkl01', 'As', 'kmlkl', '', 'ppm', 0),
('kmlkl02', 'Sn', 'kmlkl', '', 'ppm', 0),
('kmlkl03', 'W', 'kmlkl', '', 'ppm', 0),
('kmlkl04', 'Sb', 'kmlkl', '', 'ppm', 0),
('kmlkl05', 'Mo', 'kmlkl', '', 'ppm', 0),
('kmlkl06', 'V', 'kmlkl', '', '', 0),
('kmlmp02', 'Cr', 'kmlmp', '', 'ppm', 30000),
('kmlmp03', 'Al', 'kmlmp', '', '%', 30000),
('kmlmp04', 'Mg', 'kmlmp', '', 'ppb', 175000),
('kmlmp05', 'Ca', 'kmlmp', '', 'ppb', 60000),
('kmlmp06', 'Na', 'kmlmp', '', 'ppb', 60000),
('kmlmp07', 'Sr', 'kmlmp', '', 'ppb', 60000),
('knlfs01', 'Bleaching Test', 'knlfs', '', '', 0),
('knlfs02', 'KTK/CEC', 'knlfs', '', '', 0),
('knlfs03', 'Methylene Blue Test', 'knlfs', '', '', 0),
('knlfs04', 'Blast Test', 'knlfs', '', '', 0),
('knlfs05', 'Crucible Test', 'knlfs', '', '', 0),
('knlfs06', 'Drilling Mud Test (Swelling)', 'knlfs', '', '', 0),
('knlfs07', 'Drilling Mud Test (Viskositas Relatif)', 'knlfs', '', '', 0),
('knlfs08', 'Drilling Mud Test (Viskositas Absolut)', 'knlfs', '', '', 0),
('knlfs09', 'Drilling Mud Test (CEC, Ca &Mg)', 'knlfs', '', '', 0),
('knlfs10', 'Drilling Mud Test (pH)', 'knlfs', '', '', 0),
('knlfs11', 'Kadar Pasir', 'knlfs', '', '', 0),
('knlfs12', 'Kadar Air (Moisture)', 'knlfs', '', '', 0),
('knlkm01', 'SiO2', 'knlkm', '', '%', 0),
('knlkm02', 'SiO2 Reaktif', 'knlkm', '', '%', 0),
('knlkm03', 'Al2O3', 'knlkm', '', '%', 0),
('knlkm04', 'Fe2O3', 'knlkm', '', '%', 0),
('knlkm05', 'FeO', 'knlkm', '', '%', 0),
('knlkm06', 'Fetotal', 'knlkm', '', '%', 0),
('knlkm07', 'Fe3O4', 'knlkm', '', '%', 0),
('knlkm08', 'CaO', 'knlkm', '', '%', 0),
('knlkm09', 'MgO', 'knlkm', '', '%', 0),
('knlkm10', 'MnO', 'knlkm', '', '%', 0),
('knlkm11', 'MnO2', 'knlkm', '', '%', 0),
('knlkm12', 'Mntotal', 'knlkm', '', '%', 0),
('knlkm13', 'TiO2', 'knlkm', '', '%', 0),
('knlkm14', 'Na2O', 'knlkm', '', '%', 0),
('knlkm15', 'K2O', 'knlkm', '', '%', 0),
('knlkm16', 'P2O5', 'knlkm', '', '%', 0),
('knlkm17', 'Ptotal', 'knlkm', '', '%', 0),
('knlkm18', 'SO3', 'knlkm', '', '%', 0),
('knlkm19', 'Stotal', 'knlkm', '', '%', 0),
('knlkm20', 'BaO', 'knlkm', '', '%', 0),
('knlkm21', 'Cr2O3', 'knlkm', '', '%', 0),
('knlkm22', 'H2O-', 'knlkm', '', '%', 0),
('knlkm23', 'H2O+', 'knlkm', '', '%', 0),
('knlkm24', 'HD', 'knlkm', '', '%', 0),
('knlkm25', 'BV', 'knlkm', '', '%', 0),
('knlkm26', 'BJ/SG', 'knlkm', '', '%', 0),
('knlkm27', 'PH', 'knlkm', '', '%', 0),
('knlkm28', 'CI', 'knlkm', '', '%', 0),
('knlkm29', 'CO2', 'knlkm', '', '%', 0),
('knlkm30', 'Hg', 'knlkm', '', '%', 0),
('knlkm31', 'MgCO3', 'knlkm', '', '%', 0),
('knlkm32', 'CaCO3', 'knlkm', '', '%', 0),
('kpbak01', 'pH', 'kpbak', '', '', 0),
('kpbak02', 'DHL', 'kpbak', '', 'mg/L', 0),
('kpbak03', 'TDS', 'kpbak', '', 'mg/L', 0),
('kpbak04', 'SiO', 'kpbak', '', 'mg/L', 0),
('kpbak05', 'B', 'kpbak', '', 'mg/L', 0),
('kpbak06', 'Al', 'kpbak', '', 'mg/L', 0),
('kpbak07', 'Fe', 'kpbak', '', 'mg/L', 0),
('kpbak08', 'Ca', 'kpbak', '', 'mg/L', 0),
('kpbak09', 'Mg', 'kpbak', '', 'mg/L', 0),
('kpbak10', 'Na', 'kpbak', '', 'mg/L', 0),
('kpbak11', 'K', 'kpbak', '', 'mg/L', 0),
('kpbak12', 'Li', 'kpbak', '', 'mg/L', 0),
('kpbak13', 'As', 'kpbak', '', 'mg/L', 0),
('kpbak14', 'NH4', 'kpbak', '', 'mg/L', 0),
('kpbak15', 'F', 'kpbak', '', 'mg/L', 0),
('kpbak16', 'SO4', 'kpbak', '', 'mg/L', 0),
('kpbak17', 'CI', 'kpbak', '', 'mg/L', 0),
('kpbak18', 'HCO3', 'kpbak', '', 'mg/L', 0),
('kpbak19', 'CO3', 'kpbak', '', 'ppb', 0),
('kpbak20', 'TSS', 'kpbak', '', 'ppb', 0),
('kpbak21', 'SiO2', 'kpbak', '', 'ppb', 0),
('kpbgs01', 'H2', 'kpbgs', '', '% mol', 0),
('kpbgs02', 'O2', 'kpbgs', '', '% mol', 0),
('kpbgs03', 'Ar', 'kpbgs', '', '% mol', 0),
('kpbgs04', 'N2', 'kpbgs', '', '% mol', 0),
('kpbgs05', 'CH4', 'kpbgs', '', '% mol', 0),
('kpbgs06', 'CO', 'kpbgs', '', '% mol', 0),
('kpbgs07', 'He', 'kpbgs', '', '% mol', 0),
('kpbgs08', 'CO2', 'kpbgs', '', '% mol', 0),
('kpbgs09', 'H2S', 'kpbgs', '', '% mol', 0),
('kpbgs10', 'HCI', 'kpbgs', '', '% mol', 0),
('kpbgs11', 'NH4', 'kpbgs', '', '% mol', 0),
('kpbgs12', 'H2O', 'kpbgs', '', '% mol', 0),
('kpbia01', 'd(18O_16O)', 'kpbia', '', '%o', 0),
('kpbia02', 'd(D_H)', 'kpbia', '', '%o', 0),
('kpbth01', 'Hg', 'kpbth', '', 'ppb', 0),
('kpbth02', 'pH', 'kpbth', '', '', 0),
('kpbth03', 'H20-', 'kpbth', '', '%', 0),
('kpbut01', 'CO2', 'kpbut', '', '%', 0),
('kpbut02', 'silica', 'kpbut', '', 'Kg', 18000);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`id_pemohon`, `id_type_pemohon`, `nama`, `nama_sertifikat`, `alamat`, `deskripsi`, `username`, `password`, `pass_awal`) VALUES
(2, '08', 'Eddy Suryadi Soegoto', 'Eddy Suryadi Soegoto', 'Jl. Tubagus Smail No. 212 Bandung', 'Pengamat Geologi Bandung', '6622d422', '59e77a564a2bd104c9f946e3480772177716e315', 'fbc21af2'),
(3, '01', 'Prof. Dedi Kurniadi', '', '', 'No. telepon 085755268744', 'f83a36b8', 'fd6fdd45bc76f637e8648fae3918246cfef0e089', '60e04a4b'),
(4, '07', 'Baharudin', 'CV. Water Enough', 'Jl. Cimindi Raya', 'Dinas Pendapatan Daerah Kabupaten Karimun', 'a6d5b307', '9fd0bb1ba77e9adc9478a310ef327745805692b7', '336930f4'),
(5, '01', 'Musidi', '', '', 'jakarta coal', '67ae642e', 'ec6d87169826fb0c78ff42e42ea136a35e64bb81', 'dec5876b'),
(6, '02', 'Corry', '', '', 'Korkel', '31a0e77a', '3302607ea7753474f99fbfda99c26b45b6f21e18', '25fb41f4'),
(7, '01', 'Suryadi', 'Suryadi', 'Jl. Nyereded No. 52 Kota Bandung', '', '2e920c5a', '3fc16c1567ad47eb74bbd0ad1e3b7ca5254f260e', '693b021c'),
(10, '01', 'Musidi', 'Kp. Konservasi', 'Jl. Burangrang No. 23', 'jakarta coal', 'e5bfe4c5', 'ee2481032b9bb672cb62de2fdafad2d5ca862425', '3912b159'),
(11, '01', 'Jejen', 'Jejen', 'Jl. Van Houten', '-', 'cc63d0c8', 'e52ad45083aed834d704abbfc8d2e7464b5474a9', 'b5676b99'),
(12, '01', 'Ajay de Pleur', 'Ajay de Pleur', 'Jl. Leuwigoong No. 44', '', 'AJAYD26', 'b605fc3bd99bc2cb53fbf1a712863deaace7d8d6', '0d3de938');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nip`, `nama`, `telepon`, `email`, `id_komoditi`, `username`, `password`, `pass_awal`, `admin`, `is_login`, `last_login`, `created_date`, `updated_date`) VALUES
(1, '01003658841253639', 'Tati Haryati', NULL, NULL, 'tu', 'admin', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 1, 1, '2015-03-25 17:20:19', '0000-00-00 00:00:00', '2015-03-25 10:20:19'),
(2, '1234567890123456789', 'Resmi Novianti', NULL, NULL, 'bb', 'batubara', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-03-24 21:27:23', '0000-00-00 00:00:00', '2015-03-24 14:27:34'),
(3, '1231297224974', 'Kepala Pusat', NULL, NULL, 'tu', 'kapus', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21'),
(4, '28934623764', 'Kasub Bidang Lab', NULL, NULL, 'tu', 'keplab', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21'),
(5, '48480048252136658', 'Arief Wibowo', NULL, NULL, 'lg', 'logam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '2015-03-24 21:27:43', '0000-00-00 00:00:00', '2015-03-24 14:32:35'),
(6, '012536620211000114', 'Ane Yulian', NULL, NULL, 'nl', 'nonlogam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 1, '2015-03-24 21:32:41', '0000-00-00 00:00:00', '2015-03-24 14:32:41'),
(7, '2512335588141002629', 'Geanissa Handarini', NULL, NULL, 'pb', 'panasbumi', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21'),
(8, '12312t318236', 'Kabid Sarana Teknik', NULL, NULL, 'tu', 'sartek', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-22 13:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `preparasi`
--

CREATE TABLE IF NOT EXISTS `preparasi` (
`id` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
  `is_selesai` tinyint(1) NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `jumlah_conto` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `type_analisis`
--

CREATE TABLE IF NOT EXISTS `type_analisis` (
`id` int(11) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_lab` varchar(3) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_analisis`
--

INSERT INTO `type_analisis` (`id`, `id_type_analisis`, `nama`, `id_lab`, `deskripsi`, `harga`) VALUES
(1, 'fmbab', 'Analisa Butir', 'FMB', '', 640000),
(2, 'fmbbj', 'Berat Jenis', 'FMB', '', 75000),
(3, 'fmbdk', 'Derajat Kemagnetan', 'FMB', '', 100000),
(4, 'fmbim', 'Identifikasi Mineral', 'FMB', '', 0),
(5, 'fmbma', 'Analisis Ayak', 'FMB', '', 500000),
(6, 'fmbmb', 'Mineralogi Butir', 'FMB', '', 300000),
(7, 'fmbmn', 'Mineragrafi', 'FMB', '', 515000),
(8, 'fmbmr', 'Komposisi Maseral & Reflektan', 'FMB', '', 575000),
(9, 'fmbpb', 'Petrografi Batuan', 'FMB', '', 610000),
(10, 'fmbrt', 'Analisis Retort', 'FMB', '', 0),
(11, 'fmbse', 'SEM(Scanning Electron Microscopy) & EDS', 'FMB', '', 750000),
(12, 'fmbsr', 'SRA (Source Rock Analysis)', 'FMB', '', 1500000),
(13, 'fmbuf', 'Kuat Tekan dan Berat Jenis', 'FMB', '', 600000),
(14, 'fmbxr', 'Bulk', 'FMB', '', 350000),
(15, 'kbbaa', 'Analisis Abu', 'KBB', '', 0),
(16, 'kbbak', 'Analisis Kimia (Batubara)', 'KBB', '', 0),
(17, 'kbbap', 'Analisis Proksimat', 'KBB', '', 0),
(18, 'kbbas', 'Analisis Sifat Fisik', 'KBB', '', 0),
(19, 'kbbau', 'Analisis Ultimate', 'KBB', '', 0),
(20, 'kmkgb', 'Gambut', 'KGB', '', 0),
(21, 'kmlaa', 'Mineral Logam AAS', 'KML', '', 0),
(22, 'kmlcp', 'ICP', 'KML', '', 0),
(23, 'kmlkl', 'Kolorimetri', 'KML', '', 0),
(24, 'kmlmp', 'MP', 'KML', '', 0),
(25, 'knlfs', 'Fisika', 'KNL', '', 0),
(26, 'knlkm', 'Kimia', 'KNL', '', 0),
(27, 'kpbak', 'Analisis Air', 'KPB', '', 0),
(28, 'kpbgs', 'Analisis Gas', 'KPB', '', 0),
(29, 'kpbia', 'Analisis Isotop Air', 'KPB', '', 0),
(30, 'kpbth', 'Analisis Tanah', 'KPB', '', 0),
(31, 'kpbut', 'Analisis Udara Tanah', 'KPB', '', 0);

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
 ADD PRIMARY KEY (`id`), ADD KEY `id_pengirim` (`id_pemohon`), ADD KEY `id_lab` (`id_lab`), ADD KEY `id_pegawai` (`id_petugas`), ADD KEY `lokasi` (`lokasi`), ADD KEY `id_pemohon` (`id_pemohon`), ADD KEY `id_analisis` (`id_analisis`);

--
-- Indexes for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
 ADD PRIMARY KEY (`id`), ADD KEY `id_parameter` (`id_parameter`), ADD KEY `id_metoda` (`id_metoda`), ADD KEY `id_metoda_2` (`id_metoda`), ADD KEY `id_analisis` (`id_analisis`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `id_proses_analisis` (`id_conto`), ADD KEY `id_parameter` (`id_parameter`), ADD KEY `id_metoda` (`id_metoda`), ADD KEY `id_metoda_2` (`id_metoda`), ADD KEY `id_conto` (`id_conto`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
 ADD PRIMARY KEY (`id_kabupaten`), ADD KEY `id_provinsi` (`id_provinsi`);

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
 ADD PRIMARY KEY (`id_parameter`), ADD KEY `id_type` (`id_type_analisis`), ADD KEY `id_type_2` (`id_type_analisis`);

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
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
 ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `type_analisis`
--
ALTER TABLE `type_analisis`
 ADD PRIMARY KEY (`id`), ADD KEY `id_lab` (`id_lab`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `analisis_type_analisis`
--
ALTER TABLE `analisis_type_analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `conto`
--
ALTER TABLE `conto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `conto_detail_fisika`
--
ALTER TABLE `conto_detail_fisika`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `conto_parameter`
--
ALTER TABLE `conto_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=439;
--
-- AUTO_INCREMENT for table `metoda_parameter`
--
ALTER TABLE `metoda_parameter`
MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `pemohon`
--
ALTER TABLE `pemohon`
MODIFY `id_pemohon` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `preparasi`
--
ALTER TABLE `preparasi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type_analisis`
--
ALTER TABLE `type_analisis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
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
