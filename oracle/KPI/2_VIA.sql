select json_object('data' VALUE to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'),
'codigo' VALUE json_object('2_VIA' VALUE sum(decode(codigo, '2_VIA', 1, 0)),
'sem cadastro' VALUE sum(decode(codigo, 'sem cadastro', 1, 0))
) )
from (
SELECT to_char(a.re_pro_dt_conclusao,'dd/mm/yyyy') DATA,
CASE a.re_tpr_codigo WHEN '004' THEN '2_VIA'ELSE 'sem cadastro'END as codigo
from re_candidato_processo a
where a.re_pro_concluido = '2'
and a.re_pro_dt_conclusao > sysdate - interval '10' minute
)