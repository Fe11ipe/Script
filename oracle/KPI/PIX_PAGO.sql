SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('PIX_PAGO' value sum(decode(codigo, 'PIX_PAGO', 1, 0) )) , 'PIX_NAO_PAGO' value sum(decode(codigo, 'PIX_NAO_PAGO', 1, 0)) )
FROM   (
              SELECT to_char(a.dh_criacao_chave_qrcode,'dd/mm/yyyy hh24:MI') data,
                     CASE a.co_pagamento_qrcode
                            WHEN 'NULL' THEN 'PIX_NAO_PAGO'
                            ELSE 'PIX_PAGO'
                     END AS codigo
              FROM   financeiro.pix_tb_qrcode_gerado a
              WHERE  a.dh_criacao_chave_qrcode > sysdate - interval '10' minute )