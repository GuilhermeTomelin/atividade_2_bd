-- 1️⃣ Mostrar todos os clientes (Já fornecido)
SELECT * FROM Clientes;

-- 2️⃣ Mostrar apenas nome e telefone dos clientes
SELECT nome, telefone FROM Clientes;

-- 3️⃣ Mostrar todos os produtos
SELECT * FROM Produtos;

-- 4️⃣ Mostrar apenas nome e preço dos produtos
SELECT nome, preco FROM Produtos;

-- 5️⃣ Mostrar todos os funcionários
SELECT * FROM Funcionarios;

-- 6️⃣ Mostrar nome e cargo dos funcionários
SELECT nome, cargo FROM Funcionarios;

-- 7️⃣ Mostrar todas as vendas
SELECT * FROM Vendas;

-- 8️⃣ Mostrar apenas data e total das compras
SELECT data, total FROM Compras;

-- 9️⃣ Mostrar descrição e preço dos produtos
SELECT descricao, preco FROM Produtos;

-- 🔟 Mostrar todas as filiais
SELECT * FROM Filiais;

-- 1️⃣1️⃣ Mostrar apenas nome do produto e quantidade em estoque
SELECT nome, quantidade_estoque FROM Produtos;

----------------------------------------------------------------------------

-- 1️⃣ Mostrar clientes com mais de 100 pontos
SELECT * FROM Clientes 
WHERE pontos_fidelidade > 100;

-- 2️⃣ Mostrar produtos com preço maior que 50
SELECT * FROM Produtos 
WHERE preco > 50;

-- 3️⃣ Mostrar funcionários com salário acima de 3000
SELECT * FROM Funcionarios 
WHERE salario > 3000;

-- 4️⃣ Mostrar produtos com estoque menor que 10
SELECT * FROM Produtos 
WHERE quantidade_estoque < 10;

-- 5️⃣ Mostrar compras realizadas em uma data específica (2025-01-10)
SELECT * FROM Compras 
WHERE data = '2025-01-10';

-- 6️⃣ Mostrar clientes que possuem telefone cadastrado (não seja nulo)
SELECT * FROM Clientes 
WHERE telefone IS NOT NULL;

-- 7️⃣ Mostrar funcionários do cargo “Caixa”
SELECT * FROM Funcionarios 
WHERE cargo = 'Caixa';

-- 8️⃣ Mostrar produtos da filial 1
SELECT * FROM Produtos 
WHERE id_filial = 1;

-- 9️⃣ Mostrar vendas com total acima de 500
SELECT * FROM Vendas 
WHERE total > 500;

-- 🔟 Mostrar fornecedores com nome específico (“Distribuidora Alfa”)
SELECT * FROM Fornecedores 
WHERE nome = 'Distribuidora Alfa';

--------------------------------------------------------------------------------

-- 1️⃣ Mostrar produtos ordenados pelo nome (Ordem alfabética crescente)
SELECT * FROM Produtos 
ORDER BY nome ASC;

-- 2️⃣ Mostrar produtos do mais caro para o mais barato
SELECT * FROM Produtos 
ORDER BY preco DESC;

-- 3️⃣ Mostrar clientes ordenados pelos pontos de fidelidade (Menor para o maior)
SELECT * FROM Clientes 
ORDER BY pontos_fidelidade ASC;

-- 4️⃣ Mostrar funcionários ordenados pelo salário (Maior para o menor)
SELECT * FROM Funcionarios 
ORDER BY salario DESC;

-- 5️⃣ Mostrar vendas ordenadas pela data (Mais recente para a mais antiga)
SELECT * FROM Vendas 
ORDER BY data DESC;

-- 6️⃣ Mostrar compras ordenadas pelo total (Maior valor para o menor)
SELECT * FROM Compras 
ORDER BY total DESC;

-- 7️⃣ Mostrar produtos ordenados por estoque (Menor quantidade para a maior)
SELECT * FROM Produtos 
ORDER BY quantidade_estoque ASC;

-- 8️⃣ Mostrar fornecedores em ordem alfabética
SELECT * FROM Fornecedores 
ORDER BY nome ASC;

-- 9️⃣ Mostrar filiais ordenadas pelo endereço
SELECT * FROM Filiais 
ORDER BY endereco ASC;

-- 🔟 Mostrar funcionários ordenados por cargo e nome
SELECT * FROM Funcionarios 
ORDER BY cargo ASC, nome ASC;

-- 1️⃣1️⃣ Mostrar produtos ordenados por categoria e preço (Preço do maior para o menor)
SELECT * FROM Produtos 
ORDER BY id_categoria ASC, preco DESC;

----------------------------------------------------------------

-- 1️⃣ Contar quantos produtos existem em cada categoria
SELECT id_categoria, COUNT(*) AS quantidade_produtos
FROM Produtos
GROUP BY id_categoria;

-- 2️⃣ Somar o total de vendas por filial
SELECT id_filial, SUM(total) AS soma_total_vendas
FROM Vendas
GROUP BY id_filial;

-- 3️⃣ Contar quantos funcionários existem em cada filial
SELECT id_filial, COUNT(*) AS quantidade_funcionarios
FROM Funcionarios
GROUP BY id_filial;

-- 4️⃣ Mostrar o total de compras por fornecedor
SELECT id_fornecedor, SUM(total) AS soma_total_compras
FROM Compras
GROUP BY id_fornecedor;

-- 5️⃣ Mostrar a média salarial por cargo
SELECT cargo, AVG(salario) AS media_salarial
FROM Funcionarios
GROUP BY cargo;

-- 6️⃣ Mostrar quantidade de vendas realizadas por funcionário
SELECT id_funcionario, COUNT(*) AS quantidade_vendas
FROM Vendas
GROUP BY id_funcionario;

-- 7️⃣ Mostrar quantidade de produtos por fornecedor
-- (Considerando o modelo padrão onde id_fornecedor está na tabela Produtos)
SELECT id_fornecedor, COUNT(*) AS quantidade_produtos
FROM Produtos
GROUP BY id_fornecedor;

-- 8️⃣ Mostrar soma dos pontos de fidelidade dos clientes agrupando pelo endereço
SELECT endereco, SUM(pontos_fidelidade) AS soma_pontos
FROM Clientes
GROUP BY endereco;

-- 9️⃣ Mostrar quantidade de compras realizadas por filial
SELECT id_filial, COUNT(*) AS quantidade_compras
FROM Compras
GROUP BY id_filial;

-- 🔟 Mostrar o estoque total de produtos por categoria
SELECT id_categoria, SUM(quantidade_estoque) AS estoque_total
FROM Produtos
GROUP BY id_categoria;

-- 1️⃣1️⃣ Mostrar o maior salário de cada cargo
SELECT cargo, MAX(salario) AS maior_salario
FROM Funcionarios
GROUP BY cargo;

--------------------------------------------------------------------

-- 1️⃣ Mostrar categorias com mais de 5 produtos
SELECT id_categoria, COUNT(*) AS quantidade_produtos
FROM Produtos
GROUP BY id_categoria
HAVING COUNT(*) > 5;

-- 2️⃣ Mostrar filiais com total de vendas acima de 10000
SELECT id_filial, SUM(total) AS soma_total_vendas
FROM Vendas
GROUP BY id_filial
HAVING SUM(total) > 10000;

-- 3️⃣ Mostrar cargos com média salarial acima de 3000
SELECT cargo, AVG(salario) AS media_salarial
FROM Funcionarios
GROUP BY cargo
HAVING AVG(salario) > 3000;

-- 4️⃣ Mostrar fornecedores com mais de 10 produtos
SELECT id_fornecedor, COUNT(*) AS quantidade_produtos
FROM Produtos
GROUP BY id_fornecedor
HAVING COUNT(*) > 10;

-- 5️⃣ Mostrar funcionários que realizaram mais de 20 vendas
SELECT id_funcionario, COUNT(*) AS quantidade_vendas
FROM Vendas
GROUP BY id_funcionario
HAVING COUNT(*) > 20;

-- 6️⃣ Mostrar filiais com mais de 3 funcionários
SELECT id_filial, COUNT(*) AS quantidade_funcionarios
FROM Funcionarios
GROUP BY id_filial
HAVING COUNT(*) > 3;

-- 7️⃣ Mostrar categorias com estoque total acima de 500
SELECT id_categoria, SUM(quantidade_estoque) AS soma_estoque
FROM Produtos
GROUP BY id_categoria
HAVING SUM(quantidade_estoque) > 500;

-- 8️⃣ Mostrar fornecedores cujo total de compras seja maior que 5000
SELECT id_fornecedor, SUM(total) AS soma_total_compras
FROM Compras
GROUP BY id_fornecedor
HAVING SUM(total) > 5000;

-- 9️⃣ Mostrar datas com mais de 10 vendas
SELECT data, COUNT(*) AS quantidade_vendas
FROM Vendas
GROUP BY data
HAVING COUNT(*) > 10;

-- 🔟 Mostrar clientes com mais de 200 pontos de fidelidade (Agrupado por endereço)
SELECT endereco, SUM(pontos_fidelidade) AS soma_pontos
FROM Clientes
GROUP BY endereco
HAVING SUM(pontos_fidelidade) > 200;

-- 1️⃣1️⃣ Mostrar cargos cujo maior salário seja superior a 7000
SELECT cargo, MAX(salario) AS maior_salario
FROM Funcionarios
GROUP BY cargo
HAVING MAX(salario) > 7000;

---------------------------------------------------------

-- 1️⃣ Mostrar produtos e suas categorias
SELECT P.nome AS nome_produto, C.nome AS nome_categoria
FROM Produtos P
INNER JOIN Categorias C ON P.id_categoria = C.id_categoria;

-- 2️⃣ Mostrar produtos e seus fornecedores
-- (Considerando o modelo onde id_fornecedor fica na tabela Produtos)
SELECT P.nome AS nome_produto, F.nome AS nome_fornecedor
FROM Produtos P
INNER JOIN Fornecedores F ON P.id_fornecedor = F.id_fornecedor;

-- 3️⃣ Mostrar funcionários e suas filiais
SELECT Func.nome AS nome_funcionario, Fil.nome AS nome_filial
FROM Funcionarios Func
INNER JOIN Filiais Fil ON Func.id_filial = Fil.id_filial;

-- 4️⃣ Mostrar vendas e nomes dos clientes
SELECT V.id_venda, V.data AS data_venda, C.nome AS nome_cliente
FROM Vendas V
INNER JOIN Clientes C ON V.id_cliente = C.id_cliente;

-- 5️⃣ Mostrar compras e fornecedores
SELECT Com.id_compra, Com.data AS data_compra, Forn.nome AS nome_fornecedor
FROM Compras Com
INNER JOIN Fornecedores Forn ON Com.id_fornecedor = Forn.id_fornecedor;

-- 6️⃣ Mostrar itens das vendas com nomes dos produtos
SELECT IV.id_venda, P.nome AS nome_produto, IV.quantidade, IV.subtotal
FROM ItensVenda IV
INNER JOIN Produtos P ON IV.id_produto = P.id_produto;

-- 7️⃣ Mostrar produtos e suas filiais
SELECT P.nome AS nome_produto, F.nome AS nome_filial
FROM Produtos P
INNER JOIN Filiais F ON P.id_filial = F.id_filial;

-- 8️⃣ Mostrar vendas e funcionários responsáveis
SELECT V.id_venda, F.nome AS nome_funcionario
FROM Vendas V
INNER JOIN Funcionarios F ON V.id_funcionario = F.id_funcionario;

-- 9️⃣ Mostrar compras e filiais
SELECT C.id_compra, F.nome AS nome_filial, C.total AS total_da_compra
FROM Compras C
INNER JOIN Filiais F ON C.id_filial = F.id_filial;

-- 🔟 Mostrar clientes e suas vendas
SELECT C.nome AS nome_cliente, V.id_venda, V.total AS total_da_venda
FROM Clientes C
INNER JOIN Vendas V ON C.id_cliente = V.id_cliente;

-- 1️⃣1️⃣ Mostrar detalhes completos das vendas (Múltiplos JOINs)
SELECT 
    V.id_venda, 
    C.nome AS nome_cliente, 
    F.nome AS nome_funcionario, 
    Fil.nome AS nome_filial, 
    V.total AS total_da_venda
FROM Vendas V
INNER JOIN Clientes C ON V.id_cliente = C.id_cliente
INNER JOIN Funcionarios F ON V.id_funcionario = F.id_funcionario
INNER JOIN Filiais Fil ON V.id_filial = Fil.id_filial;
