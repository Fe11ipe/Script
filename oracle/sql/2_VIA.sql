CRU


SELECT To_char(a.re_pro_dt_conclusao,'dd/mm/yyyy hh24:') data,
       CASE a.re_tpr_codigowhen '004' THEN '2_VIA'
              ELSE 'sem cadastro'
       END AS codigo
FROM   re_candidato_processo a
WHERE  a.re_pro_concluido = '2'
AND    a.re_tpr_codigo = '004'
AND    a.re_pro_dt_conclusao > sysdate - interval '10' minute


RELATORIO

 select data, hora, codigo, count(*) total
 from (
  SELECT to_char(a.re_pro_dt_conclusao,'dd/mm/yyyy') DATA,   
 to_char(a.re_pro_dt_conclusao,'hh24') hora,
  CASE a.re_tpr_codigo
  WHEN '004' THEN '2_VIA'
  ELSE 'sem cadastro'END as codigo  
  from re_candidato_processo a  
  where a.re_pro_dt_conclusao between '01/01/2022' and '25/11/2022'     
  and a.re_pro_concluido = '2'  
  and a.re_tpr_codigo = '004' 
   )
   
   group by  data, hora, codigo
   