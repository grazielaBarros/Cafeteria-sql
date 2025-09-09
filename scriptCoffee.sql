-- =======================================
-- 1. Criação do banco de dados
-- =======================================
CREATE DATABASE cafeteria_db;

-- Conectar no banco (no terminal psql)
\c cafeteria_db

-- =======================================
-- 2. Tabela de Clientes
-- =======================================
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '1199999-1111'),
('Maria Oliveira', 'maria@email.com', '2198888-2222'),
('Carlos Souza', 'carlos@email.com', '3197777-3333');

-- =======================================
-- 3. Tabela de Produtos
-- =======================================
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco NUMERIC(6,2) NOT NULL,
    estoque INT NOT NULL
);

-- Inserindo produtos
INSERT INTO produtos (nome, preco, estoque) VALUES
('Café Expresso', 5.00, 50),
('Cappuccino', 7.50, 30),
('Bolo de Chocolate', 12.00, 10);

-- =======================================
-- 4. Tabela de Pedidos
-- =======================================
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserindo pedidos (ligados aos clientes)
INSERT INTO pedidos (id_cliente) VALUES
(1), -- João
(2), -- Maria
(3); -- Carlos

-- =======================================
-- 5. Tabela de Itens do Pedido
-- =======================================
CREATE TABLE pedido_itens (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserindo itens nos pedidos
INSERT INTO pedido_itens (id_pedido, id_produto, quantidade) VALUES
(1, 1, 2), -- Pedido 1 (João): 2 cafés
(1, 3, 1), -- Pedido 1 (João): 1 bolo
(2, 2, 1), -- Pedido 2 (Maria): 1 cappuccino
(3, 1, 1), -- Pedido 3 (Carlos): 1 café
(3, 2, 2); -- Pedido 3 (Carlos): 2 cappuccinos
