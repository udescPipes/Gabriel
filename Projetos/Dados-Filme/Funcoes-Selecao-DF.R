setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Projetos/Dados-Filme")

if(!require(stringr)){
  install.packages("stringr")
}
library(stringr)



tb_var <- read.csv2("tb_variaveis.csv")
tb_var$Distribuidor <- factor(tb_var$Distribuidor)





obter_linhas_analise <- function(dados){
  item <- c()
  for(i in 1:nrow(dados)){
    if(toupper(dados[i,]$Genero) == toupper("Acao")){
      duracao <- data - dados[i, ]$DataLancamento 
      if(duracao < 2000){
        pos <- length(item) + 1
        item[pos] <- i
      }
    }
  }
  return(item)
}


##--------------------------------->> <<----------------------------------------
# Possui a mesma função do anterior, porem utiliza uma tabela para comparação dos dados



for(j in 1:nrow(tb_var)){
  for(i in 1:nrow(dados)){
    if(tb_var[j,]$Genero == dados[i,]$Genero){
      pos <- length(item) + 1
      duracao <- data - dados[i, ]$DataLancamento 
      
      if(is.na(tb_var[j,]$Duracao)){
        item[pos] <- i
      }else if(duracao < tb_var[j,]$Duracao){
        item[pos] <- i
      }
    }
  }
}

