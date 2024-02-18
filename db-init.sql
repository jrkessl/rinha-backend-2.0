CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    saldo INTEGER NOT NULL DEFAULT 0,
    limite INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX idx_id ON clientes (id);

insert into clientes ( id, limite, saldo ) values ( '1', '100000', '0' );
insert into clientes ( id, limite, saldo ) values ( '2', '80000', '0' );
insert into clientes ( id, limite, saldo ) values ( '3', '1000000', '0' );
insert into clientes ( id, limite, saldo ) values ( '4', '10000000', '0' );
insert into clientes ( id, limite, saldo ) values ( '5', '500000', '0' );

select id, saldo, limite from clientes;

delete from clientes where id > 5;

drop table transacoes;
CREATE TABLE transacoes (
    id INTEGER REFERENCES clientes(id),
    valor INTEGER NOT NULL,
    tipo CHAR(1) CHECK (tipo IN ('c', 'd')) NOT NULL,
    description VARCHAR(10),
    realizada_em TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX idx_realizada_em ON transacoes (realizada_em);

insert into transacoes ( id, valor, tipo, description, realizada_em ) values ( 1, 998, 'd', 'abcd', CURRENT_TIMESTAMP );

select * from transacoes;
delete from transacoes;