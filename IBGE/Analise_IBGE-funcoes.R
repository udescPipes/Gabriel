limpar_coluna_tb_variavel <- function(tb_variavel, coluna){
  #Método responsável por excluir as colunas passadas por parâmetro
  for(item in coluna){
    if(length(tb_variavel[item]) > 0){
      tb_variavel[item] <- NULL
    }
    
  }
  return(tb_variavel)
}


remover_variavel <- function(tb_variavel, listaNegra){
  #Apagar do dataframe as variáveis (inidicadas linhas) passadas por parâmetro na listaNegra
  pos_itens <- obter_posicao_itens(tb_variavel, listaNegra)
  tb_variavel <- tb_variavel[-pos_itens]
  return(tb_variavel)
}

selecionar_variavel <- function(tb_variavel, listaEscolha){
  pos_itens <- obter_posicao_itens(tb_variavel, listaEscolha)
  tb_variavel <- tb_variavel[pos_itens,]
  
  return(tb_variavel)
}

obter_posicao_itens <- function(tb_variavel, lista){
  pos_escolhidos <- c()
  
  for(item in lista){
    pos <- match(item, tb_variavel$VAR) #Mostrar a posição do item
    if(!is.na(pos)){
      tam <- length(pos_escolhidos) + 1
      pos_escolhidos[tam] <- pos    
    }
  }
  return(pos_escolhidos)
}


# ------------------->> TB DADOS <<--------------------------

recuperar_coluna <- function(tb_dado, inicio, fim){
  for(item in tb_dado){
    informacao <- substr(tb_dado, start = inicio, stop = fim)
  }
  return(informacao)
}

recuperar_variavel <- function(tb_dado, tb_variavel){
  i <- 1
  tb_pessoa <- list()
  
  while(i <= nrow(tb_variaveis)){
    
    # Variáveis auxiliares
    inicio <- tb_variaveis$POSICAO_INICIAL[i]
    fim <- tb_variaveis$POSICAO_FINAL[i]
    n_var <- tb_variaveis$VAR[i]
    
    #Obter os dados de determinada coluna, conforme variável contadora
    aux <- recuperar_coluna(tb_dado, inicio, fim)
    
    #Armazenar na lista que contém todas as variáveis
    tb_pessoa[[n_var]] <- aux
    i <- i + 1
  }
  
  #Converter a lista para dataframe
  df <- as.data.frame(tb_pessoa)
  
  return(df)
}
