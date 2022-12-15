SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('PRIMEIRA_HABILITACAO' value sum(decode(codigo, 'PRIMEIRA_HABILITACAO', 1, 0))))
FROM   (
              SELECT to_char(a.re_cnh_dthr_lancamento,'dd/mm/yyyy hh24:MI') data ,
                     CASE a.tb_uf_codigowhen 'DF' THEN 'PRIMEIRA_HABILITACAO'
                            ELSE 'sem cadastro'
                     END AS codigofrom re_candidato_emissao_cnh awhere a.re_cnh_dt_prim_habilitacao = trunc(sysdate)
              AND    a.re_cnh_dt_validade_cnh < trunc(sysdate+470)
              AND    a.re_cnh_dthr_lancamento > sysdate - interval '10' minute)