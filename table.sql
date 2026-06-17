-- =====================================================================
-- 1. CRIAÇÃO E SELEÇÃO DO BANCO DE DADOS
-- =====================================================================
CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

-- =====================================================================
-- 2. TABELAS DE SUPORTE (SEM DEPENDÊNCIAS DE FK)
-- =====================================================================
CREATE TABLE Hospitais (
    id_hospital INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2),
    endereco VARCHAR(200)
);

CREATE TABLE Especialidades (
    id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Convenios (
    id_convenio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cobertura TEXT
);

CREATE TABLE Medicamentos (
    id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100),
    estoque INT CHECK (estoque >= 0),
    preco DECIMAL(10,2) CHECK (preco >= 0)
);

CREATE TABLE Setores (
    id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200),
    tipo_sanguineo VARCHAR(5),
    alergias TEXT
);

-- =====================================================================
-- 3. TABELAS COM DEPENDÊNCIAS (COM CHAVES ESTRANGEIRAS)
-- =====================================================================
CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    salario DECIMAL(10,2) CHECK (salario >= 0),
    id_especialidade INT NOT NULL,
    id_hospital INT NOT NULL,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidades(id_especialidade),
    FOREIGN KEY (id_hospital) REFERENCES Hospitais(id_hospital)
);

CREATE TABLE PacienteConvenio (
    id_paciente_convenio INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_convenio INT NOT NULL,
    numero_carteira VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_convenio) REFERENCES Convenios(id_convenio)
);

CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATETIME NOT NULL,
    diagnostico TEXT,
    observacoes TEXT,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0),
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Receitas (
    id_receita INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta INT NOT NULL,
    data_receita DATE NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta) ON DELETE CASCADE
);

CREATE TABLE ReceitaMedicamento (
    id_receita_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    id_receita INT NOT NULL,
    id_medicamento INT NOT NULL,
    dosagem VARCHAR(100) NOT NULL,
    frequencia VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE,
    FOREIGN KEY (id_medicamento) REFERENCES Medicamentos(id_medicamento)
);

CREATE TABLE Exames (
    id_exame INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    resultado TEXT,
    data_exame DATE NOT NULL,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Quartos (
    id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    tipo VARCHAR(50),
    capacidade INT CHECK (capacidade > 0),
    status_quarto VARCHAR(50) DEFAULT 'Disponível',
    id_hospital INT NOT NULL,
    FOREIGN KEY (id_hospital) REFERENCES Hospitais(id_hospital)
);

CREATE TABLE Internacoes (
    id_internacao INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME,
    motivo TEXT,
    id_paciente INT NOT NULL,
    id_quarto INT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_quarto) REFERENCES Quartos(id_quarto)
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) CHECK (salario >= 0),
    id_setor INT NOT NULL,
    id_hospital INT NOT NULL,
    FOREIGN KEY (id_setor) REFERENCES Setores(id_setor),
    FOREIGN KEY (id_hospital) REFERENCES Hospitais(id_hospital)
);

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0),
    data_pagamento DATE NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta) ON DELETE SET NULL
);

-- =====================================================================
-- 4. SEGURANÇA E AUDITORIA
-- =====================================================================
CREATE TABLE UsuariosSistema (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(50) NOT NULL
);

CREATE TABLE Logs (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    acao TEXT NOT NULL,
    data_log DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES UsuariosSistema(id_usuario) ON DELETE SET NULL
);