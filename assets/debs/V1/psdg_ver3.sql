-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 24, 2014 at 04:07 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

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
('kmi', 'nl', 'Kimia Mineral Industri'),
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
  PRIMARY KEY (`id_metoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metoda`
--

INSERT INTO `metoda` (`id_metoda`, `nama`) VALUES
('1', 'Gravimetri'),
('10', 'Viscometer'),
('11', 'Volumetri'),
('12', 'Ion Chromotografi'),
('13', 'Micro Plasma'),
('14', 'Mercury Analyzer Zeeman'),
('15', 'CETAC'),
('16', 'DMA'),
('2', 'Titrimetri'),
('3', 'Turbidimetri'),
('4', 'Flame Photometri'),
('5', 'Spectrometry'),
('6', 'AAS'),
('7', 'XRF'),
('8', 'Penfield Test'),
('9', 'pH meter');

-- --------------------------------------------------------

--
-- Table structure for table `metoda_parameter`
--

CREATE TABLE IF NOT EXISTS `metoda_parameter` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_metoda` int(11) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `id_metoda` (`id_metoda`,`id_parameter`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `metoda_parameter`
--

INSERT INTO `metoda_parameter` (`_id`, `id_metoda`, `id_parameter`) VALUES
(5, 1, 'KNLKM01'),
(12, 1, 'KNLKM03'),
(7, 3, 'KNLKM01'),
(8, 6, 'KNLKM01'),
(6, 10, 'KNLKM01');

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
('KMLAA03', 'Cu', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA04', 'Pb', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA05', 'Zn', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA06', 'Co', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA07', 'Ni', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA08', 'Mn', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA09', 'Ag', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA10', 'Li', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA11', 'Fe', 'KMLAA', '', '', 'ppm', 25000),
('KMLAA12', 'Bi', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA13', 'Cd', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA14', 'Au(Fire Assay)', 'KMLAA', '', '', 'ppm', 30000),
('KMLAA15', 'Au(Aqua Regia)', 'KMLAA', '', '', 'ppm', 30000),
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
('KMLKL01', 'As', 'KMLKL', '', '', 'ppm', 0),
('KMLKL02', 'Sn', 'KMLKL', '', '', 'ppm', 0),
('KMLKL03', 'W', 'KMLKL', '', '', 'ppm', 0),
('KMLKL04', 'Sb', 'KMLKL', '', '', 'ppm', 0),
('KMLKL05', 'Mo', 'KMLKL', '', '', 'ppm', 0),
('KMLKL06', 'V', 'KMLKL', '', '', '', 0),
('KMLMP01', 'K', 'KMLMP', '', '', 'ppm', 30000),
('KMLMP02', 'Cr', 'KMLMP', '', '', 'ppm', 30000),
('KMLMP03', 'Al', 'KMLMP', '', '', '%', 30000),
('KMLMP04', 'Mg', 'KMLMP', '', '', 'ppb', 175000),
('KMLMP05', 'Ca', 'KMLMP', '', '', 'ppb', 60000),
('KMLMP06', 'Na', 'KMLMP', '', '', 'ppb', 60000),
('KMLMP07', 'Sr', 'KMLMP', '', '', 'ppb', 60000),
('KNLFS01', 'Bleaching Test', 'KNLFS', '6', '', '', 0),
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
('KNLKM01', 'SiO2', 'KNLKM', '1,5', '', '%', 0),
('KNLKM02', 'Al2O3', 'KMIKM', '', '', '%', 0),
('KNLKM03', 'Fe2O3', 'KNLKM', '', '', '%', 0),
('KNLKM04', 'FeO', 'KNLKM', '', '', '%', 0),
('KNLKM05', 'Fetotal', 'KNLKM', '', '', '%', 0),
('KNLKM06', 'CaO', 'KNLKM', '', '', '%', 0),
('KNLKM07', 'MgO', 'KNLKM', '', '', '%', 0),
('KNLKM08', 'MnO', 'KNLKM', '', '', '%', 0),
('KNLKM09', 'MnO2', 'KNLKM', '', '', '%', 0),
('KNLKM10', 'Mntotal', 'KNLKM', '', '', '%', 0),
('KNLKM11', 'TiO2', 'KNLKM', '', '', '%', 0),
('KNLKM12', 'Na2O', 'KNLKM', '', '', '%', 0),
('KNLKM13', 'K20', 'KNLKM', '', '', '%', 0),
('KNLKM14', 'P205', 'KNLKM', '', '', '%', 0),
('KNLKM15', 'Ptotal', 'KNLKM', '', '', '%', 0),
('KNLKM16', 'SO3', 'KNLKM', '', '', '%', 0),
('KNLKM17', 'Stotal', 'KNLKM', '', '', '%', 0),
('KNLKM18', 'BaO', 'KNLKM', '', '', '%', 0),
('KNLKM19', 'Cr2O3', 'KNLKM', '', '', '%', 0),
('KNLKM20', 'H2O-', 'KNLKM', '', '', '%', 0),
('KNLKM21', 'H20+', 'KNLKM', '', '', '%', 0),
('KNLKM22', 'HD', 'KNLKM', '', '', '%', 0),
('KNLKM23', 'BV', 'KNLKM', '', '', '%', 0),
('KNLKM24', 'BJ/SG', 'KNLKM', '', '', '%', 0),
('KNLKM25', 'PH', 'KNLKM', '', '', '%', 0),
('KNLKM26', 'Cl', 'KNLKM', '', '', '%', 0),
('KNLKM27', 'CO2', 'KNLKM', '', '', '%', 0),
('KNLKM28', 'Hg', 'KNLKM', '', '', '%', 0),
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
('012536620211000114', 'Ane Yulian', 'nl', 'ane', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('1231297224974', 'Kepala Pusat', 'tu', 'kapus', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('12312t318236', 'Kabid Sarana Teknik', 'tu', 'sartek', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('1234567890123456789', 'Resmi Novianti', 'bb', 'resmi', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('2512335588141002629', 'Geanissa Handarini', 'pb', 'geanissa', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
('28934623764', 'Kasub Bidang Lab', 'tu', 'keplab', '8cb2237d0679ca88db6464eac60da96345513964', '12345', 0),
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
('p001', 'CHEV', 'chevron', '8cb2237d0679ca88db6464eac60da96345513964', '12345'),
('p002', 'GEOC', '114fd74a', '37d335bafa5b8e9bcda405d6d5ccf464b7deb53f', 'd5eebb07');

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
('FMBMA', 'Analisis Ayak dan Identifikasi Mineral', 'FMB', '', 500000),
('FMBMB', 'Mineralogi Butir', 'FMB', '', 300000),
('FMBMN', 'Mineragrafi', 'FMB', '', 515000),
('FMBMR', 'Komposisi Maseral & Reflektan', 'FMB', '', 575000),
('FMBPB', 'Petrografi Batuan', 'FMB', '', 610000),
('FMBRT', 'Analisis Retort', 'FMB', '', 0),
('KBBAA', 'Analisis Abu', 'KBB', '', 0),
('KBBAK', 'Analisis Kimia (Batubara)', 'KBB', '', 0),
('KBBAP', 'Analisis Proksimat', 'KBB', '', 0),
('KBBAS', 'Analisis Sifat Fisik', 'KBB', '', 0),
('KBBAU', 'Analisis Ultimate', 'KBB', '', 0),
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
-- Table structure for table `uji_parameter`
--

CREATE TABLE IF NOT EXISTS `uji_parameter` (
  `id_conto` varchar(8) NOT NULL,
  `id_parameter` varchar(7) NOT NULL,
  `nilai` float NOT NULL,
  `id_metoda` int(11) DEFAULT NULL,
  `deskripsi` text,
  KEY `id_proses_analisis` (`id_conto`),
  KEY `id_parameter` (`id_parameter`),
  KEY `id_metoda` (`id_metoda`),
  KEY `id_metoda_2` (`id_metoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
