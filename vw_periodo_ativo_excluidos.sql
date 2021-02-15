ALTER VIEW pet.vw_periodo_ativo_excluidos AS
SELECT CASE WHEN  DATEDIFF(dt_exclusao, dt_criacao) <= 30 THEN 'MENOS DE 1 MÊS'
WHEN DATEDIFF(dt_exclusao, dt_criacao) > 30 AND DATEDIFF(dt_exclusao, dt_criacao) <= 180 THEN 'ENTRE 1 e 6 MESES'
WHEN DATEDIFF(dt_exclusao, dt_criacao) > 180 AND DATEDIFF(dt_exclusao, dt_criacao) <= 360 THEN 'ENTRE 6 MESES E 1 ANO'
WHEN DATEDIFF (dt_exclusao, dt_criacao) > 360 THEN 'MAIS DE 1 ANO'
END Periodo, 
id_cliente,
COUNT(id_cliente) total_clientes, 
SUM(qtd_itens) total_pedidos,
SUM(vlr_gasto) valor_gasto
 FROM pet.base_clientes
 where YEAR(dt_exclusao) = '2020'
 group by id_cliente, CASE WHEN  DATEDIFF(dt_exclusao, dt_criacao) <= 30 THEN 'MENOS DE 1 MÊS'
WHEN DATEDIFF(dt_exclusao, dt_criacao) > 30 AND DATEDIFF(dt_exclusao, dt_criacao) <= 180 THEN 'ENTRE 1 e 6 MESES'
WHEN DATEDIFF(dt_exclusao, dt_criacao) > 180 AND DATEDIFF(dt_exclusao, dt_criacao) <= 360 THEN 'ENTRE 6 MESES E 1 ANO'
WHEN DATEDIFF (dt_exclusao, dt_criacao) > 360 THEN 'MAIS DE 1 ANO'
END;