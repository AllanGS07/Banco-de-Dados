USE locket_db;

-- Executa a Transação 1: Emprestar o objeto 1 para o usuário 1
CALL proc_realizar_emprestimo(
    1, -- ID do Usuário
    1, -- ID do Objeto (Projetor)
    CURDATE(), -- Data de Retirada (Hoje)
    DATE_ADD(CURDATE(), INTERVAL 7 DAY), -- Devolução (Daqui a 7 dias)
    @id_emprestimo_gerado,
    @mensagem_retorno
);

-- PROVA DA TRANSAÇÃO: Mostra que o empréstimo foi criado
SELECT @id_emprestimo_gerado AS Emprestimo_ID, @mensagem_retorno AS Resultado;

-- PROVA DO GATILHO AFTER INSERT: Mostra que o projetor agora está 'EMPRESTADO'
SELECT ID_Objeto, Nome, Status_Item 
FROM Objeto 
WHERE ID_Objeto = 1;