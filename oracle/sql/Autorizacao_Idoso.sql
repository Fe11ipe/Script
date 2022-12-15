CRU

SELECT To_char(a.ve_ves_dt_emissao, 'dd/mm/yyyy HH24:mi') AS data ,
       a.ve_ves_mandato                                   AS codigo
FROM   veiculo.ve_vaga_selo_idoso a
WHERE  a.ve_ves_dt_emissao > sysdate - interval '10' minute 

RELATORIO

SELECT   data,
         hora,
         codigo,
         Count(*) total
FROM     (
                SELECT To_char(a.ve_ves_dt_emissao, 'dd/mm/yyyy') data ,
                       To_char(a.ve_ves_dt_emissao, 'hh24')       hora,
                       CASE a.ve_ves_mandato
                              WHEN 'N' THEN 'SELO IDOSO'
                              ELSE 'sem cadastro'
                       END AS codigo
                FROM   veiculo.ve_vaga_selo_idoso a
                WHERE  a.ve_ves_dt_emissao BETWEEN '01/01/2022' AND    '25/11/2022' )
GROUP BY data,
         hora,
         codigo