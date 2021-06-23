-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2021 pada 20.18
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

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
(1, '22/06/2021 -BG- 001', 'Earphone', 'letter_E.png', 'Earphone Jack', 25000, 10, '2021-06-22 14:10:37', 2),
(2, '22/06/2021 -BG- 002', 'Mouse', 'letter_M.png', 'Mouse', 16000, 9, '2021-06-22 14:11:13', 2),
(3, '22/06/2021 -BG- 003', 'Laptop', 'letter_L.png', 'Electronic', 5000000, 15, '2021-06-22 14:51:41', 2),
(6, '23/06/2021 -BG- 001', 'Vortex Vanwuisher', 'letter_V.png', 'Vortex', 23000, 10, '2021-06-23 13:11:22', 2),
(7, '23/06/2021 -BG- 002', 'Lasegar', 'letter_L1.png', 'Minuman', 14000, 20, '2021-06-23 13:13:04', 2),
(8, '23/06/2021 -BG- 003', 'Audiotron', 'letter_A.png', 'Electronic', 15000, 15, '2021-06-23 13:13:56', 2),
(9, '23/06/2021 -BG- 004', 'Headphone', 'letter_H.png', 'Headphone', 27000, 16, '2021-06-23 13:15:12', 2),
(10, '23/06/2021 -BG- 005', 'Advan S7', 'letter_A1.png', 'Handphone', 1500000, 20, '2021-06-23 13:19:59', 2),
(11, '23/06/2021 -BG- 006', 'Samsung J5', 'letter_S.png', 'Handphone', 500000, 15, '2021-06-23 13:20:22', 2),
(12, '23/06/2021 -BG- 007', 'Asus Tuf 1212', 'letter_A2.png', 'Laptop', 5000000, 13, '2021-06-23 15:38:26', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `barang_keluar`
--
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

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `barang_masuk`
--
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
(1, 'Slide-01', 'slide-001.jpg', 'This is for you', '2021-06-20 13:30:42', 1),
(2, 'Slide-02', 'slide-002.jpg', 'Yeah you can see this', '2021-06-20 13:28:19', 2),
(3, 'Slide-03', 'slide-003.jpg', 'Now you can see me', '2021-06-20 13:29:04', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

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
  `penjual_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `barang_id`, `name`, `stok`, `harga`, `image`, `total`, `status`, `tanggal_detail`, `penjual_id`, `transaksi_id`) VALUES
(5, 1, 'Earphone', 2, 25000, 'letter_F.png', 50000, 1, '2021-06-24 00:42:55', 2, 3),
(6, 12, 'Asus Tuf 1212', 2, 5000000, 'letter_T.png', 10000000, 1, '2021-06-24 00:42:25', 4, 3),
(7, 2, 'Mouse', 1, 16000, 'letter_R.png', 16000, 1, '2021-06-24 00:58:07', 2, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

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
(12, 'Laptop');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

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
  `penjual_rekening` int(128) DEFAULT NULL,
  `penjual_telp` char(14) DEFAULT NULL,
  `total_transaksi` int(11) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode`, `pembeli_id`, `pembeli_name`, `pembeli_email`, `pembeli_bank`, `pembeli_rekening`, `pembeli_telp`, `penjual_id`, `penjual_name`, `penjual_bank`, `penjual_rekening`, `penjual_telp`, `total_transaksi`, `tanggal_transaksi`, `status`) VALUES
(3, '23/06/2021 -ELC- 001', 3, 'Pembeli', 'pembeli@gmail.com', 'BNI', '0111099901110888', '6285000988123', 2, 'Penjual', 'BRI', 2147483647, '6287880900666', 10050000, '2021-06-24 00:42:55', 1),
(4, '24/06/2021 -ELC- 001', 3, 'Pembeli', 'pembeli@gmail.com', 'BNI', '0111099901110888', '6285000988123', 2, 'Penjual', 'BRI', 2147483647, '6287880900666', 16000, '2021-06-24 00:58:07', 1),
(5, '24/06/2021 -ELC- 002', 3, 'Pembeli', 'pembeli@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

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
(2, 'Penjual', 'penjual@gmail.com', 'avatar4.png', '$2y$10$xJB2/kbPXo6koCs9N0Tg1e9zMtEKNDWcK2KZghxeDm9RZ5UxdVJWa', '6287880900666', 'Jl Penjual 887', 2, 1, 1621959595, '0007000100020003', 'BRI'),
(3, 'Pembeli', 'pembeli@gmail.com', 'avatar3.png', '$2y$10$fE9TFkngBIsAWKOpGvj0Y.LOcDcVFjc0GMjax2RGM3fhyqaa8plci', '6285000988000', 'Jl Pembeli 223', 3, 1, 1621959665, '-', '-'),
(4, 'Veronica', 'veronica11@gmail.com', 'user3-128x128.jpg', '$2y$10$pGw20NXc.G984ZrI9Itv7O5gysacVUmBfhOnZGF2R4ITqZiI.tTKG', '62628777000911', 'Jl Kutai No 9A Tamanbaru Banyuwangi', 2, 1, 1624462602, '0021001200110005', 'BANK PEMBANGUNAN DAERAH JAWA TIMUR'),
(5, 'Vica', 'vica@gmail.com', 'default.png', '$2y$10$uDgLOLfkb0zuV9CLAs3cj.4ZLU8vYsqVnsPsmkbcvpN4HUPaDS.n.', '62897881231236', 'Jl Kutai No 9B Tamanbaru Banyuwangi', 3, 1, 1624472045, '-', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id_detail`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `data_banner`
--
ALTER TABLE `data_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
