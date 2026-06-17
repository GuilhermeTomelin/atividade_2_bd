# MODIFICAR TABELAS (ALTER TABLE)
-- 1️⃣ Renomear tabela
ALTER TABLE Clientes RENAME TO ClientesVIP;

-- 2️⃣ Adicionar nova coluna
ALTER TABLE Produtos ADD marca VARCHAR(50);

-- 3️⃣ Remover coluna
ALTER TABLE Produtos DROP COLUMN marca;

-- 4️⃣ Modificar tipo da coluna
ALTER TABLE ClientesVIP MODIFY telefone VARCHAR(20); -- Usando ClientesVIP se já renomeado acima

-- 5️⃣ Renomear coluna
ALTER TABLE Funcionarios RENAME COLUMN cargo TO funcao;

#MODIFICAR COLUNAS / ATRIBUTOS

-- 1️⃣ Alterar tamanho do VARCHAR
ALTER TABLE Produtos MODIFY nome VARCHAR(200);

-- 2️⃣ Tornar coluna NOT NULL
ALTER TABLE ClientesVIP MODIFY nome VARCHAR(100) NOT NULL;

-- 3️⃣ Remover NOT NULL (Permitir nulo)
ALTER TABLE ClientesVIP MODIFY endereco VARCHAR(200) NULL;

-- 4️⃣ Adicionar valor DEFAULT
ALTER TABLE ClientesVIP MODIFY pontos_fidelidade INT DEFAULT 0;

-- 5️⃣ Alterar tipo INT para BIGINT
ALTER TABLE Vendas MODIFY id_venda BIGINT;

# MODIFICAR CHAVE PRIMÁRIA (PK)

-- 1️⃣ Adicionar PK
ALTER TABLE Fornecedores ADD PRIMARY KEY(id_fornecedor);

-- 2️⃣ Remover PK
ALTER TABLE Fornecedores DROP PRIMARY KEY;

-- 3️⃣ Criar PK composta
ALTER TABLE ItensVenda ADD PRIMARY KEY(id_venda, id_produto);

-- 4️⃣ Trocar PK (Remove a antiga e adiciona a nova)
ALTER TABLE ClientesVIP DROP PRIMARY KEY;
ALTER TABLE ClientesVIP ADD PRIMARY KEY(id_cliente);

-- 5️⃣ Adicionar AUTO_INCREMENT na PK
ALTER TABLE Produtos MODIFY id_produto INT AUTO_INCREMENT;

#MODIFICAR CHAVE ESTRANGEIRA (FK)

-- 1️⃣ Adicionar FK
ALTER TABLE Produtos ADD CONSTRAINT fk_categoria FOREIGN KEY(id_categoria) REFERENCES Categorias(id_categoria);

-- 2️⃣ Remover FK
ALTER TABLE Produtos DROP FOREIGN KEY fk_categoria;

-- 3️⃣ Criar FK em Vendas
ALTER TABLE Vendas ADD CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES ClientesVIP(id_cliente);

-- 4️⃣ Adicionar FK com ON DELETE CASCADE
ALTER TABLE ItensVenda ADD CONSTRAINT fk_venda FOREIGN KEY(id_venda) REFERENCES Vendas(id_venda) ON DELETE CASCADE;

-- 5️⃣ Adicionar FK com ON UPDATE CASCADE
ALTER TABLE Produtos ADD CONSTRAINT fk_fornecedor FOREIGN KEY(id_fornecedor) REFERENCES Fornecedores(id_fornecedor) ON UPDATE CASCADE;

#MODIFICAR CONSTRAINTS

-- 1️⃣ Adicionar UNIQUE
ALTER TABLE ClientesVIP ADD CONSTRAINT unique_email UNIQUE(email);

-- 2️⃣ Remover UNIQUE
ALTER TABLE ClientesVIP DROP INDEX unique_email;

-- 3️⃣ Adicionar CHECK
ALTER TABLE Produtos ADD CONSTRAINT chk_preco CHECK(preco >= 0);

-- 4️⃣ Adicionar DEFAULT via ALTER SET DEFAULT
ALTER TABLE ClientesVIP ALTER pontos_fidelidade SET DEFAULT 0;

-- 5️⃣ Adicionar NOT NULL
ALTER TABLE Funcionarios MODIFY salario DECIMAL(10,2) NOT NULL;