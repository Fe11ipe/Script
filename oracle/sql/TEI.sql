CRU

  SELECT to_char(transf.dt_registro, 'dd/mm/yyyy hh24:MI') DATA,
CASE vend.cpf
WHEN SubStr(vend.cpf,1,11) THEN 'TEI CIDADÃO'
ELSE 'TEI CNPJ'
END as tipo

from veiculo.tb_transferencia_comprador cmp 
inner join veiculo.tb_transferencia transf on transf.cod_comprador = cmp.cod_comprador
inner join veiculo.tb_transferencia_vendedor vend on vend.cod_vendedor = cmp.cod_vendedor

where cod_timeline_vendedor in (120,105)
and transf.dt_registro > sysdate - interval '10' MINUTE


RELATORIO

 select data, hora, codigo, count(*) total
 from (
 SELECT to_char(transf.dt_registro,'dd/mm/yyyy') DATA,
 to_char(transf.dt_registro,'hh24') HORA,
CASE vend.cpf
WHEN SubStr(vend.cpf,1,11) THEN 'TEI CIDADÃO'
ELSE 'TEI CNPJ'
END as codigo

from veiculo.tb_transferencia_comprador cmp 
inner join veiculo.tb_transferencia transf on transf.cod_comprador = cmp.cod_comprador
inner join veiculo.tb_transferencia_vendedor vend on vend.cod_vendedor = cmp.cod_vendedor

where cod_timeline_vendedor in (120,105)
and transf.dt_registro between '01/01/2022' and '25/11/2022'    
   )
   
   group by  data, hora, codigo