-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Bulan Mei 2021 pada 15.54
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

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

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_jenis`, `harga`, `stok`, `foto`) VALUES
('B001', 'kesing', 'kesing', 30000.00, 3, 'foto');

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

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
('J01', 'batrai');

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
  `id_user` varchar(8) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  `hak_akses` enum('petugas','pembeli','admin') NOT NULL,
  `nama_lengkap` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `user_name`, `email`, `password`, `hak_akses`, `nama_lengkap`, `alamat`, `no_telepon`) VALUES
('u0000001', 'agebimantara', 'muhammadfirmanagebimantara@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'admin', 'muhammad firman age ', 'jember', '089688492283'),
('U0000002', 'bima', 'bima', '1222222222222', '', 'bimaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'jember', '000000000000000');

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
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
