CRU

 SELECT to_char(a.ve_log_data,'dd/mm/yyyy hh24:MI') DATA    
 ,    CASE a.ve_log_transacao
 WHEN '901' THEN '901'
 WHEN '902' THEN '902'
 WHEN '903' THEN '903'
 ELSE 'acesso'END as codigo
 FROM   VEICULO.ve_log_transacoes a
 WHERE  a.ve_log_transacao IN (901, 902, 903)
 AND    a.ve_log_data >= TRUNC(SYSDATE)
 and a.ve_log_data > sysdate - interval '10' MINUTE


SELECT to_char(a.RE_LOG_DATA_TRANSACAO,'dd/mm/yyyy hh24:MI') DATA
      ,
a.RE_BIN_CODIGO codigo
from re_log_transacoes a
where RE_BIN_CODIGO in ('575' , '555' , '552' )
and a.RE_LOG_DATA_TRANSACAO >= trunc(sysdate) and a.RE_LOG_DATA_TRANSACAO < trunc(sysdate+1)
and a.RE_LOG_DATA_TRANSACAO > sysdate – interval '10' minute


RELATORIO

 select data, hora, codigo, count(*) total
 from ( 
 SELECT to_char(a.ve_log_data,'dd/mm/yyyy') DATA  
 ,  to_char(a.ve_log_data,'hh24') hora
 ,    CASE a.ve_log_transacao
 WHEN '901' THEN '901'
 WHEN '902' THEN '902'
 WHEN '903' THEN '903'
 ELSE 'acesso'END as codigo
 FROM   VEICULO.ve_log_transacoes a
 WHERE  a.ve_log_transacao IN (901, 902, 903)
 AND    a.ve_log_data between '01/01/2022' and '25/11/2022' 
   )
   
   group by  data, hora, codigo


    select data, hora, codigo, count(*) total
 from ( 
SELECT to_char(a.RE_LOG_DATA_TRANSACAO,'dd/mm/yyyy') DATA
, to_char(a.RE_LOG_DATA_TRANSACAO,'hh24') hora
      ,
a.RE_BIN_CODIGO codigo
from re_log_transacoes a
where RE_BIN_CODIGO in ('575' , '555' , '552' )
and a.RE_LOG_DATA_TRANSACAO between '01/01/2022' and '25/11/2022' 
   )
   
   group by  data, hora, codigo