SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('TEI_CIDADAO' value sum(decode(tipo, 'TEI CIDADÃO', 1, 0)), 'TEI_CNPJ' value sum(decode(tipo, 'TEI CNPJ', 1, 0))) )
FROM   (
                  SELECT     to_char(transf.dt_registro,'dd/mm/yyyy hh24:MI') data,
                             CASE vend.cpf
                                        WHEN substr(vend.cpf,1,11) THEN 'TEI CIDADÃO'
                                        ELSE 'TEI CNPJ'
                             END AS tipo
                  FROM       veiculo.tb_transferencia_comprador cmp
                  INNER JOIN veiculo.tb_transferencia transf
                  ON         transf.cod_comprador = cmp.cod_comprador
                  INNER JOIN veiculo.tb_transferencia_vendedor vend
                  ON         vend.cod_vendedor = cmp.cod_vendedor
                  WHERE      cod_timeline_vendedor       IN (120,105)
                  AND        transf.dt_registro > sysdate - interval '10' minute ) _conclusao > sysdate - interval '10' minute