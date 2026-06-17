# 1. Liste o nome e a cidade de todos os hospitais cadastrados.
SQL
SELECT nome, cidade 
FROM Hospitais;

#2. Exiba o nome, CRM e salário de todos os médicos.
SQL
SELECT nome, crm, salario 
FROM Medicos;

#3. Liste os pacientes cadastrados com seu tipo sanguíneo.
SQL
SELECT nome, tipo_sanguineo 
FROM Pacientes;

#4. Exiba os medicamentos com estoque inferior a 50 unidades.
SQL
SELECT nome, estoque 
FROM Medicamentos 
WHERE estoque < 50;

#5. Liste os pacientes que possuem alguma alergia registrada.
SQL
SELECT nome, alergias 
FROM Pacientes 
WHERE alergias IS NOT NULL AND alergias <> 'Nenhuma';

#Consultas com Filtros de Intervalo e Parâmetros
#6. Exiba as consultas realizadas após uma data informada pelo professor.
#(Exemplo utilizando a data '2026-05-10')
SQL
SELECT id_consulta, data_consulta, diagnostico 
FROM Consultas 
WHERE data_consulta > '2026-05-10 23:59:59';

#7. Liste os exames realizados em um período informado pelo professor.
#(Exemplo utilizando o intervalo de maio de 2026)
SQL
SELECT id_exame, nome, data_exame 
FROM Exames 
WHERE data_exame BETWEEN '2026-05-01' AND '2026-05-31';

#8. Exiba os funcionários cujo salário esteja entre R$ 2.500,00 e R$ 6.000,00.
SQL
SELECT nome, cargo, salario 
FROM Funcionarios 
WHERE salario BETWEEN 2500.00 AND 6000.00;

#9. Liste os quartos que estão com status "Disponível".
SQL
SELECT numero, tipo, capacidade 
FROM Quartos 
WHERE status_quarto = 'Disponível';

#10. Exiba os pagamentos realizados utilizando uma forma de pagamento informada pelo professor.
#(Exemplo utilizando 'Pix')
SQL
SELECT id_pagamento, valor, data_pagamento, forma_pagamento 
FROM Pagamentos 
WHERE forma_pagamento = 'Pix';

#Funções de Agregação e Agrupamentos (GROUP BY)
#11. Apresente a quantidade total de pacientes cadastrados.
SQL
SELECT COUNT(*) AS total_pacientes_cadastrados 
FROM Pacientes;

#12. Exiba o valor médio das consultas realizadas.
SQL
SELECT AVG(valor) AS valor_medio_consultas 
FROM Consultas;

#13. Apresente o menor valor de consulta registrado no sistema
SQL
SELECT MIN(valor) AS menor_valor_consulta 
FROM Consultas;

#14. Exiba a quantidade de médicos cadastrados por especialidade.
#(Nesta etapa básica, exibe o ID da especialidade)
SQL
SELECT id_especialidade, COUNT(*) AS quantidade_medicos 
FROM Medicos 
GROUP BY id_especialidade;

#15. Apresente a quantidade de funcionários cadastrados por setor.
#(Nesta etapa básica, exibe o ID do setor)
SQL
SELECT id_setor, COUNT(*) AS quantidade_funcionarios 
FROM Funcionarios 
GROUP BY id_setor;

#Consultas com Junções (INNER JOIN) e Subconsultas
#16. Liste o nome dos médicos e o nome de suas respectivas especialidades.
SQL
SELECT M.nome AS nome_medico, E.nome AS nome_especialidade
FROM Medicos M
INNER JOIN Especialidades E ON M.id_especialidade = E.id_especialidade;

#17. Exiba o nome dos funcionários e o nome do hospital em que trabalham.
SQL
SELECT F.nome AS nome_funcionario, H.nome AS nome_hospital
FROM Funcionarios F
INNER JOIN Hospitais H ON F.id_hospital = H.id_hospital;

#18. Liste o nome dos pacientes e as datas de suas consultas.
SQL
SELECT P.nome AS nome_paciente, C.data_consulta
FROM Consultas C
INNER JOIN Pacientes P ON C.id_paciente = P.id_paciente;

#19. Exiba o(s) medicamento(s) com o maior preço cadastrado.
SQL
SELECT nome, preco 
FROM Medicamentos 
WHERE preco = (SELECT MAX(preco) FROM Medicamentos);

#20. Liste os médicos cujo salário seja superior ao salário médio dos médicos cadastrados.
SQL
SELECT nome, crm, salario 
FROM Medicos 
WHERE salario > (SELECT AVG(salario) FROM Medicos);