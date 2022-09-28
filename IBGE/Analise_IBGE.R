setwd("D:/Gabriel/Meus_Projetos/Dados_IBGE/Censo_2010")

# Importar tabela de variaveisa a ser utilizada
tb_variaveis <- read.csv("tb_variaveis.csv", sep=";", dec=",")

# Limpar as colunas que não serão utilizadas - só valores nulos
tb_variaveis <- limpar_coluna_tb_variavel(tb_variaveis, c("X", "X.1", "X.2", "X.3", "X.4", "DEC", "TIPO"))

#Eliminar as variáveis que não serão utilizadas
tb_variaveis <- desconsiderar_variavel(tb_variaveis, c("V0001"))
tb_variaveis <- selecionar_variavel(tb_variaveis, c("V0002", "V1006 ", "V0620", "V1003"))


#Importar dados das pessoas de SC, segundo Censo de 2010
tb_dado <- read.csv("Pessoas_IBGE.csv")

# Dados de pessoas formatado
tb_pessoa <- recuperar_variavel(tb_dado[1:1000,], tb_variaveis)


#Chamar a função para recuperar uma linha da tabela
info <- recuperar_coluna(tb_variaveis, tb_dado)








