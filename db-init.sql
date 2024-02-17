CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    saldo INTEGER NOT NULL DEFAULT 0,
    limite INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX idx_id ON clientes (id);

insert into clientes ( id, saldo, limite ) values ( '1', '100000', '0' );
insert into clientes ( id, saldo, limite ) values ( '2', '80000', '0' );
insert into clientes ( id, saldo, limite ) values ( '3', '1000000', '0' );
insert into clientes ( id, saldo, limite ) values ( '4', '10000000', '0' );
insert into clientes ( id, saldo, limite ) values ( '5', '500000', '0' );

select id, saldo, limite from clientes;

delete from clientes;
