-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2013 at 06:04 PM
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
  `id_conto` varchar(8) NOT NULL,
  `id_analisis` varchar(12) NOT NULL,
  `tanggal_proses` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nama_batuan` varchar(30) DEFAULT NULL,
  `berat` float NOT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  `fotomikrografi` text,
  PRIMARY KEY (`id_conto`),
  KEY `id_proses_analisis` (`id_conto`),
  KEY `id_analisis` (`id_analisis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conto`
--

INSERT INTO `conto` (`id_conto`, `id_analisis`, `tanggal_proses`, `nama_batuan`, `berat`, `is_selesai`, `fotomikrografi`) VALUES
('001kml01', 'lg001kml1113', '2013-11-12 02:39:57', NULL, 0, 1, NULL),
('001kml02', 'lg001kml1113', '2013-11-12 02:45:00', NULL, 0, 1, NULL),
('001kml03', 'lg001kml1113', '2013-11-12 02:56:09', NULL, 0, 1, NULL),
('001kml04', 'lg001kml1113', '2013-11-12 03:16:00', NULL, 0, 1, NULL),
('001kml05', 'lg001kml1113', '2013-11-12 03:18:30', NULL, 0, 1, NULL),
('001kpb01', 'pb001kpb1113', '2013-11-12 03:35:26', NULL, 0, 1, NULL),
('001kpb02', 'pb001kpb1113', '2013-11-12 03:37:00', NULL, 0, 1, NULL),
('001kpb03', 'pb001kpb1113', '2013-11-12 03:37:02', NULL, 0, 1, NULL),
('001kpb04', 'pb001kpb1113', '2013-11-12 03:37:05', NULL, 0, 1, NULL),
('001kpb05', 'pb001kpb1113', '2013-11-12 03:37:08', NULL, 0, 1, NULL),
('001kpb06', 'pb001kpb1113', '2013-11-12 03:37:13', NULL, 0, 1, NULL),
('001kpb07', 'pb001kpb1113', '2013-11-12 03:37:16', NULL, 0, 1, NULL),
('001kpb08', 'pb001kpb1113', '2013-11-12 03:37:19', NULL, 0, 1, NULL),
('001kpb09', 'pb001kpb1113', '2013-11-12 03:37:22', NULL, 0, 1, NULL),
('001kpb10', 'pb001kpb1113', '2013-11-12 03:37:26', NULL, 0, 1, NULL),
('002fmb01', 'bb002fmb1113', '2013-11-06 04:27:49', 'Batugamping Organik', 20, 0, ''),
('002kml01', 'lg002kml1213', '2013-12-03 06:50:52', NULL, 0, 0, NULL),
('003fmb01', 'bb003fmb1113', '2013-11-09 06:36:54', 'Kuarsa', 11.547, 1, ''),
('003kml01', 'lg003kml1213', '2013-12-03 06:54:47', NULL, 0, 0, NULL),
('004kbb01', 'bb004kbb1113', '2013-11-12 04:06:13', NULL, 0, 1, NULL),
('004kbb02', 'bb004kbb1113', '2013-11-12 04:07:58', NULL, 0, 1, NULL),
('004kbb03', 'bb004kbb1113', '2013-11-12 04:08:01', NULL, 0, 1, NULL),
('004kbb04', 'bb004kbb1113', '2013-11-12 04:08:04', NULL, 0, 1, NULL),
('004kbb05', 'bb004kbb1113', '2013-11-12 04:08:08', NULL, 0, 1, NULL),
('004kbb06', 'bb004kbb1113', '2013-11-12 04:14:48', NULL, 0, 1, NULL),
('004kbb07', 'bb004kbb1113', '2013-11-12 04:14:50', NULL, 0, 1, NULL),
('004kbb08', 'bb004kbb1113', '2013-11-12 04:14:53', NULL, 0, 1, NULL),
('004kbb09', 'bb004kbb1113', '2013-11-12 04:14:58', NULL, 0, 1, NULL),
('004kml01', 'lg004kml1213', '2013-12-07 04:17:29', NULL, 0, 0, NULL),
('005fmb01', 'bb005fmb1113', '2013-11-13 02:27:47', 'gamping', 25, 1, 'berwarna kuning emas, tidak berserat'),
('005fmb02', 'bb005fmb1113', '2013-11-13 02:28:53', 'urat kuarsa', 50, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_analisis`
--

CREATE TABLE IF NOT EXISTS `hasil_analisis` (
  `id_analisis` varchar(12) NOT NULL COMMENT 'nomor analisis',
  `jenis_contoh` varchar(30) NOT NULL,
  `jumlah_contoh` int(11) NOT NULL,
  `lokasi` int(11) DEFAULT NULL,
  `tanggal_terima` date NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `id_pegawai` varchar(20) DEFAULT NULL COMMENT 'yang menerima',
  `id_lab` varchar(3) NOT NULL,
  `biaya` int(11) DEFAULT NULL,
  `id_pemohon` varchar(10) DEFAULT NULL,
  `preparasi` tinyint(1) DEFAULT NULL,
  `is_selesai` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_analisis`),
  KEY `id_pemohon` (`id_pemohon`),
  KEY `id_pengirim` (`id_pemohon`),
  KEY `id_lab` (`id_lab`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `lokasi` (`lokasi`),
  KEY `lokasi_2` (`lokasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil_analisis`
--

INSERT INTO `hasil_analisis` (`id_analisis`, `jenis_contoh`, `jumlah_contoh`, `lokasi`, `tanggal_terima`, `tanggal_daftar`, `id_pegawai`, `id_lab`, `biaya`, `id_pemohon`, `preparasi`, `is_selesai`) VALUES
('bb002fmb1113', 'Batuan Sedimen', 2, 1, '2013-11-03', '2013-11-06', '01003658841253639', 'fmb', 0, 'k001', 0, 0),
('bb003fmb1113', 'Konsentrat Dulang', 10, 2, '2013-11-09', '2013-11-09', '01003658841253639', 'fmb', 0, 'k001', 1, 0),
('bb004kbb1113', 'batubara', 9, 2, '2013-11-19', '2013-11-12', '01003658841253639', 'kbb', 5000000, 'p001', 1, 1),
('bb005fmb1113', 'batubara', 2, 1, '2013-11-13', '2013-11-13', '01003658841253639', 'fmb', 0, 'k001', 1, 1),
('lg001kml1113', 'batuan', 5, 1, '2013-11-02', '2013-11-12', '01003658841253639', 'kml', 0, 'k001', 1, 1),
('lg002kml1213', 'Batuan', 3, 2, '2013-12-04', '2013-12-03', '01003658841253639', 'kml', 0, 'p001', 0, 0),
('lg003kml1213', '3', 3, 1, '2013-12-18', '2013-12-03', '01003658841253639', 'kml', 0, 'p001', 0, 0),
('lg004kml1213', 'baturan', 2, 1, '2013-12-06', '2013-12-07', '01003658841253639', 'kml', 0, 'p001', 0, 0),
('pb001kpb1113', 'Soil dan Udara Tanah', 10, 2, '2013-11-07', '2013-11-12', '01003658841253639', 'kpb', 15000000, 'p001', 1, 1);

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
(2, 1, 'Aceh Barat Daya');

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
('fbb', 'bb', 'Fisika Batubara/Gambut'),
('fmb', 'bb', 'Fisika Mineral dan Batubara'),
('kbb', 'bb', 'Kimia Batubara/Gambut'),
('kmi', 'lg', 'Kimia Mineral Industri'),
('kml', 'lg', 'Kimia Mineral Logam'),
('knl', 'nl', 'Kimia Mineral Non Logam'),
('kpb', 'pb', 'Kimia Air Panas Bumi');

-- --------------------------------------------------------

--
-- Table structure for table `metoda`
--

CREATE TABLE IF NOT EXISTS `metoda` (
  `id_metoda` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_metoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metoda`
--

INSERT INTO `metoda` (`id_metoda`, `nama`) VALUES
('1', 'AAS'),
('10', 'Flame Photometri'),
('11', 'Turbidimetri'),
('12', 'Penfield Test'),
('13', 'pH meter'),
('14', 'Viscometer'),
('2', 'Volumetri'),
('3', 'Gravimetri'),
('4', 'Spectrofotometer'),
('5', 'Kolorimetri'),
('6', 'Spectrometry'),
('7', 'Mercury Analyzer'),
('8', 'XRF'),
('9', 'Titrimetri');

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
('bb002fmb1113', 'fmbbj'),
('bb002fmb1113', 'fmbdk'),
('bb002fmb1113', 'fmbma'),
('bb002fmb1113', 'fmbmn'),
('bb002fmb1113', 'fmbmr'),
('bb002fmb1113', 'fmbpb'),
('bb002fmb1113', 'fmbrt'),
('bb003fmb1113', 'fmbab'),
('bb005fmb1113', 'fmbpb');

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
('KBBAK03', 'Chlorine', 'KBBAK', '', '', '', 0),
('KBBAP01', 'Total Moisture', 'KBBAP', '', '', '%', 100000),
('KBBAP02', 'Moisture', 'KBBAP', '', '', '%', 100000),
('KBBAP03', 'Ash', 'KBBAP', '', '', '%', 100000),
('KBBAP04', 'Volatile Matter', 'KBBAP', '', '', '%', 100000),
('KBBAP05', 'Fixed Carbon', 'KBBAP', '', '', '%', 100000),
('KBBAP06', 'Analisa Abu', 'KBBAP', '', '', '', 100000),
('KBBAS01', 'Calorific Value', 'KBBAS', '', '', 'Cal/gr', 0),
('KBBAS02', 'True Specific Gravity', 'KBBAS', '', '', '', 0),
('KBBAS03', 'HGI', 'KBBAS', '', '', '', 0),
('KBBAS04', 'Swelling Index', 'KBBAS', '', '', '', 0),
('KBBAU01', 'Karbon / C', 'KBBAU', '', '', '%', 280000),
('KBBAU02', 'Hidrogen / H', 'KBBAU', '', '', '%', 280000),
('KBBAU03', 'Nitrogen / N', 'KBBAU', '', '', '%', 280000),
('KBBAU04', 'Oksigen / O', 'KBBAU', '', '', '%', 0),
('KBBAU05', 'Sulfur / S', 'KBBAU', '', '', '%', 0),
('KBBAU06', 'Preparasi', 'KBBAU', '', '', '', 27500),
('KBBAU07', 'Tanpa Preparasi', 'KBBAU', '', '', '', 0),
('KMIFS01', 'Bleaching Test Sudah Diaktifkan', 'KMIFS', '', '', '', 0),
('KMIFS02', 'Bleaching Test Belum Diaktifkan', 'KMIFS', '', '', '', 0),
('KMIFS03', 'KTK/CEC', 'KMIFS', '', '', '', 0),
('KMIFS04', 'Methylene Blue Test', 'KMIFS', '', '', '', 0),
('KMIFS05', 'Blast Test', 'KMIFS', '', '', '', 0),
('KMIFS06', 'Crucible Test', 'KMIFS', '', '', '', 0),
('KMIFS07', 'Drilling Mud Test (Swelling)', 'KMIFS', '', '', '', 0),
('KMIFS08', 'Drilling Mud Test (Viskositas Relatif)', 'KMIFS', '', '', '', 0),
('KMIFS09', 'Drilling Mud Test (Viskositas Absolut)', 'KMIFS', '', '', '', 0),
('KMIFS10', 'Drilling Mud Test (CEC, Ca &Mg)', 'KMIFS', '', '', '', 0),
('KMIFS11', 'Drilling Mud Test (pH)', 'KMIFS', '', '', '', 0),
('KMIFS12', 'Kadar Pasir', 'KMIFS', '', '', '', 0),
('KMIFS13', 'Kadar Air (Moisture)', 'KMIFS', '', '', '', 0),
('KMIKM01', 'SiO2', 'KMIKM', '', '', '%', 0),
('KMIKM02', 'Al2O3', 'KMIKM', '', '', '%', 0),
('KMIKM03', 'Fe2O3', 'KMIKM', '', '', '%', 0),
('KMIKM04', 'FeO', 'KMIKM', '', '', '%', 0),
('KMIKM05', 'Fetotal', 'KMIKM', '', '', '%', 0),
('KMIKM06', 'CaO', 'KMIKM', '', '', '%', 0),
('KMIKM07', 'MgO', 'KMIKM', '', '', '%', 0),
('KMIKM08', 'MnO', 'KMIKM', '', '', '%', 0),
('KMIKM09', 'MnO2', 'KMIKM', '', '', '%', 0),
('KMIKM10', 'Mntotal', 'KMIKM', '', '', '%', 0),
('KMIKM11', 'TiO2', 'KMIKM', '', '', '%', 0),
('KMIKM12', 'Na2O', 'KMIKM', '', '', '%', 0),
('KMIKM13', 'K20', 'KMIKM', '', '', '%', 0),
('KMIKM14', 'P205', 'KMIKM', '', '', '%', 0),
('KMIKM15', 'Ptotal', 'KMIKM', '', '', '%', 0),
('KMIKM16', 'SO3', 'KMIKM', '', '', '%', 0),
('KMIKM17', 'Stotal', 'KMIKM', '', '', '%', 0),
('KMIKM18', 'BaO', 'KMIKM', '', '', '%', 0),
('KMIKM19', 'Cr2O3', 'KMIKM', '', '', '%', 0),
('KMIKM20', 'H2O-', 'KMIKM', '', '', '%', 0),
('KMIKM21', 'H20+', 'KMIKM', '', '', '%', 0),
('KMIKM22', 'HD', 'KMIKM', '', '', '%', 0),
('KMIKM23', 'BV', 'KMIKM', '', '', '%', 0),
('KMIKM24', 'BJ/SG', 'KMIKM', '', '', '%', 0),
('KMIKM25', 'PH', 'KMIKM', '', '', '%', 0),
('KMIKM26', 'Cl', 'KMIKM', '', '', '%', 0),
('KMIKM27', 'CO2', 'KMIKM', '', '', '%', 0),
('KMLAA01', 'AP', 'KMLAA', '', 'Analisa Partial (Pelarut dgn HNO3 50%)', '', 25000),
('KMLAA02', 'AT', 'KMLAA', '', 'Analisa Total (Pelarut dgn HF/HCLO4)', '', 25000),
('KMLAA03', 'Cu', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA04', 'Pb', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA05', 'Zn', 'KMLAA', '', '', 'ppm', 0),
('KMLAA06', 'Co', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA07', 'Ni', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA08', 'Mn', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA09', 'Ag', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA10', 'Li', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA11', 'K', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA12', 'Fe', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA13', 'Cr', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA14', 'Bi', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA15', 'Sr', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA16', 'Ca', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA17', 'Na', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA18', 'Cd', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA19', 'Mg', 'KMLAA', '', '', '%', 30000),
('KMLAA20', 'Au (Fire Assay)', 'KMLAA', '', '', 'ppb', 175000),
('KMLAA21', 'Au (Aqua Regia)', 'KMLAA', '', '', 'ppb', 60000),
('KMLCP01', 'Zr', 'KMLCP', '', '', '', 75000),
('KMLCP02', 'Ce', 'KMLCP', '', '', '', 75000),
('KMLCP03', 'Y', 'KMLCP', '', '', '', 75000),
('KMLCP04', 'La', 'KMLCP', '', '', '', 75000),
('KMLCP05', 'Sm', 'KMLCP', '', '', '', 75000),
('KMLCP06', 'Gd', 'KMLCP', '', '', '', 75000),
('KMLCP07', 'Ho', 'KMLCP', '', '', '', 75000),
('KMLCP08', 'Tm', 'KMLCP', '', '', '', 75000),
('KMLCP09', 'Tb', 'KMLCP', '', '', '', 75000),
('KMLCP10', 'Dy', 'KMLCP', '', '', '', 75000),
('KMLCP11', 'Eu', 'KMLCP', '', '', '', 75000),
('KMLCP12', 'Nd', 'KMLCP', '', '', '', 75000),
('KMLCP13', 'Lu', 'KMLCP', '', '', '', 75000),
('KMLCP14', 'Pr', 'KMLCP', '', '', '', 75000),
('KMLCP15', 'Yb', 'KMLCP', '', '', '', 75000),
('KMLCP16', 'Ta', 'KMLCP', '', '', '', 75000),
('KMLCP17', 'Nb', 'KMLCP', '', '', '', 75000),
('KMLCP18', 'Er', 'KMLCP', '', '', '', 75000),
('KMLCV01', 'Hg', 'KMLCV', '', '', '', 0),
('KMLKL01', 'As', 'KMLKL', '', '', 'ppm', 0),
('KMLKL02', 'Sn', 'KMLKL', '', '', 'ppm', 0),
('KMLKL03', 'W', 'KMLKL', '', '', 'ppm', 0),
('KMLKL04', 'Sb', 'KMLKL', '', '', 'ppm', 0),
('KMLKL05', 'Mo', 'KMLKL', '', '', 'ppm', 0),
('KMLKL06', 'V', 'KMLKL', '', '', '', 0),
('KPBAK01', 'pH', 'KPBAK', '', '', '', 0),
('KPBAK02', 'DHL', 'KPBAK', '', '', 'umhos/cm', 0),
('KPBAK03', 'SiO2', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK04', 'Al', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK05', 'Fe', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK06', 'Ca', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK07', 'Mg', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK08', 'K', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK09', 'Na', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK10', 'Li', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK11', 'Nh4', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK12', 'B', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK13', 'Cl-', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK14', 'SO4-2', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK15', 'HCO3', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK16', 'CO3', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK17', 'As', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK18', 'F', 'KPBAK', '', '', 'mg/L', 0),
('KPBAK19', 'Hg', 'KPBAK', '', '', 'ppb', 0),
('KPBAK20', 'CO2', 'KPBAK', '', '', '%', 0);

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
('012536620211000114', 'Ane Yulian', 'nl', 'ane', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('1231297224974', 'Ahmad Bustomi', 'tu', 'kapus', '8cb2237d0679ca88db6464eac60da96345513964', 'e5d03805', 0),
('12312t318236', 'Evan Dimas', 'tu', 'sartek', '8cb2237d0679ca88db6464eac60da96345513964', 'dd67fd26', 0),
('1234567890123456789', 'Resmi Novianti', 'bb', 'resmi', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('2512335588141002629', 'Geanissa Handarini', 'pb', 'geanissa', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('28934623764', 'Djibril Colebari', 'tu', 'keplab', '8cb2237d0679ca88db6464eac60da96345513964', 'cac988f8', 0),
('48480048252136658', 'Arief Wibowo', 'lg', 'arief', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pemohon`
--

CREATE TABLE IF NOT EXISTS `pemohon` (
  `id_pemohon` varchar(7) NOT NULL,
  `id_pemilik` varchar(4) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(49) NOT NULL,
  `pass_awal` varchar(12) NOT NULL,
  PRIMARY KEY (`id_pemohon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`id_pemohon`, `id_pemilik`, `username`, `password`, `pass_awal`) VALUES
('k001', 'KPKV', 'KUTJ', 'd154f40de5eaf4b40c82ef2d639c8dd75691a362', '12345'),
('k002', 'KPEF', '72787653', 'e3d56c44e78f2f2c8a710c7cf5e716615e761c9f', 'de5fa1de'),
('k003', 'KPPB', '2a64ea99', 'acdbcd773f3db6f518a2e51c21ba06c7d4dac4f3', 'c6dc5b69'),
('k004', 'KPML', '9d2e056f', 'a997d6e51c81799d8d46a3c21fe71c96e2e0a8f5', 'ce3e3d86'),
('k005', 'KPBL', 'ae0c878f', '2d84fb23a33a04572d6407388b2b9600bfe3fdd0', '43c0d46c'),
('k006', 'KPBP', '646fa218', '4ae446de3bcd53760264419ab708f3241eea6b73', 'addc23e7'),
('p001', 'GJPR', '42bbeb49', '3207b9b173e4f6ef5dc57ea77867dcda6540e109', '8c82fb70');

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
('GJPR', 'p001', 'PT. Gerindra Jaya Perbadi', 'Jl. Tubagus Ismail No. 200 Kota Palembang', '0265249654', 'gerindra@gmail.com');

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
(1, 'Nanggroe Aceh Darusalam'),
(2, 'Sumatra Utara');

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
('FMBMA', 'Analisis Ayak dan Identifikasi Mineral', 'FMB', '', 500000),
('FMBMB', 'Mineralogi Butir', 'FMB', '', 300000),
('FMBMN', 'Mineragrafi', 'FMB', '', 515000),
('FMBMR', 'Komposisi Maesral & Reflektan', 'FMB', '', 575000),
('FMBPB', 'Petrografi Batuan', 'FMB', '', 610000),
('FMBRT', 'Analisis Retort', 'FMB', '', 0),
('KBBAA', 'Analisis Abu', 'KBB', '', 0),
('KBBAK', 'Analisis Kimia (Batubara)', 'KBB', '', 0),
('KBBAP', 'Analisis Proksimat', 'KBB', '', 0),
('KBBAS', 'Analisis Sifat Fisik', 'KBB', '', 0),
('KBBAU', 'Analisis Ultimate', 'KBB', '', 0),
('KMIFS', 'Fisika', 'KMI', '', 0),
('KMIKM', 'Kimia', 'KMI', '', 0),
('KMLAA', 'Mineral Logam AAS', 'KML', '', 0),
('KMLCP', 'ICP', 'KML', '', 0),
('KMLCV', 'AAS(CVA)', 'KML', '', 0),
('KMLKL', 'Kolorimetri', 'KML', '', 0),
('KPBAK', 'Analisis Kimia Air Panas Bumi', 'KPB', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uji_parameter`
--

CREATE TABLE IF NOT EXISTS `uji_parameter` (
  `id_conto` varchar(8) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  `nilai` float NOT NULL,
  `deskripsi` text,
  KEY `id_proses_analisis` (`id_conto`),
  KEY `id_parameter` (`id_parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uji_parameter`
--

INSERT INTO `uji_parameter` (`id_conto`, `id_parameter`, `nilai`, `deskripsi`) VALUES
('002fmb01', 'FMBPB02', 20, NULL),
('003fmb01', 'FMBAB02', 20.628, NULL),
('003fmb01', 'FMBAB03', 68.349, NULL),
('003fmb01', 'FMBAB05', 0, NULL),
('003fmb01', 'FMBAB06', 0.727, NULL),
('003fmb01', 'FMBAB08', 7.215, NULL),
('003fmb01', 'FMBAB09', 0, NULL),
('003fmb01', 'FMBAB12', 0.12, NULL),
('003fmb01', 'FMBAB15', 2.173, NULL),
('003fmb01', 'FMBAB17', 0.001, NULL),
('003fmb01', 'FMBAB27', 2, NULL),
('003fmb01', 'FMBAB28', 0, NULL),
('001kml01', 'KMIKM02', 4.54, NULL),
('001kml01', 'KMIKM03', 29.94, NULL),
('001kml01', 'KMIKM05', 20.94, NULL),
('001kml01', 'KMLAA03', 11, NULL),
('001kml01', 'KMLAA04', 49, NULL),
('001kml01', 'KMLAA05', 21, NULL),
('001kml01', 'KMLAA06', 68, NULL),
('001kml01', 'KMLAA07', 1722, NULL),
('001kml01', 'KMLAA09', 1, NULL),
('001kml01', 'KMLAA13', 526, NULL),
('001kml01', 'KMLAA19', 9.92, NULL),
('001kml01', 'KMLAA20', 13, NULL),
('001kml02', 'KMIKM02', 1.52, NULL),
('001kml02', 'KMIKM03', 11.31, NULL),
('001kml02', 'KMIKM05', 7.91, NULL),
('001kml02', 'KMLAA03', 7, NULL),
('001kml02', 'KMLAA04', 58, NULL),
('001kml02', 'KMLAA05', 52, NULL),
('001kml02', 'KMLAA06', 127, NULL),
('001kml02', 'KMLAA07', 36320, NULL),
('001kml02', 'KMLAA09', 1, NULL),
('001kml02', 'KMLAA13', 1333, NULL),
('001kml02', 'KMLAA19', 2.85, NULL),
('001kml02', 'KMLAA20', 2, NULL),
('001kml03', 'KMIKM02', 1.36, NULL),
('001kml03', 'KMIKM03', 17.66, NULL),
('001kml03', 'KMIKM05', 12.35, NULL),
('001kml03', 'KMLAA03', 12, NULL),
('001kml03', 'KMLAA04', 75, NULL),
('001kml03', 'KMLAA05', 97, NULL),
('001kml03', 'KMLAA06', 286, NULL),
('001kml03', 'KMLAA07', 10964, NULL),
('001kml03', 'KMLAA09', 2, NULL),
('001kml03', 'KMLAA13', 1599, NULL),
('001kml03', 'KMLAA19', 7.48, NULL),
('001kml03', 'KMLAA20', 6, NULL),
('001kml04', 'KMIKM02', 2.53, NULL),
('001kml04', 'KMIKM03', 25.71, NULL),
('001kml04', 'KMIKM05', 17.98, NULL),
('001kml04', 'KMLAA03', 26, NULL),
('001kml04', 'KMLAA04', 99, NULL),
('001kml04', 'KMLAA05', 263, NULL),
('001kml04', 'KMLAA06', 730, NULL),
('001kml04', 'KMLAA07', 13516, NULL),
('001kml04', 'KMLAA09', 3, NULL),
('001kml04', 'KMLAA13', 3302, NULL),
('001kml04', 'KMLAA19', 1.9, NULL),
('001kml04', 'KMLAA20', 6, NULL),
('001kml05', 'KMIKM02', 1.69, NULL),
('001kml05', 'KMIKM03', 15.12, NULL),
('001kml05', 'KMIKM05', 10.57, NULL),
('001kml05', 'KMLAA03', 20, NULL),
('001kml05', 'KMLAA04', 79, NULL),
('001kml05', 'KMLAA05', 55, NULL),
('001kml05', 'KMLAA06', 163, NULL),
('001kml05', 'KMLAA07', 2939, NULL),
('001kml05', 'KMLAA09', 2, NULL),
('001kml05', 'KMLAA13', 1253, NULL),
('001kml05', 'KMLAA19', 6.65, NULL),
('001kml05', 'KMLAA20', 2, NULL),
('001kpb01', 'KPBAK19', 39, NULL),
('001kpb01', 'KPBAK20', 1.28, NULL),
('001kpb02', 'KPBAK19', 58, NULL),
('001kpb02', 'KPBAK20', 1.44, NULL),
('001kpb03', 'KPBAK19', 99, NULL),
('001kpb03', 'KPBAK20', 4.59, NULL),
('001kpb04', 'KPBAK19', 294, NULL),
('001kpb04', 'KPBAK20', 0.64, NULL),
('001kpb05', 'KPBAK19', 54, NULL),
('001kpb05', 'KPBAK20', 0.77, NULL),
('001kpb06', 'KPBAK19', 30, NULL),
('001kpb06', 'KPBAK20', 10.1, NULL),
('001kpb07', 'KPBAK19', 28, NULL),
('001kpb07', 'KPBAK20', 1.82, NULL),
('001kpb08', 'KPBAK19', 41, NULL),
('001kpb08', 'KPBAK20', 0.85, NULL),
('001kpb09', 'KPBAK19', 37, NULL),
('001kpb09', 'KPBAK20', 1.13, NULL),
('001kpb10', 'KPBAK19', 89, NULL),
('001kpb10', 'KPBAK20', 1.27, NULL),
('004kbb01', 'KBBAP01', 0, NULL),
('004kbb01', 'KBBAP02', 0, NULL),
('004kbb01', 'KBBAP03', 0, NULL),
('004kbb01', 'KBBAP05', 0, NULL),
('004kbb01', 'KBBAU01', 0, NULL),
('004kbb01', 'KBBAU02', 0, NULL),
('004kbb01', 'KBBAU03', 0, NULL),
('004kbb01', 'KBBAU04', 0, NULL),
('004kbb01', 'KBBAU05', 0, NULL),
('004kbb02', 'KBBAP01', 0, NULL),
('004kbb02', 'KBBAP02', 0, NULL),
('004kbb02', 'KBBAP03', 0, NULL),
('004kbb02', 'KBBAP05', 0, NULL),
('004kbb02', 'KBBAU01', 0, NULL),
('004kbb02', 'KBBAU02', 0, NULL),
('004kbb02', 'KBBAU03', 0, NULL),
('004kbb02', 'KBBAU04', 0, NULL),
('004kbb02', 'KBBAU05', 0, NULL),
('004kbb03', 'KBBAP01', 0, NULL),
('004kbb03', 'KBBAP02', 0, NULL),
('004kbb03', 'KBBAP03', 0, NULL),
('004kbb03', 'KBBAP05', 0, NULL),
('004kbb03', 'KBBAU01', 0, NULL),
('004kbb03', 'KBBAU02', 0, NULL),
('004kbb03', 'KBBAU03', 0, NULL),
('004kbb03', 'KBBAU04', 0, NULL),
('004kbb03', 'KBBAU05', 0, NULL),
('004kbb04', 'KBBAP01', 0, NULL),
('004kbb04', 'KBBAP02', 0, NULL),
('004kbb04', 'KBBAP03', 0, NULL),
('004kbb04', 'KBBAP05', 0, NULL),
('004kbb04', 'KBBAU01', 0, NULL),
('004kbb04', 'KBBAU02', 0, NULL),
('004kbb04', 'KBBAU03', 0, NULL),
('004kbb04', 'KBBAU04', 0, NULL),
('004kbb04', 'KBBAU05', 0, NULL),
('004kbb05', 'KBBAP01', 0, NULL),
('004kbb05', 'KBBAP02', 0, NULL),
('004kbb05', 'KBBAP03', 0, NULL),
('004kbb05', 'KBBAP05', 0, NULL),
('004kbb05', 'KBBAU01', 0, NULL),
('004kbb05', 'KBBAU02', 0, NULL),
('004kbb05', 'KBBAU03', 0, NULL),
('004kbb05', 'KBBAU04', 0, NULL),
('004kbb05', 'KBBAU05', 0, NULL),
('004kbb06', 'KBBAP01', 0, NULL),
('004kbb06', 'KBBAP02', 0, NULL),
('004kbb06', 'KBBAP03', 0, NULL),
('004kbb06', 'KBBAP05', 0, NULL),
('004kbb06', 'KBBAU01', 0, NULL),
('004kbb06', 'KBBAU02', 0, NULL),
('004kbb06', 'KBBAU03', 0, NULL),
('004kbb06', 'KBBAU04', 0, NULL),
('004kbb06', 'KBBAU05', 0, NULL),
('004kbb07', 'KBBAP01', 56.99, NULL),
('004kbb07', 'KBBAP02', 78, NULL),
('004kbb07', 'KBBAP03', 0.345, NULL),
('004kbb07', 'KBBAP05', 4567, NULL),
('004kbb07', 'KBBAU01', 0.98, NULL),
('004kbb07', 'KBBAU02', 0.66, NULL),
('004kbb07', 'KBBAU03', 112, NULL),
('004kbb07', 'KBBAU04', 345, NULL),
('004kbb07', 'KBBAU05', 889, NULL),
('004kbb08', 'KBBAP01', 0, NULL),
('004kbb08', 'KBBAP02', 0, NULL),
('004kbb08', 'KBBAP03', 0, NULL),
('004kbb08', 'KBBAP05', 0, NULL),
('004kbb08', 'KBBAU01', 0, NULL),
('004kbb08', 'KBBAU02', 0, NULL),
('004kbb08', 'KBBAU03', 0, NULL),
('004kbb08', 'KBBAU04', 0, NULL),
('004kbb08', 'KBBAU05', 0, NULL),
('004kbb09', 'KBBAP01', 0, NULL),
('004kbb09', 'KBBAP02', 0, NULL),
('004kbb09', 'KBBAP03', 0, NULL),
('004kbb09', 'KBBAP05', 0, NULL),
('004kbb09', 'KBBAU01', 0, NULL),
('004kbb09', 'KBBAU02', 0, NULL),
('004kbb09', 'KBBAU03', 0, NULL),
('004kbb09', 'KBBAU04', 0, NULL),
('004kbb09', 'KBBAU05', 0, NULL),
('005fmb01', 'FMBPB09', 25, 'tidak berwarna, sedikit abu-abu'),
('005fmb02', 'FMBPB04', 234, NULL),
('002kml01', 'KMLCP14', 0, NULL),
('002kml01', 'KMLCP15', 0, NULL),
('003kml01', 'KMLCP09', 0, NULL),
('003kml01', 'KMLCP10', 0, NULL),
('003kml01', 'KMLCP11', 0, NULL),
('004kml01', 'KMLCP05', 0, NULL),
('004kml01', 'KMLCP06', 0, NULL),
('004kml01', 'KMLCP09', 0, NULL),
('004kml01', 'KMLCP11', 0, NULL),
('004kml01', 'KMIKM10', 0, NULL),
('004kml01', 'KMLAA01', 0, NULL),
('004kml01', 'KMLAA02', 0, NULL),
('004kml01', 'KMLAA03', 0, NULL),
('004kml01', 'KMLAA06', 0, NULL),
('004kml01', 'KMLAA07', 0, NULL),
('004kml01', 'KMLAA13', 0, NULL),
('004kml01', 'KMLAA14', 0, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conto`
--
ALTER TABLE `conto`
  ADD CONSTRAINT `conto_ibfk_1` FOREIGN KEY (`id_analisis`) REFERENCES `hasil_analisis` (`id_analisis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_analisis`
--
ALTER TABLE `hasil_analisis`
  ADD CONSTRAINT `hasil_analisis_ibfk_2` FOREIGN KEY (`id_lab`) REFERENCES `laboratorium` (`id_lab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_analisis_ibfk_3` FOREIGN KEY (`lokasi`) REFERENCES `kabupaten` (`id_kabupaten`) ON DELETE SET NULL ON UPDATE CASCADE;

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
-- Constraints for table `pakai_type_analisis`
--
ALTER TABLE `pakai_type_analisis`
  ADD CONSTRAINT `pakai_type_analisis_ibfk_1` FOREIGN KEY (`id_analisis`) REFERENCES `hasil_analisis` (`id_analisis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uji_parameter`
--
ALTER TABLE `uji_parameter`
  ADD CONSTRAINT `uji_parameter_ibfk_1` FOREIGN KEY (`id_conto`) REFERENCES `conto` (`id_conto`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
