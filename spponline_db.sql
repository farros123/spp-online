-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 01:07 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spponline_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `description` text,
  `input_date` timestamp NULL DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `nama_lengkap`, `password`, `email`, `description`, `input_date`, `last_update`) VALUES
(1, 'adminfarros', 'Admin Farros', 'b8962c9ab4478bf37d109e59d8722de3bf86c41c', 'adminfarros@example.com', '<p>Admin pertama</p>', '2018-12-30 21:32:54', '2021-03-07 08:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('019bafa9c08acdbb373520ad77b20ccac860b4f2', '::1', 1553532150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333533313938363b),
('29b369c036df91d05f0d974a4c66629cf7ee7377', '::1', 1553532455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333533323435323b);

-- --------------------------------------------------------

--
-- Table structure for table `pembangunan`
--

CREATE TABLE `pembangunan` (
  `kode_bayar` varchar(11) NOT NULL,
  `siswa_nisn` int(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `jmlh_byr` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembangunan`
--

INSERT INTO `pembangunan` (`kode_bayar`, `siswa_nisn`, `tgl_byr`, `jmlh_byr`, `bendahara`, `bukti_bayar`) VALUES
('BGN001', 1440, '2021-03-03', 100000, 'dea', 'BGN001'),
('BGN002', 1150, '2021-03-18', 100000, 'dea', 'BGN002');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `kode_keluar` varchar(11) NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `ket` text NOT NULL,
  `biaya` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`kode_keluar`, `tgl_pengeluaran`, `ket`, `biaya`, `bendahara`, `bukti_bayar`) VALUES
('KLR002', '2019-03-25', 'Contoh Pengeluaran', 50000, 'Upik', '');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `kode_siswa` varchar(11) NOT NULL,
  `siswa_nisn` varchar(11) NOT NULL,
  `siswa_nama` varchar(255) DEFAULT NULL,
  `siswa_tmpt_lhr` varchar(45) DEFAULT NULL,
  `siswa_tgl_lhr` date DEFAULT NULL,
  `siswa_jk` varchar(11) NOT NULL,
  `siswa_tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`kode_siswa`, `siswa_nisn`, `siswa_nama`, `siswa_tmpt_lhr`, `siswa_tgl_lhr`, `siswa_jk`, `siswa_tgl_masuk`) VALUES
('SSW001', '1440', 'afgan abigail', 'bantul', '2005-01-14', 'laki-laki', '2021-03-24'),
('SSW002', '1150', 'Gojo satoru', 'shibuya', '2002-08-09', 'laki-laki', '2018-12-03');

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `kode_bayar` varchar(11) NOT NULL,
  `kode_siswa` varchar(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `biaya_spp` double NOT NULL,
  `total_biaya` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`kode_bayar`, `kode_siswa`, `tgl_byr`, `biaya_spp`, `total_biaya`, `bendahara`, `bukti_bayar`) VALUES
('SPP001', 'SSW001', '2021-03-18', 500, 500, 'dea', 'SPP001'),
('SPP002', 'SSW002', '2019-01-03', 225000, 225000, 'dea', 'SPP002');

-- --------------------------------------------------------

--
-- Table structure for table `spp_detail`
--

CREATE TABLE `spp_detail` (
  `kode_bayar` varchar(11) NOT NULL,
  `kode_siswa` varchar(11) NOT NULL,
  `bulan` varchar(12) NOT NULL,
  `tahun` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp_detail`
--

INSERT INTO `spp_detail` (`kode_bayar`, `kode_siswa`, `bulan`, `tahun`) VALUES
('SPP001', 'SSW001', 'Januari', '2021'),
('SPP001', 'SSW001', 'November', '2021'),
('SPP002', 'SSW002', 'Januari', '2019');

-- --------------------------------------------------------

--
-- Table structure for table `sumbangan`
--

CREATE TABLE `sumbangan` (
  `kode_bayar` varchar(11) NOT NULL,
  `kode_siswa` varchar(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `bayar_sumbangan` double NOT NULL,
  `total_biaya` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `pembangunan`
--
ALTER TABLE `pembangunan`
  ADD PRIMARY KEY (`kode_bayar`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`kode_keluar`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`kode_siswa`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`kode_bayar`);

--
-- Indexes for table `sumbangan`
--
ALTER TABLE `sumbangan`
  ADD PRIMARY KEY (`kode_bayar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
