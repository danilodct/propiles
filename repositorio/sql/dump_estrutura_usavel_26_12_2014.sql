-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: mysql02-farm86.kinghost.net
-- Tempo de Geração: Dez 26, 2014 as 04:14 PM
-- Versão do Servidor: 5.5.40
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `clinicavanity`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigos`
--

CREATE TABLE IF NOT EXISTS `artigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `conteudo` text COLLATE utf8_unicode_ci,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `artigos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1946 ;

--
-- Estrutura da tabela `avaliacaoacupuntura`
--

CREATE TABLE IF NOT EXISTS `avaliacaoacupuntura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT '0',
  `altura` double DEFAULT '0',
  `objetivo` text COLLATE utf8_unicode_ci,
  `medicacao` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT NULL,
  `etilismo` tinyint(1) DEFAULT NULL,
  `hipertensao` tinyint(1) DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examesComplementares` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solicitacaoMedica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problema` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queSente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queMelhoraDor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quePioraDor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incomoda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicamento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `historicoDoenca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecendentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cirurgia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `respiracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tosse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problemaPele` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digestao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `circulatorio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incomodoCabeca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incomodoPerna` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtSessoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sede` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `febre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frioCalor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transpiracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `habitosAlimentares` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menstruacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disposicao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `psiquico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personalidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ofendido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dificeis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contrariado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaoacupuntura`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaoalteracoescirculatorias`
--

CREATE TABLE IF NOT EXISTS `avaliacaoalteracoescirculatorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direita` text COLLATE utf8_unicode_ci,
  `esquerda` text COLLATE utf8_unicode_ci,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaoalteracoescirculatorias`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaocirurgiaplastica`
--

CREATE TABLE IF NOT EXISTS `avaliacaocirurgiaplastica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cirurgiaPlastica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicoAcompanhante` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atoCirurgico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edema` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equimose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fibrose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fpo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seroma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descenciaCirurgica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1746 ;

--
-- Extraindo dados da tabela `avaliacaocirurgiaplastica`
--

--
-- Estrutura da tabela `avaliacaocripolise`
--

CREATE TABLE IF NOT EXISTS `avaliacaocripolise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gorduraLocalizada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaocripolise`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaodayspa`
--

CREATE TABLE IF NOT EXISTS `avaliacaodayspa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1736 ;

--
-- Extraindo dados da tabela `avaliacaodayspa`
--

--
-- Estrutura da tabela `avaliacaodepilacao`
--

CREATE TABLE IF NOT EXISTS `avaliacaodepilacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aspectoPelo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1828 ;

--
-- Extraindo dados da tabela `avaliacaodepilacao`
--

--
-- Estrutura da tabela `avaliacaodermatologia`
--

CREATE TABLE IF NOT EXISTS `avaliacaodermatologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aspectosPele` text COLLATE utf8_unicode_ci,
  `historia` tinyint(1) DEFAULT '0',
  `melanoma` tinyint(1) DEFAULT '0',
  `cancerPeleMelanoma` tinyint(1) DEFAULT '0',
  `lesaoBenigna` tinyint(1) DEFAULT '0',
  `historiaFamiliar` tinyint(1) DEFAULT '0',
  `melanoma2` tinyint(1) DEFAULT '0',
  `cancerPeleMelanoma2` tinyint(1) DEFAULT '0',
  `nevos` tinyint(1) DEFAULT '0',
  `azul` tinyint(1) DEFAULT '0',
  `verde` tinyint(1) DEFAULT '0',
  `marrom` tinyint(1) DEFAULT '0',
  `fotodanificada` tinyint(1) DEFAULT '0',
  `lentigos` tinyint(1) DEFAULT '0',
  `nenhuma` tinyint(1) DEFAULT '0',
  `monitoramento` tinyint(1) DEFAULT '0',
  `excisao` tinyint(1) DEFAULT '0',
  `fototipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numeroNevos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numeroNevosAtipicos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frontal` tinyint(1) DEFAULT '0',
  `posterior` tinyint(1) DEFAULT '0',
  `facePerfil` tinyint(1) DEFAULT '0',
  `face` tinyint(1) DEFAULT '0',
  `plantar` tinyint(1) DEFAULT '0',
  `pes` tinyint(1) DEFAULT '0',
  `maos` tinyint(1) DEFAULT '0',
  `palmar` tinyint(1) DEFAULT '0',
  `avaliacao` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1816 ;

--
-- Extraindo dados da tabela `avaliacaodermatologia`
--

--
-- Estrutura da tabela `avaliacaoestetica`
--

CREATE TABLE IF NOT EXISTS `avaliacaoestetica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT '0',
  `altura` double DEFAULT '0',
  `objetivo` text COLLATE utf8_unicode_ci,
  `medicacao` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT NULL,
  `etilismo` tinyint(1) DEFAULT NULL,
  `hipertensao` tinyint(1) DEFAULT NULL,
  `celulite` tinyint(1) DEFAULT '0',
  `gorduraLocalizada` tinyint(1) DEFAULT '0',
  `flacidez` tinyint(1) DEFAULT '0',
  `estresse` tinyint(1) DEFAULT '0',
  `cravos` tinyint(1) DEFAULT '0',
  `outrosMotivos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jaFezAlgumTratamento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quaisResultados` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pesoModificou` tinyint(1) DEFAULT '0',
  `prisaoVentre` tinyint(1) DEFAULT '0',
  `retencaoLiquidos` tinyint(1) DEFAULT '0',
  `dificuldadeUrinar` tinyint(1) DEFAULT '0',
  `alergia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atividadeFisica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estadoEmocional` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuidadoFacial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuidadoCorporal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alimentacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtRefeicoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dieta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nutricionista` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obesidade` tinyint(1) DEFAULT '0',
  `cancer` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `hernia` tinyint(1) DEFAULT '0',
  `protese` tinyint(1) DEFAULT '0',
  `queloide` tinyint(1) DEFAULT '0',
  `hemofilia` tinyint(1) DEFAULT '0',
  `varizes` tinyint(1) DEFAULT '0',
  `reumatica` tinyint(1) DEFAULT '0',
  `alergiaCalor` tinyint(1) DEFAULT '0',
  `ovario` tinyint(1) DEFAULT '0',
  `dermatite` tinyint(1) DEFAULT '0',
  `gastrite` tinyint(1) DEFAULT '0',
  `ulcera` tinyint(1) DEFAULT '0',
  `fragilidade` tinyint(1) DEFAULT '0',
  `alergiaFrio` tinyint(1) DEFAULT '0',
  `infeccionsa` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `rinoplastia` tinyint(1) DEFAULT '0',
  `lifting` tinyint(1) DEFAULT '0',
  `rejuvenescimento` tinyint(1) DEFAULT '0',
  `mastectomia` tinyint(1) DEFAULT '0',
  `abdominoplastia` tinyint(1) DEFAULT '0',
  `lipoescultura` tinyint(1) DEFAULT '0',
  `botox` tinyint(1) DEFAULT '0',
  `mamoplastiaReducao` tinyint(1) DEFAULT '0',
  `mentoplastia` tinyint(1) DEFAULT '0',
  `siliconeSeio` tinyint(1) DEFAULT '0',
  `microcirurgia` tinyint(1) DEFAULT '0',
  `blefaroplastia` tinyint(1) DEFAULT '0',
  `mamoplastiaAumento` tinyint(1) DEFAULT '0',
  `lipoaspiracao` tinyint(1) DEFAULT '0',
  `siliconeBumbum` tinyint(1) DEFAULT '0',
  `cor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lesoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acne` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaoestetica`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaoestria`
--

CREATE TABLE IF NOT EXISTS `avaliacaoestria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1820 ;

--
-- Extraindo dados da tabela `avaliacaoestria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaogestante`
--

CREATE TABLE IF NOT EXISTS `avaliacaogestante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numeroSemanas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicoAcompanhante` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mid` text COLLATE utf8_unicode_ci,
  `mie` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1281 ;

--
-- Extraindo dados da tabela `avaliacaogestante`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaogorduralocalizada`
--

CREATE TABLE IF NOT EXISTS `avaliacaogorduralocalizada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gorduraLocalizada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1834 ;

--
-- Extraindo dados da tabela `avaliacaogorduralocalizada`
--

--
-- Estrutura da tabela `avaliacaolimpezapele`
--

CREATE TABLE IF NOT EXISTS `avaliacaolimpezapele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aspectosPele` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaolimpezapele`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaonatacaoinfantil`
--

CREATE TABLE IF NOT EXISTS `avaliacaonatacaoinfantil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1750 ;

--
-- Extraindo dados da tabela `avaliacaonatacaoinfantil`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaonutricao`
--

CREATE TABLE IF NOT EXISTS `avaliacaonutricao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pesoMax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pesoMin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pesoDesejado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cintura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadril` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biceps` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `triceps` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subescapular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suprailiaca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antebraco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fletido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `axilar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abdominal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coxa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peitoral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gordura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exercicio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequenciaExercicio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horasSono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cansacoMomento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suplemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alterouPeso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumoCafe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumoLanche1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumoAlmoco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumoLanche2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumoJantar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumoLanche3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fazTratamento` tinyint(1) DEFAULT '0',
  `achaCompulsivo` tinyint(1) DEFAULT '0',
  `sonoTranquilo` tinyint(1) DEFAULT '0',
  `vontadeComerDoce` tinyint(1) DEFAULT '0',
  `cansaco` tinyint(1) DEFAULT '0',
  `intestinoPreso` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1831 ;

--
-- Extraindo dados da tabela `avaliacaonutricao`
--

--
-- Estrutura da tabela `avaliacaopeeling`
--

CREATE TABLE IF NOT EXISTS `avaliacaopeeling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aspectosPele` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaopeeling`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaopilates`
--

CREATE TABLE IF NOT EXISTS `avaliacaopilates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT '0',
  `altura` double DEFAULT '0',
  `objetivo` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT NULL,
  `etilismo` tinyint(1) DEFAULT NULL,
  `hipertensao` tinyint(1) DEFAULT NULL,
  `medicacao` text COLLATE utf8_unicode_ci,
  `musculaturaEncurtada` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `musculaturaEncurtadaObs` text COLLATE utf8_unicode_ci,
  `forcaMuscular` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joelhos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pelve` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coluna` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ombrosClavicula` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `escapulas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cabeca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atividadeFisica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regiaoDor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doenca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `historicoDoenca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solicitacaoMedica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examesComplementares` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `indicouPilates` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posterior` tinyint(1) DEFAULT '0',
  `anterior` tinyint(1) DEFAULT '0',
  `lateral` tinyint(1) DEFAULT '0',
  `mmii` tinyint(1) DEFAULT '0',
  `mmss` tinyint(1) DEFAULT '0',
  `abdome` tinyint(1) DEFAULT '0',
  `colunaForcaMuscular` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaopilates`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaopowershape`
--

CREATE TABLE IF NOT EXISTS `avaliacaopowershape` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gorduraLocalizada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1787 ;

--
-- Extraindo dados da tabela `avaliacaopowershape`
--

--
-- Estrutura da tabela `avaliacaoprojeto100dias`
--

CREATE TABLE IF NOT EXISTS `avaliacaoprojeto100dias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gorduraLocalizada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cristaIliacaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaPerda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mamaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esternoAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinturaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicatrizUmbilicalAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadrilAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregaGluteaAvaliacao5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaoprojeto100dias`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaorpg`
--

CREATE TABLE IF NOT EXISTS `avaliacaorpg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT '0',
  `altura` double DEFAULT '0',
  `objetivo` text COLLATE utf8_unicode_ci,
  `medicacao` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT NULL,
  `etilismo` tinyint(1) DEFAULT NULL,
  `hipertensao` tinyint(1) DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solicitacaoMedica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doenca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `historicoDoenca` text COLLATE utf8_unicode_ci,
  `regiaoDor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atividadeFisica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examesComplementares` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `cervical` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dorso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lombar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quadril` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joelhos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbfFotoGeral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbaFotoGeral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbfFotoGeral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbaFotoGeral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbfInterrogatorio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbaInterrogatorio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbfInterrogatorio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbaInterrogatorio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbfExameLocal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbaExameLocal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbfExameLocal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbaExameLocal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbfReequilibracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbaReequilibracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbfReequilibracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbaReequilibracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbfResultado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbaResultado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbfResultado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcbaResultado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtSessoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elevados` tinyint(1) DEFAULT NULL,
  `enroladosVerticalmente` tinyint(1) DEFAULT NULL,
  `enroladosTransversalmente` tinyint(1) DEFAULT NULL,
  `abduzidos` tinyint(1) DEFAULT NULL,
  `flexionados` tinyint(1) DEFAULT NULL,
  `pronados` tinyint(1) DEFAULT NULL,
  `normal` tinyint(1) DEFAULT NULL,
  `horizontal` tinyint(1) DEFAULT NULL,
  `isquiosTibiais` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gastrocnemios` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soleo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pelveTrocanterianosGluteos` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adutores` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `avaliacaorpg`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacaotratamentofacial`
--

CREATE TABLE IF NOT EXISTS `avaliacaotratamentofacial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `pa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alergias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `antecedentes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  `tabagismo` tinyint(1) DEFAULT '0',
  `etilismo` tinyint(1) DEFAULT '0',
  `hipertensao` tinyint(1) DEFAULT '0',
  `dormeBem` tinyint(1) DEFAULT '0',
  `alcolico` tinyint(1) DEFAULT '0',
  `marcapasso` tinyint(1) DEFAULT '0',
  `diabetes` tinyint(1) DEFAULT '0',
  `queloides` tinyint(1) DEFAULT '0',
  `atividadeFisica` tinyint(1) DEFAULT '0',
  `cuidadosFaciais` text COLLATE utf8_unicode_ci,
  `cuidadosCorporais` text COLLATE utf8_unicode_ci,
  `alteracaoHormonal` text COLLATE utf8_unicode_ci,
  `proteseMetalica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervencoesCirurgicas` text COLLATE utf8_unicode_ci,
  `tensaoPremenstrual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantidadeGPA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anticonceptivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tratamento` text COLLATE utf8_unicode_ci,
  `exameFisico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aspectosPele` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1753 ;

--
-- Extraindo dados da tabela `avaliacaotratamentofacial`
--

--
-- Estrutura da tabela `cadastro`
--

CREATE TABLE IF NOT EXISTS `cadastro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `avaliacao_id` int(11) DEFAULT NULL,
  `dataCriacao` date DEFAULT NULL,
  `statusObjeto` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATIVO',
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `contrato_id` (`contrato_id`),
  KEY `avaliacao_id` (`avaliacao_id`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2770 ;

--
-- Extraindo dados da tabela `cadastro`
--

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE IF NOT EXISTS `caixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicio` date DEFAULT NULL,
  `valorInicial` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`id`, `dataInicio`, `valorInicial`) VALUES
(1, '2012-01-01', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `centrocusto`
--

CREATE TABLE IF NOT EXISTS `centrocusto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `centrocusto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'FEMININO',
  `cpf` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `foneFixo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foneCelular` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco_id` int(11) DEFAULT NULL,
  `niver` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `estadoCivil` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'SOLTEIRO',
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cpf_2` (`cpf`),
  KEY `endereco_id` (`endereco_id`),
  KEY `idx_1` (`nome`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1859 ;

--
-- Extraindo dados da tabela `cliente`
--

--
-- Estrutura da tabela `configuracao`
--

CREATE TABLE IF NOT EXISTS `configuracao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avaliacaoPilates` double DEFAULT '0',
  `avaliacaoRPG` double DEFAULT '0',
  `avaliacaoAcupuntura` double DEFAULT '0',
  `avaliacaoEstetica` double DEFAULT '0',
  `caixaValorInicial` double DEFAULT NULL,
  `caixaDataInicial` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `configuracao`
--

INSERT INTO `configuracao` (`id`, `avaliacaoPilates`, `avaliacaoRPG`, `avaliacaoAcupuntura`, `avaliacaoEstetica`, `caixaValorInicial`, `caixaDataInicial`) VALUES
(1, 0, 0, 0, 0, 0, '2010-01-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contapagar`
--

CREATE TABLE IF NOT EXISTS `contapagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataVencimento` date DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `valor` double DEFAULT '0',
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipocusto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mesCompetencia` date DEFAULT NULL,
  `centroCusto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2632 ;

--
-- Extraindo dados da tabela `contapagar`
--

--
-- Estrutura da tabela `contareceber`
--

CREATE TABLE IF NOT EXISTS `contareceber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataVencimento` date DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `valor` double DEFAULT '0',
  `cadastro_id` int(11) DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formaPagamento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacao` text COLLATE utf8_unicode_ci,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `descontos` double DEFAULT '0',
  `caixa` double DEFAULT '0',
  `dataLancamento` date DEFAULT NULL,
  `pai_id` int(11) DEFAULT NULL,
  `ordemParcelamento` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cadastro_id` (`cadastro_id`),
  KEY `tipo` (`tipo`),
  KEY `professorAvaliacao_id` (`professor_id`),
  KEY `pai_id` (`pai_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6565 ;

--
-- Extraindo dados da tabela `contareceber`
--

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentual` double DEFAULT '0',
  `modalidade` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `statusObjeto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_id` (`professor_id`),
  KEY `idx_1` (`modalidade`,`professor_id`),
  KEY `servico_id` (`servico_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=76 ;

--
-- Extraindo dados da tabela `contrato`
--

--
-- Estrutura da tabela `depoimento`
--

CREATE TABLE IF NOT EXISTS `depoimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conteudo` text COLLATE utf8_unicode_ci,
  `autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `depoimento`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logradouro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2779 ;

--
-- Extraindo dados da tabela `endereco`
--

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT '0',
  `data` date DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_id` (`produto_id`),
  KEY `vendedor_id` (`vendedor_id`),
  KEY `idx_1` (`data`,`vendedor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=392 ;

--
-- Extraindo dados da tabela `estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `frequencia`
--

CREATE TABLE IF NOT EXISTS `frequencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `modalidade` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissional_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profissional_id` (`profissional_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `servico_id` (`servico_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9059 ;

--
-- Extraindo dados da tabela `frequencia`
--

--
-- Estrutura da tabela `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `horaInicial` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horaFinal` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cadastro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cadastro_id` (`cadastro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `horario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `conteudo` text COLLATE utf8_unicode_ci,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `noticias`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoria` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=143 ;

--
-- Extraindo dados da tabela `produto`
--

--
-- Estrutura da tabela `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'FEMININO',
  `cpf` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `foneFixo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foneCelular` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salarioBase` double DEFAULT '0',
  `numeroCarteira` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco_id` int(11) DEFAULT NULL,
  `niver` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `porcentagemVendas` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `endereco_id` (`endereco_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Extraindo dados da tabela `professor`
--

--
-- Estrutura da tabela `servico`
--

CREATE TABLE IF NOT EXISTS `servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `centroCusto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Extraindo dados da tabela `servico`
--

--
-- Estrutura da tabela `tipocadastro`
--

CREATE TABLE IF NOT EXISTS `tipocadastro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tipocadastro`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocontapagar`
--

CREATE TABLE IF NOT EXISTS `tipocontapagar` (
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tipocontapagar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocontareceber`
--

CREATE TABLE IF NOT EXISTS `tipocontareceber` (
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tipocontareceber`
--

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusObjeto` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'ATIVO',
  PRIMARY KEY (`id`),
  KEY `idx_1` (`statusObjeto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `senha`, `tipo`, `statusObjeto`) VALUES
(1, 'admin', 'email4321', 'ADMINISTRADOR', 'ATIVO');

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE IF NOT EXISTS `vendedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentual` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `vendedor`
--


--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `contareceber`
--
ALTER TABLE `contareceber`
  ADD CONSTRAINT `contareceber_ibfk_1` FOREIGN KEY (`pai_id`) REFERENCES `contareceber` (`id`);

--
-- Restrições para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`id`);

--
-- Restrições para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `estoque_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `professor` (`id`);

--
-- Restrições para a tabela `frequencia`
--
ALTER TABLE `frequencia`
  ADD CONSTRAINT `frequencia_ibfk_1` FOREIGN KEY (`profissional_id`) REFERENCES `professor` (`id`),
  ADD CONSTRAINT `frequencia_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `frequencia_ibfk_3` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`id`);

  
  