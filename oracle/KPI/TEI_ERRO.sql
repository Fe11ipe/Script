SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('TEI ERRO' value sum(decode( codigo, 'TEI ERRO', 1, 0))))
FROM  (
              SELECT to_char(dt_registro, 'dd/mm/yyyy hh24:MI') data,
                     CASE chassi
                            WHEN substr(chassi,1,11) THEN 'TEI CIDADÃO'
                            ELSE 'TEI ERRO'
                     END AS codigo
              FROM   (
                                     SELECT DISTINCT chassi,
                                                     dt_registro
                                     FROM            veiculo.tb_transferencia
                                     WHERE           cod_timeline_vendedor IN ('105',
                                                                               '115')
                                     AND             chassi IN
                                                     (
                                                            SELECT chassi
                                                            FROM   portal.tb_emissao_atpve atpve
                                                            WHERE  tipo_transacao   IN ('231')
                                                            AND    codg_retorno NOT IN ('000')
                                                            AND    NOT EXISTS
                                                                   (
                                                                          SELECT 1
                                                                          FROM   portal.tb_emissao_atpve atpveint
                                                                          WHERE  atpve.chassi = atpveint.chassi
                                                                          AND    tipo_transacao IN ('231')
                                                                          AND    codg_retorno   IN ('000') ) )
                                     AND             dt_registro >= trunc( sysdate) ) )