drop table tipocadastro;
drop table caixa;
alter table centrocusto add column statusObjeto varchar(20);
update centrocusto set statusObjeto = 'ATIVO';