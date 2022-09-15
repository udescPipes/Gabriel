# Aula 04

#Importação dos dados 
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

if(!require(dplyr)){
  install.packages("psych")
  install.packages("car")
  install.packages("RVAideMemoire")
}else{
  library(psych)
  library(dplyr)
  library(car)
  library(RVAideMemoire)
}

dados <- read.csv2("Banco de Dados 3.csv")
glimpse(dados)
View(dados)

#Teste T; usado para comparar dois grupos que sejam independentes.  
dados$Genero <- factor(dados$Genero)
dados$Posicao_Sala <- factor(dados$Posicao_Sala)
dados$Escola <- factor(dados$Escola)

 Verificar a normalidade 
#1º Verificar a normalidade dos dados - apresenta distribuição normal
 # Shapiro: por grupo (RVAideMemoire)
 # W: valor da hipótese p> 0.05 - distribuição normal
 
 
 
 
  byf.shapiro(Nota_Biol ~ Posicao_Sala, dados) #Variavel dependente - variavel de agrupamento
  byf.shapiro(Nota_Fis ~ Posicao_Sala, dados)
  byf.shapiro(Nota_Hist ~ Posicao_Sala, dados)

  
# 2º Passo, Verificação da homogeneidade de variâncias
  # Teste de Levene (pacote car)
  
    # H0: as variancias dos grupos são homogeneas p > 0,05
    #H1: as variancias dos grupos não são homogeneas p <= 0.05
  
  leveneTest(Nota_Biol ~ Posicao_Sala, dados, center = mean) #Baseado na média - homogenea
  leveneTest(Nota_Fis ~ Posicao_Sala, dados, center = mean) #Baseado na média - não homogenea
  leveneTest(Nota_Hist ~ Posicao_Sala, dados, center = mean) #Baseado na média - nao homogenea

# 3º PAssos - Realização do teste T para amaostras independentes
  
  
  t.test(Nota_Biol ~ Posicao_Sala, dados, var.equal = TRUE) #Variavel dependente ~ grupo, var.equal - se o análise é homogenea
  t.test(Nota_Fis ~ Posicao_Sala, dados, var.equal = FALSE) # Existe diferença
  t.test(Nota_Hist ~ Posicao_Sala, dados, var.equal = FALSE) #Não xiste diferença
  
# 6º passo: visualização da distribuição dos dados
  par(mfrow = c(1,3)) #Estabelece que quero os gráficoa saiam na mesma linha
  boxplot(Nota_Biol ~ Posicao_Sala, dados, ylab = "Nota de Biologia", xlab = "Posição na Sala")
  boxplot(Nota_Fis ~ Posicao_Sala, dados, ylab = "Nota de Física", xlab = "Posição na Sala")
  boxplot(Nota_Hist ~ Posicao_Sala, dados, ylab = "Nota de História", xlab = "Posição na Sala")
  
  