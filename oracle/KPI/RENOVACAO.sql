SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('Renovacao' value sum(decode(codigo, 'Renovacao', 1, 0))))
FROM   (
              SELECT to_char(a.re_pro_dt_abertura_processo,'dd/mm/yyyy hh24:MI') data,
                     CASE a.re_pro_mot_req_1
                            WHEN '5' THEN 'Renovacao'
                            ELSE 'sem cadastro'
                     END AS codigo
              FROM   refor.re_candidato_processo a
              WHERE  a.re_pro_dt_abertura_processo > sysdate - interval '10' minute
              AND    a.re_pro_mot_req_1 = '5' )