SELECT JSON_OBJECT('data' VALUE TO_CHAR(SYSDATE - INTERVAL '10' MINUTE,
                           'dd/mm/yyyy HH24:mi'),
                   'codigo' VALUE
                   JSON_OBJECT('CNH_Mudanca_de_Categoria' VALUE
                               SUM(DECODE(CODIGO,
                                          'CNH_Mudanca_de_Categoria',
                                          1,
                                          0)),
                               'CNH_Definitiva' VALUE
                               SUM(DECODE(CODIGO, 'CNH_Definitiva', 1, 0)),
                               'Veiculo_Alteracao_de_Categoria' VALUE
                               SUM(DECODE(CODIGO,
                                          'Veiculo_Alteracao_de_Categoria',
                                          1,
                                          0)),
                               '2a_via_a_ATPVe' VALUE
                               SUM(DECODE(CODIGO, '2a_via_a_ATPVe', 1, 0)),
                               'Cancelamento_de_ATPVe' VALUE SUM(DECODE(CODIGO,
                                          'Cancelamento_de_ATPVe',
                                          1,
                                          0)),
                               '2a_via_de_CRLV' VALUE
                               SUM(DECODE(CODIGO, '2a_via_de_CRLV', 1, 0)),
                               'Alteracao_de_caracteristica_de_CNH' VALUE
                               SUM(DECODE(CODIGO,
                                          'Alteracao_de_caracteristica_de_CNH',
                                          1,
                                          0)),
                               'PID' VALUE SUM(DECODE(CODIGO, 'PID', 1, 0)),
                               'Conversao_placa_mercosul' VALUE
                               SUM(DECODE(CODIGO,
                                          'Conversao_placa_mercosul',
                                          1,
                                          0)),
                               'VeIculo_Reboque' VALUE
                               SUM(DECODE(CODIGO, 'VeIculo_Reboque', 1, 0)),
                               'Veiculo_Taxa_primeiro_emplacamento' VALUE
                               SUM(DECODE(CODIGO,
                                          'Veiculo_Taxa_primeiro_emplacamento',
                                          1,
                                          0)),
                               'Servicos_SNG' VALUE
                               SUM(DECODE(CODIGO, 'Servicos_SNG', 1, 0)),
                               'Transferencia_de_veiculos' VALUE
                               SUM(DECODE(CODIGO,
                                          'Transferencia_de_veiculos',
                                          1,
                                          0)),
                               'Vistoria' VALUE
                               SUM(DECODE(CODIGO, 'Vistoria', 1, 0))))
  FROM (SELECT COUNT(*) TOTAL,
               SYS_DATA,
               SYS_HORA,
               CASE CODIGO
                 WHEN '02100110' THEN
                  'CNH_Definitiva'
                 WHEN '02100118' THEN
                  'CNH_Definitiva'
                 WHEN '02100721' THEN
                  'CNH_Definitiva'
                 WHEN '02100107' THEN
                  'CNH_Definitiva'
                 WHEN '02100777' THEN
                  'CNH_Definitiva'
                 WHEN '02100716' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100715' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100717' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100111' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100109' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100505' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100714' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '02100506' THEN
                  'CNH_Mudanca_de_Categoria'
                 WHEN '01110301' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110300' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110303' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01150645' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110302' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110900' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110700' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110701' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110702' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01150646' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01000015' THEN
                  '2a_via_a_ATPVe'
                 WHEN '01000016' THEN
                  '2a_via_a_ATPVe'
                 WHEN '01130200' THEN
                  '2a_via_a_ATPVe'
                 WHEN '03817707' THEN
                  'Cancelamento_de_ATPVe'
                 WHEN '02100719' THEN
                  'CNH_Definitiva'
                 WHEN '02100718' THEN
                  'CNH_Definitiva'
                 WHEN '02100720' THEN
                  'CNH_Definitiva'
                 WHEN '02100420' THEN
                  'CNH_Definitiva'
                 WHEN '02100422' THEN
                  'CNH_Definitiva'
                 WHEN '02100421' THEN
                  'CNH_Definitiva'
                 WHEN '02100423' THEN
                  'CNH_Definitiva'
                 WHEN '02100742' THEN
                  'CNH_Definitiva'
                 WHEN '02100743' THEN
                  'CNH_Definitiva'
                 WHEN '01130100' THEN
                  '2a_via_de_CRLV'
                 WHEN '01201611' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01201620' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110800' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '01110200' THEN
                  'Veiculo_Alteracao_de_Categoria'
                 WHEN '02100502' THEN
                  'Alteracao_de_caracteristica_de_CNH'
                 WHEN '02100503' THEN
                  'Alteracao_de_caracteristica_de_CNH'
                 WHEN '02100504' THEN
                  'Alteracao_de_caracteristica_de_CNH'
                 WHEN '03116600' THEN
                  'PID'
                 WHEN '01100400' THEN
                  'Conversao_placa_mercosul'
                 WHEN '01100202' THEN
                  'Veiculo_Reboque'
                 WHEN '01871018' THEN
                  'Veiculo_Reboque'
                 WHEN '01100205' THEN
                  'Veiculo_Reboque'
                 WHEN '01871032' THEN
                  'Veiculo_Reboque'
                 WHEN '01100100' THEN
                  'Veiculo_Taxa_primeiro_emplacamento'
                 WHEN '01201614' THEN
                  'Veiculo_Taxa_primeiro_emplacamento'
                 WHEN '01100101' THEN
                  'Veiculo_Taxa_primeiro_emplacamento'
                 WHEN '01100203' THEN
                  'Veiculo_Taxa_primeiro_emplacamento'
                 WHEN '01100200' THEN
                  'Veiculo_Taxa_primeiro_emplacamento'
                 WHEN '01100102' THEN
                  'Veiculo_Taxa_primeiro_emplacamento'
                 WHEN '01870500' THEN
                  'Servicos_SNG'
                 WHEN '01870600' THEN
                  'Servicos_SNG'
                 WHEN '01870300' THEN
                  'Servicos_SNG'
                 WHEN '01111004' THEN
                  'Servicos_SNG'
                 WHEN '01111002' THEN
                  'Servicos_SNG'
                 WHEN '01111001' THEN
                  'Servicos_SNG'
                 WHEN '01111003' THEN
                  'Servicos_SNG'
                 WHEN '03107700' THEN
                  'Servicos_SNG'
                 WHEN '01870400' THEN
                  'Servicos_SNG'
                 WHEN '03108200' THEN
                  'Servicos_SNG'
                 WHEN '01111000' THEN
                  'Servicos_SNG'
                 WHEN '01201613' THEN
                  'Transferencia_de_veiculos'
                 WHEN '01120200' THEN
                  'Transferencia_de_veiculos'
                 WHEN '01120800' THEN
                  'Transferencia_de_veiculos'
                 WHEN '01120100' THEN
                  'Transferencia_de_veiculos'
                 WHEN '01120600' THEN
                  'Transferencia_de_veiculos'
                 WHEN '02100309' THEN
                  'Transferencia_de_veiculos'
                 WHEN '02100307' THEN
                  'Transferencia_de_veiculos'
                 WHEN '02100308' THEN
                  'Transferencia_de_veiculos'
                 WHEN '02100311' THEN
                  'Transferencia_de_veiculos'
                 WHEN '02100723' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100729' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100726' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100727' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100730' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100724' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100725' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100731' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100728' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100112' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100113' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100114' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100115' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100116' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '02100117' THEN
                  'CNH_Mudanca_de_categoria'
                 WHEN '01164120' THEN
                  'Vistoria'
                 WHEN '01120420' THEN
                  'Vistoria'
                 WHEN '01141210' THEN
                  'Vistoria'
                 WHEN '01120400' THEN
                  'Vistoria'
                 WHEN '01141400' THEN
                  'Vistoria'
                 WHEN '01141200' THEN
                  'Vistoria'
                 WHEN '01140800' THEN
                  'Vistoria'
                 WHEN '01164100' THEN
                  'Vistoria'
                 WHEN '01150202' THEN
                  'Vistoria'
                 ELSE
                  'ID Diferente'
               END AS CODIGO
          FROM (SELECT *
                  FROM (SELECT TO_CHAR(SYSDATE - INTERVAL '1' HOUR, 'hh24') SYS_HORA,
                               TO_CHAR(SYSDATE, 'MI') SYS_MINUTO,
                               TRUNC(SYSDATE) SYS_DATA,
                               T.SF_SER_DESCRICAO DESCRICAO,
                               TO_DATE(H.SF_HVEI_DATA_EMISSAO, 'yyyymmdd') DATA,
                               SUBSTR(H.SF_HVEI_HORA, 1, 2) HORA,
                               SUBSTR(H.SF_HVEI_HORA, 5, 2) MINUTO,
                               H.SF_HVEI_SER_CODIGO CODIGO
                          FROM SFA1HVEI H
                         INNER JOIN SFA1SER T
                            ON T.SF_SER_CODIGO = H.SF_HVEI_SER_CODIGO
                         WHERE H.SF_HVEI_DATA_EMISSAO BETWEEN '20221208' AND
                               '20250101'
                         ORDER BY DATA, HORA, MINUTO)
                
                 WHERE DATA >= SYS_DATA
                   AND HORA = SYS_HORA
                
                )
         GROUP BY SYS_DATA, SYS_HORA, CODIGO)
