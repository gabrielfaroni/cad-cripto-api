-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Mar-2023 às 01:47
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gabriel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `coretoras`
--

CREATE TABLE `coretoras` (
  `ID_CORRETORA` int(11) NOT NULL,
  `NOME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `coretoras`
--

INSERT INTO `coretoras` (`ID_CORRETORA`, `NOME`) VALUES
(1, 'gabriel'),
(2, 'lara'),
(3, 'luan'),
(4, 'maria'),
(5, 'luiza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `moedas`
--

CREATE TABLE `moedas` (
  `ID_MOEDA` int(11) NOT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `PRECO_COMPRA_VENDA` double DEFAULT NULL,
  `UNIDADE_MONETARIA_COMPRA_VENDA` varchar(45) DEFAULT NULL,
  `DESCRICAO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `moedas`
--

INSERT INTO `moedas` (`ID_MOEDA`, `NOME`, `PRECO_COMPRA_VENDA`, `UNIDADE_MONETARIA_COMPRA_VENDA`, `DESCRICAO`) VALUES
(1, 'bitcoin', 10, 'R$', 'Muito bom!'),
(2, 'elacoin', 20, 'R$', 'Muito ruim!'),
(3, 'elecoin', 30, 'R$', 'Bom'),
(4, 'coin', 40, 'R$', 'mal'),
(5, 'boin', 50, 'R$', 'mais ou menos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `moedas_has_coretoras`
--

CREATE TABLE `moedas_has_coretoras` (
  `MOEDAS_ID_MOEDA` int(11) NOT NULL,
  `CORETORAS_ID_CORRETORA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `moedas_has_coretoras`
--

INSERT INTO `moedas_has_coretoras` (`MOEDAS_ID_MOEDA`, `CORETORAS_ID_CORRETORA`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `moedas_has_paridades`
--

CREATE TABLE `moedas_has_paridades` (
  `MOEDAS_ID_MOEDA` int(11) NOT NULL,
  `PARIDADES_ID_PARIDADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `moedas_has_paridades`
--

INSERT INTO `moedas_has_paridades` (`MOEDAS_ID_MOEDA`, `PARIDADES_ID_PARIDADE`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `paridades`
--

CREATE TABLE `paridades` (
  `ID_PARIDADE` int(11) NOT NULL,
  `NOME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `paridades`
--

INSERT INTO `paridades` (`ID_PARIDADE`, `NOME`) VALUES
(1, 'pamela'),
(2, 'conceicao'),
(3, 'ygor'),
(4, 'lari'),
(5, 'jessica');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `coretoras`
--
ALTER TABLE `coretoras`
  ADD PRIMARY KEY (`ID_CORRETORA`);

--
-- Índices para tabela `moedas`
--
ALTER TABLE `moedas`
  ADD PRIMARY KEY (`ID_MOEDA`);

--
-- Índices para tabela `moedas_has_coretoras`
--
ALTER TABLE `moedas_has_coretoras`
  ADD PRIMARY KEY (`MOEDAS_ID_MOEDA`,`CORETORAS_ID_CORRETORA`),
  ADD KEY `fk_MOEDAS_has_CORETORAS_CORETORAS1` (`CORETORAS_ID_CORRETORA`);

--
-- Índices para tabela `moedas_has_paridades`
--
ALTER TABLE `moedas_has_paridades`
  ADD PRIMARY KEY (`MOEDAS_ID_MOEDA`,`PARIDADES_ID_PARIDADE`),
  ADD KEY `fk_MOEDAS_has_PARIDADES_PARIDADES1` (`PARIDADES_ID_PARIDADE`);

--
-- Índices para tabela `paridades`
--
ALTER TABLE `paridades`
  ADD PRIMARY KEY (`ID_PARIDADE`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `coretoras`
--
ALTER TABLE `coretoras`
  MODIFY `ID_CORRETORA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `moedas`
--
ALTER TABLE `moedas`
  MODIFY `ID_MOEDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `paridades`
--
ALTER TABLE `paridades`
  MODIFY `ID_PARIDADE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `moedas_has_coretoras`
--
ALTER TABLE `moedas_has_coretoras`
  ADD CONSTRAINT `fk_MOEDAS_has_CORETORAS_CORETORAS1` FOREIGN KEY (`CORETORAS_ID_CORRETORA`) REFERENCES `coretoras` (`ID_CORRETORA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MOEDAS_has_CORETORAS_MOEDAS` FOREIGN KEY (`MOEDAS_ID_MOEDA`) REFERENCES `moedas` (`ID_MOEDA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `moedas_has_paridades`
--
ALTER TABLE `moedas_has_paridades`
  ADD CONSTRAINT `fk_MOEDAS_has_PARIDADES_MOEDAS1` FOREIGN KEY (`MOEDAS_ID_MOEDA`) REFERENCES `moedas` (`ID_MOEDA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MOEDAS_has_PARIDADES_PARIDADES1` FOREIGN KEY (`PARIDADES_ID_PARIDADE`) REFERENCES `paridades` (`ID_PARIDADE`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
