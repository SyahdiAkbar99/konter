-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2021 pada 11.34
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konter`
--
CREATE DATABASE IF NOT EXISTS `konter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `konter`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `jenis` varchar(128) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(4) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `kode`, `name`, `image`, `jenis`, `harga`, `stok`, `tanggal`, `user_id`) VALUES
(17, '10/07/2021 -BG- 002', 'Boult Audio ProBass Q Over-Ear Wireless Headphone', 'images(18)2.jpg', 'Headset', 150000, 46, '2021-07-10 08:23:17', 8),
(18, '10/07/2021 -BG- 003', 'Sound', 'images(19).jpg', 'Speaker', 200000, 18, '2021-07-10 08:29:55', 8),
(19, '10/07/2021 -BG- 004', 'Charger Original New 20W Iphone 12', '9f2a5959-9171-457a-9a02-834e4ea940743.jpg', 'Charger', 400000, 97, '2021-07-10 08:33:54', 8),
(20, '18/07/2021 -BG- 008', 'Earbuds White Support Distances', 'white-wireless-earbud-digital-earphones.png', 'Earbuds', 121000, 50, '2021-07-18 07:48:23', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

DROP TABLE IF EXISTS `barang_keluar`;
CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `barang_keluar`
--
DROP TRIGGER IF EXISTS `t__keluar`;
DELIMITER $$
CREATE TRIGGER `t__keluar` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
	UPDATE barang SET stok = stok - NEW.stok WHERE id = NEW.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `barang_masuk`
--
DROP TRIGGER IF EXISTS `t_masuk`;
DELIMITER $$
CREATE TRIGGER `t_masuk` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE barang SET stok = stok + NEW.stok WHERE id = NEW.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_banner`
--

DROP TABLE IF EXISTS `data_banner`;
CREATE TABLE `data_banner` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(256) NOT NULL,
  `descript` varchar(255) NOT NULL,
  `banner_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `urutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_banner`
--

INSERT INTO `data_banner` (`id`, `name`, `image`, `descript`, `banner_date`, `urutan`) VALUES
(5, 'ASEK', 'slide-02.jpg', 'Uhuh', '2021-07-10 08:38:11', 1),
(6, 'Yoi', 'alexandru-acea-GhwCef9VRr4-unsplash.jpg', 'Oke', '2021-07-10 08:38:46', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

DROP TABLE IF EXISTS `detail_transaksi`;
CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tanggal_detail` datetime NOT NULL,
  `image_bayar` varchar(256) DEFAULT NULL,
  `penjual_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `barang_id`, `name`, `stok`, `harga`, `image`, `total`, `status`, `tanggal_detail`, `image_bayar`, `penjual_id`, `transaksi_id`) VALUES
(23, 18, 'Sound', 2, 200000, 'images(19).jpg', 400000, 2, '2021-07-18 16:21:54', 'letter_S.png', 8, 17),
(24, 17, 'Boult Audio ProBass Q Over-Ear Wireless Headphone', 2, 150000, 'images(18)2.jpg', 300000, 2, '2021-07-18 16:15:34', 'letter_H1.png', 8, 17),
(25, 20, 'Earbuds White Support Distances', 2, 121000, 'white-wireless-earbud-digital-earphones.png', 242000, 2, '2021-07-18 16:31:52', 'letter_E1.png', 8, 18),
(26, 19, 'Charger Original New 20W Iphone 12', 2, 400000, '9f2a5959-9171-457a-9a02-834e4ea940743.jpg', 800000, 2, '2021-07-18 16:30:07', 'letter_C.png', 8, 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

DROP TABLE IF EXISTS `jenis`;
CREATE TABLE `jenis` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id`, `name`) VALUES
(1, 'Earphone Jack'),
(2, 'Mouse'),
(3, 'Electronic'),
(4, 'Electronic'),
(5, 'Electronic'),
(6, 'Vortex'),
(7, 'Minuman'),
(8, 'Electronic'),
(9, 'Headphone'),
(10, 'Handphone'),
(11, 'Handphone'),
(12, 'Laptop'),
(13, 'Laptop'),
(14, 'Charger'),
(15, 'Headset'),
(16, 'Charger'),
(17, 'Headset'),
(18, 'Speaker'),
(19, 'Charger'),
(20, 'Earbuds 2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kode` varchar(128) NOT NULL,
  `pembeli_id` int(11) DEFAULT NULL,
  `pembeli_name` varchar(128) DEFAULT NULL,
  `pembeli_email` varchar(256) DEFAULT NULL,
  `pembeli_bank` varchar(128) DEFAULT NULL,
  `pembeli_rekening` varchar(128) DEFAULT NULL,
  `pembeli_telp` char(14) DEFAULT NULL,
  `penjual_id` int(11) DEFAULT NULL,
  `penjual_name` varchar(128) DEFAULT NULL,
  `penjual_bank` varchar(128) DEFAULT NULL,
  `penjual_rekening` varchar(128) DEFAULT NULL,
  `penjual_telp` char(14) DEFAULT NULL,
  `total_transaksi` int(11) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode`, `pembeli_id`, `pembeli_name`, `pembeli_email`, `pembeli_bank`, `pembeli_rekening`, `pembeli_telp`, `penjual_id`, `penjual_name`, `penjual_bank`, `penjual_rekening`, `penjual_telp`, `total_transaksi`, `tanggal_transaksi`, `status`) VALUES
(17, '16/07/2021 -ELC- 001', 6, 'Firman', 'firmanagebimantara@gmail.com', 'BRI', '123456789123', '6289688492288', 8, 'Bimantara', 'BNI', '1032432432653601', '6289688492283', 700000, '2021-07-18 16:21:54', 2),
(18, '18/07/2021 -ELC- 001', 6, 'Firman', 'firmanagebimantara@gmail.com', 'BRI', '123456789123', '6289688492288', 8, 'Bimantara', 'BNI', '1032432432653601', '6289688492283', 1042000, '2021-07-18 16:31:52', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `no_telp` char(14) CHARACTER SET utf8mb4 NOT NULL,
  `alamat` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  `no_rekening` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `nama_bank` varchar(128) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `no_telp`, `alamat`, `role_id`, `is_active`, `date_created`, `no_rekening`, `nama_bank`) VALUES
(1, 'Admin', 'admin@gmail.com', 'avatar.png', '$2y$10$OCvmvrtPHbClwbGjqQY.4u1s2jGquK80tMMqd.nWlDNqBaxohnJXy', '6281336787990', 'Jl Admin 221', 1, 1, 1621959515, '-', '-'),
(6, 'Firman', 'firmanagebimantara@gmail.com', 'default.png', '$2y$10$9zXYUMUHizAe2rKqBqp51O3QnoX/KLFQB6bj7zPgHGODzTvZm3z4m', '6289688492288', 'Besuki', 3, 1, 1625844212, '123456789123', 'BRI'),
(8, 'Bimantara', 'muhfirmanagebimantara@gmail.com', '0_big.jpg', '$2y$10$4W7CkRAHmQW6BiSvJANvKOAHW75W3Sm/TYfidVL5XIUZe9MqSNrbG', '6289688492283', 'Situbondo', 2, 1, 1625905274, '1032432432653601', 'BNI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

DROP TABLE IF EXISTS `user_access_menu`;
CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `urutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`, `urutan`) VALUES
(1, 'Admin', 1),
(2, 'Penjual', 1),
(3, 'Pembeli', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Penjual'),
(3, 'Pembeli');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

DROP TABLE IF EXISTS `user_sub_menu`;
CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `urutan` int(11) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `urutan`, `is_active`) VALUES
(1, 1, 'Dashboard Admin', 'Admin', 'fas fa-fw fa-tachometer-alt', 1, 1),
(2, 2, 'Dashboard Penjual', 'Penjual', 'fas fa-fw fa-tachometer-alt', 1, 1),
(3, 1, 'My Profile', 'Admin/my_profile', 'far fa-fw fa-user', 8, 1),
(4, 2, 'My Profile', 'Penjual/my_profile', 'far fa-fw fa-user', 8, 1),
(5, 1, 'Edit Profile', 'Admin/edit_profile', 'fa fa-fw fa-user-edit', 9, 1),
(6, 2, 'Edit Profile', 'Penjual/edit_profile', 'fa fa-fw fa-user-edit', 9, 1),
(7, 1, 'Change Password', 'Admin/change_password', 'fa fa-fw fa-key', 10, 1),
(8, 2, 'Change Password', 'Penjual/change_password', 'fa fa-fw fa-key', 10, 1),
(9, 1, 'Kelola User', 'Admin/kelola_user', 'fas fa-fw fa-users', 2, 1),
(10, 1, 'Kelola Banner', 'Admin/kelola_banner', 'fas fa-fw fa-folder', 3, 1),
(11, 2, 'Kelola Produk', 'Penjual/kelola_produk', 'fas fa-fw fa-toolbox', 2, 1),
(12, 2, 'Riwayat Penjualan', 'Penjual/riwayat_penjualan', 'fas fa-fw fa-money-bill', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_banner`
--
ALTER TABLE `data_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `penjual_id` (`penjual_id`),
  ADD KEY `transaksi_id` (`transaksi_id`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjual_id` (`penjual_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `data_banner`
--
ALTER TABLE `data_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
