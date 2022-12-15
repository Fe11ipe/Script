CRU

SELECT To_char(a.re_pro_dt_conclusao,'dd/mm/yyyy hh24:MI') data,
       CASE a.re_pro_concluidowhen '2' THEN 'CNH_DEFINITIVA'
              ELSE 'sem cadastro'
       END AS codigofrom refor.re_candidato_processo awhere a.re_tpr_codigo IN ('016',
                                                                                '017',
                                                                                '086',
                                                                                '019',
                                                                                '020',
                                                                                '092',
                                                                                '018',
                                                                                '093',
                                                                                '087',
                                                                                '021')
AND    a.re_pro_dt_conclusao > sysdate - interval '10' minute

RELATORIO

 select data, hora, codigo, count(*) total
 from (
 SELECT to_char(a.re_pro_dt_conclusao,'dd/mm/yyyy') DATA,  
  to_char(a.re_pro_dt_conclusao,'hh24') Hora,    
 CASE a.re_pro_concluido
 WHEN '2' THEN 'CNH_DEFINITIVA'
 ELSE 'sem cadastro'END as codigo
 from refor.re_candidato_processo a
 where a.re_pro_dt_conclusao between '01/01/2022' and '25/11/2022' 
 and   a.re_tpr_codigo in ('016','017','086','019','020','092','018','093','087','021') 
   )
   
   group by  data, hora, codigo