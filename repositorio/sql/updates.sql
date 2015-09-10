DROP TABLE avaliacaoacupuntura;
DROP TABLE avaliacaoalteracoescirculatorias;
DROP TABLE avaliacaocirurgiaplastica;
DROP TABLE avaliacaocripolise;
DROP TABLE avaliacaodayspa;
DROP TABLE avaliacaodepilacao;
DROP TABLE avaliacaodermatologia;
DROP TABLE avaliacaoestetica;
DROP TABLE avaliacaoestria;
DROP TABLE avaliacaogestante;
DROP TABLE avaliacaogorduralocalizada;
DROP TABLE avaliacaolimpezapele;
DROP TABLE avaliacaonatacaoinfantil;
DROP TABLE avaliacaonutricao;
DROP TABLE avaliacaopeeling;
DROP TABLE avaliacaopilates;
DROP TABLE avaliacaopowershape;
DROP TABLE avaliacaoprojeto100dias;
DROP TABLE avaliacaorpg;
DROP TABLE avaliacaotratamentofacial;

drop table horario;
drop table noticias;
drop table depoimento;

alter table produto add column statusObjeto varchar(100);
update produto set statusObjeto = "ATIVO";

alter table estoque add column statusObjeto varchar(100);
update estoque set statusObjeto = "ATIVO";

rename table professor to colaborador; 

alter table configuracao drop column avaliacaoPilates;
alter table configuracao drop column avaliacaoRPG;
alter table configuracao drop column avaliacaoAcupuntura;
alter table configuracao drop column avaliacaoEstetica;

alter table cliente add column statusObjeto varchar(100) default 'ATIVO';
update cliente set statusObjeto = 'ATIVO';


alter table cadastro add column historico text;

rename table cadastro to atividade;
rename table cliente to cadastro;

drop table artigos;

alter table contareceber drop column dataVencimento;

update contareceber as cr set cr.observacao = (select tcr.nome from tipocontareceber as tcr where tcr.nome=cr.tipo);
alter table contareceber drop column tipo;
drop table tipocontareceber;
UPDATE contareceber SET observacao = NULL WHERE UPPER(observacao) = UPPER(formaPagamento);

alter table frequencia add column atividade_id int(11);
ALTER TABLE frequencia ADD COLUMN novo TINYINT(1) DEFAULT 0;

alter table contareceber add column outroColaborador double default 0;
update contareceber set outroColaborador = 1;

alter table contapagar add column observacao text;
update contapagar set observacao = tipo where tipo like "13%";
update contapagar set tipo="13° Salário" where tipo like "13%"; 
delete from tipocontapagar where nome like "13%" ;
insert into tipocontapagar values ("13° Salário");

CREATE TABLE IF NOT EXISTS `movimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT 0,
  `data` date DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

alter table movimentacao add column tipoMovimentacao varchar(100);

alter table contareceber add column movimentacao_id int(11);
alter table contapagar add column movimentacao_id int(11);
alter table estoque add column movimentacao_id int(11);

/* 8888888888888888888888888888888888888888888888888888888888888888888888888 */
/* RODAR O SCRIPT A BAIXO E DEPOIS RODAR O SCRIPT GERADO*/ 
/* 8888888888888888888888888888888888888888888888888888888888888888888888888 */

SELECT 'insert into movimentacao (valor, data, descricao, tipoMovimentacao) values (', cr.caixa, ', \'', cr.dataLancamento, '\', \'Cliente: ', cad.nome , ' - ', cr.formaPagamento, ' ', cr.observacao , '\', \'CONTA_RECEBER\');',
'update contareceber set movimentacao_id = LAST_INSERT_ID() where id = ', cr.id , ';'
FROM contareceber cr
LEFT JOIN atividade ati ON ati.id = cr.cadastro_id
LEFT JOIN cadastro cad ON cad.id = ati.cliente_id;

SELECT 'insert into movimentacao (valor, data, descricao, tipoMovimentacao) values (-', cr.valor, ', \'', cr.dataPagamento, '\', \'', cr.tipo , ' - ', cr.observacao , '\', \'CONTA_PAGAR\');',
'update contapagar set movimentacao_id = LAST_INSERT_ID() where id = ', cr.id , ';'
FROM contapagar cr;

SELECT 'insert into movimentacao (valor, data, descricao, tipoMovimentacao) values (', cr.valor, ', \'', cr.data, '\', \'', cad.nome , ' - ', prod.nome , '\', \'VENDA\');',
'update estoque set movimentacao_id = LAST_INSERT_ID() where id = ', cr.id , ';'
FROM estoque cr
LEFT JOIN produto prod ON prod.id = cr.produto_id
LEFT JOIN cadastro cad ON cad.id = cr.vendedor_id
WHERE cr.status = 'VENDIDO';

UPDATE estoque SET movimentacao_id = NULL WHERE movimentacao_id IN (SELECT id FROM movimentacao WHERE DATA = '0000-00-00');

DELETE FROM movimentacao WHERE DATA = '0000-00-00';

/* 8888888888888888888888888888888888888888888888888888888888888888888888888 */
/* VER TB NO SCRIPT ABAIXO SE TEM ALGUM CONTRATO SEM SERVICO ASSOCIADO */

UPDATE contrato SET servico_id = 2 WHERE servico_id IS NULL AND modalidade = 'DAY_SPA';
UPDATE contrato SET servico_id = 3 WHERE servico_id IS NULL AND modalidade = 'DEPILACAO_LASER';
UPDATE contrato SET servico_id = 4 WHERE servico_id IS NULL AND modalidade = 'DERMATOLOGIA';

SELECT * FROM contrato WHERE servico_id IS null;

/* 8888888888888888888888888888888888888888888888888888888888888888888888888 */

alter table contareceber add column valorCheio double default 0;
alter table contareceber add column primeiraParcela tinyint(1) default 1;
UPDATE contareceber SET primeiraParcela = FALSE WHERE ordemParcelamento > 1;
UPDATE contareceber SET primeiraParcela = true WHERE ordemParcelamento = 1;

UPDATE contareceber SET valorCheio = valor WHERE formaPagamento IN ('CHEQUE_1', 'CREDITO_1', 'DINHEIRO', 'DEBITO') AND ordemParcelamento=1;
UPDATE contareceber SET valorCheio = valor*2 WHERE formaPagamento IN ('CHEQUE_2', 'CREDITO_2') AND ordemParcelamento=1;
UPDATE contareceber SET valorCheio = valor*3 WHERE formaPagamento IN ('CHEQUE_3', 'CREDITO_3') AND ordemParcelamento=1;
UPDATE contareceber SET valorCheio = valor*4 WHERE formaPagamento IN ('CHEQUE_4', 'CREDITO_4') AND ordemParcelamento=1;
UPDATE contareceber SET valorCheio = valor*5 WHERE formaPagamento IN ('CHEQUE_5', 'CREDITO_5') AND ordemParcelamento=1;
UPDATE contareceber SET valorCheio = valor*6 WHERE formaPagamento IN ('CHEQUE_6', 'CREDITO_6') AND ordemParcelamento=1;

delete from estoque where statusObjeto = 'MORTO'; 

/* 8888888888888888888888888888888888888888888888888888888888888888888888888 */
/* RODAR E RODAR O RESULTADO PARA ATUALIZAR QUEM NAO TEM DATA DE CADASTRO */
SELECT 'update cadastro set dataCadastro = \"', freq.data, '\" where id = ', cad.id, ';'
FROM cadastro AS cad
LEFT JOIN frequencia AS freq ON freq.cliente_id = cad.id
WHERE cad.dataCadastro IS NULL
and freq.data is not null
GROUP BY cad.id;

SELECT 'update cadastro set dataCadastro = \"', ati.dataCriacao, '\" where id = ', cad.id, ';'
FROM cadastro AS cad
LEFT JOIN atividade AS ati ON ati.cliente_id = cad.id
WHERE cad.dataCadastro IS NULL
AND ati.dataCriacao IS NOT NULL
GROUP BY cad.id;

/* 8888888888888888888888888888888888888888888888888888888888888888888888888 */

drop index cpf on cadastro;
drop index cpf_2 on cadastro;

UPDATE contapagar SET mesCompetencia = dataPagamento WHERE mesCompetencia IS NULL;

alter table contareceber add column qtdSessoes int(11);
update contareceber set qtdSessoes = 1;

alter table frequencia add column contaReceber_id int(11);
alter table frequencia add foreign key (contaReceber_id) references contareceber(id); 

alter table contareceber add column qtdParcelas int(5);
UPDATE contareceber SET qtdParcelas = 1 where formaPagamento in ('CHEQUE_1', 'CREDITO_1', 'DINHEIRO', 'DEBITO') AND ordemParcelamento=1;
UPDATE contareceber SET qtdParcelas = 2 WHERE formaPagamento IN ('CHEQUE_2', 'CREDITO_2') AND ordemParcelamento=1;
UPDATE contareceber SET qtdParcelas = 3 WHERE formaPagamento IN ('CHEQUE_3', 'CREDITO_3') AND ordemParcelamento=1;
UPDATE contareceber SET qtdParcelas = 4 WHERE formaPagamento IN ('CHEQUE_4', 'CREDITO_4') AND ordemParcelamento=1;
UPDATE contareceber SET qtdParcelas = 5 WHERE formaPagamento IN ('CHEQUE_5', 'CREDITO_5') AND ordemParcelamento=1;
UPDATE contareceber SET qtdParcelas = 6 WHERE formaPagamento IN ('CHEQUE_6', 'CREDITO_6') AND ordemParcelamento=1;



alter table servico add column qtdSessoes int(11);
alter table servico add column duracaoSessao int(11);
UPDATE servico SET qtdSessoes = 1;
UPDATE servico SET duracaoSessao = 30;

alter table frequencia add column duracao int(11);
UPDATE frequencia SET duracao = 0;

CREATE TABLE IF NOT EXISTS `agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255),
  `nota` text,
  `dataInicio` datetime DEFAULT NULL,
  `dataFim` datetime DEFAULT NULL,
  `cadastro_id` int(11),
  `contaReceber_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

alter table agendamento add column duracao int(11);

alter table contapagar add column colaborador_id int(11);

drop table tipocadastro;
drop table caixa;

CREATE TABLE IF NOT EXISTS `tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  `dataCriacao` date DEFAULT NULL,
  `plano` varchar(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

alter table agendamento add column tenant_id int(11) not null;
alter table agendamento drop primary key, add primary key (id, tenant_id);
alter table atividade add column tenant_id int(11) not null;
alter table atividade drop primary key, add primary key (id, tenant_id);
alter table avaliacao add column tenant_id int(11) not null;
alter table avaliacao drop primary key, add primary key (id, tenant_id);
alter table cadastro add column tenant_id int(11) not null;
alter table cadastro drop primary key, add primary key (id, tenant_id);
alter table centrocusto add column tenant_id int(11) not null;
alter table centrocusto drop primary key, add primary key (id, tenant_id);
alter table colaborador add column tenant_id int(11) not null;
alter table colaborador drop primary key, add primary key (id, tenant_id);
alter table configuracao add column tenant_id int(11) not null;
alter table configuracao drop primary key, add primary key (id, tenant_id);
alter table contapagar add column tenant_id int(11) not null;
alter table contapagar drop primary key, add primary key (id, tenant_id);
alter table contareceber add column tenant_id int(11) not null;
alter table contareceber drop primary key, add primary key (id, tenant_id);
alter table contrato add column tenant_id int(11) not null;
alter table contrato drop primary key, add primary key (id, tenant_id);
alter table endereco add column tenant_id int(11) not null;
alter table endereco drop primary key, add primary key (id, tenant_id);
alter table estoque add column tenant_id int(11) not null;
alter table estoque drop primary key, add primary key (id, tenant_id);
alter table frequencia add column tenant_id int(11) not null;
alter table frequencia drop primary key, add primary key (id, tenant_id);
alter table movimentacao add column tenant_id int(11) not null;
alter table movimentacao drop primary key, add primary key (id, tenant_id);
alter table produto add column tenant_id int(11) not null;
alter table produto drop primary key, add primary key (id, tenant_id);
alter table servico add column tenant_id int(11) not null;
alter table servico drop primary key, add primary key (id, tenant_id);
alter table tipocontapagar add column tenant_id int(11) not null;
alter table tipocontapagar drop primary key, add primary key (nome, tenant_id);
alter table usuario add column tenant_id int(11) not null;
alter table usuario drop primary key, add primary key (id, tenant_id);

update agendamento set tenant_id = 1;
update atividade set tenant_id = 1;
update avaliacao set tenant_id = 1;
update cadastro set tenant_id = 1;
update centrocusto set tenant_id = 1;
update colaborador set tenant_id = 1;
update configuracao set tenant_id = 1;
update contapagar set tenant_id = 1;
update contareceber set tenant_id = 1;
update contrato set tenant_id = 1;
update endereco set tenant_id = 1;
update estoque set tenant_id = 1;
update frequencia set tenant_id = 1;
update movimentacao set tenant_id = 1;
update produto set tenant_id = 1;
update servico set tenant_id = 1;
update tipocontapagar set tenant_id = 1;
update usuario set tenant_id = 1;

alter table usuario change id id int(11);

alter table centrocusto add column statusObjeto varchar(20);
update centrocusto set statusObjeto = 'ATIVO';

alter table colaborador drop column tenant_id; 
alter table endereco drop column tenant_id; 
alter table avaliacao drop column tenant_id; 
/*
DROP TABLE tipocontapagar;
CREATE TABLE IF NOT EXISTS `tipocontapagar` (
  id int(11) NOT NULL AUTO_INCREMENT,
  nome varchar(255),
  tenant_id int(11) not null,
  PRIMARY KEY (id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
*/

alter table usuario change login login varchar(255);
alter table usuario change senha senha varchar(255);

alter table usuario add column confirmado tinyint(1) default 0;
update usuario set confirmado = 1;




RENAME TABLE tipocontapagar TO tipocontapagar_antiga;

CREATE TABLE IF NOT EXISTS `tipocontapagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) not null,
  `nome` varchar(255),
  PRIMARY KEY (`id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

SELECT 'insert into tipocontapagar (nome) values (\"', nome, '\");' FROM tipocontapagar_antiga ORDER BY nome ;
/*
 * 
 * RODAR O SCRIPT GERADO ACIMA
 * 
 * */
UPDATE CONTAPAGAR cnta SET cnta.tipo = (SELECT tpn.id FROM tipocontapagar tpn WHERE tpn.nome = cnta.tipo);
ALTER TABLE contapagar CHANGE tipo tipo INT(11);

alter table contapagar add column numRef varchar(11);
alter table contareceber add column numRef varchar(11);

alter table usuario add column nomeUser varchar(255);

alter table tenant add column logo varchar(255);
alter table tenant add column cor varchar(20);

alter table servico add column statusObjeto varchar(100);
update servico set statusObjeto = "ATIVO";


CREATE TABLE IF NOT EXISTS `transacaopagamento` (
  `codigo` varchar(255) NOT NULL,
  `data` date DEFAULT NULL,
  `url` varchar(255),
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

alter table usuario add column aguardandoPagamento tinyint(1) default 1;
update usuario set aguardandoPagamento = 0;

alter table transacaopagamento add column status varchar(100);

alter table usuario drop column aguardandoPagamento;
alter table tenant add column aguardandoPagamento tinyint(1) default 1;
update tenant set aguardandoPagamento = 0;


CREATE TABLE IF NOT EXISTS `tour` (
  `tenant_id` int(11) NOT NULL,
  PRIMARY KEY (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


alter table tenant add column dataUltimoPagamento datetime;
alter table tenant add column statusUltimaTransacao varchar(100);



alter table agendamento add column repeticao varchar(50);
update agendamento set repeticao = 'NAO_REPETIR';

alter table agendamento add column pai_id int(11);

alter table agendamento add column status varchar(11);

alter table agendamento add column atividade_id int(11);