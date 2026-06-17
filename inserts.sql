INSERT INTO Hospitais (nome, cidade, estado, endereco) VALUES
('Hospital Central HealthCare', 'São Paulo', 'SP', 'Av. Paulista, 1000'),
('Pronto Socorro Zona Sul', 'São Paulo', 'SP', 'Rua das Clínicas, 500');

INSERT INTO Especialidades (nome) VALUES
('Cardiologia'), ('Pediatria'), ('Clínica Geral'), ('Neurologia'), ('Ortopedia');

INSERT INTO Convenios (nome, telefone, cobertura) VALUES
('Amil Saúde', '11999991111', 'Completa Nacional'),
('Unimed Paulista', '11988882222', 'Enfermaria e Ambulatorial'),
('SulAmérica Premium', '11977773333', 'Apartamento e Reembolso');

INSERT INTO Medicamentos (nome, fabricante, estoque, preco) VALUES
('Dipirona Monohidratada 500mg', 'Medley', 1500, 5.40),
('Amoxicilina 500mg', 'EMS', 450, 28.90),
('Omeprazol 20mg', 'Eurofarma', 800, 14.20),
('Losartana Potássica 50mg', 'Neo Química', 1200, 9.90);

INSERT INTO Setores (nome) VALUES
('Enfermaria'), ('UTI Adulto'), ('Pronto Atendimento'), ('Administrativo'), ('Faturamento');

INSERT INTO Pacientes (nome, cpf, data_nascimento, telefone, email, endereco, tipo_sanguineo, alergias) VALUES
('Carlos Augusto Silva', '12345678901', '1985-04-12', '11911112222', 'carlos@email.com', 'Rua A, 123', 'O+', 'Nenhuma'),
('Mariana Costa Oliveira', '98765432100', '1992-09-25', '11922223333', 'mariana@email.com', 'Av. B, 456', 'A-', 'Dipirona'),
('Roberto Santos Lima', '45678912388', '1960-11-02', '11933334444', 'roberto@email.com', 'Rua C, 789', 'AB+', 'Penicilina'),
('Ana Julia Pereira', '32165498711', '2018-06-15', '11944445555', 'anajulia@email.com', 'Av. D, 101', 'O-', 'Nenhuma');

INSERT INTO PacienteConvenio (id_paciente, id_convenio, numero_carteira) VALUES
(1, 1, 'AMIL-123456'),
(2, 2, 'UNIMED-654321'),
(3, 3, 'SULAMERICA-999');

INSERT INTO Medicos (nome, crm, telefone, email, salario, id_especialidade, id_hospital) VALUES
('Dr. Arnaldo Rocha', 'CRM-SP12345', '11955556666', 'arnaldo@healthcare.com', 15000.00, 1, 1),
('Dra. Beatriz Souza', 'CRM-SP67890', '11966667777', 'beatriz@healthcare.com', 12500.00, 2, 1),
('Dr. Cláudio Mendes', 'CRM-SP54321', '11977778888', 'claudio@healthcare.com', 9800.00, 3, 2);

INSERT INTO Consultas (data_consulta, diagnostico, observacoes, valor, id_paciente, id_medico) VALUES
('2026-05-10 10:00:00', 'Hipertensão Essencial', 'Paciente orientado a reduzir sal.', 250.00, 1, 1),
('2026-05-11 14:30:00', 'Amigdalite Bacteriana', 'Necessário repouso de 3 dias.', 180.00, 4, 2),
('2026-05-12 09:15:00', 'Check-up de rotina', 'Exames laboratoriais solicitados.', 200.00, 2, 3),
('2026-06-01 16:00:00', 'Arritmia leve', 'Acompanhamento trimestral.', 300.00, 3, 1);

INSERT INTO Receitas (id_consulta, data_receita, observacoes) VALUES
(1, '2026-05-10', 'Tomar de uso contínuo.'),
(2, '2026-05-11', 'Antibioticoterapia completa.');

INSERT INTO ReceitaMedicamento (id_receita, id_medicamento, dosagem, frequencia) VALUES
(1, 4, '1 comprimido 50mg', 'A cada 24 horas'),
(2, 2, '1 comprimido 500mg', 'A cada 8 horas por 7 dias');

INSERT INTO Exames (nome, resultado, data_exame, id_paciente, id_medico) VALUES
('Eletrocardiograma', 'Ritmo sinusal, sem alterações de ST.', '2026-05-10', 1, 1),
('Hemograma Completo', 'Leucocitose leve compatível com quadro clínico.', '2026-05-11', 4, 2),
('Colesterol Total e Frações', 'LDL ligeiramente elevado (135 mg/dL).', '2026-05-12', 2, 3);

INSERT INTO Quartos (numero, tipo, capacidade, status_quarto, id_hospital) VALUES
('101-A', 'Apartamento Privativo', 1, 'Ocupado', 1),
('102-B', 'Enfermaria Coletiva', 4, 'Disponível', 1),
('201-U', 'UTI Isolamento', 1, 'Disponível', 1);

INSERT INTO Internacoes (data_entrada, data_saida, motivo, id_paciente, id_quarto) VALUES
('2026-05-15 08:00:00', '2026-05-18 12:00:00', 'Pós-operatório ortopédico', 1, 1),
('2026-06-10 22:30:00', NULL, 'Crise hipertensiva severa', 3, 1);

INSERT INTO Funcionarios (nome, cpf, cargo, salario, id_setor, id_hospital) VALUES
('Marcos Roberto Diaz', '11122233344', 'Enfermeiro Chefe', 5500.00, 1, 1),
('Luciana Maria Silva', '55566677788', 'Técnico de Enfermagem', 3200.00, 3, 1),
('Roberta Lima Knupp', '99988877766', 'Analista Administrativo', 4100.00, 4, 2);

INSERT INTO Pagamentos (valor, data_pagamento, forma_pagamento, id_consulta) VALUES
(250.00, '2026-05-10', 'Cartão de Crédito', 1),
(180.00, '2026-05-11', 'Dinheiro', 2),
(200.00, '2026-05-12', 'Pix', 3);