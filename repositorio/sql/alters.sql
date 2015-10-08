alter table cadastro add column preferenciaContato varchar(255); 
alter table cadastro add column inativo tinyint(1) default 0;
update cadastro set inativo = 0;