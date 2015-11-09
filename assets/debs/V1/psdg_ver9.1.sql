-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2014 at 06:40 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `conto`
--

CREATE TABLE IF NOT EXISTS `conto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conto` varchar(11) NOT NULL COMMENT '0000-00-00000 <- nomor urut dari nomor analisis',
  `id_analisis` varchar(12) NOT NULL,
  `tanggal_proses` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nama_batuan` varchar(30) DEFAULT NULL,
  `berat` float NOT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `deskripsi` text,
  PRIMARY KEY (`id`),
  KEY `id_analisis` (`id_analisis`),
  KEY `id_conto` (`id_conto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `conto`
--

INSERT INTO `conto` (`id`, `id_conto`, `id_analisis`, `tanggal_proses`, `nama_batuan`, `berat`, `is_selesai`, `deskripsi`) VALUES
(12, '20140700001', 'bb001fmb1014', '2014-10-22 17:12:15', '0', 0, 1, NULL),
(13, '20140100002', 'bb002fmb1014', '2014-10-22 17:52:53', '0', 0, 1, NULL),
(14, '20140100003', 'bb002fmb1014', '2014-10-22 17:53:12', '0', 0, 1, NULL),
(15, '20140100004', 'bb003fmb1014', '2014-10-22 17:56:49', '0', 0, 1, NULL),
(16, '20140700005', 'bb004fmb1014', '2014-10-22 18:29:13', '0', 0, 0, NULL),
(17, '20140200006', 'bb005fmb1014', '2014-10-22 18:38:51', '0', 0, 0, NULL),
(18, '20140100007', 'bb006fmb1014', '2014-10-23 15:18:15', '0', 0, 1, NULL),
(19, '20140200008', 'bb007fmb1014', '2014-10-23 15:23:31', '0', 0, 1, NULL),
(20, '20140800009', 'bb008fmb1014', '2014-10-23 15:31:26', '0', 0, 0, NULL),
(21, '20140700011', 'bb009fmb1014', '2014-10-23 15:34:06', '0', 0, 1, NULL),
(22, '20140700012', 'bb009fmb1014', '2014-10-23 15:34:47', '0', 0, 1, NULL),
(23, '20140700013', 'bb009fmb1014', '2014-10-23 15:35:23', '0', 0, 1, NULL),
(24, '20140700014', 'bb009fmb1014', '2014-10-23 15:36:01', '0', 0, 1, NULL),
(25, '20140700015', 'bb009fmb1014', '2014-10-23 15:36:04', '0', 0, 1, NULL),
(26, '20140100016', 'bb010fmb1014', '2014-10-23 15:38:56', '0', 0, 1, NULL),
(27, '20140100017', 'bb010fmb1014', '2014-10-23 15:39:30', '0', 0, 1, NULL),
(28, '20140100018', 'bb010fmb1014', '2014-10-23 15:39:42', '0', 0, 1, NULL),
(29, '20140100019', 'bb010fmb1014', '2014-10-23 15:40:05', '0', 0, 1, NULL),
(30, '20140100020', 'bb010fmb1014', '2014-10-23 15:40:19', '0', 0, 1, NULL),
(31, '20140100021', 'bb010fmb1014', '2014-10-23 15:40:33', '0', 0, 1, NULL),
(32, '20140100022', 'bb010fmb1014', '2014-10-23 15:40:49', '0', 0, 1, NULL),
(33, '20140800023', 'bb011fmb1014', '2014-10-23 15:54:56', '0', 0, 1, NULL),
(34, '20140800024', 'bb012fmb1014', '2014-10-23 17:00:55', '0', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_conto_fisika`
--

CREATE TABLE IF NOT EXISTS `detail_conto_fisika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conto` int(11) NOT NULL,
  `id_type_analisis` varchar(5) NOT NULL,
  `foto_1` varchar(100) NOT NULL,
  `foto_2` varchar(100) NOT NULL,
  `deskripsi_1` varchar(255) NOT NULL,
  `deskripsi_2` varchar(255) NOT NULL,
  `nilai` varchar(100) DEFAULT NULL,
  `d_mikroskopis` text,
  `komposisi` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_conto` (`id_conto`),
  KEY `id_type_analisis` (`id_type_analisis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `detail_conto_fisika`
--

INSERT INTO `detail_conto_fisika` (`id`, `id_conto`, `id_type_analisis`, `foto_1`, `foto_2`, `deskripsi_1`, `deskripsi_2`, `nilai`, `d_mikroskopis`, `komposisi`) VALUES
(28, 12, 'fmbbj', '', '', '', '', '["2.42"]', NULL, NULL),
(29, 13, 'fmbuf', '', '', '', '', '["497","5.33"]', NULL, NULL),
(30, 14, 'fmbuf', '', '', '', '', '["495","4.56"]', NULL, NULL),
(31, 15, 'fmbmn', '15311.jpg', '15312.jpg', 'fotomikrograf sayatan poles pirit dan nampak sedikit inklusi kalkopirit', 'fotomikrograf sayatan poles pirit dan nampak tersebar dalam massa batuan', NULL, 'sayatan poles batuan di bawah mikroskop cahaya oantul, mineral logam yang teridentifikasi adalah pirit dan kallopirit berbutir halus hingga kurang lebih >1 mm, dengan bentuk subhedral hingga anhedral.\n\nParagenesa :\nPirit\n    Kalkopirit\n                                 Hidrous Iron Oxide', 'Pirit (7), Kalkopirit(0.5), Hidrous Iron Oxide(1)'),
(32, 16, 'fmbab', '', '', '', '', NULL, NULL, NULL),
(33, 17, 'fmbdk', '', '', '', '', NULL, NULL, NULL),
(34, 18, 'fmbpb', '18341.jpg', '18342.jpg', 'Mikro diorit terubah disusun oleh plagioklas piroksen dan mineral opak, tampak plagioklas sebagian terubah kuat ke serisit, klorit dan epidot; piroksen terubah ke klorit dan epidot, sedangkan sebagian klorit mengisi celah-celah/rongga-rongga antar mineral', 'Mikro diorit terubah disusun oleh plagioklas piroksen dan mineral opak, tampak plagioklas sebagian terubah kuat ke serisit, klorit dan epidot; piroksen terubah ke klorit dan epidot, sedangkan sebagian klorit mengisi celah-celah/rongga-rongga antar mineral', NULL, 'Di dalam sayatan tipis batuan ini menunjukkan tekstur hipidiomorfik granular, berbutir halus hingga berukuran 1 mm, bentuk butir anhedral-subhedral, disusun oleh plagioklas, piroksen dan mineral opak serta mineral-mineral sekunder. Terdapat klorit mengisi celah-celah/rongga antar mineral dan epidot mengisi rekahan-rekahan halus.\n\nPlagioklas, tak berwarna, agak kusam, berbutir halus hingga berukuran 1 mm, bentuk butir anhedral-subhedral, menunjukkan relik-relik kembar, beberapa plagioklas berzona, umumnya terubah kuat ke serisit, klorit dan sedikit epidot.\n\nPiroksen, berwarna hijau pucat, berbutir halus hingga berukuran hingga 1mm, bentuk butir anhedral-subhedral, beberapa individu mempunyai kembar, menunjukkan pleokroisme lemah, terubah ke klorit, epidot, dan karbonat. \n\nMineral Opak, berwarna hitam, kedap cahaya, berbutir halus hingga berukuran 0,25 mm, bentuk anhedral, umumnya terdapat menyebar dalam jumlah sedikit. \n\nKlorit, berwarna hijau pucat, berbutir halus berupa agregat-agregat berserabut, sebagian terdapat mengisi celah-celah/rongga-rongga antar mineral, sedangkan epidot membentuk urat-urat halus. \n', 'Plagioklas (40), Piroksen (12),  Mineral opak (1), Serisit (35), Klorit (10), Epidot (2), Karbonat (tr)'),
(35, 19, 'fmbrt', '', '', '', '', '{"k_air":"70.4","k_minyak":"23.5","sg_batuan":"","sg_minyak":""}', NULL, NULL),
(36, 20, 'fmbmr', '', '', '', '', NULL, NULL, NULL),
(37, 21, 'fmbsr', '', '', '', '', '[["0.22","0.62","0.32"],"0.3","414.7","204","105"]', NULL, NULL),
(38, 22, 'fmbsr', '', '', '', '', '[["0.21","0.60","0.32"],"0.45","361.5","134","71"]', NULL, NULL),
(39, 23, 'fmbsr', '', '', '', '', '[["0.17","0.50","0.52"],"0.06","478.4","891","932"]', NULL, NULL),
(40, 24, 'fmbsr', '', '', '', '', '[["0.13","0.47","0.44"],"0.62","406.7","75","71"]', NULL, NULL),
(41, 25, 'fmbsr', '', '', '', '', '[["0.18","0.51","0.52"],"0.27","333.2","190","195"]', NULL, NULL),
(42, 26, 'fmbxr', '', '', '', '', '["- Quartz, Illite "]', NULL, NULL),
(43, 27, 'fmbxr', '', '', '', '', '["-\\tQuartz, Kaolinite, Pyrophyllite "]', NULL, NULL),
(44, 28, 'fmbxr', '', '', '', '', '["-\\tQuartz, Illite "]', NULL, NULL),
(45, 29, 'fmbxr', '', '', '', '', '["-\\tQuartz, Kaolinite, Illite "]', NULL, NULL),
(46, 30, 'fmbxr', '', '', '', '', '["-\\tQuartz, Kaolinite, Illite, Clinochlore"]', NULL, NULL),
(47, 31, 'fmbxr', '', '', '', '', '["-\\tNatroalunite"]', NULL, NULL),
(48, 32, 'fmbxr', '', '', '', '', '["-\\tQuartz, Kaolinite, Illite "]', NULL, NULL),
(49, 33, 'fmbab', '33491.jpg', '33492.jpg', 'Butiran mineral Mika, abu-abu, coklat, pipih, sangat lunak, Oksida besi, coklat kemerahan, kusam, Ilmenit, hitam, kilap metalik, Amfibol, hitam, bentuk prismatik.', 'Butiran mineral Mika, abu-abu, coklat, pipih, sangat lunak, Kuarsa, putih, transparan, Pirit, kuning metalik (terselimuti oksida besi kemerahan), Zirkon, tidak berwarna, prismatik, Turmalin, hijau botol, bentuk tabular.', NULL, 'Di bawah Mikroskop Stereo Binokuler, teridentifikasi mineral-mineral :', 'NO. NAMA MINERAL % KETERANGAN\n1 Kuarsa 78.38 Tidak berwarna, putih, kekuningan, transparan, kilap kaca, bentuk butir menyudut tanggung, hadir dalam jumlah paling dominan.\n2 Magnetit 0.15 Berwarna hitam, kilap metalik – agak kusam, bentuk butir menyudut tanggung – membundar tanggung, bersifat ‘strong'),
(50, 34, 'fmbdk', '', '', '', '', '["57.5"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_analisis`
--

CREATE TABLE IF NOT EXISTS `hasil_analisis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_analisis` varchar(12) NOT NULL COMMENT 'nomor analisis',
  `nomor_analisis` varchar(12) NOT NULL,
  `jenis_contoh` varchar(30) NOT NULL,
  `jumlah_contoh` int(11) NOT NULL,
  `kode_conto` varchar(5) NOT NULL,
  `lokasi` int(11) DEFAULT NULL,
  `tanggal_terima` date NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `id_pegawai` varchar(20) DEFAULT NULL COMMENT 'yang menerima',
  `id_lab` varchar(3) NOT NULL,
  `biaya` int(11) DEFAULT NULL,
  `id_pemohon` int(11) DEFAULT NULL,
  `preparasi` tinyint(1) DEFAULT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_pengirim` (`id_pemohon`),
  KEY `id_lab` (`id_lab`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `lokasi` (`lokasi`),
  KEY `id_pemohon` (`id_pemohon`),
  KEY `id_analisis` (`id_analisis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `hasil_analisis`
--

INSERT INTO `hasil_analisis` (`id`, `id_analisis`, `nomor_analisis`, `jenis_contoh`, `jumlah_contoh`, `kode_conto`, `lokasi`, `tanggal_terima`, `tanggal_daftar`, `id_pegawai`, `id_lab`, `biaya`, `id_pemohon`, `preparasi`, `is_selesai`, `created_at`) VALUES
(6, 'bb001fmb1014', '20140700001', 'batuan', 1, 'TU/V', 123, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 4, 0, 1, '2014-10-22 17:11:31'),
(7, 'bb002fmb1014', '20140100002', 'batuan', 2, '18-C', 376, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 5, 0, 1, '2014-10-22 17:52:34'),
(8, 'bb003fmb1014', '20140100004', 'batuan', 1, 'KT14-', 436, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 3, 0, 1, '2014-10-22 17:56:39'),
(9, 'bb004fmb1014', '20140700005', 'konsentrat dulang', 1, 'MB/DI', 323, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 4, 0, 0, '2014-10-22 18:29:04'),
(10, 'bb005fmb1014', '20140200006', 'batuan', 1, 'BTN', 277, '2014-10-22', '2014-10-22', '01003658841253639', 'fmb', 0, 6, 0, 0, '2014-10-22 18:38:04'),
(11, 'bb006fmb1014', '20140100007', 'batuan', 1, 'TT14-', 5, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 5, 0, 1, '2014-10-23 15:17:41'),
(12, 'bb007fmb1014', '20140200008', 'batuan', 1, '14 KD', 351, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 6, 0, 1, '2014-10-23 15:23:21'),
(13, 'bb008fmb1014', '20140800009', 'batubara', 2, 'BR', 304, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 2, 0, 0, '2014-10-23 15:31:17'),
(14, 'bb009fmb1014', '20140700011', 'batuan', 5, 'LP', 372, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 4, 0, 1, '2014-10-23 15:33:57'),
(15, 'bb010fmb1014', '20140100016', 'batuan', 7, 'KT14-', 436, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 5, 0, 1, '2014-10-23 15:38:47'),
(16, 'bb011fmb1014', '20140800023', 'konsentrat dulang', 1, '07/PC', 465, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 2, 0, 1, '2014-10-23 15:54:41'),
(17, 'bb012fmb1014', '20140800024', 'batuan', 1, 'TST', 448, '2014-10-23', '2014-10-23', '01003658841253639', 'fmb', 0, 2, 0, 1, '2014-10-23 17:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE IF NOT EXISTS `kabupaten` (
  `id_kabupaten` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kabupaten`),
  KEY `id_provinsi` (`id_provinsi`)
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
  `nama` varchar(12) NOT NULL,
  PRIMARY KEY (`id_komoditi`)
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
-- Table structure for table `k_penelitian`
--

CREATE TABLE IF NOT EXISTS `k_penelitian` (
  `id_kp` varchar(4) NOT NULL,
  `id_pemohon` varchar(9) NOT NULL,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='kelompok penelitian';

--
-- Dumping data for table `k_penelitian`
--

INSERT INTO `k_penelitian` (`id_kp`, `id_pemohon`, `nama`) VALUES
('KPBL', 'k005', 'Bukan Logam'),
('KPBP', 'k006', 'Bawah Permukaan'),
('KPEF', 'k002', 'Energi Fosil'),
('KPKV', 'k001', 'Konservasi'),
('KPML', 'k004', 'Mineral Logam'),
('KPPB', 'k003', 'Panas Bumi');

-- --------------------------------------------------------

--
-- Table structure for table `laboratorium`
--

CREATE TABLE IF NOT EXISTS `laboratorium` (
  `id_lab` varchar(3) NOT NULL,
  `id_komoditi` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_lab`),
  UNIQUE KEY `nama` (`nama`),
  KEY `id_komoditi` (`id_komoditi`)
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
  `id_laboratorium` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_metoda`),
  KEY `id_laboratorium` (`id_laboratorium`)
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
('7', 'SNI 13-3494-1994', 'knl'),
('8', 'SNI 13-3495-1994', 'knl'),
('9', 'SNI 13-3497-1994', 'knl');

-- --------------------------------------------------------

--
-- Table structure for table `metoda_parameter`
--

CREATE TABLE IF NOT EXISTS `metoda_parameter` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_metoda` varchar(2) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `id_metoda` (`id_metoda`,`id_parameter`),
  KEY `id_parameter` (`id_parameter`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=142 ;

--
-- Dumping data for table `metoda_parameter`
--

INSERT INTO `metoda_parameter` (`_id`, `id_metoda`, `id_parameter`) VALUES
(9, '1', 'KNLKM03'),
(17, '1', 'KNLKM04'),
(23, '1', 'KNLKM08'),
(27, '1', 'KNLKM09'),
(43, '1', 'KNLKM10'),
(31, '1', 'KNLKM14'),
(35, '1', 'KNLKM15'),
(57, '1', 'KNLKM22'),
(60, '1', 'KNLKM24'),
(49, '10', 'KNLKM16'),
(48, '12', 'KNLKM11'),
(47, '13', 'KNLKM12'),
(65, '14', 'KNLFS01'),
(66, '15', 'KNLFS01'),
(39, '16', 'KNLKM13'),
(8, '18', 'KNLKM03'),
(16, '18', 'KNLKM04'),
(5, '19', 'KNLKM01'),
(55, '2', 'KNLKM26'),
(6, '20', 'KNLKM01'),
(12, '20', 'KNLKM03'),
(20, '20', 'KNLKM04'),
(25, '20', 'KNLKM08'),
(29, '20', 'KNLKM09'),
(45, '20', 'KNLKM10'),
(41, '20', 'KNLKM13'),
(33, '20', 'KNLKM14'),
(37, '20', 'KNLKM15'),
(11, '21', 'KNLKM03'),
(14, '22', 'KNLKM06'),
(51, '23', 'KNLKM18'),
(52, '24', 'KNLKM18'),
(58, '24', 'KNLKM22'),
(61, '24', 'KNLKM24'),
(2, '25', 'KNLKM01'),
(4, '26', 'KNLKM01'),
(10, '26', 'KNLKM03'),
(18, '26', 'KNLKM04'),
(24, '26', 'KNLKM08'),
(28, '26', 'KNLKM09'),
(44, '26', 'KNLKM10'),
(40, '26', 'KNLKM13'),
(32, '26', 'KNLKM14'),
(36, '26', 'KNLKM15'),
(50, '26', 'KNLKM16'),
(1, '27', 'KNLKM02'),
(15, '28', 'KNLKM05'),
(7, '29', 'KNLKM01'),
(13, '29', 'KNLKM03'),
(21, '29', 'KNLKM04'),
(26, '29', 'KNLKM08'),
(30, '29', 'KNLKM09'),
(46, '29', 'KNLKM10'),
(42, '29', 'KNLKM13'),
(34, '29', 'KNLKM14'),
(38, '29', 'KNLKM15'),
(56, '3', 'KNLKM22'),
(59, '3', 'KNLKM24'),
(19, '30', 'KNLKM04'),
(22, '30', 'KNLKM07'),
(53, '31', 'KNLKM29'),
(54, '32', 'KNLKM29'),
(64, '33', 'KNLKM30'),
(111, '36', 'KPBAK15'),
(117, '36', 'KPBAK16'),
(114, '36', 'KPBAK17'),
(86, '37', 'KNLFS04'),
(88, '37', 'KNLFS05'),
(90, '37', 'KNLFS11'),
(91, '37', 'KNLFS12'),
(76, '37', 'KNLKM19'),
(78, '37', 'KNLKM20'),
(83, '37', 'KNLKM23'),
(84, '37', 'KNLKM25'),
(87, '38', 'KNLFS04'),
(89, '38', 'KNLFS05'),
(74, '38', 'KNLKM17'),
(77, '39', 'KNLKM19'),
(62, '4', 'KNLKM28'),
(75, '40', 'KNLKM17'),
(80, '40', 'KNLKM21'),
(79, '41', 'KNLKM20'),
(81, '41', 'KNLKM21'),
(82, '42', 'KNLKM23'),
(85, '43', 'KNLKM27'),
(92, '44', 'KPBAK01'),
(93, '44', 'KPBAK02'),
(122, '44', 'KPBTH02'),
(94, '45', 'KPBAK03'),
(98, '45', 'KPBAK08'),
(100, '45', 'KPBAK09'),
(120, '46', 'KPBAK20'),
(121, '47', 'KPBAK21'),
(95, '48', 'KPBAK05'),
(96, '49', 'KPBAK06'),
(3, '5', 'KNLKM01'),
(97, '50', 'KPBAK07'),
(99, '51', 'KPBAK08'),
(101, '51', 'KPBAK09'),
(102, '52', 'KPBAK10'),
(103, '52', 'KPBAK11'),
(104, '52', 'KPBAK13'),
(112, '52', 'KPBAK17'),
(105, '53', 'KPBAK13'),
(107, '54', 'KPBAK14'),
(108, '55', 'KPBAK14'),
(137, '55', 'KPBGS11'),
(109, '56', 'KPBAK14'),
(110, '57', 'KPBAK15'),
(113, '58', 'KPBAK17'),
(136, '58', 'KPBGS10'),
(115, '59', 'KPBAK16'),
(63, '6', 'KNLKM28'),
(124, '60', 'KPBTH03'),
(135, '61', 'KPBGS09'),
(118, '62', 'KPBAK18'),
(119, '62', 'KPBAK19'),
(125, '62', 'KPBUT01'),
(106, '63', 'KPBAK13'),
(116, '64', 'KPBAK16'),
(123, '65', 'KPBTH01'),
(126, '66', 'KPBIA01'),
(127, '66', 'KPBIA02'),
(128, '67', 'KPBGS01'),
(129, '67', 'KPBGS02'),
(130, '67', 'KPBGS03'),
(131, '67', 'KPBGS04'),
(132, '67', 'KPBGS05'),
(133, '67', 'KPBGS06'),
(134, '67', 'KPBGS07'),
(141, '68', 'KPBAK04'),
(140, '68', 'KPBAK12'),
(138, '68', 'KPBGS12'),
(67, '7', 'KNLFS02'),
(69, '8', 'KNLFS06'),
(70, '8', 'KNLFS07'),
(71, '8', 'KNLFS08'),
(72, '8', 'KNLFS09'),
(73, '8', 'KNLFS10'),
(68, '9', 'KNLFS03');

-- --------------------------------------------------------

--
-- Table structure for table `pakai_type_analisis`
--

CREATE TABLE IF NOT EXISTS `pakai_type_analisis` (
  `id_analisis` varchar(12) NOT NULL,
  `id_type` varchar(5) NOT NULL,
  KEY `id_analisis` (`id_analisis`,`id_type`),
  KEY `id_analisis_2` (`id_analisis`),
  KEY `id_analisis_3` (`id_analisis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pakai_type_analisis`
--

INSERT INTO `pakai_type_analisis` (`id_analisis`, `id_type`) VALUES
('bb001fmb1014', 'fmbbj'),
('bb002fmb1014', 'fmbuf'),
('bb003fmb1014', 'fmbmn'),
('bb004fmb1014', 'fmbab'),
('bb005fmb1014', 'fmbdk'),
('bb006fmb1014', 'fmbpb'),
('bb007fmb1014', 'fmbrt'),
('bb008fmb1014', 'fmbmr'),
('bb009fmb1014', 'fmbsr'),
('bb010fmb1014', 'fmbxr'),
('bb011fmb1014', 'fmbab'),
('bb012fmb1014', 'fmbdk');

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
  `id_parameter` varchar(7) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `id_type` varchar(5) NOT NULL,
  `id_metoda` varchar(3) NOT NULL,
  `deskripsi` text NOT NULL,
  `satuan` varchar(8) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_parameter`),
  KEY `id_type` (`id_type`),
  KEY `id_type_2` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id_parameter`, `nama`, `id_type`, `id_metoda`, `deskripsi`, `satuan`, `harga`) VALUES
('FMBAB01', 'Ratio', 'FMBAB', '', '', '%', 0),
('FMBAB02', 'Magnetit', 'FMBAB', '', '', '%', 0),
('FMBAB03', 'Ilmenit', 'FMBAB', '', '', '%', 0),
('FMBAB04', 'Hematit', 'FMBAB', '', '', '%', 0),
('FMBAB05', 'Epidot', 'FMBAB', '', '', '%', 0),
('FMBAB06', 'Amfibol', 'FMBAB', '', '', '%', 0),
('FMBAB07', 'Piroksen', 'FMBAB', '', '', '%', 0),
('FMBAB08', 'Kuarsa', 'FMBAB', '', '', '%', 0),
('FMBAB09', 'Pirit', 'FMBAB', '', '', '%', 0),
('FMBAB10', 'Kalkopirit', 'FMBAB', '', '', '%', 0),
('FMBAB11', 'Leukosen', 'FMBAB', '', '', '%', 0),
('FMBAB12', 'Zirkon', 'FMBAB', '', '', '%', 0),
('FMBAB13', 'Kasiterit', 'FMBAB', '', '', '%', 0),
('FMBAB14', 'Rutil', 'FMBAB', '', '', '%', 0),
('FMBAB15', 'Oksida Besi', 'FMBAB', '', '', '%', 0),
('FMBAB16', 'Kromit', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB17', 'Garnet', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB18', 'Korundum', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB19', 'Markasit', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB20', 'Turmalin', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB21', 'Sinabar', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB22', 'Argentit', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB23', 'Barit', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB24', 'Apatit', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB25', 'Anatas', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB26', 'FR.Batuan', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB27', 'Emas', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBAB28', 'Biotit', 'FMBAB', '', 'Analisa Butir-Ayak', '%', 0),
('FMBBB01', 'AKMPR', 'FMBBB', '', 'Analisis Komposisi Maseral dan Penentuan Reflektan', '', 0),
('FMBPB01', 'Plagioklas', 'FMBPB', '', 'Deskripsi Petrografi Batuan dilengkapi dengan Interpretasi Mineral Ubahan', '%', 0),
('FMBPB02', 'Kuarsa', 'FMBPB', '', '', '%', 0),
('FMBPB03', 'Epidot', 'FMBPB', '', '', '%', 0),
('FMBPB04', 'Mineral Opak/Oksida Besi', 'FMBPB', '', '', '%', 0),
('FMBPB05', 'Lempung', 'FMBPB', '', '', '%', 0),
('FMBPB06', 'Klorit', 'FMBPB', '', '', '%', 0),
('FMBPB07', 'Karbonat', 'FMBPB', '', '', '%', 0),
('FMBPB08', 'Masadasar', 'FMBPB', '', '', '%', 0),
('FMBPB09', 'Fragmen Fosil', 'FMBPB', '', '', '%', 0),
('FMBPB10', 'Dolomit', 'FMBPB', '', '', '%', 0),
('KBBAK01', 'Form of Sulfur', 'KBBAK', '', '', '%', 0),
('KBBAK02', 'CO2', 'KBBAK', '', '', '%', 0),
('KBBAK03', 'Chlorine', 'KBBAK', '', '', '%', 0),
('KBBAK04', 'TOC (Total Organic Carbon)', 'KBBAK', '', '', '%', 0),
('KBBAP01', 'Total Moisture', 'KBBAP', '', '', '%', 100000),
('KBBAP02', 'Moisture', 'KBBAP', '', '', '%', 100000),
('KBBAP03', 'Ash', 'KBBAP', '', '', '%', 100000),
('KBBAP04', 'Volatile Matter', 'KBBAP', '', '', '%', 100000),
('KBBAP05', 'Fixed Carbon', 'KBBAP', '', '', '%', 100000),
('KBBAP06', 'Analisa Abu', 'KBBAP', '', '', '%', 100000),
('KBBAS01', 'Calorific Value', 'KBBAS', '', '', 'Cal/gr', 0),
('KBBAS02', 'True Specific Gravity', 'KBBAS', '', '', '', 0),
('KBBAS03', 'HGI', 'KBBAS', '', '', '', 0),
('KBBAS04', 'Swelling Index', 'KBBAS', '', '', '', 0),
('KBBAS05', 'Gray King Coke', 'KBBAS', '', '', '', 0),
('KBBAS06', 'Titik Leleh Abu', 'KBBAS', '', '', '''C', 0),
('KBBAS07', 'HGI (Hard Groved Index)', 'KBBAS', '', '', '', 0),
('KBBAS08', 'Sifat Muai (Dilatometer)', 'KBBAS', '', '', '%', 0),
('KBBAU01', 'Karbon / C', 'KBBAU', '', '', '%', 280000),
('KBBAU02', 'Hidrogen / H', 'KBBAU', '', '', '%', 280000),
('KBBAU03', 'Nitrogen / N', 'KBBAU', '', '', '%', 280000),
('KBBAU04', 'Oksigen / O', 'KBBAU', '', '', '%', 0),
('KBBAU05', 'Sulfur / S', 'KBBAU', '', '', '%', 0),
('KMKGB01', 'pH', 'KMKGB', '', '', '', 0),
('KMKGB02', 'BD', 'KMKGB', '', '', '', 0),
('KMKGB03', 'LS', 'KMKGB', '', '', '%', 0),
('KMKGB04', 'RM', 'KMKGB', '', '', '%', 0),
('KMKGB05', 'VM', 'KMKGB', '', '', '%', 0),
('KMKGB06', 'ASH', 'KMKGB', '', '', '%', 0),
('KMKGB07', 'FC', 'KMKGB', '', '', '%', 0),
('KMKGB08', 'M', 'KMKGB', '', '', '%', 0),
('KMKGB09', 'S', 'KMKGB', '', '', '%', 0),
('KMKGB10', 'W', 'KMKGB', '', '', 'Cal/gr', 0),
('KMLAA03', 'Cu', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA04', 'Pb', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA05', 'Zn', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA06', 'Ag', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA07', 'Co', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA08', 'Ni', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA09', 'Fe', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA10', 'Cr', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA11', 'Mn', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA12', 'Li', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA13', 'K', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA14', 'Bi', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA15', 'Cd', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA16', 'Au (Fire Assay)', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA17', 'Au (Aqua Regia)', 'KMLAA', '', '', 'ppm', 30000),
('KMLCP01', 'Y', 'KMLCP', '', '', '', 75000),
('KMLCP02', 'Zr', 'KMLCP', '', '', '', 75000),
('KMLCP03', 'Nb', 'KMLCP', '', '', '', 75000),
('KMLCP04', 'La', 'KMLCP', '', '', '', 75000),
('KMLCP05', 'Ce', 'KMLCP', '', '', '', 75000),
('KMLCP06', 'Nd', 'KMLCP', '', '', '', 75000),
('KMLCP07', 'Pm', 'KMLCP', '', '', '', 75000),
('KMLCP08', 'Sm', 'KMLCP', '', '', '', 75000),
('KMLCP09', 'Eu', 'KMLCP', '', '', '', 75000),
('KMLCP10', 'Gd', 'KMLCP', '', '', '', 75000),
('KMLCP11', 'Tb', 'KMLCP', '', '', '', 75000),
('KMLCP12', 'Dy', 'KMLCP', '', '', '', 75000),
('KMLCP13', 'Ho', 'KMLCP', '', '', '', 75000),
('KMLCP14', 'Er', 'KMLCP', '', '', '', 75000),
('KMLCP15', 'Tm', 'KMLCP', '', '', '', 75000),
('KMLCP16', 'Yb', 'KMLCP', '', '', '', 75000),
('KMLCP17', 'Lu', 'KMLCP', '', '', '', 75000),
('KMLKL01', 'As', 'KMLKL', '', '', 'ppm', 0),
('KMLKL02', 'Sn', 'KMLKL', '', '', 'ppm', 0),
('KMLKL03', 'W', 'KMLKL', '', '', 'ppm', 0),
('KMLKL04', 'Sb', 'KMLKL', '', '', 'ppm', 0),
('KMLKL05', 'Mo', 'KMLKL', '', '', 'ppm', 0),
('KMLKL06', 'V', 'KMLKL', '', '', '', 0),
('KMLMP02', 'Cr', 'KMLMP', '', '', 'ppm', 30000),
('KMLMP03', 'Al', 'KMLMP', '', '', '%', 30000),
('KMLMP04', 'Mg', 'KMLMP', '', '', 'ppb', 175000),
('KMLMP05', 'Ca', 'KMLMP', '', '', 'ppb', 60000),
('KMLMP06', 'Na', 'KMLMP', '', '', 'ppb', 60000),
('KMLMP07', 'Sr', 'KMLMP', '', '', 'ppb', 60000),
('KNLFS01', 'Bleaching Test', 'KNLFS', '', '', '', 0),
('KNLFS02', 'KTK/CEC', 'KNLFS', '', '', '', 0),
('KNLFS03', 'Methylene Blue Test', 'KNLFS', '', '', '', 0),
('KNLFS04', 'Blast Test', 'KNLFS', '', '', '', 0),
('KNLFS05', 'Crucible Test', 'KNLFS', '', '', '', 0),
('KNLFS06', 'Drilling Mud Test (Swelling)', 'KNLFS', '', '', '', 0),
('KNLFS07', 'Drilling Mud Test (Viskositas Relatif)', 'KNLFS', '', '', '', 0),
('KNLFS08', 'Drilling Mud Test (Viskositas Absolut)', 'KNLFS', '', '', '', 0),
('KNLFS09', 'Drilling Mud Test (CEC, Ca &Mg)', 'KNLFS', '', '', '', 0),
('KNLFS10', 'Drilling Mud Test (pH)', 'KNLFS', '', '', '', 0),
('KNLFS11', 'Kadar Pasir', 'KNLFS', '', '', '', 0),
('KNLFS12', 'Kadar Air (Moisture)', 'KNLFS', '', '', '', 0),
('KNLKM01', 'SiO2', 'KNLKM', '', '', '%', 0),
('KNLKM02', 'SiO2 Reaktif', 'KNLKM', '', '', '%', 0),
('KNLKM03', 'Al2O3', 'KNLKM', '', '', '%', 0),
('KNLKM04', 'Fe2O3', 'KNLKM', '', '', '%', 0),
('KNLKM05', 'FeO', 'KNLKM', '', '', '%', 0),
('KNLKM06', 'Fetotal', 'KNLKM', '', '', '%', 0),
('KNLKM07', 'Fe3O4', 'KNLKM', '', '', '%', 0),
('KNLKM08', 'CaO', 'KNLKM', '', '', '%', 0),
('KNLKM09', 'MgO', 'KNLKM', '', '', '%', 0),
('KNLKM10', 'MnO', 'KNLKM', '', '', '%', 0),
('KNLKM11', 'MnO2', 'KNLKM', '', '', '%', 0),
('KNLKM12', 'Mntotal', 'KNLKM', '', '', '%', 0),
('KNLKM13', 'TiO2', 'KNLKM', '', '', '%', 0),
('KNLKM14', 'Na2O', 'KNLKM', '', '', '%', 0),
('KNLKM15', 'K2O', 'KNLKM', '', '', '%', 0),
('KNLKM16', 'P2O5', 'KNLKM', '', '', '%', 0),
('KNLKM17', 'Ptotal', 'KNLKM', '', '', '%', 0),
('KNLKM18', 'SO3', 'KNLKM', '', '', '%', 0),
('KNLKM19', 'Stotal', 'KNLKM', '', '', '%', 0),
('KNLKM20', 'BaO', 'KNLKM', '', '', '%', 0),
('KNLKM21', 'Cr2O3', 'KNLKM', '', '', '%', 0),
('KNLKM22', 'H2O-', 'KNLKM', '', '', '%', 0),
('KNLKM23', 'H2O+', 'KNLKM', '', '', '%', 0),
('KNLKM24', 'HD', 'KNLKM', '', '', '%', 0),
('KNLKM25', 'BV', 'KNLKM', '', '', '%', 0),
('KNLKM26', 'BJ/SG', 'KNLKM', '', '', '%', 0),
('KNLKM27', 'PH', 'KNLKM', '', '', '%', 0),
('KNLKM28', 'CI', 'KNLKM', '', '', '%', 0),
('KNLKM29', 'CO2', 'KNLKM', '', '', '%', 0),
('KNLKM30', 'Hg', 'KNLKM', '', '', '%', 0),
('KPBAK01', 'pH', 'KPBAK', '', '', '', 0),
('KPBAK02', 'DHL', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK03', 'TDS', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK04', 'SiO', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK05', 'B', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK06', 'Al', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK07', 'Fe', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK08', 'Ca', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK09', 'Mg', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK10', 'Na', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK11', 'K', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK12', 'Li', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK13', 'As', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK14', 'NH4', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK15', 'F', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK16', 'SO4', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK17', 'CI', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK18', 'HCO3', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK19', 'CO3', 'KPBAK', '', '', 'ppb', 0),
('KPBAK20', 'TSS', 'KPBAK', '', '', 'ppb', 0),
('KPBAK21', 'SiO2', 'KPBAK', '', '', 'ppb', 0),
('KPBGS01', 'H2', 'KPBGS', '', '', '% mol', 0),
('KPBGS02', 'O2', 'KPBGS', '', '', '% mol', 0),
('KPBGS03', 'Ar', 'KPBGS', '', '', '% mol', 0),
('KPBGS04', 'N2', 'KPBGS', '', '', '% mol', 0),
('KPBGS05', 'CH4', 'KPBGS', '', '', '% mol', 0),
('KPBGS06', 'CO', 'KPBGS', '', '', '% mol', 0),
('KPBGS07', 'He', 'KPBGS', '', '', '% mol', 0),
('KPBGS08', 'CO2', 'KPBGS', '', '', '% mol', 0),
('KPBGS09', 'H2S', 'KPBGS', '', '', '% mol', 0),
('KPBGS10', 'HCI', 'KPBGS', '', '', '% mol', 0),
('KPBGS11', 'NH4', 'KPBGS', '', '', '% mol', 0),
('KPBGS12', 'H2O', 'KPBGS', '', '', '% mol', 0),
('KPBIA01', 'd(18O_16O)', 'KPBIA', '', '', '%o', 0),
('KPBIA02', 'd(D_H)', 'KPBIA', '', '', '%o', 0),
('KPBTH01', 'Hg', 'KPBTH', '', '', 'ppb', 0),
('KPBTH02', 'pH', 'KPBTH', '', '', '', 0),
('KPBTH03', 'H20-', 'KPBTH', '', '', '%', 0),
('KPBUT01', 'CO2', 'KPBUT', '', '', '%', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `id_pegawai` varchar(20) NOT NULL COMMENT 'Nomor Induk Pegawai',
  `nama` varchar(30) NOT NULL,
  `id_komoditi` varchar(2) NOT NULL COMMENT 'bagian',
  `username` varchar(12) NOT NULL,
  `password` varchar(49) NOT NULL,
  `key` varchar(9) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pegawai`),
  UNIQUE KEY `usename` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `id_komoditi`, `username`, `password`, `key`, `admin`) VALUES
('01003658841253639', 'Admin', 'tu', 'admin', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 1),
('012536620211000114', 'Ane Yulian', 'nl', 'nonlogam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('1231297224974', 'Kepala Pusat', 'tu', 'kapus', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('12312t318236', 'Kabid Sarana Teknik', 'tu', 'sartek', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('1234567890123456789', 'Resmi Novianti', 'bb', 'batubara', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('2512335588141002629', 'Geanissa Handarini', 'pb', 'panasbumi', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('28934623764', 'Kasub Bidang Lab', 'tu', 'keplab', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('48480048252136658', 'Arief Wibowo', 'lg', 'logam', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pemohon`
--

CREATE TABLE IF NOT EXISTS `pemohon` (
  `id_pemohon` int(11) NOT NULL AUTO_INCREMENT,
  `id_type_pemohon` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(49) NOT NULL,
  `pass_awal` varchar(12) NOT NULL,
  PRIMARY KEY (`id_pemohon`),
  KEY `id_type_pemohon` (`id_type_pemohon`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`id_pemohon`, `id_type_pemohon`, `nama`, `deskripsi`, `username`, `password`, `pass_awal`) VALUES
(2, '08', 'Eddy Suryadi Soegoto', 'Alamat: Jl. Tubagus Smail No. 212 Bandung', '6622d422', '59e77a564a2bd104c9f946e3480772177716e315', 'fbc21af2'),
(3, '01', 'Prof. Dedi Kurniadi', 'No. telepon 085755268744', 'f83a36b8', 'fd6fdd45bc76f637e8648fae3918246cfef0e089', '60e04a4b'),
(4, '07', 'Baharudin', 'Dinas Pendapatan Daerah Kabupaten Karimun', 'a6d5b307', '9fd0bb1ba77e9adc9478a310ef327745805692b7', '336930f4'),
(5, '01', 'Musidi', 'jakarta coal', '67ae642e', 'ec6d87169826fb0c78ff42e42ea136a35e64bb81', 'dec5876b'),
(6, '02', 'Corry', 'Korkel', '31a0e77a', '3302607ea7753474f99fbfda99c26b45b6f21e18', '25fb41f4');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE IF NOT EXISTS `perusahaan` (
  `id_perusahaan` varchar(4) NOT NULL,
  `id_pemohon` varchar(9) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `id_pemohon`, `nama`, `alamat`, `telepon`, `email`) VALUES
('CHEV', 'p001', 'PT. Chevron Indonesia', 'Jl. Tubagus Ismail No. 200 Kota Palembang', '0265249654', 'gerindra@gmail.com'),
('GEOC', 'p002', 'PT. Geofirst Consulting', 'Taman A9 Mega Kuningan, Jakarta Selatan', '0217532245', 'geofirst.consult@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_provinsi`)
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
  `id_type` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_lab` varchar(3) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_type`),
  KEY `id_lab` (`id_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_analisis`
--

INSERT INTO `type_analisis` (`id_type`, `nama`, `id_lab`, `deskripsi`, `harga`) VALUES
('FMBAB', 'Analisa Butir', 'FMB', '', 640000),
('FMBBJ', 'Berat Jenis', 'FMB', '', 75000),
('FMBDK', 'Derajat Kemagnetan', 'FMB', '', 100000),
('FMBIM', 'Identifikasi Mineral', 'FMB', '', 0),
('FMBMA', 'Analisis Ayak', 'FMB', '', 500000),
('FMBMB', 'Mineralogi Butir', 'FMB', '', 300000),
('FMBMN', 'Mineragrafi', 'FMB', '', 515000),
('FMBMR', 'Komposisi Maseral & Reflektan', 'FMB', '', 575000),
('FMBPB', 'Petrografi Batuan', 'FMB', '', 610000),
('FMBRT', 'Analisis Retort', 'FMB', '', 0),
('FMBSE', 'SEM(Scanning Electron Microscopy) & EDS', 'FMB', '', 750000),
('FMBSR', 'SRA (Source Rock Analysis)', 'FMB', '', 1500000),
('FMBUF', 'Kuat Tekan dan Berat Jenis', 'FMB', '', 600000),
('FMBXR', 'Bulk', 'FMB', '', 350000),
('KBBAA', 'Analisis Abu', 'KBB', '', 0),
('KBBAK', 'Analisis Kimia (Batubara)', 'KBB', '', 0),
('KBBAP', 'Analisis Proksimat', 'KBB', '', 0),
('KBBAS', 'Analisis Sifat Fisik', 'KBB', '', 0),
('KBBAU', 'Analisis Ultimate', 'KBB', '', 0),
('KMKGB', 'Gambut', 'KGB', '', 0),
('KMLAA', 'Mineral Logam AAS', 'KML', '', 0),
('KMLCP', 'ICP', 'KML', '', 0),
('KMLKL', 'Kolorimetri', 'KML', '', 0),
('KMLMP', 'MP', 'KML', '', 0),
('KNLFS', 'Fisika', 'KNL', '', 0),
('KNLKM', 'Kimia', 'KNL', '', 0),
('KPBAK', 'Analisis Air', 'KPB', '', 0),
('KPBGS', 'Analisis Gas', 'KPB', '', 0),
('KPBIA', 'Analisis Isotop Air', 'KPB', '', 0),
('KPBTH', 'Analisis Tanah', 'KPB', '', 0),
('KPBUT', 'Analisis Udara Tanah', 'KPB', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `type_pemohon`
--

CREATE TABLE IF NOT EXISTS `type_pemohon` (
  `id` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
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

-- --------------------------------------------------------

--
-- Table structure for table `uji_parameter`
--

CREATE TABLE IF NOT EXISTS `uji_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conto` int(11) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  `nilai` float NOT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `id_metoda` int(11) DEFAULT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id`),
  KEY `id_proses_analisis` (`id_conto`),
  KEY `id_parameter` (`id_parameter`),
  KEY `id_metoda` (`id_metoda`),
  KEY `id_metoda_2` (`id_metoda`),
  KEY `id_conto` (`id_conto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conto`
--
ALTER TABLE `conto`
  ADD CONSTRAINT `conto_ibfk_1` FOREIGN KEY (`id_analisis`) REFERENCES `hasil_analisis` (`id_analisis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_conto_fisika`
--
ALTER TABLE `detail_conto_fisika`
  ADD CONSTRAINT `detail_conto_fisika_ibfk_1` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_conto_type` FOREIGN KEY (`id_type_analisis`) REFERENCES `type_analisis` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_analisis`
--
ALTER TABLE `hasil_analisis`
  ADD CONSTRAINT `hasil_analisis_ibfk_2` FOREIGN KEY (`id_lab`) REFERENCES `laboratorium` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_analisis_ibfk_3` FOREIGN KEY (`lokasi`) REFERENCES `kabupaten` (`id_kabupaten`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_pemohon` FOREIGN KEY (`id_pemohon`) REFERENCES `pemohon` (`id_pemohon`);

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
  ADD CONSTRAINT `metoda_parameter_ibfk_1` FOREIGN KEY (`id_parameter`) REFERENCES `parameter` (`id_parameter`),
  ADD CONSTRAINT `metoda_parameter_ibfk_2` FOREIGN KEY (`id_metoda`) REFERENCES `metoda` (`id_metoda`);

--
-- Constraints for table `pakai_type_analisis`
--
ALTER TABLE `pakai_type_analisis`
  ADD CONSTRAINT `pakai_type_analisis_ibfk_1` FOREIGN KEY (`id_analisis`) REFERENCES `hasil_analisis` (`id_analisis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uji_parameter`
--
ALTER TABLE `uji_parameter`
  ADD CONSTRAINT `uji_parameter_ibfk_1` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
