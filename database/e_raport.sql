-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jan 2024 pada 15.06
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_raport`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `idguru` int(4) NOT NULL,
  `nip` varchar(25) DEFAULT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `tmp_lhr` varchar(128) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`idguru`, `nip`, `nama`, `tmp_lhr`, `tgl_lhr`, `jk`, `alamat`) VALUES
(23, '170512345678901234', 'Budi Santoso', 'Padang', '1978-05-17', 'L', 'Jl. Melati No. 12, Desa Suka Maju, Padang Pariaman'),
(24, '180623456789012345', 'Siti Rahayu', 'Bukittinggi', '1979-06-18', 'P', 'Jl. Anggrek No. 8, Desa Bahagia, Padang Pariaman'),
(25, '190724567890123456', 'Agus Setiawan', 'Solok', '1980-07-19', 'L', ' Jl. Mawar No. 25, Desa Damai, Padang Pariaman'),
(26, '200830678901234567', 'Rina Wulandari', 'Payakumbuh', '1971-08-20', 'P', 'Dusun Sungai Tarab, Sungai Limau, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman'),
(27, '210928789012345678', 'Dedi Saputra', 'Sawahlunto', '1972-09-21', 'L', 'Dusun Bungo, Batu Ampar, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman'),
(28, '220103890123456789', 'Maya Sari', 'Pariaman', '1973-10-22', 'P', 'Dusun Koto Tangah, V Koto, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman'),
(29, '230204901234567890', 'Fauzi Rahman', ' Lubuk Basung', '1974-11-23', 'L', 'Dusun Simpang Jorong, Sungai Geringging, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman'),
(30, '240305012345678901', 'Dewi Anggraini', 'Dewi Anggraini', '1975-12-24', 'P', 'Dusun Batu Balai, Sungai Limau, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman'),
(31, '250406123456789012', 'Agung Wibowo', 'Dharmasraya', '1976-01-25', 'L', 'Dusun Banda Gadang, Sungai Pinang, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman'),
(32, '260507234567890123', 'Rina Fitriani', 'Tanah Datar', '1977-02-26', 'P', 'Dusun Koto Tangah, Batang Anai, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `idkelas` int(4) NOT NULL,
  `kelas_kd` varchar(10) DEFAULT NULL,
  `kelas_nama` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`idkelas`, `kelas_kd`, `kelas_nama`) VALUES
(10, 'K11IPS1', 'XI IPS 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `idmapel` int(4) NOT NULL,
  `mapel_kd` varchar(10) DEFAULT NULL,
  `mapel_nama` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`idmapel`, `mapel_kd`, `mapel_nama`) VALUES
(6, 'PA01BP02', 'Pendidikan Agam dan Budi Pekerti'),
(7, 'PP03KN04', 'Pendidikan Pancasila dan Kewarganegaraan'),
(8, 'BI05ID06', 'Bahasa Indonesia'),
(9, 'Matematika', 'MT07KA08'),
(10, 'SE09HI10', 'Sejarah Indonesia'),
(11, 'BI11EN12', 'Bahasa Inggris '),
(12, 'SE13BU14', 'Seni Budaya'),
(13, 'PE15NJ16', 'Pendidikan Jasmani, Olahraga, dan Kesehatan'),
(14, 'PR17KW18', 'Prakarya dan Kewirausahaan '),
(15, 'EK19ON20', 'Ekonomi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengajar`
--

CREATE TABLE `mengajar` (
  `idmengajar` int(4) NOT NULL,
  `idtahun_akademik` int(11) NOT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `idguru` int(4) NOT NULL,
  `idmapel` int(4) NOT NULL,
  `idkelas` int(4) NOT NULL,
  `kkm` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `mengajar`
--

INSERT INTO `mengajar` (`idmengajar`, `idtahun_akademik`, `semester`, `idguru`, `idmapel`, `idkelas`, `kkm`) VALUES
(50, 9, 'Genap', 23, 6, 10, 73),
(51, 9, 'Genap', 24, 7, 10, 73),
(52, 9, 'Genap', 25, 8, 10, 73),
(53, 9, 'Genap', 26, 9, 10, 73),
(54, 9, 'Genap', 27, 10, 10, 73),
(55, 9, 'Genap', 28, 11, 10, 73),
(56, 9, 'Genap', 29, 12, 10, 73),
(57, 9, 'Genap', 30, 13, 10, NULL),
(58, 9, 'Genap', 31, 14, 10, 73),
(59, 9, 'Genap', 32, 15, 10, 73);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `idnilai` int(11) NOT NULL,
  `idtahun_akademik` int(4) NOT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `idkelas` int(4) NOT NULL,
  `idmapel` int(4) NOT NULL,
  `idsiswa` int(4) NOT NULL,
  `nilai_tp1` int(4) DEFAULT NULL,
  `nilai_tp2` int(4) DEFAULT NULL,
  `nilai_tp3` int(4) DEFAULT NULL,
  `nilai_tp4` int(4) DEFAULT NULL,
  `nilai_tp5` int(4) DEFAULT NULL,
  `nilai_tp6` int(4) DEFAULT NULL,
  `nilai_tp7` int(4) DEFAULT NULL,
  `rata_tp` int(4) DEFAULT NULL,
  `nilai_uh1` int(4) DEFAULT NULL,
  `nilai_uh2` int(4) DEFAULT NULL,
  `nilai_uh3` int(4) DEFAULT NULL,
  `nilai_uh4` int(4) DEFAULT NULL,
  `nilai_uh5` int(4) DEFAULT NULL,
  `nilai_uh6` int(4) DEFAULT NULL,
  `nilai_uh7` int(4) DEFAULT NULL,
  `rata_uh` int(4) DEFAULT NULL,
  `nilai_pts` int(4) DEFAULT NULL,
  `nilai_uas` int(4) DEFAULT NULL,
  `nilai_akhir` int(4) DEFAULT NULL,
  `nilai_huruf` enum('A','B','C','D','E') DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`idnilai`, `idtahun_akademik`, `semester`, `idkelas`, `idmapel`, `idsiswa`, `nilai_tp1`, `nilai_tp2`, `nilai_tp3`, `nilai_tp4`, `nilai_tp5`, `nilai_tp6`, `nilai_tp7`, `rata_tp`, `nilai_uh1`, `nilai_uh2`, `nilai_uh3`, `nilai_uh4`, `nilai_uh5`, `nilai_uh6`, `nilai_uh7`, `rata_uh`, `nilai_pts`, `nilai_uas`, `nilai_akhir`, `nilai_huruf`, `deskripsi`) VALUES
(105, 9, 'Genap', 10, 6, 23, 75, 77, 80, 76, 79, 74, 78, 77, 78, 82, 85, 80, 83, 79, 82, 81, 85, 88, 83, 'B', 'Baik'),
(106, 9, 'Genap', 10, 6, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(107, 9, 'Genap', 10, 6, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(108, 9, 'Genap', 10, 6, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(109, 9, 'Genap', 10, 6, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(110, 9, 'Genap', 10, 6, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(111, 9, 'Genap', 10, 6, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(112, 9, 'Genap', 10, 6, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(113, 9, 'Genap', 10, 6, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(114, 9, 'Genap', 10, 6, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(115, 9, 'Genap', 10, 7, 23, 82, 80, 85, 88, 81, 83, 87, 84, 85, 83, 87, 89, 86, 84, 0, 86, 87, 89, 86, 'B', 'Baik'),
(116, 9, 'Genap', 10, 7, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(117, 9, 'Genap', 10, 7, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(118, 9, 'Genap', 10, 7, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(119, 9, 'Genap', 10, 7, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(120, 9, 'Genap', 10, 7, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(121, 9, 'Genap', 10, 7, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(122, 9, 'Genap', 10, 7, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(123, 9, 'Genap', 10, 7, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(124, 9, 'Genap', 10, 7, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(125, 9, 'Genap', 10, 9, 23, 88, 90, 87, 89, 91, 86, 88, 88, 87, 89, 92, 88, 90, 91, 86, 89, 90, 92, 90, 'B', 'Baik'),
(126, 9, 'Genap', 10, 9, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(127, 9, 'Genap', 10, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(128, 9, 'Genap', 10, 9, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(129, 9, 'Genap', 10, 9, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(130, 9, 'Genap', 10, 9, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(131, 9, 'Genap', 10, 9, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(132, 9, 'Genap', 10, 9, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(133, 9, 'Genap', 10, 9, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(134, 9, 'Genap', 10, 9, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(135, 9, 'Genap', 10, 10, 23, 75, 77, 79, 74, 78, 80, 76, 77, 82, 79, 84, 81, 85, 80, 83, 82, 88, 85, 83, 'B', 'Baik'),
(136, 9, 'Genap', 10, 10, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(137, 9, 'Genap', 10, 10, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(138, 9, 'Genap', 10, 10, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(139, 9, 'Genap', 10, 10, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(140, 9, 'Genap', 10, 10, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(141, 9, 'Genap', 10, 10, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(142, 9, 'Genap', 10, 10, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(143, 9, 'Genap', 10, 10, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(144, 9, 'Genap', 10, 10, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(145, 9, 'Genap', 10, 8, 23, 75, 77, 79, 74, 78, 80, 76, 77, 82, 79, 84, 81, 85, 80, 83, 82, 85, 88, 83, 'B', 'Baik'),
(146, 9, 'Genap', 10, 8, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(147, 9, 'Genap', 10, 8, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(148, 9, 'Genap', 10, 8, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(149, 9, 'Genap', 10, 8, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(150, 9, 'Genap', 10, 8, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(151, 9, 'Genap', 10, 8, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(152, 9, 'Genap', 10, 8, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(153, 9, 'Genap', 10, 8, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(154, 9, 'Genap', 10, 8, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(155, 9, 'Genap', 10, 11, 23, 89, 87, 91, 88, 90, 92, 86, 89, 85, 88, 91, 86, 89, 84, 89, 87, 89, 91, 89, 'B', 'Baik'),
(156, 9, 'Genap', 10, 11, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(157, 9, 'Genap', 10, 11, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(158, 9, 'Genap', 10, 11, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(159, 9, 'Genap', 10, 11, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(160, 9, 'Genap', 10, 11, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(161, 9, 'Genap', 10, 11, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(162, 9, 'Genap', 10, 11, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(163, 9, 'Genap', 10, 11, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(164, 9, 'Genap', 10, 11, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(165, 9, 'Genap', 10, 12, 23, 72, 74, 77, 73, 78, 79, 75, 75, 74, 78, 80, 76, 79, 75, 77, 77, 82, 80, 79, 'C', 'Cukup Baik'),
(166, 9, 'Genap', 10, 12, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(167, 9, 'Genap', 10, 12, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(168, 9, 'Genap', 10, 12, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(169, 9, 'Genap', 10, 12, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(170, 9, 'Genap', 10, 12, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(171, 9, 'Genap', 10, 12, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(172, 9, 'Genap', 10, 12, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(173, 9, 'Genap', 10, 12, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(174, 9, 'Genap', 10, 12, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(175, 9, 'Genap', 10, 14, 23, 85, 87, 89, 86, 88, 84, 87, 87, 86, 88, 90, 87, 89, 85, 88, 88, 88, 85, 87, 'B', 'Baik'),
(176, 9, 'Genap', 10, 14, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(177, 9, 'Genap', 10, 14, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(178, 9, 'Genap', 10, 14, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(179, 9, 'Genap', 10, 14, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(180, 9, 'Genap', 10, 14, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(181, 9, 'Genap', 10, 14, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(182, 9, 'Genap', 10, 14, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(183, 9, 'Genap', 10, 14, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(184, 9, 'Genap', 10, 14, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(185, 9, 'Genap', 10, 15, 23, 89, 91, 88, 90, 96, 86, 90, 90, 90, 92, 94, 98, 93, 87, 90, 92, 90, 92, 91, 'A', 'Sangat Baik'),
(186, 9, 'Genap', 10, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(187, 9, 'Genap', 10, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(188, 9, 'Genap', 10, 15, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(189, 9, 'Genap', 10, 15, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(190, 9, 'Genap', 10, 15, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(191, 9, 'Genap', 10, 15, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(192, 9, 'Genap', 10, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(193, 9, 'Genap', 10, 15, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(194, 9, 'Genap', 10, 15, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_sekolah`
--

CREATE TABLE `profil_sekolah` (
  `idprofil_sekolah` int(4) NOT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `status` enum('Negeri','Swasta') DEFAULT NULL,
  `nama_kepsek` varchar(128) DEFAULT NULL,
  `nip_kepsek` varchar(25) DEFAULT NULL,
  `akreditasi` enum('kosong','A','B','C') DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `provinsi` varchar(128) DEFAULT NULL,
  `kabupaten` varchar(128) DEFAULT NULL,
  `kecamatan` varchar(128) DEFAULT NULL,
  `kelurahan` varchar(128) DEFAULT NULL,
  `dusun` varchar(128) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `alamat` varchar(256) DEFAULT NULL,
  `kodepos` varchar(10) DEFAULT NULL,
  `lintang` varchar(15) DEFAULT NULL,
  `bujur` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `profil_sekolah`
--

INSERT INTO `profil_sekolah` (`idprofil_sekolah`, `nama`, `npsn`, `status`, `nama_kepsek`, `nip_kepsek`, `akreditasi`, `logo`, `provinsi`, `kabupaten`, `kecamatan`, `kelurahan`, `dusun`, `rt`, `rw`, `alamat`, `kodepos`, `lintang`, `bujur`) VALUES
(1, 'SMAN 1 2X11  KAYU TANAM', '10305560', 'Negeri', 'Sunaryo, S.Pd., M.Pd.', '-', 'A', 'logo-sekolah.png', 'Sumatera Barang', 'Padang Pariaman', 'Kec. Pucakwangi', '2 X 11 KAYU TANAM', 'KAYU TANAM', '0', '0', 'Dusun Pasir Tengah, Kayu Tanam, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman, Sumatera Bara', '25585', '0', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rombel`
--

CREATE TABLE `rombel` (
  `idrombel` int(4) NOT NULL,
  `idwali_kelas` int(4) NOT NULL,
  `idsiswa` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `rombel`
--

INSERT INTO `rombel` (`idrombel`, `idwali_kelas`, `idsiswa`) VALUES
(37, 8, 23),
(38, 8, 24),
(39, 8, 25),
(40, 8, 26),
(41, 8, 27),
(42, 8, 28),
(43, 8, 29),
(44, 8, 30),
(45, 8, 31),
(46, 8, 32);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int(4) NOT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `nis` varchar(5) DEFAULT NULL,
  `nisn` varchar(15) DEFAULT NULL,
  `nik` varchar(25) DEFAULT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `tmp_lhr` varchar(128) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `hobi` varchar(128) DEFAULT NULL,
  `citacita` varchar(128) DEFAULT NULL,
  `sts_anak` enum('Anak Kandung','Anak Tiri','Anak Angkat') DEFAULT NULL,
  `jml_sdr` int(2) DEFAULT NULL,
  `anak_ke` int(2) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nik_ayah` varchar(25) DEFAULT NULL,
  `nama_ayah` varchar(128) DEFAULT NULL,
  `pend_ayah` varchar(50) DEFAULT NULL,
  `pekr_ayah` varchar(50) DEFAULT NULL,
  `nik_ibu` varchar(25) DEFAULT NULL,
  `nama_ibu` varchar(128) DEFAULT NULL,
  `pend_ibu` varchar(50) DEFAULT NULL,
  `pekr_ibu` varchar(50) DEFAULT NULL,
  `alamat_ortu` text DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `status` enum('Aktif','Nonaktif','Pindah','Keluar','Alumni') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`idsiswa`, `foto`, `nis`, `nisn`, `nik`, `nama`, `tmp_lhr`, `tgl_lhr`, `jk`, `hobi`, `citacita`, `sts_anak`, `jml_sdr`, `anak_ke`, `alamat`, `nik_ayah`, `nama_ayah`, `pend_ayah`, `pekr_ayah`, `nik_ibu`, `nama_ibu`, `pend_ibu`, `pekr_ibu`, `alamat_ortu`, `tgl_masuk`, `tgl_keluar`, `status`) VALUES
(23, NULL, '12345', '2005034567', '', 'Putra Pratama', 'Bukittinggi', '2006-03-15', 'L', '', '', NULL, 0, 0, 'Dusun Tanjung Sari, Jorong VII, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(24, NULL, '23456', '2004112345', '', 'Dewi Kartika', 'Payakumbuh', '2004-11-25', 'P', '', '', NULL, 0, 0, 'Dusun Sungai Pinang, Jorong IX, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(25, NULL, '34567', '2002083456', '', 'Irfan Ramadhan', 'Padang', '2002-08-10', 'L', '', '', NULL, 0, 0, 'Dusun Bukit Tinggi, Jorong III, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman\r\n\r\n', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(26, NULL, '45678', '2005012345', '', 'Rina Fitriani', 'Pariaman', '2005-01-20', 'P', '', '', NULL, 0, 0, 'Dusun Batang Anai, Jorong V, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(27, NULL, '56789', ' 200612567', '', 'Dodi Prasetyo', 'Lubuk Basung', '2006-12-05', 'L', '', '', NULL, 0, 0, 'Dusun Batu Ampar, Jorong II, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(28, NULL, '67890', '2007056789', '', 'Maya Sari', 'Solok', '2007-05-18', 'P', '', '', NULL, 0, 0, 'Dusun V Koto, Jorong VI, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(29, NULL, '78901', '7890123456', '', 'Faisal Ramadhan', 'Tanah Datar', '2006-09-22', 'L', '', '', NULL, 0, 0, 'Dusun Sungai Geringging, Jorong I, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(30, NULL, '89012', '2003128901', '', 'Siti Rahayu', 'Dharmasraya', '2003-12-14', 'P', '', '', NULL, 0, 0, 'Dusun Sungai Limau, Jorong VIII, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(31, NULL, '90123', '2006049012', '', 'Iwan Setiawan', 'Solok Selatan', '2006-04-30', 'L', '', '', NULL, 0, 0, 'Dusun Sungai Pinang, Jorong IV, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif'),
(32, NULL, '01234', '2007080123', '', 'Yulia Fitriani', 'Agam', '2007-08-08', 'P', '', '', NULL, 0, 0, 'Dusun Batang Anai, Jorong X, Kec. 2 X 11 Kayu Tanam, Kabupaten Padang Pariaman', '', '', NULL, '', '', '', NULL, '', '', '2024-01-01', NULL, 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `idtahun_akademik` int(4) NOT NULL,
  `tahun_akademik` varchar(10) DEFAULT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `semester_aktif` tinyint(4) DEFAULT NULL,
  `tempat` varchar(128) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`idtahun_akademik`, `tahun_akademik`, `semester`, `semester_aktif`, `tempat`, `tanggal`) VALUES
(9, '2022-2023', 'Genap', 1, 'Padang', '2024-01-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `user_password` varchar(128) DEFAULT NULL,
  `user_fullname` varchar(128) DEFAULT NULL,
  `user_type` enum('super_user','guru','siswa') DEFAULT NULL,
  `is_block` tinyint(1) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`idusers`, `user_name`, `user_password`, `user_fullname`, `user_type`, `is_block`, `create_at`, `update_at`, `create_by`, `update_by`) VALUES
(1, 'admin', '$2y$10$ePYvbmZHzPxjanA.aCprMO9p0Z7Q9JgzlzyCevd7Jqf.Wb2huO8t.', 'Admin', 'super_user', 0, 1556509343, 1586934959, 1, 1),
(61, '170512345678901234', '$2y$10$fnbJdd.DUCCs8/ClFHlX9e5jl48WDNOvPFI4.guaO7SQQCy60SgG2', 'Budi Santoso', 'guru', 0, 1704114414, NULL, 1, NULL),
(62, '180623456789012345', '$2y$10$ofuaoiwCqg5PF2UvSvWm2.BVVcMig4FyTmPHv89EIshCmkDcoizKy', 'Siti Rahayu', 'guru', 0, 1704114415, NULL, 1, NULL),
(63, '12345', '$2y$10$Y6Aov3TDFvl4QCTOGlfSbOfy6EtK3mkVRWb53sWbzEfDcp52.Qtvi', 'Putra Pratama', 'siswa', 0, 1704116132, NULL, 1, NULL),
(64, '23456', '$2y$10$vbfoDR6vCHLdW1dBLmQemeUR6a0LpGC373708PQnf44LNL6LEG9GC', 'Dewi Kartika', 'siswa', 0, 1704116132, NULL, 1, NULL),
(65, '34567', '$2y$10$yZtibmd9jxX9OnRt1.uaZ.B9Zrp.UeZ0widv8a0o4E0IAgsQte.Bi', 'Irfan Ramadhan', 'siswa', 0, 1704116132, NULL, 1, NULL),
(66, '45678', '$2y$10$pBf4NbSg.goC2eG8QsmcDOgjfKfn2cSF6pOEM0INJaOamol/EbyVG', 'Rina Fitriani', 'siswa', 0, 1704116132, NULL, 1, NULL),
(67, '56789', '$2y$10$aev5JWbkL/2N/cbUyEjJ3OsegfXgISnMQQvmQfiP9ul5BwEUkNPjq', 'Dodi Prasetyo', 'siswa', 0, 1704116132, NULL, 1, NULL),
(68, '67890', '$2y$10$tk2gmyyCx9wCm745AxzQAe1JwTm5zoJ173p3FuN5smhZsySqUyLRW', 'Maya Sari', 'siswa', 0, 1704116132, NULL, 1, NULL),
(69, '78901', '$2y$10$u1yqXoB3xlGs4gPWafMuNusyZRShzO8mWrWZ1SQSMoM5FY8v1oRzu', 'Faisal Ramadhan', 'siswa', 0, 1704116132, NULL, 1, NULL),
(70, '89012', '$2y$10$6Ap9vFqDchqgNxuOlM1mlOrHRWAh8b1OewSjGF8MXp.TT7kmof...', 'Siti Rahayu', 'siswa', 0, 1704116132, NULL, 1, NULL),
(71, '90123', '$2y$10$8viCSlZGnLnkiWMoHIo1pOcvNKZJlXOc0OEPyd8SGVUiyrUIpGNKu', 'Iwan Setiawan', 'siswa', 0, 1704116132, NULL, 1, NULL),
(72, '01234', '$2y$10$ISWsehLkv7zTQRrm9CByiOQAmp90tGhxzviQvkzYh66EnoeviZZOW', 'Yulia Fitriani', 'siswa', 0, 1704116132, NULL, 1, NULL),
(73, '190724567890123456', '$2y$10$VplBFA7oTZL3A4wlz8NeoeckAF7tW/d7mnlPXqkNFkBRMYW5TCkJu', 'Agus Setiawan', 'guru', 0, 1704116354, NULL, 1, NULL),
(74, '200830678901234567', '$2y$10$6HHIkAFEKTG3Z7pasHn4COI3.UJVnxujgvcKZLuMqODkRRv8yl/UO', 'Rina Wulandari', 'guru', 0, 1704116354, NULL, 1, NULL),
(75, '210928789012345678', '$2y$10$WwYWjEOC1i3OKL0/8pzv/eQjNhSRWVvGEw3ZfnogoVYhie123gvOq', 'Dedi Saputra', 'guru', 0, 1704116354, NULL, 1, NULL),
(76, '220103890123456789', '$2y$10$4ltRgXS7uII0oYI2CJ5ws.2xolD.p.qjcAj1tIxbdSAqt/.p3.zta', 'Maya Sari', 'guru', 0, 1704116354, NULL, 1, NULL),
(77, '230204901234567890', '$2y$10$IZOkMPqOM72XfJcPuw4xUuAmsmM71E5qWYmk1Hm/HBInZQJ8L33by', 'Fauzi Rahman', 'guru', 0, 1704116355, NULL, 1, NULL),
(78, '240305012345678901', '$2y$10$hosXeBsO/8YG70E8L/D1duf6m9QL8tcP7GH96.ZZHM6wQzOsgbgaK', 'Dewi Anggraini', 'guru', 0, 1704116355, NULL, 1, NULL),
(79, '250406123456789012', '$2y$10$FsFUAUjHVM7tw7vkBqKsjOCnM/dFzi5.bmUfdsuMqviQBvcg7V6rG', 'Agung Wibowo', 'guru', 0, 1704116355, NULL, 1, NULL),
(80, '260507234567890123', '$2y$10$./kLqW7739P4Dnhqi67DAuweoyYXdc83MdUd.7afltYDK7bb1wERq', 'Rina Fitriani', 'guru', 0, 1704116355, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `idwali_kelas` int(4) NOT NULL,
  `idtahun_akademik` int(4) NOT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `idkelas` int(4) NOT NULL,
  `idguru` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `wali_kelas`
--

INSERT INTO `wali_kelas` (`idwali_kelas`, `idtahun_akademik`, `semester`, `idkelas`, `idguru`) VALUES
(8, 9, 'Genap', 10, 24);

-- --------------------------------------------------------

--
-- Struktur dari tabel `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('4d16p9cteq073gbh08vqjjqmaine88v4', '::1', 1704117911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730343131373831303b69647c733a313a2231223b757365726e616d657c733a353a2261646d696e223b6163636573737c733a31303a2273757065725f75736572223b),
('hmholtbdv4m6vuiqirfnh3m60u6q1cvf', '::1', 1703889781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730333838393734353b69647c733a313a2231223b757365726e616d657c733a353a2261646d696e223b6163636573737c733a31303a2273757065725f75736572223b);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`idkelas`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`idmapel`);

--
-- Indeks untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`idmengajar`,`idtahun_akademik`,`idguru`,`idmapel`,`idkelas`),
  ADD KEY `fk_guru_has_mapel_mapel1_idx` (`idmapel`),
  ADD KEY `fk_guru_has_mapel_guru1_idx` (`idguru`),
  ADD KEY `fk_mengajar_tahun_akademik1_idx` (`idtahun_akademik`),
  ADD KEY `fk_mengajar_kelas1_idx` (`idkelas`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`idnilai`,`idtahun_akademik`,`idkelas`,`idmapel`,`idsiswa`),
  ADD KEY `fk_mapel_has_siswa_siswa1_idx` (`idsiswa`),
  ADD KEY `fk_mapel_has_siswa_mapel1_idx` (`idmapel`),
  ADD KEY `fk_nilai_tahun_akademik1_idx` (`idtahun_akademik`),
  ADD KEY `fk_nilai_kelas1_idx` (`idkelas`);

--
-- Indeks untuk tabel `profil_sekolah`
--
ALTER TABLE `profil_sekolah`
  ADD PRIMARY KEY (`idprofil_sekolah`);

--
-- Indeks untuk tabel `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`idrombel`,`idwali_kelas`,`idsiswa`),
  ADD KEY `fk_rombel_siswa1_idx` (`idsiswa`),
  ADD KEY `fk_rombel_wali_kelas1_idx` (`idwali_kelas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`);

--
-- Indeks untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`idtahun_akademik`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- Indeks untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`idwali_kelas`,`idtahun_akademik`,`idkelas`,`idguru`),
  ADD KEY `fk_rombel_has_guru_guru1_idx` (`idguru`),
  ADD KEY `fk_wali_kelas_kelas1_idx` (`idkelas`),
  ADD KEY `fk_tahun_akademik_tahun_akademik1_idx` (`idtahun_akademik`);

--
-- Indeks untuk tabel `_sessions`
--
ALTER TABLE `_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `idguru` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `idkelas` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `mapel`
--
ALTER TABLE `mapel`
  MODIFY `idmapel` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  MODIFY `idmengajar` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `idnilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT untuk tabel `profil_sekolah`
--
ALTER TABLE `profil_sekolah`
  MODIFY `idprofil_sekolah` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rombel`
--
ALTER TABLE `rombel`
  MODIFY `idrombel` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `idtahun_akademik` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `idwali_kelas` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD CONSTRAINT `fk_guru_has_mapel_guru1` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_guru_has_mapel_mapel1` FOREIGN KEY (`idmapel`) REFERENCES `mapel` (`idmapel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mengajar_kelas1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mengajar_tahun_akademik1` FOREIGN KEY (`idtahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `fk_mapel_has_siswa_mapel1` FOREIGN KEY (`idmapel`) REFERENCES `mapel` (`idmapel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mapel_has_siswa_siswa1` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nilai_kelas1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nilai_tahun_akademik1` FOREIGN KEY (`idtahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `rombel`
--
ALTER TABLE `rombel`
  ADD CONSTRAINT `fk_rombel_siswa1` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rombel_wali_kelas1` FOREIGN KEY (`idwali_kelas`) REFERENCES `wali_kelas` (`idwali_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD CONSTRAINT `fk_rombel_has_guru_guru1` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tahun_akademik_tahun_akademik1` FOREIGN KEY (`idtahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_wali_kelas_kelas1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
