SELECT JSON_OBJECT('data' VALUE TO_CHAR(SYSDATE - INTERVAL '10' MINUTE,
                           'dd/mm/yyyy HH24:mi'),
                   'codigo' VALUE
                   JSON_OBJECT('BOLETO_LICENCIAMENTO2' VALUE
                               SUM(DECODE(CODIGO,
                                          'BOLETO_LICENCIAMENTO2',
                                          1,0))))
  FROM ( SELECT 
               SYS_DATA,
             CASE CODIGO
                 WHEN 'a' THEN
                  'a'
                                ELSE
                  'BOLETO_LICENCIAMENTO2'
               END AS CODIGO
          FROM (SELECT * FROM 
          ( select 
    TRUNC(SYSDATE) SYS_DATA,
    TO_DATE(a.sf_licc_log_data, 'yyyymmdd') DATA,
   a.sf_licc_log_data codigo
   from SFA1LICC a
  where A.sf_licc_log_data BETWEEN '20221208' AND '20250101'
)WHERE DATA >= SYS_DATA
) 
)