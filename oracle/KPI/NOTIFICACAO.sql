SELECT To_char(a.dat_ocorrencia, 'dd/mm/yyyy hh24:MI') DATA,
       CASE a.cod_tabela
         WHEN '2' THEN 'NOTIFICACAO'
         WHEN '902' THEN '902'
         WHEN '903' THEN '903'
         ELSE 'sem cadastro'
       END                                             AS codigo
FROM   detran_log_multa a
WHERE  a.txt_alteracoes BETWEEN '131' AND '139'
       AND a.cod_tabela = '2'
       AND a.dat_ocorrencia > SYSDATE - interval '10' minute 