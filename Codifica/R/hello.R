#Obter o diretorio
getwd()

# Adicionar área de trabalho - local onde será armazenado as base de dados
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Codifica")

# -------------------------------- IMPORTACAO DOS DADOS


#Instalar no computador a biblioteca que permite ler diversos tipos de dados
if(!require(readr)){
  install.packages("readr")
}



# Biblioteca que permite manipular os dados de um dataframe (necessita tidyverse)
if(!require(dplyr)){
  install.packages("dplyr")
}

if(!require(tidyverse)){
  install.packages("tidyverse")
}

library(dplyr)
library(tidyverse)


#Importar a biblioteca no projeto
library(readr)


### Importar uma planilha do formato csv (separado por ;)

#Formato padrão, informado quem é o digito decimal (',' no BR, '.' no USA) e separador
dadosCSV <- read.csv("imdb.csv", sep=",")

#Formato de importação no padrão pt-Br
dadosCSV <- read.csv2("imdb.csv")

#Importar um arquivo de texto
dadosTXT <- read.delim("imdb.txt") #Formato padrão, no qual o sep = "\t - tabulação"

# ------------------------------------------------------ Configuração do tipo de dado-------------------------------------

#Obter um resumo estatístico sobre todas as colunas do dataframe
summary(dadosTXT)

#Visualizar os dados em forma de tabela (gráfica)
View(dadosTXT)

#Verificar o tipo de dado correspondente a variável
class(dadosTXT)

#Verificar a maneira que os dados de cada coluna estão configurados
mode(dadosTXT)


# Visualizar o tipo de dado de cada coluna do dataframe - Biblioteca dplyr (dependente tidyverse)
glimpse(dadosTXT)

dadosTXT <- dadosTXT %>%
  mutate(
    data_lancamento = as.Date(data_lancamento, format="%m-%d-%Y")
  )


