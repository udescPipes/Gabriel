#Instalação de pacote
install.packages("dplyr")

# Instalar pacote, somente se o mesmo não esta instalado ainda
if(!require(car)){
  install.packages(car)
  print("Instalado")
}else{
  print("Ja tenho")
}

#Carregamento de pacote, parecido com o comando 'import' do python
library(dplyr)
require(car)

#Estabelecer diretório de trabalho
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R/")

#CAregar banco de dados - sep(separador ";") - digito de decimal (,)
dados <- read.csv("BD2.csv", sep = ";", dec = ",")

# Mostrar dados do DataFrame
View(dados)
summary(dados) #Mostrar resumo esatistico dos dados
glimpse(dados) #Mostrar detalhes da Informação

# Modificar o tipo de dado, deixar como coluna categorica (factor)
dados$Genero <- factor(dados$Genero)
dados$Grau_de_Instru.ao <- factor(dados$Grau_de_Instru.ao)
