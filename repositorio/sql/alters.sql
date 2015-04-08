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