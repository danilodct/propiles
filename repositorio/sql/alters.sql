alter table servico add column statusObjeto varchar(20);
update servico set statusObjeto = "ATIVO";