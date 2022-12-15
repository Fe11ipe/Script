SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('CNH' value sum(decode(codigo, 'CNH_DEFINITIVA', 1, 0))))
FROM   (
              SELECT to_char(a.re_pro_dt_conclusao,'dd/mm/yyyy hh24:MI') data,
                     CASE a.re_pro_concluido
                            WHEN '2' THEN 'CNH_DEFINITIVA'
                            ELSE 'sem cadastro'
                     END AS codigo
              FROM   refor.re_candidato_processo a
              WHERE  a.re_tpr_codigo IN ('016',
                                         '017',
                                         '086',
                                         '019',
                                         '020',
                                         '092',
                                         '018',
                                         '093',
                                         '087',
                                         '021')
              AND    a.re_pro_dt_conclusao > sysdate - interval '10' minute )