select
   json_object('data' VALUE to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' VALUE json_object('MULTA' VALUE sum(decode( codigo, 'MULTA', 1, 0)))) 
from
   (
      SELECT
         to_char(a.dat_ocorrencia, 'dd/mm/yyyy hh24') DATA,
         CASE
            a.TXT_ALTERACOES 
            WHEN
               'a' 
            THEN
               'SEM_MULTA' 
            ELSE
               'MULTA' 
         END
         as codigo 
      from
         detran_log_multa a 
      where
         a.cod_tabela = '2' 
         and a.TXT_ALTERACOES between '140' and '999' 
         and a.TXT_ALTERACOES <> '145' 
         and a.dat_ocorrencia > sysdate - interval '10' MINUTE 
   )