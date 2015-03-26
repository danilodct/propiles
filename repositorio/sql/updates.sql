CREATE TABLE `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `horaInicial` varchar(20) DEFAULT NULL,
  `horaFinal` varchar(20) DEFAULT NULL,
  `cadastro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY cadastro_id (`cadastro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `frequencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime,
  `modalidade` varchar(20) DEFAULT NULL,
  `profissional_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (profissional_id) REFERENCES professor(`id`),
  FOREIGN KEY (cliente_id) REFERENCES cliente(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `valor` double DEFAULT 0.0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `vendedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `fone1` varchar(255) DEFAULT NULL,
  `fone2` varchar(255) DEFAULT NULL,
  `percentual` double DEFAULT 0.0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double default 0.0,
  `data` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  produto_id int(11),
  vendedor_id int(11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (produto_id) REFERENCES produto(id), 
  FOREIGN KEY (vendedor_id) REFERENCES vendedor(id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

alter table professor add column porcentagemVendas double;
alter table professor change column porcentagemVendas porcentagemVendas double default 0;
update professor set porcentagemVendas = 0;

drop table estoque;

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double default 0.0,
  `data` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  produto_id int(11),
  vendedor_id int(11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (produto_id) REFERENCES produto(id), 
  FOREIGN KEY (vendedor_id) REFERENCES professor(id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `avaliacaotratamentofacial` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	aspectosPele text,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `avaliacaocirurgiaplastica` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),

	cirurgiaPlastica varchar(255),
	medicoAcompanhante varchar(255),
	atoCirurgico varchar(255),
	edema varchar(255),
	equimose varchar(255),
	fibrose varchar(255),
	fpo varchar(255),
	seroma varchar(255),
	descenciaCirurgica varchar(255),
	mamaAvaliacao varchar(255),		
	mamaPerda varchar(255),
	esternoAvaliacao varchar(255),
	esternoPerda varchar(255),
	cinturaAvaliacao varchar(255),
	cinturaPerda varchar(255),
	cicatrizUmbilicalAvaliacao varchar(255),		
	cicatrizUmbilicalPerda varchar(255),
	cristaIliacaAvaliacao varchar(255),		
	cristaIliacaPerda varchar(255),
	quadrilAvaliacao varchar(255),
	quadrilPerda varchar(255),
	pregaGluteaAvaliacao varchar(255),
	pregaGluteaPerda varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `avaliacaogestante` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),

	numeroSemanas varchar(255),
	medicoAcompanhante varchar(255),
	mid text,
	mie text,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `avaliacaogorduralocalizada` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	gorduraLocalizada varchar(255),
	mamaAvaliacao varchar(255),		
	mamaPerda varchar(255),
	esternoAvaliacao varchar(255),
	esternoPerda varchar(255),
	cinturaAvaliacao varchar(255),
	cinturaPerda varchar(255),
	cicatrizUmbilicalAvaliacao varchar(255),		
	cicatrizUmbilicalPerda varchar(255),
	cristaIliacaAvaliacao varchar(255),		
	cristaIliacaPerda varchar(255),
	quadrilAvaliacao varchar(255),
	quadrilPerda varchar(255),
	pregaGluteaAvaliacao varchar(255),
	pregaGluteaPerda varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `avaliacaoestria` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `avaliacaodayspa` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `avaliacaodepilacao` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),

	aspectoPelo varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `avaliacaoalteracoescirculatorias` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	direita text,
	esquerda text,
	mamaAvaliacao varchar(255),		
	mamaPerda varchar(255),
	esternoAvaliacao varchar(255),
	esternoPerda varchar(255),
	cinturaAvaliacao varchar(255),
	cinturaPerda varchar(255),
	cicatrizUmbilicalAvaliacao varchar(255),		
	cicatrizUmbilicalPerda varchar(255),
	cristaIliacaAvaliacao varchar(255),		
	cristaIliacaPerda varchar(255),
	quadrilAvaliacao varchar(255),
	quadrilPerda varchar(255),
	pregaGluteaAvaliacao varchar(255),
	pregaGluteaPerda varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

alter table frequencia change modalidade modalidade varchar(100) DEFAULT NULL;

alter table avaliacaocirurgiaplastica add column mamaAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column mamaAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column mamaAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column mamaAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column mamaAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column mamaAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column mamaAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column mamaAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column mamaAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column mamaAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column mamaAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column mamaAvaliacao5 varchar(255);

alter table avaliacaocirurgiaplastica add column esternoAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column esternoAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column esternoAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column esternoAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column esternoAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column esternoAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column esternoAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column esternoAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column esternoAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column esternoAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column esternoAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column esternoAvaliacao5 varchar(255);

alter table avaliacaocirurgiaplastica add column cinturaAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column cinturaAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column cinturaAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column cinturaAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column cinturaAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column cinturaAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column cinturaAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column cinturaAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cinturaAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cinturaAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cinturaAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cinturaAvaliacao5 varchar(255);

alter table avaliacaocirurgiaplastica add column cicatrizUmbilicalAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column cicatrizUmbilicalAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column cicatrizUmbilicalAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column cicatrizUmbilicalAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column cicatrizUmbilicalAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column cicatrizUmbilicalAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column cicatrizUmbilicalAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column cicatrizUmbilicalAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cicatrizUmbilicalAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cicatrizUmbilicalAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cicatrizUmbilicalAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cicatrizUmbilicalAvaliacao5 varchar(255);

alter table avaliacaocirurgiaplastica add column cristaIliacaAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column cristaIliacaAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column cristaIliacaAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column cristaIliacaAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column cristaIliacaAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column cristaIliacaAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column cristaIliacaAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column cristaIliacaAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cristaIliacaAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cristaIliacaAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cristaIliacaAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column cristaIliacaAvaliacao5 varchar(255);

alter table avaliacaocirurgiaplastica add column quadrilAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column quadrilAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column quadrilAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column quadrilAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column quadrilAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column quadrilAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column quadrilAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column quadrilAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column quadrilAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column quadrilAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column quadrilAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column quadrilAvaliacao5 varchar(255);

alter table avaliacaocirurgiaplastica add column pregaGluteaAvaliacao2 varchar(255);
alter table avaliacaocirurgiaplastica add column pregaGluteaAvaliacao3 varchar(255);
alter table avaliacaocirurgiaplastica add column pregaGluteaAvaliacao4 varchar(255);
alter table avaliacaocirurgiaplastica add column pregaGluteaAvaliacao5 varchar(255);
alter table avaliacaogorduralocalizada add column pregaGluteaAvaliacao2 varchar(255);
alter table avaliacaogorduralocalizada add column pregaGluteaAvaliacao3 varchar(255);
alter table avaliacaogorduralocalizada add column pregaGluteaAvaliacao4 varchar(255);
alter table avaliacaogorduralocalizada add column pregaGluteaAvaliacao5 varchar(255);
alter table avaliacaoalteracoescirculatorias add column pregaGluteaAvaliacao2 varchar(255);
alter table avaliacaoalteracoescirculatorias add column pregaGluteaAvaliacao3 varchar(255);
alter table avaliacaoalteracoescirculatorias add column pregaGluteaAvaliacao4 varchar(255);
alter table avaliacaoalteracoescirculatorias add column pregaGluteaAvaliacao5 varchar(255);




CREATE TABLE `avaliacaonutricao` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	pesoMax varchar(255),
	pesoMin varchar(255),
	pesoDesejado varchar(255),
	imc varchar(255),
	cintura varchar(255),
	quadril varchar(255),
	branco varchar(255),
	biceps varchar(255),
	triceps varchar(255),
	subescapular varchar(255),
	suprailiaca varchar(255),
	antebraco varchar(255),
	fletido varchar(255),
	axilar varchar(255),
	abdominal varchar(255),
	coxa varchar(255),
	peitoral varchar(255),
	gordura varchar(255),
	exercicio varchar(255),
	frequenciaExercicio varchar(255),
	horasSono varchar(255),
	cansacoMomento varchar(255),
	suplemento varchar(255),
	alterouPeso varchar(255),
	consumoCafe varchar(255),
	consumoLanche1 varchar(255),
	consumoAlmoco varchar(255),
	consumoLanche2 varchar(255),
	consumoJantar varchar(255),
	consumoLanche3 varchar(255),		
	fazTratamento tinyint(1) default 0,
	achaCompulsivo tinyint(1) default 0,
	sonoTranquilo tinyint(1) default 0,
	vontadeComerDoce tinyint(1) default 0,
	cansaco tinyint(1) default 0,
	intestinoPreso tinyint(1) default 0,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `avaliacaopowershape` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	gorduraLocalizada varchar(255),
	mamaAvaliacao varchar(255),		
	mamaPerda varchar(255),
	esternoAvaliacao varchar(255),
	esternoPerda varchar(255),
	cinturaAvaliacao varchar(255),
	cinturaPerda varchar(255),
	cicatrizUmbilicalAvaliacao varchar(255),		
	cicatrizUmbilicalPerda varchar(255),
	cristaIliacaAvaliacao varchar(255),		
	cristaIliacaPerda varchar(255),
	quadrilAvaliacao varchar(255),
	quadrilPerda varchar(255),
	pregaGluteaAvaliacao varchar(255),
	pregaGluteaPerda varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
alter table avaliacaopowershape add column mamaAvaliacao2 varchar(255);
alter table avaliacaopowershape add column mamaAvaliacao3 varchar(255);
alter table avaliacaopowershape add column mamaAvaliacao4 varchar(255);
alter table avaliacaopowershape add column mamaAvaliacao5 varchar(255);
alter table avaliacaopowershape add column esternoAvaliacao2 varchar(255);
alter table avaliacaopowershape add column esternoAvaliacao3 varchar(255);
alter table avaliacaopowershape add column esternoAvaliacao4 varchar(255);
alter table avaliacaopowershape add column esternoAvaliacao5 varchar(255);
alter table avaliacaopowershape add column cinturaAvaliacao2 varchar(255);
alter table avaliacaopowershape add column cinturaAvaliacao3 varchar(255);
alter table avaliacaopowershape add column cinturaAvaliacao4 varchar(255);
alter table avaliacaopowershape add column cinturaAvaliacao5 varchar(255);
alter table avaliacaopowershape add column cicatrizUmbilicalAvaliacao2 varchar(255);
alter table avaliacaopowershape add column cicatrizUmbilicalAvaliacao3 varchar(255);
alter table avaliacaopowershape add column cicatrizUmbilicalAvaliacao4 varchar(255);
alter table avaliacaopowershape add column cicatrizUmbilicalAvaliacao5 varchar(255);
alter table avaliacaopowershape add column cristaIliacaAvaliacao2 varchar(255);
alter table avaliacaopowershape add column cristaIliacaAvaliacao3 varchar(255);
alter table avaliacaopowershape add column cristaIliacaAvaliacao4 varchar(255);
alter table avaliacaopowershape add column cristaIliacaAvaliacao5 varchar(255);
alter table avaliacaopowershape add column quadrilAvaliacao2 varchar(255);
alter table avaliacaopowershape add column quadrilAvaliacao3 varchar(255);
alter table avaliacaopowershape add column quadrilAvaliacao4 varchar(255);
alter table avaliacaopowershape add column quadrilAvaliacao5 varchar(255);
alter table avaliacaopowershape add column pregaGluteaAvaliacao2 varchar(255);
alter table avaliacaopowershape add column pregaGluteaAvaliacao3 varchar(255);
alter table avaliacaopowershape add column pregaGluteaAvaliacao4 varchar(255);
alter table avaliacaopowershape add column pregaGluteaAvaliacao5 varchar(255);


CREATE TABLE `avaliacaodermatologia` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	aspectosPele text,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


alter table usuario add column statusObjeto varchar(100) default 'ATIVO';
update usuario set statusObjeto = 'ATIVO';

alter table cliente add column estadoCivil varchar(100) default 'SOLTEIRO';
update cliente set estadoCivil = 'SOLTEIRO';


CREATE TABLE `avaliacaonatacaoinfantil` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

alter table cliente add column dataCadastro date default null;

update endereco set bairro = 'GRAÇAS' where bairro = 'GraÃ§as';
update endereco set bairro = 'Várzea' where bairro = 'VÃ¡rzea';
update endereco set bairro = 'Poço da Panela' where bairro = 'PoÃ§o da Panela';
update endereco set bairro = 'JARDIM ATLATINCO' where bairro = 'Jardim AtlÃ¢ntico';
update endereco set bairro = 'Torrões' where bairro = 'TorrÃµes';
update endereco set bairro = 'Jardim São Paulo' where bairro = 'Jardim SÃ£o Paulo';
update endereco set bairro = 'Torreão' where bairro = 'TorreÃ£o';
update endereco set bairro = '7ª RO' where bairro = '7Âº/RO';
update endereco set bairro = 'Timbi' where bairro = 'TimbÃ­';
update endereco set bairro = 'Bomba do Hemetério' where bairro = 'Bomba do HemetÃ©rio';
update endereco set bairro = 'Dois Irmãos' where bairro = 'Dois IrmÃ£os';
update endereco set bairro = 'Nossa Senhora do Ó' where bairro = 'Nossa Senhora do Ã';
update endereco set bairro = 'Vila da Fábrica' where bairro = 'Vila da FÃ¡brica';
update endereco set bairro = 'Vila da Saúde' where bairro = 'Vila da SaÃºde';
update endereco set bairro = 'Tejipió' where bairro = 'TejipiÃ³';
update endereco set bairro = 'Santo Inácio' where bairro = 'Santo InÃ¡cio';
update endereco set bairro = 'Sítio dos Pintos' where bairro = 'SÃ­tio dos Pintos';

alter table avaliacaodermatologia add column historia tinyint(1) default 0;
alter table avaliacaodermatologia add column melanoma tinyint(1) default 0;
alter table avaliacaodermatologia add column cancerPeleMelanoma tinyint(1) default 0;
alter table avaliacaodermatologia add column lesaoBenigna tinyint(1) default 0;

update avaliacaodermatologia set historia = 0, melanoma = 0, cancerPeleMelanoma = 0, lesaoBenigna = 0;


alter table avaliacaodermatologia add column historiaFamiliar tinyint(1) default 0;
alter table avaliacaodermatologia add column melanoma2 tinyint(1) default 0;
alter table avaliacaodermatologia add column cancerPeleMelanoma2 tinyint(1) default 0;
alter table avaliacaodermatologia add column nevos tinyint(1) default 0;
alter table avaliacaodermatologia add column azul tinyint(1) default 0;
alter table avaliacaodermatologia add column verde tinyint(1) default 0;
alter table avaliacaodermatologia add column marrom tinyint(1) default 0;
alter table avaliacaodermatologia add column fotodanificada tinyint(1) default 0;
alter table avaliacaodermatologia add column lentigos tinyint(1) default 0;
alter table avaliacaodermatologia add column nenhuma tinyint(1) default 0;
alter table avaliacaodermatologia add column monitoramento tinyint(1) default 0;
alter table avaliacaodermatologia add column excisao tinyint(1) default 0;
 
update avaliacaodermatologia set historiaFamiliar = 0, melanoma2 = 0, cancerPeleMelanoma2 = 0, nevos = 0, azul = 0, verde = 0, marrom = 0, fotodanificada = 0, lentigos = 0, nenhuma = 0, monitoramento = 0, excisao = 0;
 
alter table avaliacaodermatologia add column fototipo varchar(255);
alter table avaliacaodermatologia add column numeroNevos varchar(255);
alter table avaliacaodermatologia add column numeroNevosAtipicos varchar(255);
 
 
alter table avaliacaodermatologia add column frontal tinyint(1) default 0;
alter table avaliacaodermatologia add column posterior tinyint(1) default 0;
alter table avaliacaodermatologia add column facePerfil tinyint(1) default 0;
alter table avaliacaodermatologia add column face tinyint(1) default 0;
alter table avaliacaodermatologia add column plantar tinyint(1) default 0;
alter table avaliacaodermatologia add column pes tinyint(1) default 0;
alter table avaliacaodermatologia add column maos tinyint(1) default 0;
alter table avaliacaodermatologia add column palmar tinyint(1) default 0;
 
update avaliacaodermatologia set frontal = 0, posterior = 0, facePerfil = 0, face = 0, plantar = 0, pes = 0, maos = 0, palmar = 0;
 
alter table contrato add column statusObjeto varchar(255);
update contrato set statusObjeto = 'ATIVO';
 
 
alter table avaliacaodermatologia add column avaliacao varchar(500);


ALTER TABLE CLIENTE ADD COLUMN conhecimentoStudio varchar(255);

update cliente set conhecimentoStudio = 'INDICACAO' where id =	2;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	6;	
update cliente set conhecimentoStudio = 'FOLDERS' where id =	7;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	11;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	12	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	17	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	21	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	22	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	23	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	25	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	27	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	32	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	33	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	40	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	42	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	48	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	49	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	63	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	73	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	74	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	78	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	80	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	89;	
update cliente set conhecimentoStudio = 'INTERNET' where id =	105;	
update cliente set conhecimentoStudio = 'FOLDERS' where id =	106	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	109	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	110	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	121;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	128	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	129	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	130	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	133	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	135	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	142	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	143	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	144	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	152	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	155	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	159;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	161	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	168	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	175	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	185	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	187	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	189;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	193	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	196	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	197;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	199	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	200	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	212	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	219	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	220	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	221	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	222	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	226	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	229	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	232	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	238	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	241	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	252	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	253	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	255	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	257	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	260;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	266	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	271	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	272	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	277	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	281	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	284;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	285	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	288	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	290	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	305	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	333	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	337	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	343;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	349	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	361	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	362;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	363	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	366	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	370;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	381	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	384;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	386	;
update cliente set conhecimentoStudio = 'JORNAL' where id =	395	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	396;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	403	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	405	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	409	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	410	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	411	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	412	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	419	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	421	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	422	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	426	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	443;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	444	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	446	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	470;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	471	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	475	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	476	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	480	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	493	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	494	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	512	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	513;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	515	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	520	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	527	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	533	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	543	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	550;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	564	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	603	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	620	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	621	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	628	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	629	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	634	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	678	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	685	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	691	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	705	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	708	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	710	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	713	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	718	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	719	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	725	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	728	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	736	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	740	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	750	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	752	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	755	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	769	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	771	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	773;	
update cliente set conhecimentoStudio = 'CARTAZ' where id =	775	;
update cliente set conhecimentoStudio = 'CARTAO' where id =	782	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	784;	
update cliente set conhecimentoStudio = 'INDICACAO' where id =	795	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	813	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	830	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	831	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	837	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	863	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	920	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	924	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	959	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	995	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1015	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1017	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	1024	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1025	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1028	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1032	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1033	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1075	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	1101	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1175	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1183	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1187	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1219	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1231	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	1314	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1326	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1334	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1345	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1352	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1367	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1407	;
update cliente set conhecimentoStudio = 'VIZINHOS' where id =	1410	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1414	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1422	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1443	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1454	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1462	;
update cliente set conhecimentoStudio = 'INDICACAO' where id =	1478	;
update cliente set conhecimentoStudio = 'CARTAZ' where id =	1481	;
update cliente set conhecimentoStudio = 'INTERNET' where id =	1482	;
update cliente set conhecimentoStudio = 'FOLDERS' where id =	1502	;


UPDATE cliente SET conhecimentoStudio = 'Cartão' WHERE conhecimentoStudio = 'CARTAO';
UPDATE cliente SET conhecimentoStudio = 'Cartaz' WHERE conhecimentoStudio = 'CARTAZ';
UPDATE cliente SET conhecimentoStudio = 'Folders' WHERE conhecimentoStudio = 'FOLDERS';
UPDATE cliente SET conhecimentoStudio = 'Indicação' WHERE conhecimentoStudio = 'INDICACAO';
UPDATE cliente SET conhecimentoStudio = 'Internet' WHERE conhecimentoStudio = 'INTERNET';
UPDATE cliente SET conhecimentoStudio = 'Jornal' WHERE conhecimentoStudio = 'JORNAL';
UPDATE cliente SET conhecimentoStudio = 'Vizinhos' WHERE conhecimentoStudio = 'VIZINHOS';

CREATE TABLE `avaliacaolimpezapele` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	aspectosPele text,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `avaliacaopeeling` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	aspectosPele text,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE contareceber ADD COLUMN descontos DOUBLE DEFAULT 0.0;
UPDATE contareceber SET descontos = 0 WHERE descontos IS NULL;
ALTER TABLE contareceber ADD COLUMN caixa DOUBLE DEFAULT 0.0;
UPDATE contareceber SET caixa = 0 WHERE caixa IS NULL;
ALTER TABLE contareceber ADD COLUMN dataLancamento DATE DEFAULT NULL;
UPDATE contareceber SET dataLancamento = dataPagamento WHERE dataLancamento IS NULL;
ALTER TABLE contareceber ADD COLUMN pai_id INT(11);
ALTER TABLE contareceber ADD FOREIGN KEY (pai_id) REFERENCES contareceber(id);
ALTER TABLE contareceber ADD COLUMN ordemParcelamento INT(10);
update contareceber set ordemParcelamento = 1;
update contareceber set formaPagamento = 'CHEQUE_1' where formaPagamento = 'CHEQUE';
update contareceber set formaPagamento = 'DEBITO' where formaPagamento = 'CARTAO';

UPDATE contareceber SET caixa = valor WHERE formaPagamento = 'DINHEIRO';
UPDATE contareceber SET caixa = valor WHERE formaPagamento LIKE 'CHEQUE%';
UPDATE contareceber SET caixa = (valor - valor*0.025) WHERE formaPagamento LIKE 'DEBITO';
UPDATE contareceber SET descontos = (valor*0.025) WHERE formaPagamento LIKE 'DEBITO';
UPDATE contareceber SET caixa = (valor - valor*0.035) WHERE formaPagamento LIKE 'CREDITO%';
UPDATE contareceber SET descontos = (valor*0.035) WHERE formaPagamento LIKE 'CREDITO%';


CREATE TABLE `caixa` (
	id int(11) NOT NULL AUTO_INCREMENT,
	dataInicio date,
	valorInicial double,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
insert into caixa values (1, '2014-10-31', 0);



CREATE TABLE `avaliacaocripolise` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	gorduraLocalizada varchar(255),
	mamaAvaliacao varchar(255),		
	mamaPerda varchar(255),
	esternoAvaliacao varchar(255),
	esternoPerda varchar(255),
	cinturaAvaliacao varchar(255),
	cinturaPerda varchar(255),
	cicatrizUmbilicalAvaliacao varchar(255),		
	cicatrizUmbilicalPerda varchar(255),
	cristaIliacaAvaliacao varchar(255),		
	cristaIliacaPerda varchar(255),
	quadrilAvaliacao varchar(255),
	quadrilPerda varchar(255),
	pregaGluteaAvaliacao varchar(255),
	pregaGluteaPerda varchar(255),
	
	mamaAvaliacao2 varchar(255),
	mamaAvaliacao3 varchar(255),
	mamaAvaliacao4 varchar(255),
	mamaAvaliacao5 varchar(255),
	esternoAvaliacao2 varchar(255),
	esternoAvaliacao3 varchar(255),
	esternoAvaliacao4 varchar(255),
	esternoAvaliacao5 varchar(255),
	cinturaAvaliacao2 varchar(255),
	cinturaAvaliacao3 varchar(255),
	cinturaAvaliacao4 varchar(255),
	cinturaAvaliacao5 varchar(255),
	cicatrizUmbilicalAvaliacao2 varchar(255),
	cicatrizUmbilicalAvaliacao3 varchar(255),
	cicatrizUmbilicalAvaliacao4 varchar(255),
	cicatrizUmbilicalAvaliacao5 varchar(255),
	quadrilAvaliacao2 varchar(255),
	quadrilAvaliacao3 varchar(255),
	quadrilAvaliacao4 varchar(255),
	quadrilAvaliacao5 varchar(255),
	pregaGluteaAvaliacao2 varchar(255),
	pregaGluteaAvaliacao3 varchar(255),
	pregaGluteaAvaliacao4 varchar(255),
	pregaGluteaAvaliacao5 varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `avaliacaoprojeto100dias` (
	id int(11) NOT NULL AUTO_INCREMENT,
	data date,
	peso double,
	altura double,
	objetivo text,
	pa varchar(255),
	medicacao varchar(255),
	alergias varchar(255),
	antecedentes  varchar(255),
	conhecimentoStudio varchar(255),
	observacoes text,
	tabagismo tinyint(1) default 0,
	etilismo tinyint(1) default 0,
	hipertensao tinyint(1) default 0,
	dormeBem tinyint(1) default 0,
	alcolico tinyint(1) default 0,
	marcapasso tinyint(1) default 0,
	diabetes tinyint(1) default 0,
	queloides tinyint(1) default 0,
	atividadeFisica tinyint(1) default 0,
	cuidadosFaciais text,
	cuidadosCorporais text,
	alteracaoHormonal text,
	proteseMetalica varchar(255),
	intervencoesCirurgicas text,
	tensaoPremenstrual varchar(255),
	quantidadeGPA varchar(255),
	anticonceptivo varchar(255),
	tratamento text,
	exameFisico varchar(255),
	
	gorduraLocalizada varchar(255),
	mamaAvaliacao varchar(255),		
	mamaPerda varchar(255),
	esternoAvaliacao varchar(255),
	esternoPerda varchar(255),
	cinturaAvaliacao varchar(255),
	cinturaPerda varchar(255),
	cicatrizUmbilicalAvaliacao varchar(255),		
	cicatrizUmbilicalPerda varchar(255),
	cristaIliacaAvaliacao varchar(255),		
	cristaIliacaPerda varchar(255),
	quadrilAvaliacao varchar(255),
	quadrilPerda varchar(255),
	pregaGluteaAvaliacao varchar(255),
	pregaGluteaPerda varchar(255),
	
	mamaAvaliacao2 varchar(255),
	mamaAvaliacao3 varchar(255),
	mamaAvaliacao4 varchar(255),
	mamaAvaliacao5 varchar(255),
	esternoAvaliacao2 varchar(255),
	esternoAvaliacao3 varchar(255),
	esternoAvaliacao4 varchar(255),
	esternoAvaliacao5 varchar(255),
	cinturaAvaliacao2 varchar(255),
	cinturaAvaliacao3 varchar(255),
	cinturaAvaliacao4 varchar(255),
	cinturaAvaliacao5 varchar(255),
	cicatrizUmbilicalAvaliacao2 varchar(255),
	cicatrizUmbilicalAvaliacao3 varchar(255),
	cicatrizUmbilicalAvaliacao4 varchar(255),
	cicatrizUmbilicalAvaliacao5 varchar(255),
	quadrilAvaliacao2 varchar(255),
	quadrilAvaliacao3 varchar(255),
	quadrilAvaliacao4 varchar(255),
	quadrilAvaliacao5 varchar(255),
	pregaGluteaAvaliacao2 varchar(255),
	pregaGluteaAvaliacao3 varchar(255),
	pregaGluteaAvaliacao4 varchar(255),
	pregaGluteaAvaliacao5 varchar(255),

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

alter table contapagar add column tipocusto varchar(100);
alter table contapagar add column mesCompetencia date;
update contapagar set mesCompetencia = dataPagamento;



CREATE TABLE `servico` (
	id int(11) NOT NULL AUTO_INCREMENT,
	nome varchar(255),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into servico (nome) values ("Cripólise");
insert into servico (nome) values ("Day Spa");
insert into servico (nome) values ("Depilação a Laser");
insert into servico (nome) values ("Dermatologia");
insert into servico (nome) values ("Design de cilios e sobrancelha");
insert into servico (nome) values ("GL e FEG");
insert into servico (nome) values ("Hidroginástica");
insert into servico (nome) values ("Limpeza de pele");
insert into servico (nome) values ("Massagens relaxantes e terapêuticas");
insert into servico (nome) values ("Micropigmentação");
insert into servico (nome) values ("Natação Infantil");
insert into servico (nome) values ("Peeling");
insert into servico (nome) values ("Projeto 100 dias");
insert into servico (nome) values ("Pré e pós operatóroio Cirurgia Plástica");
insert into servico (nome) values ("Pós Mastectomia");
insert into servico (nome) values ("Tratamento para estrias");
insert into servico (nome) values ("Tratamento facial");
insert into servico (nome) values ("Tratamento para Gestantes");
insert into servico (nome) values ("Treinamento funcional");
insert into servico (nome) values ("Nutrição");
insert into servico (nome) values ("Power shape");



alter table contrato add column servico_id int(11);
ALTER TABLE contrato ADD FOREIGN KEY (servico_id) REFERENCES servico(id);
update contrato set servico_id = 1 where modalidade = "CRIPOLISE";
update contrato set servico_id = 2 where modalidade = "DAY_SPA";
update contrato set servico_id = 3 where modalidade = "DEPILACAO_LASER";
update contrato set servico_id = 4 where modalidade = "DERMATOLOGIA";
update contrato set servico_id = 5 where modalidade = "DESIGN_CILIOS_SOBRANCELHAS";
update contrato set servico_id = 6 where modalidade = "GL_FEG";
update contrato set servico_id = 7 where modalidade = "HIDROGINASTICA";
update contrato set servico_id = 8 where modalidade = "LIMPEZA_PELE";
update contrato set servico_id = 9 where modalidade = "MASSAGENS_RELAXANTES_TERAPEUTICAS";
update contrato set servico_id = 10 where modalidade = "MICROPIGMENTACAO";
update contrato set servico_id = 11 where modalidade = "NATACAO_INFANTIL";
update contrato set servico_id = 12 where modalidade = "PEELING";
update contrato set servico_id = 13 where modalidade = "PROJETO_100_DIAS";
update contrato set servico_id = 14 where modalidade = "OPERATORIO_CIRURGIA";
update contrato set servico_id = 15 where modalidade = "POS_MASTECTOMIA";
update contrato set servico_id = 16 where modalidade = "TRATAMENTO_ESTRIAS";
update contrato set servico_id = 17 where modalidade = "TRATAMENTO_FACIAL";
update contrato set servico_id = 18 where modalidade = "TRATAMENTO_GESTANTE";
update contrato set servico_id = 19 where modalidade = "TREINAMENTO_FUNCIONAL";
update contrato set servico_id = 20 where modalidade = "NUTRICAO";
update contrato set servico_id = 21 where modalidade = "POWER_SHAPE";



alter table avaliacao add column data date;
alter table avaliacao add column peso double;
alter table avaliacao add column altura double;
alter table avaliacao add column objetivo text;
alter table avaliacao add column pa varchar(255);
alter table avaliacao add column medicacao varchar(255);
alter table avaliacao add column alergias varchar(255);
alter table avaliacao add column antecedentes  varchar(255);
alter table avaliacao add column observacoes text;
alter table avaliacao add column tabagismo tinyint(1) default 0;
alter table avaliacao add column etilismo tinyint(1) default 0;
alter table avaliacao add column hipertensao tinyint(1) default 0;
alter table avaliacao add column dormeBem tinyint(1) default 0;
alter table avaliacao add column alcolico tinyint(1) default 0;
alter table avaliacao add column marcapasso tinyint(1) default 0;
alter table avaliacao add column diabetes tinyint(1) default 0;
alter table avaliacao add column queloides tinyint(1) default 0;
alter table avaliacao add column atividadeFisica tinyint(1) default 0;
alter table avaliacao add column cuidadosFaciais text;
alter table avaliacao add column cuidadosCorporais text;
alter table avaliacao add column alteracaoHormonal text;
alter table avaliacao add column proteseMetalica varchar(255);
alter table avaliacao add column intervencoesCirurgicas text;
alter table avaliacao add column tensaoPremenstrual varchar(255);
alter table avaliacao add column quantidadeGPA varchar(255);
alter table avaliacao add column anticonceptivo varchar(255);
alter table avaliacao add column tratamento text;
alter table avaliacao add column exameFisico varchar(255);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaodayspa AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodayspa AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaodepilacao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodepilacao AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaodermatologia AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaodermatologia AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaoestria AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoestria AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaogestante AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogestante AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaonatacaoinfantil AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonatacaoinfantil AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaonutricao AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaonutricao AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaopowershape AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaopowershape AS ava2);

UPDATE avaliacao AS ava1 SET ava1.data = (SELECT ava2.data FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.conhecimentoStudio = (SELECT ava2.conhecimentoStudio FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.peso = (SELECT ava2.peso FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.altura = (SELECT ava2.altura FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.objetivo = (SELECT ava2.objetivo FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pa = (SELECT ava2.pa FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.medicacao = (SELECT ava2.medicacao FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alergias = (SELECT ava2.alergias FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.antecedentes = (SELECT ava2.antecedentes FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.observacoes = (SELECT ava2.observacoes FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tabagismo = (SELECT ava2.tabagismo FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.etilismo = (SELECT ava2.etilismo FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.hipertensao = (SELECT ava2.hipertensao FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.dormeBem = (SELECT ava2.dormeBem FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alcolico = (SELECT ava2.alcolico FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.marcapasso = (SELECT ava2.marcapasso FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.diabetes = (SELECT ava2.diabetes FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.queloides = (SELECT ava2.queloides FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.atividadeFisica = (SELECT ava2.atividadeFisica FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosFaciais = (SELECT ava2.cuidadosFaciais FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cuidadosCorporais = (SELECT ava2.cuidadosCorporais FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.alteracaoHormonal = (SELECT ava2.alteracaoHormonal FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.proteseMetalica = (SELECT ava2.proteseMetalica FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.intervencoesCirurgicas = (SELECT ava2.intervencoesCirurgicas FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tensaoPremenstrual = (SELECT ava2.tensaoPremenstrual FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quantidadeGPA = (SELECT ava2.quantidadeGPA FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.anticonceptivo = (SELECT ava2.anticonceptivo FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.tratamento = (SELECT ava2.tratamento FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);
UPDATE avaliacao AS ava1 SET ava1.exameFisico = (SELECT ava2.exameFisico FROM avaliacaotratamentofacial AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaotratamentofacial AS ava2);


alter table frequencia add column servico_id int(11);
alter table frequencia add foreign key (servico_id) references servico(id);

update frequencia set servico_id = 1 where modalidade = "CRIPOLISE";
update frequencia set servico_id = 2 where modalidade = "DAY_SPA";
update frequencia set servico_id = 3 where modalidade = "DEPILACAO_LASER";
update frequencia set servico_id = 4 where modalidade = "DERMATOLOGIA";
update frequencia set servico_id = 5 where modalidade = "DESIGN_CILIOS_SOBRANCELHAS";
update frequencia set servico_id = 6 where modalidade = "GL_FEG";
update frequencia set servico_id = 7 where modalidade = "HIDROGINASTICA";
update frequencia set servico_id = 8 where modalidade = "LIMPEZA_PELE";
update frequencia set servico_id = 9 where modalidade = "MASSAGENS_RELAXANTES_TERAPEUTICAS";
update frequencia set servico_id = 10 where modalidade = "MICROPIGMENTACAO";
update frequencia set servico_id = 11 where modalidade = "NATACAO_INFANTIL";
update frequencia set servico_id = 12 where modalidade = "PEELING";
update frequencia set servico_id = 13 where modalidade = "PROJETO_100_DIAS";
update frequencia set servico_id = 14 where modalidade = "OPERATORIO_CIRURGIA";
update frequencia set servico_id = 15 where modalidade = "POS_MASTECTOMIA";
update frequencia set servico_id = 16 where modalidade = "TRATAMENTO_ESTRIAS";
update frequencia set servico_id = 17 where modalidade = "TRATAMENTO_FACIAL";
update frequencia set servico_id = 18 where modalidade = "TRATAMENTO_GESTANTE";
update frequencia set servico_id = 19 where modalidade = "TREINAMENTO_FUNCIONAL";
update frequencia set servico_id = 20 where modalidade = "NUTRICAO";
update frequencia set servico_id = 21 where modalidade = "POWER_SHAPE";

update avaliacao set peso = 0 where peso is null;
update avaliacao set altura = 0 where altura is null;

alter table avaliacao add column mamaAvaliacao varchar(255);
alter table avaliacao add column mamaAvaliacao2 varchar(255);
alter table avaliacao add column mamaAvaliacao3 varchar(255);
alter table avaliacao add column mamaAvaliacao4 varchar(255);
alter table avaliacao add column mamaAvaliacao5 varchar(255);
alter table avaliacao add column mamaPerda varchar(255);
alter table avaliacao add column esternoAvaliacao varchar(255);
alter table avaliacao add column esternoAvaliacao2 varchar(255);
alter table avaliacao add column esternoAvaliacao3 varchar(255);
alter table avaliacao add column esternoAvaliacao4 varchar(255);
alter table avaliacao add column esternoAvaliacao5 varchar(255);
alter table avaliacao add column esternoPerda varchar(255);
alter table avaliacao add column cinturaAvaliacao varchar(255);
alter table avaliacao add column cinturaAvaliacao2 varchar(255);
alter table avaliacao add column cinturaAvaliacao3 varchar(255);
alter table avaliacao add column cinturaAvaliacao4 varchar(255);
alter table avaliacao add column cinturaAvaliacao5 varchar(255);
alter table avaliacao add column cinturaPerda varchar(255);
alter table avaliacao add column cicatrizUmbilicalAvaliacao varchar(255);
alter table avaliacao add column cicatrizUmbilicalAvaliacao2 varchar(255);
alter table avaliacao add column cicatrizUmbilicalAvaliacao3 varchar(255);
alter table avaliacao add column cicatrizUmbilicalAvaliacao4 varchar(255);
alter table avaliacao add column cicatrizUmbilicalAvaliacao5 varchar(255);
alter table avaliacao add column cicatrizUmbilicalPerda varchar(255);
alter table avaliacao add column cristaIliacaAvaliacao varchar(255);
alter table avaliacao add column cristaIliacaAvaliacao2 varchar(255);
alter table avaliacao add column cristaIliacaAvaliacao3 varchar(255);
alter table avaliacao add column cristaIliacaAvaliacao4 varchar(255);
alter table avaliacao add column cristaIliacaAvaliacao5 varchar(255);
alter table avaliacao add column cristaIliacaPerda varchar(255);
alter table avaliacao add column quadrilAvaliacao varchar(255);
alter table avaliacao add column quadrilAvaliacao2 varchar(255);
alter table avaliacao add column quadrilAvaliacao3 varchar(255);
alter table avaliacao add column quadrilAvaliacao4 varchar(255);
alter table avaliacao add column quadrilAvaliacao5 varchar(255);
alter table avaliacao add column quadrilPerda varchar(255);
alter table avaliacao add column pregaGluteaAvaliacao varchar(255);
alter table avaliacao add column pregaGluteaAvaliacao2 varchar(255);
alter table avaliacao add column pregaGluteaAvaliacao3 varchar(255);
alter table avaliacao add column pregaGluteaAvaliacao4 varchar(255);
alter table avaliacao add column pregaGluteaAvaliacao5 varchar(255);
alter table avaliacao add column pregaGluteaPerda varchar(255);


UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao = (SELECT ava2.mamaAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao2 = (SELECT ava2.mamaAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao3 = (SELECT ava2.mamaAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao4 = (SELECT ava2.mamaAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao5 = (SELECT ava2.mamaAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaPerda = (SELECT ava2.mamaPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao = (SELECT ava2.esternoAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao2 = (SELECT ava2.esternoAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao3 = (SELECT ava2.esternoAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao4 = (SELECT ava2.esternoAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao5 = (SELECT ava2.esternoAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoPerda = (SELECT ava2.esternoPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao = (SELECT ava2.cinturaAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao2 = (SELECT ava2.cinturaAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao3 = (SELECT ava2.cinturaAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao4 = (SELECT ava2.cinturaAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao5 = (SELECT ava2.cinturaAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaPerda = (SELECT ava2.cinturaPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao = (SELECT ava2.cicatrizUmbilicalAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao2 = (SELECT ava2.cicatrizUmbilicalAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao3 = (SELECT ava2.cicatrizUmbilicalAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao4 = (SELECT ava2.cicatrizUmbilicalAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao5 = (SELECT ava2.cicatrizUmbilicalAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalPerda = (SELECT ava2.cicatrizUmbilicalPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao = (SELECT ava2.cristaIliacaAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao2 = (SELECT ava2.cristaIliacaAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao3 = (SELECT ava2.cristaIliacaAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao4 = (SELECT ava2.cristaIliacaAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao5 = (SELECT ava2.cristaIliacaAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaPerda = (SELECT ava2.cristaIliacaPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);

UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao = (SELECT ava2.pregaGluteaAvaliacao FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao2 = (SELECT ava2.pregaGluteaAvaliacao2 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao3 = (SELECT ava2.pregaGluteaAvaliacao3 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao4 = (SELECT ava2.pregaGluteaAvaliacao4 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao5 = (SELECT ava2.pregaGluteaAvaliacao5 FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaPerda = (SELECT ava2.pregaGluteaPerda FROM avaliacaoalteracoescirculatorias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoalteracoescirculatorias AS ava2);




UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao = (SELECT ava2.mamaAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao2 = (SELECT ava2.mamaAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao3 = (SELECT ava2.mamaAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao4 = (SELECT ava2.mamaAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao5 = (SELECT ava2.mamaAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaPerda = (SELECT ava2.mamaPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);


UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao = (SELECT ava2.esternoAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao2 = (SELECT ava2.esternoAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao3 = (SELECT ava2.esternoAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao4 = (SELECT ava2.esternoAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao5 = (SELECT ava2.esternoAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoPerda = (SELECT ava2.esternoPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao = (SELECT ava2.cinturaAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao2 = (SELECT ava2.cinturaAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao3 = (SELECT ava2.cinturaAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao4 = (SELECT ava2.cinturaAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao5 = (SELECT ava2.cinturaAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaPerda = (SELECT ava2.cinturaPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao = (SELECT ava2.cicatrizUmbilicalAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao2 = (SELECT ava2.cicatrizUmbilicalAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao3 = (SELECT ava2.cicatrizUmbilicalAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao4 = (SELECT ava2.cicatrizUmbilicalAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao5 = (SELECT ava2.cicatrizUmbilicalAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalPerda = (SELECT ava2.cicatrizUmbilicalPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao = (SELECT ava2.cristaIliacaAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao2 = (SELECT ava2.cristaIliacaAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao3 = (SELECT ava2.cristaIliacaAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao4 = (SELECT ava2.cristaIliacaAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao5 = (SELECT ava2.cristaIliacaAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaPerda = (SELECT ava2.cristaIliacaPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);


UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);



UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);



UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao = (SELECT ava2.pregaGluteaAvaliacao FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao2 = (SELECT ava2.pregaGluteaAvaliacao2 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao3 = (SELECT ava2.pregaGluteaAvaliacao3 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao4 = (SELECT ava2.pregaGluteaAvaliacao4 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao5 = (SELECT ava2.pregaGluteaAvaliacao5 FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaPerda = (SELECT ava2.pregaGluteaPerda FROM avaliacaocirurgiaplastica AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocirurgiaplastica AS ava2);





UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao = (SELECT ava2.mamaAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao2 = (SELECT ava2.mamaAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao3 = (SELECT ava2.mamaAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao4 = (SELECT ava2.mamaAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao5 = (SELECT ava2.mamaAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaPerda = (SELECT ava2.mamaPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);


UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao = (SELECT ava2.esternoAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao2 = (SELECT ava2.esternoAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao3 = (SELECT ava2.esternoAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao4 = (SELECT ava2.esternoAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao5 = (SELECT ava2.esternoAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoPerda = (SELECT ava2.esternoPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao = (SELECT ava2.cinturaAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao2 = (SELECT ava2.cinturaAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao3 = (SELECT ava2.cinturaAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao4 = (SELECT ava2.cinturaAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao5 = (SELECT ava2.cinturaAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaPerda = (SELECT ava2.cinturaPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao = (SELECT ava2.cicatrizUmbilicalAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao2 = (SELECT ava2.cicatrizUmbilicalAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao3 = (SELECT ava2.cicatrizUmbilicalAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao4 = (SELECT ava2.cicatrizUmbilicalAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao5 = (SELECT ava2.cicatrizUmbilicalAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalPerda = (SELECT ava2.cicatrizUmbilicalPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao = (SELECT ava2.cristaIliacaAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaPerda = (SELECT ava2.cristaIliacaPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);


UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);



UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);



UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao = (SELECT ava2.pregaGluteaAvaliacao FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao2 = (SELECT ava2.pregaGluteaAvaliacao2 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao3 = (SELECT ava2.pregaGluteaAvaliacao3 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao4 = (SELECT ava2.pregaGluteaAvaliacao4 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao5 = (SELECT ava2.pregaGluteaAvaliacao5 FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaPerda = (SELECT ava2.pregaGluteaPerda FROM avaliacaocripolise AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaocripolise AS ava2);



UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao = (SELECT ava2.mamaAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao2 = (SELECT ava2.mamaAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao3 = (SELECT ava2.mamaAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao4 = (SELECT ava2.mamaAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao5 = (SELECT ava2.mamaAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaPerda = (SELECT ava2.mamaPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);


UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao = (SELECT ava2.esternoAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao2 = (SELECT ava2.esternoAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao3 = (SELECT ava2.esternoAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao4 = (SELECT ava2.esternoAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao5 = (SELECT ava2.esternoAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoPerda = (SELECT ava2.esternoPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao = (SELECT ava2.cinturaAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao2 = (SELECT ava2.cinturaAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao3 = (SELECT ava2.cinturaAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao4 = (SELECT ava2.cinturaAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao5 = (SELECT ava2.cinturaAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaPerda = (SELECT ava2.cinturaPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao = (SELECT ava2.cicatrizUmbilicalAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao2 = (SELECT ava2.cicatrizUmbilicalAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao3 = (SELECT ava2.cicatrizUmbilicalAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao4 = (SELECT ava2.cicatrizUmbilicalAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao5 = (SELECT ava2.cicatrizUmbilicalAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalPerda = (SELECT ava2.cicatrizUmbilicalPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao = (SELECT ava2.cristaIliacaAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao2 = (SELECT ava2.cristaIliacaAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao3 = (SELECT ava2.cristaIliacaAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao4 = (SELECT ava2.cristaIliacaAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao5 = (SELECT ava2.cristaIliacaAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaPerda = (SELECT ava2.cristaIliacaPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);


UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);



UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);



UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao = (SELECT ava2.pregaGluteaAvaliacao FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao2 = (SELECT ava2.pregaGluteaAvaliacao2 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao3 = (SELECT ava2.pregaGluteaAvaliacao3 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao4 = (SELECT ava2.pregaGluteaAvaliacao4 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao5 = (SELECT ava2.pregaGluteaAvaliacao5 FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaPerda = (SELECT ava2.pregaGluteaPerda FROM avaliacaogorduralocalizada AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaogorduralocalizada AS ava2);





UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao = (SELECT ava2.mamaAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao2 = (SELECT ava2.mamaAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao3 = (SELECT ava2.mamaAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao4 = (SELECT ava2.mamaAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaAvaliacao5 = (SELECT ava2.mamaAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.mamaPerda = (SELECT ava2.mamaPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);


UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao = (SELECT ava2.esternoAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao2 = (SELECT ava2.esternoAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao3 = (SELECT ava2.esternoAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao4 = (SELECT ava2.esternoAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoAvaliacao5 = (SELECT ava2.esternoAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.esternoPerda = (SELECT ava2.esternoPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao = (SELECT ava2.cinturaAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao2 = (SELECT ava2.cinturaAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao3 = (SELECT ava2.cinturaAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao4 = (SELECT ava2.cinturaAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaAvaliacao5 = (SELECT ava2.cinturaAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cinturaPerda = (SELECT ava2.cinturaPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao = (SELECT ava2.cicatrizUmbilicalAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao2 = (SELECT ava2.cicatrizUmbilicalAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao3 = (SELECT ava2.cicatrizUmbilicalAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao4 = (SELECT ava2.cicatrizUmbilicalAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalAvaliacao5 = (SELECT ava2.cicatrizUmbilicalAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cicatrizUmbilicalPerda = (SELECT ava2.cicatrizUmbilicalPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);


UPDATE avaliacao AS ava1 SET ava1.cristaIliacaAvaliacao = (SELECT ava2.cristaIliacaAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.cristaIliacaPerda = (SELECT ava2.cristaIliacaPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);


UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);



UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao = (SELECT ava2.quadrilAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao2 = (SELECT ava2.quadrilAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao3 = (SELECT ava2.quadrilAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao4 = (SELECT ava2.quadrilAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilAvaliacao5 = (SELECT ava2.quadrilAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.quadrilPerda = (SELECT ava2.quadrilPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);



UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao = (SELECT ava2.pregaGluteaAvaliacao FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao2 = (SELECT ava2.pregaGluteaAvaliacao2 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao3 = (SELECT ava2.pregaGluteaAvaliacao3 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao4 = (SELECT ava2.pregaGluteaAvaliacao4 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaAvaliacao5 = (SELECT ava2.pregaGluteaAvaliacao5 FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);
UPDATE avaliacao AS ava1 SET ava1.pregaGluteaPerda = (SELECT ava2.pregaGluteaPerda FROM avaliacaoprojeto100dias AS ava2 WHERE ava2.id = ava1.id) WHERE ava1.id IN (SELECT ava2.id FROM avaliacaoprojeto100dias AS ava2);


CREATE TABLE `centrocusto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

alter table servico add column centroCusto_id int(11);

alter table configuracao add column caixaValorInicial double;
update configuracao set caixaValorInicial = 0;
alter table configuracao add column caixaDataInicial date;

insert into configuracao (caixaValorInicial, caixaDataInicial) values (0.0, '2010-01-01');

alter table contapagar add column centroCusto_id int(11);

