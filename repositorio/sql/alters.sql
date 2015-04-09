alter table servico add column statusObjeto varchar(20);
update servico set statusObjeto = "ATIVO";


CREATE TABLE IF NOT EXISTS `tipocontapagar_novo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

SELECT 'insert into tipocontapagar_novo (nome) values (\"', nome, '\");' FROM tipocontapagar ORDER BY nome ;
/*
 * 
 * EXECUTAR O SCRIPT DE INSERÇÃO GERADO PELO SCRIPT ANTERIOR
 * 
 */

UPDATE CONTAPAGAR cnta SET cnta.tipo = (SELECT tpn.id FROM tipocontapagar_novo tpn WHERE tpn.nome = cnta.tipo);
ALTER TABLE contapagar CHANGE tipo tipo INT(11);