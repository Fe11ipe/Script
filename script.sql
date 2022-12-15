 select         
         a.ve_log_transacao as codigo
  from veiculo.VE_LOG_TRANSACOES a
       where a.ve_log_cod_retorno   = '000'
   and a.ve_log_transacao in (201,202,203,204,233,263,227,237,250,253,230)   
and a.ve_log_data > sysdate - interval '10' MINUTE
