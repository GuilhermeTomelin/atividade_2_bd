-- Desafio 1: Listar nome, CPF e e-mail de todos os pacientes.
SELECT nome, cpf, email FROM Pacientes;

-- Desafio 2: Listar nome dos medicamentos, fabricante e o preço unitário.
SELECT nome AS Medicamento, fabricante AS Laboratorio, preco AS Valor_Unitario FROM Medicamentos;

-- Desafio 3: Exibir a listagem de médicos cadastrados mostrando nome e o CRM correspondente.
SELECT nome, crm FROM Medicos;

-- Desafio 4: Mostrar o número, tipo e capacidade de todos os quartos cadastrados no sistema.
SELECT numero, tipo, capacidade FROM Quartos;

-- Desafio 5: Mostrar todos os medicamentos com estoque crítico (abaixo de 500 unidades).
SELECT * FROM Medicamentos 
WHERE estoque < 500;

-- Desafio 6: Encontrar os médicos com vencimento/salário superior a R$ 10.000,00.
SELECT nome, crm, salario FROM Medicos 
WHERE salario > 10000.00;

-- Desafio 7: Buscar todos os pacientes que possuam o sobrenome 'Silva' (uso do operador LIKE).
SELECT id_paciente, nome, cpf FROM Pacientes 
WHERE nome LIKE '%Silva%';

-- Desafio 8: Identificar quais internações continuam ativas (onde a data de saída não foi preenchida).
SELECT * FROM Internacoes 
WHERE data_saida IS NULL;

-- Desafio 9: Listar consultas cujo valor esteja compreendido na faixa de R$ 200,00 a R$ 300,00.
SELECT id_consulta, data_consulta, valor FROM Consultas 
WHERE valor BETWEEN 200.00 AND 300.00;

-- Desafio 10: Mostrar os funcionários ordenados pelo salário em ordem decrescente (do maior para o menor).
SELECT nome, cargo, salario FROM Funcionarios 
ORDER BY salario DESC;

-- Desafio 11: Listar os pacientes em ordem alfabética crescente.
SELECT nome, data_nascimento, telefone FROM Pacientes 
ORDER BY nome ASC;

-- Desafio 12: Listar os exames ordenados da data mais recente para a mais antiga.
SELECT nome, data_exame, resultado FROM Exames 
ORDER BY data_exame DESC;

-- Desafio 13: Combinar médicos com suas respectivas áreas profissionais (Especialidades).
SELECT M.nome AS Nome_Medico, M.crm, E.nome AS Especialidade
FROM Medicos M
INNER JOIN Especialidades E ON M.id_especialidade = E.id_especialidade;

-- Desafio 14: Mostrar os detalhes das consultas exibindo o nome do paciente e o nome do médico responsável.
SELECT C.id_consulta, C.data_consulta, P.nome AS Paciente, M.nome AS Medico
FROM Consultas C
INNER JOIN Pacientes P ON C.id_paciente = P.id_paciente
INNER JOIN Medicos M ON C.id_medico = M.id_medico;

-- Desafio 15: Exibir os itens presentes nas receitas cruzando os dados com a tabela de medicamentos.
SELECT RM.id_receita, M.nome AS Medicamento, RM.dosagem, RM.frequencia
FROM ReceitaMedicamento RM
INNER JOIN Medicamentos M ON RM.id_medicamento = M.id_medicamento;

-- Desafio 16: Listar os funcionários mapeando o nome do setor onde trabalham e o hospital físico.
SELECT F.nome AS Funcionario, F.cargo, S.nome AS Setor, H.nome AS Hospital
FROM Funcionarios F
INNER JOIN Setores S ON F.id_setor = S.id_setor
INNER JOIN Hospitais H ON F.id_hospital = H.id_hospital;

-- Desafio 17: Contar o número de médicos alocados por especialidade médica.
SELECT id_especialidade, COUNT(*) AS Total_Medicos
FROM Medicos
GROUP BY id_especialidade;

-- Desafio 18: Calcular o faturamento total e a média de valor cobrado por consulta realizada.
SELECT SUM(valor) AS Faturamento_Total, AVG(valor) AS Media_Preco_Consulta 
FROM Consultas;

-- Desafio 19: Exibir a folha salarial média aglutinada por cargos dentro do hospital.
SELECT cargo, AVG(salario) AS Media_Salarial_Cargo
FROM Funcionarios
GROUP BY cargo;

-- Desafio 20: Listar apenas os setores que possuem folha de pagamento total acima de R$ 5.000,00 (Uso do HAVING).
SELECT id_setor, SUM(salario) AS Gasto_Salarial_Setor
FROM Funcionarios
GROUP BY id_setor
HAVING SUM(salario) > 5000.00;

-- Desafio 21: Encontrar todos os dados do médico que possui o maior salário do corpo clínico.
SELECT * FROM Medicos
WHERE salario = (SELECT MAX(salario) FROM Medicos);

-- Desafio 22: Selecionar as consultas cujo valor cobrado superou a média geral de preços praticados na rede.
SELECT id_consulta, data_consulta, valor 
FROM Consultas
WHERE valor > (SELECT AVG(valor) FROM Consultas);

-- Desafio 23: Encontrar os medicamentos cujo estoque está abaixo da média global de estoque do almoxarifado.
SELECT nome, estoque FROM Medicamentos
WHERE estoque < (SELECT AVG(estoque) FROM Medicamentos);