DROP TABLE IF EXISTS `artigos`;

CREATE TABLE `artigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `conteudo` text COLLATE utf8_unicode_ci,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table avaliacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avaliacao`;

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conhecimentoStudio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table avaliacaoacupuntura
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avaliacaoacupuntura`;

CREATE TABLE `avaliacaoacupuntura` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table avaliacaoestetica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avaliacaoestetica`;

CREATE TABLE `avaliacaoestetica` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table avaliacaopilates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avaliacaopilates`;

CREATE TABLE `avaliacaopilates` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table avaliacaorpg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avaliacaorpg`;

CREATE TABLE `avaliacaorpg` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cadastro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cadastro`;

CREATE TABLE `cadastro` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cpf_2` (`cpf`),
  KEY `endereco_id` (`endereco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table configuracao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `configuracao`;

CREATE TABLE `configuracao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avaliacaoPilates` double DEFAULT '0',
  `avaliacaoRPG` double DEFAULT '0',
  `avaliacaoAcupuntura` double DEFAULT '0',
  `avaliacaoEstetica` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contapagar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contapagar`;

CREATE TABLE `contapagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataVencimento` date DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `valor` double DEFAULT '0',
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contareceber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contareceber`;

CREATE TABLE `contareceber` (
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
  PRIMARY KEY (`id`),
  KEY `cadastro_id` (`cadastro_id`),
  KEY `tipo` (`tipo`),
  KEY `professorAvaliacao_id` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table contrato
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contrato`;

CREATE TABLE `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentual` double DEFAULT '0',
  `modalidade` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_id` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table depoimento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `depoimento`;

CREATE TABLE `depoimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conteudo` text COLLATE utf8_unicode_ci,
  `autor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table endereco
# ------------------------------------------------------------

DROP TABLE IF EXISTS `endereco`;

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logradouro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table noticias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `noticias`;

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `conteudo` text COLLATE utf8_unicode_ci,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table professor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `professor`;

CREATE TABLE `professor` (
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
  PRIMARY KEY (`id`),
  KEY `endereco_id` (`endereco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tipocadastro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipocadastro`;

CREATE TABLE `tipocadastro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tipocontapagar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipocontapagar`;

CREATE TABLE `tipocontapagar` (
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tipocontareceber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipocontareceber`;

CREATE TABLE `tipocontareceber` (
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
