-- Insercao

INSERT INTO usuarios (nome, email, senha, perfil) 
VALUES ('Maria Silva', 'maria@email.com', '123456', 'cliente');

-- Atualizacao

UPDATE chamados 
SET status = 'em andamento' 
WHERE id_chamado = 1;

-- Remocao

DELETE FROM faq WHERE id_faq = 3;

-- Consulta

SELECT c.titulo, c.status, u.nome AS cliente, cat.nome_categoria
FROM chamados c
JOIN usuarios u ON c.id_usuario = u.id_usuario
JOIN categorias cat ON c.id_categoria = cat.id_categoria
WHERE c.status = 'aberto';

