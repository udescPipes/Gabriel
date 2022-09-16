limpar_coluna_tb_variavel <- function(tb_variavel, coluna){
  #Método responsável por excluir as colunas passadas por parâmetro
  for(item in coluna){
    if(length(tb_variavel[item]) > 0){
      tb_variavel[item] <- NULL
    }
    
  }
  return(tb_variavel)
}


recuperar_coluna <- function(tb_variavel, tb_dado){
  for(item in tb_dado){
    informacao <- substr(tb_dado, tb_variavel$POSICAO_INICIAL[1], tb_variavel$POSICAO_FINAL[1])
  }
  return(informacao)

}


