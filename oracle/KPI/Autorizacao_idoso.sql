SELECT json_object('data' value to_char(sysdate - interval '10' minute, 'dd/mm/yyyy HH24:mi'), 'codigo' value json_object('SELO_IDOSO' value sum(decode( codigo, 'N', 1, 0))))
FROM   (
              SELECT to_char(a.ve_ves_dt_emissao, 'dd/mm/yyyy HH24:mi') AS hora ,
                     a.ve_ves_mandato                                   AS codigo
              FROM   veiculo.ve_vaga_selo_idoso a
              WHERE  a.ve_ves_dt_emissao > sysdate - interval '10' minute )