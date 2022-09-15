#Teste T Pareado no R - necessita da normalidade de dados
# Compara duas amostras do mesmo individuo, 

#A variável convulsões indica o número de convulsões pro dia de cada paciente em três condições:antes do inicio
#na primeira semana, e na sexta semana. Verifique se há diferrença no número de convulsões antes do tratameno e na 


if(!require(dplyr)){
  install.packages(dplyr)
}
if(!require(psych)){
  install.packages("psych")
}

library(dplyr)
library(psych)


setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

dados4 <- read.csv("BD4.csv", sep=";", dec=",") %>%
  rename(Convulsoes_PT = Convulsões_PT,
         Convulsoes_S1 = Convulsões_S1,
         Convulsoes_S6 = Convulsões_S6,
         Genero = Gênero)#Mudar nome de variáveis (depois = antes)

dados4$Genero <- factor(dados4$Genero)


glimpse(dados4)

#Passo 4: Verificação das normalidades dos dados - diferença deve ter distribuição normal
dados4$DiferencaPTS1 <- dados4$Convulsoes_PT - dados4$Convulsoes_S1

shapiro.test(dados4$DiferencaPTS1) #Hipotese alternativa - não tem normalidade
# Solução
# 1º Continuar o processo - não recomendade
# 2º Transformar os dados, trabalhar com os logaritmos
# 3º Utilizar um teste não parametrico, que não necessita de normalidade

t.test(dados4$Convulsoes_PT, dados4$Convulsoes_S1, paired = TRUE) #Considerar que é um teste pareado -
# Resultado: media de 1 diferença - hipotese nula  


#Visualização dos dados - Não e bom, possui dados fora do intervalo - Escala diferente 
par(mfrow=c(1,2))
boxplot(dados4$Convulsoes_PT, ylab="Quantidade de Convulsões", xlab="Pré-Tratamento")
boxplot(dados4$Convulsoes_S1, ylab="Quandtidade de Convulsões", xlab="Primeira Semana")


#Análise Descritiva dos dados - Quartio
summary(dados4$Convulsoes_PT)
describe(dados4$Convulsoes_PT) #Mostra dados detalhados - pacote psych



# O teste-t pareado mostrou que a média na primeira seman é diferente de convulsões pré-tratamento (t(274) = 3,68, p < 0.001)
# A média de convulsões da primeira semana foi inferior à média da semana pré-tratamento
