USE locket_db;

-- Executa a Transação 2: Devolver o empréstimo que foi criado no teste 02
CALL proc_devolver_emprestimo(
    @id_emprestimo_gerado, -- Pega o ID gerado no script 02 (ou você pode digitar 1 direto)
    CURDATE(), -- Data da devolução (Hoje)
    @sucesso,
    @mensagem_devolucao
);

-- PROVA DA TRANSAÇÃO: Mostra que a devolução foi registrada
SELECT @sucesso AS Devolucao_Bem_Sucedida, @mensagem_devolucao AS Mensagem;

-- PROVA DO GATILHO AFTER UPDATE: Mostra que o projetor voltou a ficar 'DISPONIVEL'
SELECT ID_Objeto, Nome, Status_Item 
FROM Objeto 
WHERE ID_Objeto = 1;

-- Mostra como ficou o registro final na tabela de empréstimos
SELECT ID_Emprestimo, Status_Emprestimo, Data_Devolucao_Real 
FROM Emprestimos 
WHERE ID_Emprestimo = @id_emprestimo_gerado;