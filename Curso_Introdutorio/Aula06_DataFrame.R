#DataFrame

#Definir área de trabalho
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Introdutorio")
df <- read.csv("teste.csv")

#Analisando um dataframe
View(df)
str(df)
summary(df)

df[1] <-  factor(df$DIA_SEM)
df2 <- df$UPS
View(df2)

#Modificação no DF
df$ONIBUS <- NULL #Excluir determinada coluna
df$UPS <- as.factor(df$UPS)
N
#Criar coluna no dataFrames
df$MES <- NA #Setar valor padrão
df$MES[1:3] <- c("Agosto", "Setembro", "Outubro")
class(df$MES)

# -------------------------------------------------->> <<---------------------------------------------------

#Acessar, extrair e modificar dados em variáveis

vogais <- c("a", "e", "i", "o", "u")
vogais[-1:-3]
length(vogais)
vogais[3:length(vogais)]

a <- 3
b <- 5
vogais[a:b]

#Filtro de variáveis
vogais[vogais > "e"]
vogais[vogais == "a" | vogais == "i"]
vogais[vogais != "e"]

numeros <- 1:100
numeros[numeros >= 90]
