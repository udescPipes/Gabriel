# Codificação de variáveis

#Importação dos dados 
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

if(!require(dplyr)){
  install.packages("dplyr")
}else{
  library(dplyr)
}

# Importação da tabela
dadosAula2 <- read.csv("BD_Variaveis.csv", sep = ";", dec = ",")
summary(dadosAula2)

# Mostrar dados
glimpse(dadosAula2)
View(dadosAula2)
summary(dadosAula2)

#Mostrar coluna especifica, na qual satisfaz as condição
dadosAula2[dadosAula2$Genero == "M",c(1,3,5)]
dadosAula2[dadosAula2$Idade > 35, c(1:5)]

#Ajuste de variáveis para ser do tipo categorico (factor) - 
#labels - Criar um rótulo para identificar a variável - niveis 
#Order: representa que existe ordem entre esta categorias, no levels se define a ordem - tipo de dador ordinal
dadosAula2$Genero <- factor(dadosAula2$Genero)
dadosAula2$Grau_de_Instruçao <- factor(dadosAula2$Grau_de_Instruçao,
                            labels = c("Fundamental", "Medio", "Superior"),
                            levels = 1:3,
                            order = T 
                            )

#Codificação para dados ausentes
#Padrão, colocar nos dados adadosAulusentes os valores -999
dadosAula2[dadosAula2 == -999] <- NA



