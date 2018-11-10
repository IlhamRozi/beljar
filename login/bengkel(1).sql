-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10 Nov 2018 pada 03.33
-- Versi Server: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` int(10) NOT NULL,
  `id_pembayaran` int(10) NOT NULL,
  `id_service` int(10) NOT NULL,
  `tgl_jadwal` date NOT NULL,
  `ket_jadwal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluhuan`
--

CREATE TABLE IF NOT EXISTS `keluhuan` (
  `id_keluhan` int(10) NOT NULL,
  `ket_keluhan` varchar(50) NOT NULL,
  `id_kendaraan` int(10) NOT NULL,
  `id_pengguna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE IF NOT EXISTS `kendaraan` (
  `id_kendaraan` int(10) NOT NULL,
  `id_plg` int(10) NOT NULL,
  `no_pol` varchar(20) NOT NULL,
  `jarak` varchar(20) NOT NULL,
  `tipe_mtr` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komplain`
--

CREATE TABLE IF NOT EXISTS `komplain` (
  `id_komplain` int(10) NOT NULL,
  `id_service` int(10) NOT NULL,
  `ket_komplain` varchar(50) NOT NULL,
  `id_pembayaran` int(10) NOT NULL,
  `id_kendaraan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mekanik`
--

CREATE TABLE IF NOT EXISTS `mekanik` (
  `id_pengguna` int(10) NOT NULL,
  `nama_png` varchar(30) NOT NULL,
  `alamat_png` varchar(30) NOT NULL,
  `no_telp_png` int(20) NOT NULL,
  `level_png` int(10) NOT NULL,
  `file_pengguna` varchar(30) NOT NULL,
  `username_png` varchar(30) NOT NULL,
  `password_png` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_plg` int(10) NOT NULL,
  `nama_plg` varchar(30) NOT NULL,
  `alamat_plg` varchar(50) NOT NULL,
  `tt_plg` date NOT NULL,
  `no_tlp_plg` int(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `file_plg` varchar(20) NOT NULL,
  `username_plg` varchar(30) NOT NULL,
  `password_plg` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayran`
--

CREATE TABLE IF NOT EXISTS `pembayran` (
  `id_pembayaran` int(10) NOT NULL,
  `id_spare_part` int(10) NOT NULL,
  `id_plg` int(10) NOT NULL,
  `id_pengguna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sa`
--

CREATE TABLE IF NOT EXISTS `sa` (
  `id_pengguna` int(10) NOT NULL,
  `nama_png` varchar(30) NOT NULL,
  `alamat_png` varchar(30) NOT NULL,
  `no_telp_png` int(20) NOT NULL,
  `level_png` int(10) NOT NULL,
  `file_pengguna` varchar(30) NOT NULL,
  `username_png` varchar(30) NOT NULL,
  `password_png` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id_service` int(10) NOT NULL,
  `jenis_service` varchar(30) NOT NULL,
  `tgl_service` date NOT NULL,
  `id_keluhan` int(10) NOT NULL,
  `id_pengguna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sparepart`
--

CREATE TABLE IF NOT EXISTS `sparepart` (
  `id_sp` int(10) NOT NULL,
  `nama_sp` varchar(30) NOT NULL,
  `stok_sp` int(10) NOT NULL,
  `harga_sp` int(20) NOT NULL,
  `jumlah_sp` int(20) NOT NULL,
  `ket_sp` varchar(50) NOT NULL,
  `tgl_sp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `hak_akses` enum('admin','pemilik','mekanik','kepala mekanik','pelanggan','service advistor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `hak_akses`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a74389', 'pemilik'),
(2, 'admin', 'admin', '21232f297a57a5a74389', 'admin'),
(3, 'kepala mekanik', 'kepalamekanik', '3234b5aa194ad832ea55', 'kepala mekanik'),
(4, 'serviceadvistor', 'serviceadvistor', '31b0cb7ad75627371322', 'service advistor'),
(5, 'pelanggan', 'pelanggan', 'pelanggan', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
 ADD PRIMARY KEY (`id_jadwal`), ADD KEY `id_pembayaran` (`id_pembayaran`), ADD KEY `id_service` (`id_service`);

--
-- Indexes for table `keluhuan`
--
ALTER TABLE `keluhuan`
 ADD PRIMARY KEY (`id_keluhan`), ADD KEY `id_pengguna` (`id_pengguna`), ADD KEY `id_kendaraan` (`id_kendaraan`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
 ADD PRIMARY KEY (`id_kendaraan`), ADD KEY `id_plg` (`id_plg`);

--
-- Indexes for table `komplain`
--
ALTER TABLE `komplain`
 ADD PRIMARY KEY (`id_komplain`), ADD KEY `id_pembayaran_2` (`id_pembayaran`), ADD KEY `id_kendaraan` (`id_kendaraan`), ADD KEY `id_service` (`id_service`);

--
-- Indexes for table `mekanik`
--
ALTER TABLE `mekanik`
 ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
 ADD PRIMARY KEY (`id_plg`);

--
-- Indexes for table `pembayran`
--
ALTER TABLE `pembayran`
 ADD PRIMARY KEY (`id_pembayaran`), ADD KEY `id_plg` (`id_plg`), ADD KEY `id_spare_part` (`id_spare_part`);

--
-- Indexes for table `sa`
--
ALTER TABLE `sa`
 ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
 ADD PRIMARY KEY (`id_service`), ADD KEY `id_keluhan` (`id_keluhan`), ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `sparepart`
--
ALTER TABLE `sparepart`
 ADD PRIMARY KEY (`id_sp`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayran` (`id_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keluhuan`
--
ALTER TABLE `keluhuan`
ADD CONSTRAINT `keluhuan_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `keluhuan_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `sa` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`id_plg`) REFERENCES `pelanggan` (`id_plg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komplain`
--
ALTER TABLE `komplain`
ADD CONSTRAINT `komplain_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `komplain_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `komplain_ibfk_3` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayran` (`id_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayran`
--
ALTER TABLE `pembayran`
ADD CONSTRAINT `pembayran_ibfk_1` FOREIGN KEY (`id_plg`) REFERENCES `pelanggan` (`id_plg`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pembayran_ibfk_2` FOREIGN KEY (`id_spare_part`) REFERENCES `sparepart` (`id_sp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `service`
--
ALTER TABLE `service`
ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id_keluhan`) REFERENCES `keluhuan` (`id_keluhan`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `mekanik` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
