CRU

  SELECT to_char(a.dat_ocorrencia,'dd/mm/yyyy hh24:MI') DATA,
  CASE a.TXT_ALTERACOES
WHEN 'a' THEN 'SEM_MULTA'
ELSE 'MULTA'
END as codigo
   from detran_log_multa a
      where a.cod_tabela = '2'
      and  a.TXT_ALTERACOES between '140' and '999'
     and  a.TXT_ALTERACOES <> '145'
   and a.dat_ocorrencia > sysdate – interval '10' MINUTE

   RELATORIO

   select data, hora, codigo, count(*) total
 from (
  SELECT to_char(a.dat_ocorrencia,'dd/mm/yyyy') DATA,
 to_char(a.dat_ocorrencia,'hh24') hora,
  CASE a.TXT_ALTERACOES
WHEN 'a' THEN 'SEM_MULTA'
ELSE 'MULTA'
END as codigo
   from detran_log_multa a
      where a.cod_tabela = '2'
      and  a.TXT_ALTERACOES between '140' and '999'
     and  a.TXT_ALTERACOES <> '145'
   and a.dat_ocorrencia between '01/01/2022' and '25/11/2022'
   )
   
   group by  data, hora, codigo