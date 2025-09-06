SELECT 
    p.id_pedido,
    c.nome AS cliente,
    pr.nome AS produto,
    pi.quantidade,
    pr.preco,
    (pi.quantidade * pr.preco) AS total_item
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN pedido_itens pi ON p.id_pedido = pi.id_pedido
JOIN produtos pr ON pi.id_produto = pr.id_produto
ORDER BY p.id_pedido;