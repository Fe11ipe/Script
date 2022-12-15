CRUSELECT a.ve_log_transacao AS codigo
FROM   veiculo.ve_log_transacoes a
WHERE  a.ve_log_cod_retorno = '000'
AND    a.ve_log_transacao     IN (201,202,203,204,233,263,227,237,250,253,230)
AND    a.ve_log_data > sysdate - interval '10' minute relatorioSELECT   data,
         hora,
         codigo,
         Count (*) total
FROM     (
                SELECT To_char(a.ve_log_data, 'dd/mm/yyyy') AS data,
                       To_char(a.ve_log_data, 'HH24')          hora,
                       CASE a.ve_log_transacao
                              WHEN '201' THEN 'PRIMEIRO_EMPLACAMENTO'
                              WHEN '202' THEN 'ALTERAR_CARACTERISTICAS'
                              WHEN '203' THEN 'AQUISICAO_VEICULO'
                              WHEN '204' THEN 'TRANSFERENCIA_DE_JURIDICAO'
                              WHEN '233' THEN 'VENDA_ELETRONICA'
                              WHEN '263' THEN 'INTENCAO_DE_VENDA'
                              WHEN '227' THEN 'CRV_e'
                              WHEN '237' THEN 'CRLV_E'
                              WHEN '253' THEN 'MERCOSUL'
                              WHEN '250' THEN 'AUTORIZACAO_DE_ESTAPAGEM'
                              WHEN '230' THEN 'ATUALIZACAO_ENDERECO'
                              ELSE 'sem cadastro'
                       END AS codigo
                FROM   veiculo.ve_log_transacoes a
                WHERE  a.ve_log_cod_retorno = '000'
                AND    a.ve_log_renavam IS NOT NULL
                AND    a.ve_log_transacao IN (201,202,203,204,233,263,227,237,250,253,230)
                AND    a.ve_log_data BETWEEN '01/01/2022' AND    '25/11/2022' )
GROUP BY data,
         hora,
         codigo
ORDER BY data,
         hora