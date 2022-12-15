CRU

  SELECT to_char(a.data_transacao,'dd/mm/yyyy hh24:MI') DATA,
    a.num_transacao codigo
   from sng_logtransacao a
   where a.cod_retorno = '030'   
   and a.num_transacao = '770'
   and a.data_transacao > sysdate - interval '10' MINUTE

   RELATORIO

    select data, hora, codigo, count(*) total
 from (
    select  to_char(a.data_transacao, 'dd/mm/yyyy') data  , 
 to_char(a.data_transacao, 'hh24') hora,
          CASE a.num_transacao
WHEN '770' THEN 'GRAVAME'
ELSE 'sem codigo registrado'
END as codigo
   from sng_logtransacao a
   where a.cod_retorno = '030'   
   and a.num_transacao = '770'
   and  a.data_transacao between '01/01/2022' and '25/11/2022'
   )
   
   group by  data, hora, codigo