alter table agendamento add column repeticao varchar(50);
update agendamento set repeticao = 'NAO_REPETIR';

alter table agendamento add column pai_id int(11);

alter table agendamento add column status varchar(11);
