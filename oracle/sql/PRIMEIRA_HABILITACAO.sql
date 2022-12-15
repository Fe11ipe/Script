CRU

SELECT To_char(a.re_cnh_dthr_lancamento,'dd/mm/yyyy hh24:MI') data ,
       CASE a.tb_uf_codigowhen 'DF' THEN 'PRIMEIRA_HABILITACAO'
              ELSE 'sem cadastro'
       END AS codigofrom re_candidato_emissao_cnh awhere a.re_cnh_dt_prim_habilitacao = trunc(sysdate)
AND    a.re_cnh_dt_validade_cnh < trunc(sysdate+470)
AND    a.re_cnh_dthr_lancamento > sysdate - interval '10' minute

REATORIO

 select data, hora, codigo, count(*) total
 from ( 
 SELECT to_char(a.RE_CNH_DTHR_LANCAMENTO,'dd/mm/yyyy') DATA ,   
  to_char(a.RE_CNH_DTHR_LANCAMENTO,'hh24') hora ,   
 CASE a.tb_uf_codigo
 WHEN 'DF' THEN 'PRIMEIRA_HABILITACAO'
 ELSE 'sem cadastro'END as codigo
 from re_candidato_emissao_cnh a
 where a.re_cnh_dt_prim_habilitacao between '01/01/2022' and '25/11/2022' 
 and a.re_cnh_dt_validade_cnh < trunc(sysdate+470) 
   )
   
   group by  data, hora, codigo