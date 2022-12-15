SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('2_VIA_ABERTO' value sum(decode(codigo, '2_VIA_ABERTO', 1, 0)), 'sem cadastro' value sum(decode(codigo, 'sem cadastro', 1, 0)) ) )
FROM   (
              SELECT to_char(a.re_pro_dt_conclusao,'dd/mm/yyyy') data,
                     CASE a.re_tpr_codigo
                            WHEN '004' THEN '2_VIA_ABERTO'
                            ELSE 'sem cadastro'
                     END AS codigo
              FROM   re_candidato_processo a
              WHERE  a.re_pro_concluido = '1'
              AND    a.re_tpr_codigo = '004'
              AND    a.re_pro_dt_conclusao >= trunc( sysdate) )