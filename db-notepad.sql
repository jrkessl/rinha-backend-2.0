select id, saldo, limite from clientes;

delete from clientes where id > 5;

insert into transacoes ( id, valor, tipo, description, realizada_em ) values ( 1, 998, 'd', 'abcd', CURRENT_TIMESTAMP );

select * from transacoes;
delete from transacoes;