CRU

SELECT To_char(a.re_pro_dt_abertura_processo,'dd/mm/yyyy hh24:MI') data,
       CASE a.re_pro_mot_req_1when '5' THEN 'Renovacao'
              ELSE 'sem cadastro'
       END AS codigo
FROM   refor.re_candidato_processo awhere a.re_pro_dt_abertura_processo > sysdate - interval '10' minuteand a.re_pro_mot_req_1 = '5'


RELATORIO

 select data, hora, codigo, count(*) total
 from ( 
 SELECT to_char(a.RE_LOG_DATA_TRANSACAO,'dd/mm/yyyy') DATA,  
  to_char(a.RE_LOG_DATA_TRANSACAO,'hh24') hora,   
 CASE a.RE_BIN_CODIGO
 WHEN '157' THEN 'ATUALIZAR_CONDUTOR'    
 WHEN '190' THEN 'PID'ELSE 'sem cadastro'END as codigo   
 from re_log_transacoes a
 where RE_BIN_CODIGO in ('157', '190')
 and a.RE_LOG_DATA_TRANSACAO between '01/01/2022' and '25/11/2022' 
   )
   
   group by  data, hora, codigo