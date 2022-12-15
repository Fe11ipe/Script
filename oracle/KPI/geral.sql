SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('PRIMEIRO_EMPLACAMENTO' value sum(decode(codigo, '201', 1, 0)) , 'ALTERAR_CARACTERISTICAS' value sum(decode(codigo, '202', 1, 0)) , 'AQUISICAO_VEICULO' value sum(decode(codigo, '203', 1, 0)) , 'TRANSFERENCIA_DE_JURIDICAO' value sum(decode(codigo, '204', 1, 0)) , 'VENDA_ELETRONICA' value sum(decode(codigo, '233', 1, 0)) , 'INTENCAO_DE_VENDA' value sum(decode(codigo, '263', 1, 0)) , 'CRV_e' value sum(decode(codigo, '227', 1, 0)) , 'CRLV_E' value sum(decode(codigo, '237', 1, 0)) , 'MERCOSUL' value sum(decode(codigo, '253', 1, 0)) , 'ATUALIZACAO_ENDERECO' value sum(decode(codigo, '230', 1, 0))) format json)
FROM   (
              SELECT a.ve_log_transacao AS codigo
              FROM   veiculo.ve_log_transacoes a
              WHERE  a.ve_log_cod_retorno = '000'
              AND    a.ve_log_transacao     IN (201,202,203,204,233,263,227,237,250,253,230)
              AND    a.ve_log_data > sysdate - interval '10' minute )