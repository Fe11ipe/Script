SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('901' value sum(decode(codigo, '901', 1, 0) ), '902' value sum(decode(codigo, '902', 1, 0)) , '903' value sum(decode(codigo, '903', 1, 0)) , '921' value sum(decode(codigo, '921', 1, 0))) )
FROM   (
              SELECT to_char(a.ve_log_data,'dd/mm/yyyy hh24:MI') data ,
                     CASE a.ve_log_transacao
                            WHEN '901' THEN '901'
                            WHEN '902' THEN '902'
                            WHEN '903' THEN '903'
                            WHEN '921' THEN '921'
                            ELSE 'acesso'
                     END AS codigo
              FROM   veiculo.ve_log_transacoes a
              WHERE  a.ve_log_transacao IN (901,
                                            902,
                                            903,
                                            921)
              AND    a.ve_log_data >= trunc(sysdate)
              AND    a.ve_log_data > sysdate - interval '10' minute )


SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('575' value sum(decode(codigo, '575', 1, 0) ), '555' value sum(decode(codigo, '555', 1, 0)) , '552' value sum(decode(codigo, '552', 1, 0)) ) )
FROM   (
              SELECT to_char(a.re_log_data_transacao,'dd/mm/yyyy hh24:MI') data ,
                     a.re_bin_codigo                                       codigo
              FROM   re_log_transacoes a
              WHERE  re_bin_codigo IN ('575' ,
                                       '555' ,
                                       '552' )
              AND    a.re_log_data_transacao >= trunc(sysdate)
              AND    a.re_log_data_transacao < trunc(sysdate+1)
              AND    a.re_log_data_transacao > sysdate - interval '10' minute )