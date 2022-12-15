CRU

SELECT To_char(a.dat_ocorrencia,'dd/mm/yyyy hh24:MI') data,
       CASE a.cod_tabelawhen '2' THEN 'NOTIFICACAO'
              WHEN '902' THEN '902'
              WHEN '903' THEN '903'
              ELSE 'sem cadastro'
       END AS codigo
FROM   detran_log_multa a
WHERE  a.dat_ocorrencia >= trunc(sysdate)
AND    a.dat_ocorrencia < trunc(sysdate+1)
AND    to_char(a.dat_ocorrencia, 'HH24') = to_number(to_char(trunc(CURRENT_TIMESTAMP,'HH'),'HH24'))-1
AND    a.txt_alteracoes BETWEEN '131' AND    '139'
AND    a.cod_tabela = '2'

RELATORIO

 select data, hora, codigo, count(*) total
 from (
 SELECT to_char(a.re_pro_dt_conclusao,'dd/mm/yyyy') DATA,  
  to_char(a.re_pro_dt_conclusao,'hh24') Hora,    
 CASE a.re_pro_concluido
 WHEN '2' THEN 'CNH_DEFINITIVA'
 ELSE 'sem cadastro'END as codigo
 from refor.re_candidato_processo a
 where a.re_pro_dt_conclusao between '01/01/2022' and '25/11/2022' 
 and   a.re_tpr_codigo in ('016','017','086','019','020','092','018','093','087','021') 
   )
   
   group by  data, hora, codigo