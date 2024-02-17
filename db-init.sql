CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    saldo INTEGER NOT NULL DEFAULT 0,
    limite INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX idx_id ON my_table (id);
