USE locket_db;

-- 1. Cria uma instituição
INSERT INTO Instituicao_Ensino (CNPJ, Nome, e_MEC_INEP) 
VALUES ('12.345.678/0001-90', 'IF Goiano - Campus Teste', '12345678');

-- 2. Cria um usuário ativo
INSERT INTO Usuario (CPF, Matricula, Nome, Data_Nascimento, Email, Senha_Hash, Funcao, ID_Instituicao) 
VALUES ('111.111.111-11', '2026001', 'Felipe Gaia', '1990-01-01', 'felipe@teste.com', 'hash123', 'PROFESSOR', 1);

-- 3. Cria dois objetos disponíveis
INSERT INTO Objeto (Numero_Tombamento, Nome, Marca, Modelo, Numero_Serie, Status_Item, ID_Instituicao) 
VALUES 
(1001, 'Projetor Epson', 'Epson', 'X100', 'SN123456', 'DISPONIVEL', 1),
(1002, 'Notebook Dell', 'Dell', 'Inspiron', 'SN654321', 'DISPONIVEL', 1);

-- Mostra os objetos antes do teste
SELECT ID_Objeto, Nome, Status_Item FROM Objeto;