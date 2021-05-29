-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2021 pada 09.48
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
  `id_barang` varchar(4) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `id_jenis` varchar(20) NOT NULL,
  `harga` double(12,2) NOT NULL,
  `stok` int(4) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `beli`
--

CREATE TABLE `beli` (
  `id_beli` varchar(8) NOT NULL,
  `tanggal_beli` date NOT NULL,
  `id_user` varchar(8) NOT NULL,
  `total` double(12,2) NOT NULL,
  `status` enum('dipesan','dibayar','diterima','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id_beli` varchar(8) NOT NULL,
  `id_barang` varchar(9) NOT NULL,
  `jumlah_beli` int(8) NOT NULL,
  `sub_total` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id_jual` varchar(8) NOT NULL,
  `id_barang` varchar(8) NOT NULL,
  `jumlah_jual` int(10) NOT NULL,
  `sub_total` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(3) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jual`
--

CREATE TABLE `jual` (
  `id_jual` varchar(8) NOT NULL,
  `tanggal_jual` date NOT NULL,
  `id_user` varchar(8) NOT NULL,
  `nama_benda` varchar(20) NOT NULL,
  `alamat_kirim` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `total` double(12,2) NOT NULL,
  `status` enum('dipesan','dikirim','diterima','ditolak','dibayar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` varchar(8) NOT NULL,
  `waktu_keranjang` datetime NOT NULL,
  `id_user` varchar(8) NOT NULL,
  `id_barang` varchar(20) NOT NULL,
  `jumlah_jual` int(10) NOT NULL,
  `sub_total` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Admin', 'admin@gmail.com', 'default.png', '$2y$10$66ouz6vCWvwnuJBtx7B.uevW9EBjKrYq0pHSITDOD678qjudzmPE2', '6281336787990', 'Jl Admin 221', 1, 1, 1621959515, '-', '-'),
(2, 'Penjual', 'penjual@gmail.com', 'default.png', '$2y$10$osgIK9gqBofOfu/tgQB9bOkI5wrFit2lutKDGzty2D2lBOZTYNt8a', '6287880900655', 'Jl Penjual 887', 2, 1, 1621959595, '0007000100020003', 'BRI'),
(3, 'Pembeli', 'pembeli@gmail.com', 'default.png', '$2y$10$EtzFzgWxjmZb/WkpR2ovaOkcU6O.y1VhG.BHP/yrrDG917/ipFNYG', '6285000988123', 'Jl Pembeli 223', 3, 1, 1621959665, '-', '-');

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
(1, 1, 'Dashboard Admin', 'admin', 'fas fa-fw fa-tachometer-alt', 1, 1),
(2, 2, 'Dashboard Penjual', 'penjual', 'fas fa-fw fa-tachometer-alt', 1, 1),
(3, 1, 'My Profile', 'admin/my_profile', 'far fa-fw fa-user', 8, 1),
(4, 2, 'My Profile', 'penjual/my_profile', 'far fa-fw fa-user', 8, 1),
(5, 1, 'Edit Profile', 'admin/edit_profile', 'fa fa-fw fa-user-edit', 9, 1),
(6, 2, 'Edit Profile', 'penjual/edit_profile', 'fa fa-fw fa-user-edit', 9, 1),
(7, 1, 'Change Password', 'admin/change_password', 'fa fa-fw fa-key', 10, 1),
(8, 2, 'Change Password', 'penjual/change_password', 'fa fa-fw fa-key', 10, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `beli`
--
ALTER TABLE `beli`
  ADD PRIMARY KEY (`id_beli`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `jual`
--
ALTER TABLE `jual`
  ADD PRIMARY KEY (`id_jual`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

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
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
