CRU

SELECT to_char(a.DH_CRIACAO_CHAVE_QRCODE,'dd/mm/yyyy hh24:MI') DATA,
 
 CASE a.co_pagamento_qrcode
 WHEN 'NULL' THEN 'PIX_NAO_PAGO'
ELSE 'PIX_PAGO'
END as codigo
  FROM financeiro.PIX_TB_QRCODE_GERADO a
WHERE a.DH_CRIACAO_CHAVE_QRCODE > sysdate - interval '10' MINUTE

RELATORIO

 select data, hora, codigo, count(*) total
 from ( 
SELECT 
 to_char(a.DH_CRIACAO_CHAVE_QRCODE, 'mm/dd/yyyy') as data,
 to_char(a.DH_CRIACAO_CHAVE_QRCODE, 'HH24') hora, 
 
 CASE a.co_pagamento_qrcode
 WHEN 'NULL' THEN 'PIX_NAO_PAGO'
ELSE 'PIX_PAGO'
END as codigo
  FROM financeiro.PIX_TB_QRCODE_GERADO a
WHERE a.co_pagamento_qrcode is not null
AND a.DH_CRIACAO_CHAVE_QRCODE between '01/01/2022' and '25/11/2022' 
   )
   
   group by  data, hora, codigo