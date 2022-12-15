   
   
   select  json_object('data'  VALUE to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'),
   'codigo' VALUE json_object('Gravame' VALUE sum(decode(codigo, 'GRAVAME', 1, 0))))
from (
  SELECT to_char(a.data_transacao,'dd/mm/yyyy hh24:MI') DATA,
        CASE a.num_transacao
WHEN '770' THEN 'GRAVAME'
ELSE 'sem codigo registrado'
END as codigo
   from sng_logtransacao a
   where a.cod_retorno = '030'   
   and a.num_transacao = '770'
   and a.data_transacao > sysdate - interval '10' MINUTE
)
