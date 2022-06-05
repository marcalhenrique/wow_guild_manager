-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Out-2020 às 01:56
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild`
--

CREATE TABLE `guild` (
  `id_guild` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `lider` int(11) DEFAULT NULL,
  `infoGuild` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `guild`
--

INSERT INTO `guild` (`id_guild`, `nome`, `id_usuario`, `lider`, `infoGuild`) VALUES
(1, 'Numero uno', 1, NULL, NULL),
(2, 'Anjos Sangrentos', 2, 4, 'aaaaaaaaaaaaaaaadddddd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `membro`
--

CREATE TABLE `membro` (
  `id_membro` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `classe` varchar(45) NOT NULL,
  `talento` varchar(45) NOT NULL,
  `gearscore` int(11) NOT NULL,
  `ranking` varchar(45) NOT NULL,
  `pontos` int(11) NOT NULL,
  `alt_char` char(1) NOT NULL,
  `id_guild` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `membro`
--

INSERT INTO `membro` (`id_membro`, `nome`, `classe`, `talento`, `gearscore`, `ranking`, `pontos`, `alt_char`, `id_guild`) VALUES
(1, 'Nizu', 'Warlock', 'Affliction', 6125, 'Core', 3347, 'N', 2),
(2, 'LeoPQR', 'Druid', 'Restoration', 6520, 'Demotado', 0, 'N', 2),
(3, 'Gorg', 'Hunter', 'Marksmanship', 1345, 'Officer', 7677, 'N', 2),
(4, 'LittleVampire', 'Shaman', 'Enhacement', 6430, 'Lider', 22544, 'S', 2),
(5, 'ArianaGrande', 'Priest', 'Shadow/disc', 7000, 'Fortão', 5061, 'N', 2),
(6, 'Billconha', 'Hunter', 'Beastmastery', 6823, 'Patrocinador oficial agronegocios', 61567, 'N', 2),
(7, 'Souphodinha', 'Druid', 'Feral', 6309, 'Talarico LittleVampire', 4567, 'N', 2),
(9, 'LittleVampire', 'Shaman', 'Enhacement', 6430, 'Lider', 121543, 'S', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `membrosnaraid`
--

CREATE TABLE `membrosnaraid` (
  `id_membro` int(11) NOT NULL,
  `id_guild` int(11) NOT NULL,
  `id_raid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `membrosnaraid`
--

INSERT INTO `membrosnaraid` (`id_membro`, `id_guild`, `id_raid`) VALUES
(1, 2, 2),
(3, 2, 2),
(4, 2, 2),
(5, 2, 2),
(3, 2, 3),
(5, 2, 3),
(6, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `raid`
--

CREATE TABLE `raid` (
  `id_raid` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `qtd_membro` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `inicio` varchar(45) NOT NULL,
  `termino` varchar(45) DEFAULT NULL,
  `boss_final_morto` char(1) DEFAULT NULL,
  `raid_finalizada` char(1) DEFAULT NULL,
  `narrador` varchar(45) NOT NULL,
  `pontuacao` int(11) NOT NULL,
  `id_guild` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `raid`
--

INSERT INTO `raid` (`id_raid`, `nome`, `qtd_membro`, `tipo`, `inicio`, `termino`, `boss_final_morto`, `raid_finalizada`, `narrador`, `pontuacao`, `id_guild`) VALUES
(1, 'Ulduar', 4, '25 - Heroic', '14/09/2001 - 19:00', '31/12/2019 - 23:59', 'S', 'S', 'LittleVampire', 30, 1),
(2, 'Icecrow Citadel', 7, '10 - Normal', '19/09/2020 - 13:00', '22/10/2020 20:49:45', 'S', 'S', 'LeoPQR', 100, 2),
(3, 'a', 1, 'b', 'c', '22/10/2020 20:53:41', 'S', 'S', 'Billconha', 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `login`, `senha`, `nome`) VALUES
(1, 'jorgeloco', 'muitoloco', 'Jorge'),
(2, '1', '1', 'Jefim');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `guild`
--
ALTER TABLE `guild`
  ADD PRIMARY KEY (`id_guild`),
  ADD KEY `guild_FK_usuario` (`id_usuario`),
  ADD KEY `guild_FK_lider` (`lider`);

--
-- Índices para tabela `membro`
--
ALTER TABLE `membro`
  ADD PRIMARY KEY (`id_membro`),
  ADD KEY `membro_FK_guild` (`id_guild`);

--
-- Índices para tabela `membrosnaraid`
--
ALTER TABLE `membrosnaraid`
  ADD PRIMARY KEY (`id_guild`,`id_raid`,`id_membro`),
  ADD KEY `membros_na_raid_FK_raid` (`id_raid`),
  ADD KEY `membros_na_raid_fk_membros` (`id_membro`);

--
-- Índices para tabela `raid`
--
ALTER TABLE `raid`
  ADD PRIMARY KEY (`id_raid`),
  ADD KEY `raid_id_guild_fk_guild` (`id_guild`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `guild`
--
ALTER TABLE `guild`
  MODIFY `id_guild` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `membro`
--
ALTER TABLE `membro`
  MODIFY `id_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `raid`
--
ALTER TABLE `raid`
  MODIFY `id_raid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `guild`
--
ALTER TABLE `guild`
  ADD CONSTRAINT `guild_FK_lider` FOREIGN KEY (`lider`) REFERENCES `membro` (`id_membro`),
  ADD CONSTRAINT `guild_FK_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `membro`
--
ALTER TABLE `membro`
  ADD CONSTRAINT `membro_FK_guild` FOREIGN KEY (`id_guild`) REFERENCES `guild` (`id_guild`);

--
-- Limitadores para a tabela `membrosnaraid`
--
ALTER TABLE `membrosnaraid`
  ADD CONSTRAINT `membros_na_raid_FK_guild` FOREIGN KEY (`id_guild`) REFERENCES `guild` (`id_guild`),
  ADD CONSTRAINT `membros_na_raid_FK_raid` FOREIGN KEY (`id_raid`) REFERENCES `raid` (`id_raid`),
  ADD CONSTRAINT `membros_na_raid_fk_membros` FOREIGN KEY (`id_membro`) REFERENCES `membro` (`id_membro`);

--
-- Limitadores para a tabela `raid`
--
ALTER TABLE `raid`
  ADD CONSTRAINT `raid_id_guild_fk_guild` FOREIGN KEY (`id_guild`) REFERENCES `guild` (`id_guild`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
