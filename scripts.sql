INSERT INTO Categorias (nome) VALUES 
('Bebidas'), ('Higiene'), ('Alimentos'), ('Limpeza'), ('Eletrônicos');

INSERT INTO Fornecedores (nome, contato, endereco) VALUES
('Coca-Cola Brasil', 'coca@coca.com', 'Av. Paulista, 1000 - SP'),
('Nestlé', 'contato@nestle.com', 'Rua das Indústrias, 200 - SP'),
('Unilever', 'suporte@unilever.com', 'Av. Central, 1500 - RJ'),
('LG Electronics', 'lg@lg.com', 'Rua Tech, 300 - SP');

INSERT INTO Filiais (nome, endereco) VALUES
('Filial Centro', 'Rua Principal, 123 - Centro - SP'),
('Filial Zona Sul', 'Av. Sul, 500 - SP');

INSERT INTO Clientes (nome, cpf, telefone, endereco, pontos_fidelidade) VALUES
('João Pedro', '12345678901', '11999999999', 'Rua das Flores, 45 - SP', 150),
('Maria Clara', '98765432100', '11888888888', 'Av. Paulista, 900 - SP', 300),
('Lucas Santos', '45678912311', '11777777777', 'Rua Verde, 12 - SP', 50);

INSERT INTO Produtos (nome, descricao, preco, quantidade_estoque, id_categoria, id_filial) VALUES
('Coca-Cola Lata 350ml', 'Refrigerante em lata', 4.50, 200, 1, 1),
('Nescau 400g', 'Achocolatado em pó', 7.99, 100, 3, 1),
('Sabonete Dove', 'Sabonete hidratante', 3.20, 150, 2, 2),
('Detergente Ypê 500ml', 'Detergente neutro', 2.50, 300, 4, 1),
('TV LG 42"', 'Smart TV LED Full HD', 1800.00, 10, 5, 2);

-- Vinculando os produtos aos seus fornecedores na tabela intermediária N:M
INSERT INTO Produtos_Fornecedores (id_produto, id_fornecedor) VALUES 
(1, 1), -- Coca na Coca-Cola
(2, 2), -- Nescau na Nestlé
(3, 3), -- Sabonete na Unilever
(4, 3), -- Detergente na Unilever
(5, 4); -- TV na LG

INSERT INTO Funcionarios (nome, cargo, salario, data_contratacao, id_filial) VALUES
('Carlos Silva', 'Caixa', 2000.00, '2022-01-15', 1),
('Ana Souza', 'Vendedora', 2200.00, '2021-05-10', 1),
('Marcos Lima', 'Gerente', 4500.00, '2020-03-01', 2);

INSERT INTO Compras (data, total, id_fornecedor, id_filial) VALUES
('2023-10-01', 900.00, 1, 1),
('2023-10-05', 500.00, 2, 1),
('2023-10-10', 200.00, 3, 2);

INSERT INTO ItensCompra (id_compra, id_produto, quantidade, subtotal) VALUES
(1, 1, 200, 900.00),
(2, 2, 100, 500.00),
(3, 3, 100, 320.00);

INSERT INTO Vendas (data, total, id_cliente, id_funcionario, id_filial) VALUES
('2023-11-01', 45.00, 1, 1, 1),
('2023-11-02', 1800.00, 2, 2, 2),
('2023-11-03', 6.40, 3, 1, 1);

INSERT INTO ItensVenda (id_venda, id_produto, quantidade, subtotal) VALUES
(1, 1, 10, 45.00),
(2, 5, 1, 1800.00),
(3, 3, 2, 6.40);