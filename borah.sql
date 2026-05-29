-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2026 at 02:29 PM
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
-- Database: `borah`
--

-- --------------------------------------------------------

--
-- Table structure for table `caixa`
--

CREATE TABLE `caixa` (
  `caiid` int NOT NULL,
  `caidata` date NOT NULL,
  `caitroco` double NOT NULL,
  `caitotal` double DEFAULT NULL,
  `caiusuid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `catid` int NOT NULL,
  `catnome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `cliid` int NOT NULL,
  `clinome` varchar(100) NOT NULL,
  `clitelefone` varchar(100) DEFAULT NULL,
  `cliemail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `iteid` int NOT NULL,
  `itepedid` int DEFAULT NULL,
  `iteproid` int DEFAULT NULL,
  `itequantidade` int NOT NULL,
  `itepreco` double NOT NULL,
  `iteobservacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagamentos`
--

CREATE TABLE `pagamentos` (
  `pagid` int NOT NULL,
  `pagpedid` int DEFAULT NULL,
  `pagforma` varchar(100) NOT NULL,
  `pagvalor` double NOT NULL,
  `pagdata_hora` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `pedid` int NOT NULL,
  `pedcliid` int DEFAULT NULL,
  `pedcaiid` int DEFAULT NULL,
  `pedtipo` varchar(100) NOT NULL,
  `pedstatus` varchar(100) DEFAULT NULL,
  `pedvalor` double DEFAULT NULL,
  `peddata_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `pedtempo_estimado` int DEFAULT NULL,
  `pedmesa_numero` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `proid` int NOT NULL,
  `pronome` varchar(100) NOT NULL,
  `prodescricao` varchar(100) DEFAULT NULL,
  `propreco` double NOT NULL,
  `procatid` int DEFAULT NULL,
  `profot` longblob,
  `proespecial_do_dia` tinyint(1) DEFAULT '0',
  `proativo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuid` int NOT NULL,
  `usunome` varchar(100) NOT NULL,
  `usuemail` varchar(100) DEFAULT NULL,
  `ususenha` varchar(100) NOT NULL,
  `usutipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`caiid`),
  ADD KEY `caiusuid` (`caiusuid`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliid`);

--
-- Indexes for table `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`iteid`),
  ADD KEY `itepedid` (`itepedid`),
  ADD KEY `iteproid` (`iteproid`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`pagid`),
  ADD KEY `pagpedid` (`pagpedid`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedid`),
  ADD KEY `pedcliid` (`pedcliid`),
  ADD KEY `pedcaiid` (`pedcaiid`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`proid`),
  ADD KEY `procatid` (`procatid`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuid`),
  ADD UNIQUE KEY `usuemail` (`usuemail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caixa`
--
ALTER TABLE `caixa`
  MODIFY `caiid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `catid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `iteid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `pagid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `proid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuid` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `caixa_ibfk_1` FOREIGN KEY (`caiusuid`) REFERENCES `usuarios` (`usuid`);

--
-- Constraints for table `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD CONSTRAINT `itens_pedidos_ibfk_1` FOREIGN KEY (`itepedid`) REFERENCES `pedidos` (`pedid`),
  ADD CONSTRAINT `itens_pedidos_ibfk_2` FOREIGN KEY (`iteproid`) REFERENCES `produtos` (`proid`);

--
-- Constraints for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`pagpedid`) REFERENCES `pedidos` (`pedid`);

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`pedcliid`) REFERENCES `clientes` (`cliid`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`pedcaiid`) REFERENCES `caixa` (`caiid`);

--
-- Constraints for table `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`procatid`) REFERENCES `categorias` (`catid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
