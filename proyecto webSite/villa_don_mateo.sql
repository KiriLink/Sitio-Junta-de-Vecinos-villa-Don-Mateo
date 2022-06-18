-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2022 at 02:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `villa_don_mateo`
--

-- --------------------------------------------------------

--
-- Table structure for table `acta`
--

CREATE TABLE `acta` (
  `IDActa` int(11) NOT NULL,
  `IDDirectivo` int(11) NOT NULL,
  `tituloActa` varchar(30) NOT NULL,
  `tipoReunion` int(11) NOT NULL,
  `fechaActa` date NOT NULL,
  `horaActa` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cargo_directivo`
--

CREATE TABLE `cargo_directivo` (
  `IDDirectivo` int(11) NOT NULL,
  `rutUsuario` varchar(15) NOT NULL,
  `cargo` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaTermino` date NOT NULL,
  `estadoCargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comuna`
--

CREATE TABLE `comuna` (
  `IDComuna` int(11) NOT NULL,
  `nombreComuna` varchar(30) NOT NULL,
  `regionComuna` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `denuncia`
--

CREATE TABLE `denuncia` (
  `IDDenuncia` int(11) NOT NULL,
  `rutUsuario` varchar(15) NOT NULL,
  `fechaDenuncia` date NOT NULL,
  `horaDenuncia` time NOT NULL,
  `motivoDenuncia` varchar(500) NOT NULL,
  `rutDirectivo` varchar(15) NOT NULL,
  `estadoDenuncia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `documento`
--

CREATE TABLE `documento` (
  `IDDocumento` int(11) NOT NULL,
  `rutUsuario` varchar(15) DEFAULT NULL,
  `IDTipoDocumento` int(11) NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `horaSolicitud` time NOT NULL,
  `fechaEntrega` date NOT NULL,
  `horaEntrega` time NOT NULL,
  `comentarioDocumento` varchar(500) NOT NULL,
  `estadoDocumento` int(11) NOT NULL,
  `rutRetiro` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hogar`
--

CREATE TABLE `hogar` (
  `IDHogar` int(11) NOT NULL,
  `calleHogar` varchar(50) NOT NULL,
  `numeracionHogar` int(11) NOT NULL,
  `IDSector` int(11) NOT NULL,
  `fechaHogar` date NOT NULL,
  `estadoHogar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `integrante_hogar`
--

CREATE TABLE `integrante_hogar` (
  `IDIntHogar` int(11) NOT NULL,
  `rutUsuario` varchar(15) NOT NULL,
  `IDHogar` int(11) NOT NULL,
  `tipoIntegrante` int(11) NOT NULL,
  `parentescoIntegrante` int(11) NOT NULL,
  `fechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `observacion`
--

CREATE TABLE `observacion` (
  `IDObservacion` int(11) NOT NULL,
  `IDDenuncia` int(11) NOT NULL,
  `fechaObservacion` date NOT NULL,
  `horaObservacion` time NOT NULL,
  `comentarioObservacion` varchar(500) NOT NULL,
  `rutUsuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publicacion`
--

CREATE TABLE `publicacion` (
  `IDPublicacion` int(11) NOT NULL,
  `rutUsuario` varchar(15) NOT NULL,
  `tituloPublicacion` varchar(30) NOT NULL,
  `tipoPublicacion` varchar(30) NOT NULL,
  `fechaPublicacion` date NOT NULL,
  `horaPublicacion` time NOT NULL,
  `contenidoPublicacion` varchar(500) DEFAULT NULL,
  `estadoPublicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `IDSector` int(11) NOT NULL,
  `nombreSector` varchar(30) NOT NULL,
  `IDComuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `IDTipoDocumento` int(11) NOT NULL,
  `nombreTipoDocumento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `rutUsuario` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fechaNac` date NOT NULL,
  `estadoCivil` int(11) NOT NULL,
  `numeroContacto` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `genero` int(11) NOT NULL,
  `etnia` varchar(50) NOT NULL,
  `ocupacion` varchar(50) NOT NULL,
  `discapacidad` int(11) NOT NULL,
  `tipoSocio` int(11) NOT NULL,
  `estadoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acta`
--
ALTER TABLE `acta`
  ADD PRIMARY KEY (`IDActa`),
  ADD KEY `IDDirectivo` (`IDDirectivo`);

--
-- Indexes for table `cargo_directivo`
--
ALTER TABLE `cargo_directivo`
  ADD PRIMARY KEY (`IDDirectivo`),
  ADD KEY `rutUsuario` (`rutUsuario`);

--
-- Indexes for table `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`IDComuna`);

--
-- Indexes for table `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`IDDenuncia`),
  ADD KEY `rutUsuario` (`rutUsuario`);

--
-- Indexes for table `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`IDDocumento`),
  ADD KEY `rutUsuario` (`rutUsuario`),
  ADD KEY `IDTipoDocumento` (`IDTipoDocumento`);

--
-- Indexes for table `hogar`
--
ALTER TABLE `hogar`
  ADD PRIMARY KEY (`IDHogar`),
  ADD KEY `IDSector` (`IDSector`);

--
-- Indexes for table `integrante_hogar`
--
ALTER TABLE `integrante_hogar`
  ADD PRIMARY KEY (`IDIntHogar`),
  ADD KEY `rutUsuario` (`rutUsuario`),
  ADD KEY `IDHogar` (`IDHogar`);

--
-- Indexes for table `observacion`
--
ALTER TABLE `observacion`
  ADD PRIMARY KEY (`IDObservacion`),
  ADD KEY `IDDenuncia` (`IDDenuncia`),
  ADD KEY `rutUsuario` (`rutUsuario`);

--
-- Indexes for table `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`IDPublicacion`),
  ADD KEY `rutUsuario` (`rutUsuario`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`IDSector`),
  ADD KEY `IDComuna` (`IDComuna`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`IDTipoDocumento`),
  ADD UNIQUE KEY `nombreTipoDocumento` (`nombreTipoDocumento`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rutUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acta`
--
ALTER TABLE `acta`
  MODIFY `IDActa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cargo_directivo`
--
ALTER TABLE `cargo_directivo`
  MODIFY `IDDirectivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comuna`
--
ALTER TABLE `comuna`
  MODIFY `IDComuna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `IDDenuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documento`
--
ALTER TABLE `documento`
  MODIFY `IDDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hogar`
--
ALTER TABLE `hogar`
  MODIFY `IDHogar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `integrante_hogar`
--
ALTER TABLE `integrante_hogar`
  MODIFY `IDIntHogar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `observacion`
--
ALTER TABLE `observacion`
  MODIFY `IDObservacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `IDPublicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `IDSector` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `IDTipoDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acta`
--
ALTER TABLE `acta`
  ADD CONSTRAINT `acta_ibfk_1` FOREIGN KEY (`IDDirectivo`) REFERENCES `cargo_directivo` (`IDDirectivo`);

--
-- Constraints for table `cargo_directivo`
--
ALTER TABLE `cargo_directivo`
  ADD CONSTRAINT `cargo_directivo_ibfk_1` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`);

--
-- Constraints for table `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `denuncia_ibfk_1` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`);

--
-- Constraints for table `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`),
  ADD CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`IDTipoDocumento`) REFERENCES `tipo_documento` (`IDTipoDocumento`);

--
-- Constraints for table `hogar`
--
ALTER TABLE `hogar`
  ADD CONSTRAINT `hogar_ibfk_1` FOREIGN KEY (`IDSector`) REFERENCES `sector` (`IDSector`);

--
-- Constraints for table `integrante_hogar`
--
ALTER TABLE `integrante_hogar`
  ADD CONSTRAINT `integrante_hogar_ibfk_1` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`),
  ADD CONSTRAINT `integrante_hogar_ibfk_2` FOREIGN KEY (`IDHogar`) REFERENCES `hogar` (`IDHogar`);

--
-- Constraints for table `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `observacion_ibfk_1` FOREIGN KEY (`IDDenuncia`) REFERENCES `denuncia` (`IDDenuncia`),
  ADD CONSTRAINT `observacion_ibfk_2` FOREIGN KEY (`rutUsuario`) REFERENCES `denuncia` (`rutUsuario`);

--
-- Constraints for table `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`);

--
-- Constraints for table `sector`
--
ALTER TABLE `sector`
  ADD CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`IDComuna`) REFERENCES `comuna` (`IDComuna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
