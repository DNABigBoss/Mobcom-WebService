-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Okt 2020 pada 15.53
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
(12, 'Minyak Goreng', NULL);

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
(14, 12, '3 Sendok Makan', 1);

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
(1, 'Kue Balok', '30 Menit', 0, '45000.00', 0, 0, 'kuebalok.jpg'),
(2, 'Kue Bantal', '30 Menit', 5, NULL, 0, 0, NULL);

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
(7, 5, 'Lalu masukan bahan kering yang sudah diayak tadi, aduk-aduk dengan rata lalu cetak pake cetakan kue balok. Cukup 5 menit untuk memanggangnya dengan api kecil dan hasilnya nanti kuenya garing di luar dan lumer di dalamnya.', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `bahan_resep`
--
ALTER TABLE `bahan_resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `step_resep`
--
ALTER TABLE `step_resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
