-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Agu 2020 pada 15.55
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skripsi_a_g`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kandungan_bahan`
--

CREATE TABLE `kandungan_bahan` (
  `idkandungan_bahan` int(11) NOT NULL,
  `nama_bahan` varchar(30) NOT NULL,
  `kalori_bahan` int(3) UNSIGNED ZEROFILL NOT NULL,
  `karbohidrat_bahan` float(4,2) UNSIGNED ZEROFILL NOT NULL,
  `protein_bahan` float(4,2) UNSIGNED ZEROFILL NOT NULL,
  `lemak_bahan` float(4,2) UNSIGNED ZEROFILL NOT NULL,
  `sumber_idsumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kandungan_bahan`
--

INSERT INTO `kandungan_bahan` (`idkandungan_bahan`, `nama_bahan`, `kalori_bahan`, `karbohidrat_bahan`, `protein_bahan`, `lemak_bahan`, `sumber_idsumber`) VALUES
(1, 'Ayam', 298, 0.00, 18.20, 25.00, 1),
(2, 'Ayam Bakar', 167, 0.00, 25.01, 6.63, 2),
(4, 'Ayam Geprek', 263, 7.60, 17.61, 17.99, 2),
(5, 'Ayam Goreng', 595, 0.00, 30.05, 0.00, 3),
(6, 'Ayam Kari', 124, 4.74, 11.47, 6.67, 2),
(7, 'Ayam Kecap', 111, 5.73, 9.79, 5.30, 2),
(8, 'Ayam Pedas', 131, 7.53, 16.01, 4.31, 2),
(9, 'Ayam Plecing', 199, 5.29, 25.05, 8.53, 2),
(10, 'Babat', 108, 0.00, 17.60, 4.20, 1),
(11, 'Bihun', 348, 82.10, 4.70, 0.10, 1),
(12, 'Bihun Goreng', 381, 80.30, 6.10, 3.90, 1),
(13, 'Botok', 152, 16.29, 6.95, 7.49, 2),
(14, 'Bumbu Pecel', 440, 46.00, 18.00, 20.00, 2),
(15, 'Cilok', 266, 58.17, 2.45, 2.57, 2),
(16, 'Daging Sapi', 273, 0.00, 17.50, 22.00, 1),
(17, 'Ikan Asin', 193, 0.00, 42.00, 1.50, 1),
(18, 'Ikan Tongkol', 100, 8.00, 13.70, 1.50, 1),
(19, 'Ikan Wader', 084, 0.00, 14.88, 2.27, 2),
(20, 'Jamur Tiram', 030, 5.50, 1.90, 0.10, 1),
(21, 'Kacang Panjang Rebus', 030, 5.80, 2.30, 0.40, 1),
(22, 'Kecambah', 029, 4.69, 3.59, 0.48, 2),
(23, 'Kentang', 062, 13.50, 2.10, 0.20, 1),
(24, 'Ketimun', 008, 1.40, 0.20, 0.20, 1),
(25, 'Kuah', 000, 0.00, 0.00, 0.00, NULL),
(26, 'Kubis', 051, 8.00, 2.50, 1.10, 1),
(27, 'Lontong', 144, 31.76, 2.76, 0.23, 2),
(28, 'Kikil', 100, 4.16, 10.88, 4.53, 2),
(29, 'Mie Basah', 088, 14.00, 0.60, 3.30, 1),
(30, 'Mie Goreng', 117, 15.60, 1.90, 5.10, 3),
(31, 'Mie Instant Goreng', 380, 54.00, 8.00, 14.00, 2),
(32, 'Mie Instant Rebus', 300, 43.00, 7.00, 11.00, 2),
(33, 'Nasi', 180, 39.80, 3.00, 0.30, 1),
(34, 'Nasi Jagung', 357, 79.50, 8.80, 0.50, 1),
(35, 'Pangsit Polos', 124, 20.22, 3.30, 3.21, 2),
(36, 'Perkedel Jagung', 260, 27.01, 5.33, 15.44, 2),
(37, 'Rawon', 060, 4.00, 5.40, 2.50, 1),
(38, 'Rempelo Ayam Goreng', 270, 9.90, 32.30, 11.20, 3),
(39, 'Sawi', 028, 4.00, 2.30, 0.30, 1),
(40, 'Sayur Bening', 036, 7.64, 1.79, 0.37, 2),
(41, 'Sayur Lodeh', 068, 6.14, 2.78, 3.95, 2),
(42, 'Sayur Nangka', 066, 8.70, 1.30, 3.50, 2),
(43, 'Seledri', 023, 4.60, 1.00, 0.10, 1),
(44, 'Sosis Sapi', 448, 2.30, 14.50, 42.30, 1),
(45, 'Tahu Bacem', 095, 4.37, 7.62, 5.86, 2),
(46, 'Tahu Goreng', 115, 2.40, 9.70, 8.50, 1),
(47, 'Tahu Telur', 328, 24.60, 12.60, 19.90, 1),
(48, 'Telur Goreng', 251, 1.40, 16.30, 19.40, 1),
(49, 'Telur Rebus', 154, 0.00, 12.20, 0.00, 3),
(50, 'Tempe Bacem', 195, 8.93, 14.91, 12.40, 2),
(51, 'Tempe Goreng', 350, 10.40, 24.50, 26.60, 1),
(52, 'Terong', 028, 5.50, 1.10, 0.20, 1),
(53, 'Toge', 037, 3.80, 4.40, 0.50, 1),
(54, 'Tomat', 024, 4.70, 1.30, 0.50, 1),
(55, 'Tumis Kangkung', 092, 0.00, 2.50, 0.00, 3),
(56, 'Urap', 112, 10.89, 2.32, 7.65, 2),
(57, 'Usus Ayam Goreng', 473, 13.90, 45.20, 26.30, 1),
(58, 'Wortel Rebus', 028, 6.30, 0.70, 0.50, 1),
(59, 'Nasi Uduk', 152, 7.00, 2.60, 2.60, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kantin`
--

CREATE TABLE `kantin` (
  `idkantin` int(11) NOT NULL,
  `nama_kantin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kantin`
--

INSERT INTO `kantin` (`idkantin`, `nama_kantin`) VALUES
(1, 'Bu Lilik'),
(2, 'Bu Salim'),
(4, 'Bu Diah'),
(5, 'Bu Atik'),
(6, 'Bu Winda'),
(7, 'Bu Misnan'),
(8, 'Bu Mega'),
(9, 'Bu Nana'),
(10, 'Bu Yubi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komposisi`
--

CREATE TABLE `komposisi` (
  `bahan_idkandungan` int(11) NOT NULL,
  `makanan_idmenu` int(11) NOT NULL,
  `berat_bahan` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_makanan`
--

CREATE TABLE `menu_makanan` (
  `idmenu_makanan` int(11) NOT NULL,
  `nama_makanan` varchar(30) NOT NULL,
  `berat_makanan` smallint(6) NOT NULL,
  `total_kalori_makanan` float(6,2) NOT NULL,
  `total_karbohidrat_makanan` float(8,4) NOT NULL,
  `total_protein_makanan` float(8,4) NOT NULL,
  `total_lemak_makanan` float(8,4) NOT NULL,
  `kantin_idkantin` int(11) NOT NULL,
  `kode_makanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_makanan`
--

INSERT INTO `menu_makanan` (`idmenu_makanan`, `nama_makanan`, `berat_makanan`, `total_kalori_makanan`, `total_karbohidrat_makanan`, `total_protein_makanan`, `total_lemak_makanan`, `kantin_idkantin`, `kode_makanan`) VALUES
(1, 'Gado - gado', 270, 565.90, 77.5940, 21.0540, 16.7155, 1, 1),
(2, 'Mie Kopyok', 490, 464.40, 73.7650, 10.8550, 14.0750, 1, 2),
(5, 'Nasi Sop Bakmoy', 425, 474.05, 97.6190, 9.4650, 3.9990, 1, 3),
(6, 'Nasi Sop Kikil', 430, 414.00, 83.4620, 11.0460, 2.6535, 1, 4),
(7, 'Nasi Campur', 310, 668.45, 100.0850, 22.6850, 19.3100, 2, 5),
(8, 'Nasi Goreng', 250, 570.40, 72.8400, 18.2900, 0.6300, 2, 6),
(9, 'Nasi Goreng Mawut', 250, 563.55, 67.9500, 17.9750, 2.3100, 2, 7),
(10, 'Bihun Goreng', 281, 999.97, 177.6480, 23.2410, 16.7580, 2, 8),
(11, 'Bihun Kuah', 389, 874.41, 176.9950, 18.6160, 0.2510, 2, 9),
(12, 'Mie Instant Kuah', 300, 394.50, 44.4000, 14.5150, 11.1050, 4, 10),
(13, 'Mie Instant Goreng', 180, 513.90, 55.9000, 16.8400, 23.7900, 4, 11),
(14, 'Nasi Kare Ayam', 520, 702.40, 117.7110, 23.2155, 13.1655, 4, 12),
(15, 'Nasi Pecel', 470, 746.10, 141.3580, 19.3330, 10.2760, 4, 13),
(16, 'Nasi Rawon', 510, 510.95, 105.8345, 11.3645, 3.1340, 4, 14),
(17, 'Soto Babat', 440, 446.25, 79.7000, 20.2250, 4.0350, 5, 15),
(18, 'Nasi Ayam Plecing', 320, 597.30, 84.7830, 30.7850, 14.5860, 5, 16),
(19, 'Lontong Sayur', 382, 525.28, 65.9376, 19.2468, 20.2577, 5, 17),
(20, 'Nasi Ayam Kecap', 350, 575.80, 86.8270, 23.2960, 14.7250, 5, 18),
(21, 'Nasi Ayam Pedas', 340, 575.90, 87.8570, 27.6590, 12.4940, 5, 19),
(22, 'Mie Ayam', 265, 356.20, 23.3000, 14.5900, 22.7350, 6, 20),
(23, 'Nasi Lodeh', 290, 454.20, 72.3260, 14.6520, 12.0150, 6, 21),
(24, 'Nasi Sayur Bening', 310, 442.10, 80.6540, 13.3440, 7.5820, 6, 22),
(25, 'Nasi Tumis', 319, 570.64, 101.6383, 11.5291, 9.3019, 6, 23),
(26, 'Soto Ayam', 420, 616.90, 59.7540, 24.3940, 0.6980, 6, 24),
(27, 'Lalapan Ayam Goreng', 434, 1008.21, 124.5620, 34.8910, 8.6030, 7, 25),
(28, 'Lalapan Ayam Geprek', 485, 915.73, 146.0900, 30.6809, 21.9531, 7, 26),
(29, 'Lalapan Sosis Geprek', 446, 904.46, 132.4920, 24.6910, 29.5770, 7, 27),
(30, 'Lalapan Tahu / Tempe', 449, 776.74, 126.8700, 26.4940, 18.3850, 7, 28),
(31, 'Tahu Tek', 454, 1172.31, 140.2571, 41.4361, 48.3384, 7, 29),
(32, 'Lalapan Jamur Krispi', 390, 493.48, 107.1280, 10.0520, 1.2380, 8, 30),
(33, 'Lalapan Rempelo Ati', 356, 585.55, 96.8590, 24.2050, 10.5910, 8, 31),
(34, 'Lalapan Usus Ayam', 329, 711.64, 92.0060, 36.6630, 21.4820, 8, 32),
(35, 'Lalapan Wader', 329, 518.59, 90.3100, 19.7864, 7.8576, 8, 33),
(36, 'Ayam Bakar', 491, 834.22, 116.8540, 44.5264, 19.9172, 9, 34),
(37, 'Nasi Jagung', 402, 1130.02, 209.2325, 41.9770, 15.7515, 9, 35),
(38, 'Soto Daging', 380, 440.74, 55.2940, 18.0700, 11.6950, 9, 36),
(39, 'Lalapan Ayam Bakar', 305, 451.67, 74.0880, 23.1978, 5.3154, 10, 37),
(40, 'Lalapan Tahu + Tempe Bacem', 318, 469.73, 84.7575, 14.7884, 7.4788, 10, 38),
(41, 'Lalapan Telur', 307, 501.21, 84.2400, 14.7170, 10.1730, 10, 39),
(42, 'Nasi Timbel Ayam Laos', 378, 768.67, 21.9100, 26.2100, 7.1370, 10, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sumber`
--

CREATE TABLE `sumber` (
  `idsumber` int(11) NOT NULL,
  `nama_sumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sumber`
--

INSERT INTO `sumber` (`idsumber`, `nama_sumber`) VALUES
(1, 'TKPI 2017'),
(2, 'fatsecret'),
(3, 'DKBM Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kandungan_bahan`
--
ALTER TABLE `kandungan_bahan`
  ADD PRIMARY KEY (`idkandungan_bahan`),
  ADD UNIQUE KEY `idkandungan_bahan_UNIQUE` (`idkandungan_bahan`),
  ADD KEY `fk_id_sumber_idx` (`sumber_idsumber`);

--
-- Indeks untuk tabel `kantin`
--
ALTER TABLE `kantin`
  ADD PRIMARY KEY (`idkantin`);

--
-- Indeks untuk tabel `komposisi`
--
ALTER TABLE `komposisi`
  ADD PRIMARY KEY (`bahan_idkandungan`,`makanan_idmenu`),
  ADD KEY `fk_kandungan_bahan_has_menu_makanan_menu_makanan1_idx` (`makanan_idmenu`),
  ADD KEY `fk_kandungan_bahan_has_menu_makanan_kandungan_bahan1_idx` (`bahan_idkandungan`);

--
-- Indeks untuk tabel `menu_makanan`
--
ALTER TABLE `menu_makanan`
  ADD PRIMARY KEY (`idmenu_makanan`),
  ADD KEY `fk_menu_makanan_kantin_idx` (`kantin_idkantin`);

--
-- Indeks untuk tabel `sumber`
--
ALTER TABLE `sumber`
  ADD PRIMARY KEY (`idsumber`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kandungan_bahan`
--
ALTER TABLE `kandungan_bahan`
  MODIFY `idkandungan_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `kantin`
--
ALTER TABLE `kantin`
  MODIFY `idkantin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `menu_makanan`
--
ALTER TABLE `menu_makanan`
  MODIFY `idmenu_makanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kandungan_bahan`
--
ALTER TABLE `kandungan_bahan`
  ADD CONSTRAINT `fk_id_sumber` FOREIGN KEY (`sumber_idsumber`) REFERENCES `sumber` (`idsumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `komposisi`
--
ALTER TABLE `komposisi`
  ADD CONSTRAINT `fk_kandungan_bahan_has_menu_makanan_kandungan_bahan1` FOREIGN KEY (`bahan_idkandungan`) REFERENCES `kandungan_bahan` (`idkandungan_bahan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kandungan_bahan_has_menu_makanan_menu_makanan1` FOREIGN KEY (`makanan_idmenu`) REFERENCES `menu_makanan` (`idmenu_makanan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `menu_makanan`
--
ALTER TABLE `menu_makanan`
  ADD CONSTRAINT `fk_menu_makanan_kantin` FOREIGN KEY (`kantin_idkantin`) REFERENCES `kantin` (`idkantin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
