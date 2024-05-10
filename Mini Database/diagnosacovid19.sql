-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2024 at 07:28 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diagnosacovid19`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_aturan`
--

CREATE TABLE `tb_aturan` (
  `ID_Aturan` varchar(15) NOT NULL,
  `ID_Penyakit` varchar(15) NOT NULL,
  `ID_Gejala` varchar(15) NOT NULL,
  `ID_Pasien` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_diagnosa`
--

CREATE TABLE `tb_diagnosa` (
  `ID_Diagnosa` varchar(15) NOT NULL,
  `ID_Aturan` varchar(15) NOT NULL,
  `ID_Gejala` varchar(15) NOT NULL,
  `ID_Pasien` varchar(15) NOT NULL,
  `ID_Penyakit` varchar(15) NOT NULL,
  `Tanggal Diagnosa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `ID_Gejala` varchar(15) NOT NULL,
  `Nama Gejala` text NOT NULL,
  `Deskripsi Gejala` text NOT NULL,
  `ID_User` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasien`
--

CREATE TABLE `tb_pasien` (
  `ID_Pasien` varchar(10) NOT NULL,
  `Nama Pasien` text NOT NULL,
  `Umur` varchar(10) NOT NULL,
  `Jenis Kelamin` text NOT NULL,
  `Alamat` text NOT NULL,
  `ID_User` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyakit`
--

CREATE TABLE `tb_penyakit` (
  `ID_Penyakit` varchar(15) NOT NULL,
  `Nama Penyakit` text NOT NULL,
  `Deskripsi` text NOT NULL,
  `ID_User` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_solusi`
--

CREATE TABLE `tb_solusi` (
  `ID_Solusi` int NOT NULL,
  `ID_Diagnosa` varchar(10) NOT NULL,
  `ID_Pasien` varchar(10) NOT NULL,
  `Deskripsi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `ID_User` varchar(15) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD PRIMARY KEY (`ID_Aturan`),
  ADD KEY `ID_Penyakit` (`ID_Penyakit`,`ID_Gejala`,`ID_Pasien`),
  ADD KEY `ID_Gejala` (`ID_Gejala`),
  ADD KEY `ID_Pasien` (`ID_Pasien`);

--
-- Indexes for table `tb_diagnosa`
--
ALTER TABLE `tb_diagnosa`
  ADD PRIMARY KEY (`ID_Diagnosa`),
  ADD KEY `ID_Aturan` (`ID_Aturan`,`ID_Gejala`,`ID_Pasien`,`ID_Penyakit`),
  ADD KEY `ID_Gejala` (`ID_Gejala`),
  ADD KEY `ID_Pasien` (`ID_Pasien`),
  ADD KEY `ID_Penyakit` (`ID_Penyakit`);

--
-- Indexes for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`ID_Gejala`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD PRIMARY KEY (`ID_Pasien`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `tb_penyakit`
--
ALTER TABLE `tb_penyakit`
  ADD PRIMARY KEY (`ID_Penyakit`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `tb_solusi`
--
ALTER TABLE `tb_solusi`
  ADD PRIMARY KEY (`ID_Solusi`),
  ADD KEY `ID_Diagnosa` (`ID_Diagnosa`,`ID_Pasien`),
  ADD KEY `ID_Pasien` (`ID_Pasien`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`ID_User`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD CONSTRAINT `tb_aturan_ibfk_1` FOREIGN KEY (`ID_Gejala`) REFERENCES `tb_gejala` (`ID_Gejala`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_aturan_ibfk_2` FOREIGN KEY (`ID_Pasien`) REFERENCES `tb_pasien` (`ID_Pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_diagnosa`
--
ALTER TABLE `tb_diagnosa`
  ADD CONSTRAINT `tb_diagnosa_ibfk_1` FOREIGN KEY (`ID_Aturan`) REFERENCES `tb_aturan` (`ID_Aturan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_diagnosa_ibfk_2` FOREIGN KEY (`ID_Gejala`) REFERENCES `tb_gejala` (`ID_Gejala`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_diagnosa_ibfk_3` FOREIGN KEY (`ID_Pasien`) REFERENCES `tb_pasien` (`ID_Pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_diagnosa_ibfk_4` FOREIGN KEY (`ID_Penyakit`) REFERENCES `tb_penyakit` (`ID_Penyakit`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD CONSTRAINT `tb_gejala_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `tb_user` (`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD CONSTRAINT `tb_pasien_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `tb_user` (`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_penyakit`
--
ALTER TABLE `tb_penyakit`
  ADD CONSTRAINT `tb_penyakit_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `tb_user` (`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_solusi`
--
ALTER TABLE `tb_solusi`
  ADD CONSTRAINT `tb_solusi_ibfk_1` FOREIGN KEY (`ID_Diagnosa`) REFERENCES `tb_diagnosa` (`ID_Diagnosa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_solusi_ibfk_2` FOREIGN KEY (`ID_Pasien`) REFERENCES `tb_pasien` (`ID_Pasien`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
