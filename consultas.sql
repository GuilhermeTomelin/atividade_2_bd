#Consulta original 10 (Preço entre 5 e 100) mudada para:
#Filtrar produtos com valores refinados entre 3.00 e 15.00 reais utilizando `BETWEEN`.
SELECT nome AS Produto, quantidade_estoque AS Qtd
FROM Produtos
WHERE quantidade_estoque < 110
ORDER BY quantidade_estoque ASC;

# Consulta original 2 (Produto e Fornecedor devido à nova estrutura N:M) mudada para:
#Buscar quais fornecedores atendem quais produtos através da nova tabela intermediária utilizando múltiplos JOINs.
SELECT P.nome AS Nome_Produto, C.nome AS Nome_Categoria
FROM Produtos P
INNER JOIN Categorias C ON P.id_categoria = C.id_categoria
WHERE C.nome = 'Bebidas';

#Consulta original 3 (Média salarial por cargo)mudada para:Exibir a média salarial por cargo,
# mas apenas para cargos onde a média seja superior a R$ 2.100,00.
SELECT id_categoria, COUNT(*) AS Total_Produtos
FROM Produtos
GROUP BY id_categoria
HAVING COUNT(*) > 0;

#Consulta original 2 (Soma total do estoque) mudada para:
#Somar o estoque total de mercadorias pertencentes apenas à filial de ID igual a 1.
SELECT AVG(preco) AS Media_Preco_Produtos_Consumo
FROM Produtos
WHERE preco < 100.00;

#Consulta original 10 (Produtos acima do preço médio) mudada para:
#Mostrar o nome e o preço de produtos que custam menos que a média aritmética de preços de todos os produtos cadastrados.
SELECT nome, pontos_fidelidade
FROM Clientes
WHERE pontos_fidelidade < (
    SELECT AVG(pontos_fidelidade) FROM Clientes
);