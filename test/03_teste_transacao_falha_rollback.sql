USE locket_db;

-- Executa a Transação 1 novamente, tentando pegar o mesmo Projetor (ID 1) que já está emprestado!
CALL proc_realizar_emprestimo(
    1, 
    1, 
    CURDATE(), 
    DATE_ADD(CURDATE(), INTERVAL 7 DAY), 
    @id_emprestimo_falha, 
    @mensagem_falha
);

-- PROVA DO ROLLBACK: Deve retornar ID -1 e a mensagem de erro (Objeto indisponível)
SELECT @id_emprestimo_falha AS Emprestimo_Cancelado, @mensagem_falha AS Resultado_Erro;

-- Prova de que nada foi inserido indevidamente
SELECT COUNT(*) AS Total_Emprestimos_Objeto_1 FROM Emprestimos WHERE ID_Objeto = 1; 
-- Deve retornar apenas 1, provando que o segundo não passou!