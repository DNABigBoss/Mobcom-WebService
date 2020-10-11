-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Okt 2020 pada 12.10
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resep_jajanan_kekinian`
--
CREATE DATABASE IF NOT EXISTS `resep_jajanan_kekinian` DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_ci;
USE `resep_jajanan_kekinian`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan`
--

DROP TABLE IF EXISTS `bahan`;
CREATE TABLE `bahan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data untuk tabel `bahan`
--

INSERT INTO `bahan` (`id`, `nama`, `gambar`) VALUES
(1, 'Tepung Terigu', NULL),
(2, 'Gula Pasir', NULL),
(3, 'Telur', NULL),
(4, 'Susu Bubuk', NULL),
(5, 'Coklat Bubuk', NULL),
(6, 'Dark Coklat', NULL),
(7, 'Mentega', NULL),
(8, 'SP (Emulsifier)', NULL),
(9, 'Baking Powder', NULL),
(10, 'Vanili', NULL),
(11, 'Garam', NULL),
(12, 'Minyak Goreng', NULL),
(13, 'Margarin', NULL),
(14, 'Ragi Instan (Fermipan)', NULL),
(15, 'Vanili Cair', NULL),
(16, 'Susu Kental Manis', NULL),
(17, 'Air', NULL),
(18, 'Wijen', NULL),
(19, 'Maizena', NULL),
(20, 'Vanila Bubuk', NULL),
(21, 'Selai', NULL),
(22, 'Butter Leleh', NULL),
(23, 'Tepung Segitiga', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_resep`
--

DROP TABLE IF EXISTS `bahan_resep`;
CREATE TABLE `bahan_resep` (
  `id` int(11) NOT NULL,
  `bahan_id` int(11) NOT NULL,
  `takaran` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `resep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data untuk tabel `bahan_resep`
--

INSERT INTO `bahan_resep` (`id`, `bahan_id`, `takaran`, `resep_id`) VALUES
(1, 1, '150 gram', 1),
(2, 2, '3 Sendok Makan', 1),
(3, 3, '1 Butir', 1),
(4, 4, '1 Sendok Makan', 1),
(5, 5, '1 Sendok Makan', 1),
(6, 6, '100 gram', 1),
(7, 7, '3 Sendok Makan', 1),
(8, 8, '1/2 Sendok Teh', 1),
(11, 9, '1/2 Sendok Teh', 1),
(12, 10, 'Secukupnya', 1),
(13, 11, '1/2 Sendok Teh', 1),
(14, 12, '3 Sendok Makan', 1),
(15, 1, '250 Gram', 2),
(16, 3, '1 Butir', 2),
(17, 13, '2 Sendok Makan', 2),
(18, 16, '2 Sendok Makan', 2),
(19, 2, '5 Sendok Makan', 2),
(20, 14, '1 Sendok Teh', 2),
(21, 15, '1 Sendok Teh', 2),
(22, 17, '100 ml', 2),
(23, 18, 'Secukupnya', 2),
(24, 3, '6 Butir', 3),
(25, 2, '90 Gram', 3),
(26, 8, '1,5 Sendok Teh', 3),
(27, 23, '70 Gram', 3),
(28, 19, '10 Gram', 3),
(29, 4, '10 Gram', 3),
(30, 20, '1/4 Sendok Teh', 3),
(31, 22, '120 Gram', 3),
(32, 21, 'Isian : ButterCream / ', 3),
(33, 3, '1 Butir', 4),
(34, 10, '1 Sendok Teh', 4),
(35, 11, '1/4 Sendok Teh', 4),
(36, 1, '250 Gram', 4),
(37, 2, '200 Gram', 4),
(38, 17, '200 ml', 4),
(39, 8, '1 Sendok Teh', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `balasan`
--

DROP TABLE IF EXISTS `balasan`;
CREATE TABLE `balasan` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `isi` text COLLATE utf32_unicode_ci NOT NULL,
  `diskusi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskusi`
--

DROP TABLE IF EXISTS `diskusi`;
CREATE TABLE `diskusi` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `isi` text COLLATE utf32_unicode_ci NOT NULL,
  `resep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

DROP TABLE IF EXISTS `resep`;
CREATE TABLE `resep` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `waktu_memasak` varchar(25) COLLATE utf32_unicode_ci NOT NULL,
  `porsi` int(11) NOT NULL,
  `harga` decimal(19,2) DEFAULT NULL,
  `favorit` int(11) NOT NULL DEFAULT '0',
  `dilihat` int(11) NOT NULL DEFAULT '0',
  `gambar` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data untuk tabel `resep`
--

INSERT INTO `resep` (`id`, `nama`, `waktu_memasak`, `porsi`, `harga`, `favorit`, `dilihat`, `gambar`) VALUES
(1, 'Kue Balok', '30 Menit', 0, '45000.00', 0, 0, 'https://apimarbidev.000webhostapp.com/assets/img/kuebalok.jpg'),
(2, 'Kue Bantal', '30 Menit', 5, NULL, 0, 0, 'https://apimarbidev.000webhostapp.com/assets/img/kuebantal.jpg'),
(3, 'Bolu Gulung', '30 Menit', 5, '45000.00', 10, 50, 'https://apimarbidev.000webhostapp.com/assets/img/bolugulung.jpg'),
(4, 'Bolu Kukus', '60 Menit', 10, '50000.00', 0, 0, 'https://apimarbidev.000webhostapp.com/assets/img/bolukukus.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `step_resep`
--

DROP TABLE IF EXISTS `step_resep`;
CREATE TABLE `step_resep` (
  `id` int(11) NOT NULL,
  `nomor_step` int(11) NOT NULL,
  `intruksi` text COLLATE utf32_unicode_ci NOT NULL,
  `resep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data untuk tabel `step_resep`
--

INSERT INTO `step_resep` (`id`, `nomor_step`, `intruksi`, `resep_id`) VALUES
(1, 1, 'Kocok gula + telur + vanili + sp + garam', 1),
(2, 2, 'Tim mentega dan dark coklat aduk rata dinginkan', 1),
(5, 3, 'Jadikan satu bahan kering tepung terigu, coklat bubuk, susu, tbm lalu ayak.', 1),
(6, 4, 'Masukkan mentega cair campurkan dark coklat tadi yg sudah dingin ke dalam kocokan telur tambahkan minyak goreng aduk pake spatula.', 1),
(7, 5, 'Lalu masukan bahan kering yang sudah diayak tadi, aduk-aduk dengan rata lalu cetak pake cetakan kue balok. Cukup 5 menit untuk memanggangnya dengan api kecil dan hasilnya nanti kuenya garing di luar dan lumer di dalamnya.', 1),
(8, 1, 'Larutkan gula kedalam 100 ml air.', 2),
(9, 2, 'Campurkan tepung terigu,margarin,ragi,susu kental manis,telur dan vanili aduk hingga rata.', 2),
(10, 3, 'Tambahkan air sedikit demi sedikit lalu uleni sampai kalis (kurang lebih 10 menit).', 2),
(11, 4, 'Diamkan adonan dan tutup dengan kain bersih sekitar 1 jam.', 2),
(12, 5, 'Pipihkan adonan kemudian olesi air dan taburkan wijen diatasnya lalu diamkan kurang lebih 10 menit lagi.', 2),
(13, 6, 'Potong potong adonan dalam bentuk persegi.', 2),
(14, 7, 'Siapkan minyak untuk menggoreng lalu goreng dengan api kecil balik cukup sekali saja agar muncul white ring pada kue bantal.', 2),
(15, 8, 'Goreng sampai kecoklatan angkat lalu sajikan.', 2),
(16, 1, 'Masukan seluruh bahan menjadi satu kecuali Butter Leleh lalu Kocok sampai mengembang pucat kental.', 3),
(17, 2, 'Masukkan butter leleh suhu ruang pelan2, aduk pake Spatula.', 3),
(18, 3, 'Tuang dalam loyang yang sudah diberikan kertas roti, panggang 190 derajat sampai matang suhu sesuaikan oven.', 3),
(19, 4, 'Keluarkan dari loyang,tunggu suhu ruang siap dioles memakai BC/selai.kalau memakai Selai selagi masih panas digulung.', 3),
(20, 1, 'Siapakan bahan-bahannya terlebih dahulu, lalu campur semua bahan, mixer hingga kental berjejak. Jika masih ada gelembung, tambahkan SP sedikit kemudian, mixer lagi beberapa menit.', 4),
(21, 2, 'Lalu bagi adonan menjadi 3 bagian, putih/tanpa warna, merah dan coklat atau sesuai selera.Tuang adonan tanpa warna cetakan saja, lalu tuang warna merah', 4),
(22, 3, 'Sebelumnya panaskan kukusan selama 5 menit sampai mendidih dan beruap banyak, lalu kukus selama 15 menit, jangan dibuka tutupnya selama mengukus, karena nanti bisa tidak mengembang. Tutupnya dialasi serbet, supaya air tidak mengenai adonan bolu.', 4),
(23, 4, 'Setelah dingin, tambahkan selai strawberry diatasnya.', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bahan_resep`
--
ALTER TABLE `bahan_resep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_resep_bahan` (`resep_id`),
  ADD KEY `FK_bahanresep_bahan` (`bahan_id`);

--
-- Indeks untuk tabel `balasan`
--
ALTER TABLE `balasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_diskusi_balasan` (`diskusi_id`);

--
-- Indeks untuk tabel `diskusi`
--
ALTER TABLE `diskusi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `step_resep`
--
ALTER TABLE `step_resep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_resep_step` (`resep_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan`
--
ALTER TABLE `bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `bahan_resep`
--
ALTER TABLE `bahan_resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `balasan`
--
ALTER TABLE `balasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `diskusi`
--
ALTER TABLE `diskusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resep`
--
ALTER TABLE `resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `step_resep`
--
ALTER TABLE `step_resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bahan_resep`
--
ALTER TABLE `bahan_resep`
  ADD CONSTRAINT `FK_bahanresep_bahan` FOREIGN KEY (`bahan_id`) REFERENCES `bahan` (`id`),
  ADD CONSTRAINT `FK_resep_bahan` FOREIGN KEY (`resep_id`) REFERENCES `resep` (`id`);

--
-- Ketidakleluasaan untuk tabel `balasan`
--
ALTER TABLE `balasan`
  ADD CONSTRAINT `FK_diskusi_balasan` FOREIGN KEY (`diskusi_id`) REFERENCES `diskusi` (`id`);

--
-- Ketidakleluasaan untuk tabel `step_resep`
--
ALTER TABLE `step_resep`
  ADD CONSTRAINT `FK_resep_step` FOREIGN KEY (`resep_id`) REFERENCES `resep` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
