setwd("D:/Gabriel/Meus_Projetos/Dados_IBGE/Censo_2010")

tb_variaveis <- read.csv("tb_variaveis.csv", sep=";", dec=",")
tb_dado <- read.csv("Pessoas_IBGE.csv")


#Chamar a função para recuperar uma linha da tabela
info <- recuperar_coluna(tb_variaveis, tb_dado[1:100])

tb_variaveis <- limpar_coluna_tb_variavel(tb_variaveis, c("X", "X.1", "X.2", "X.3", "X.4"))

