# Aula 04

#Importação dos dados 
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

if(!require(dplyr)){
  install.packages("psych")
}else{
  library(psych)
}

dadosAula4 <- read.csv("BD_Variaveis.csv", sep = ";", dec = ",")
dadosAula4 <- read.csv2("BD_Variaveis.csv")
View(dadosAula3)
glimpse(dadosAula4)

dadosAula4$Grau_de_Instruçao <- factor(dadosAula4$Grau_de_Instruçao,
                                       labels = c("Fundamental", "Medio", "Superior"),
                                       levels = 1:3,
                                       order = T 
)
# -------------------------->> <<-----------------------------------------------
#Tabela de frequência de variáveis categoricas (Genero e Grau de Instrução)

  #Frequência absolutas:
  table(dadosAula4$Genero)
  table(dadosAula4$Grau_de_Instruçao)

  #Tabela cruzada de frequência absolutas
  table(dadosAula4$Genero, dadosAula4$Grau_de_Instruçao)
  
  #Frequência relativa (porcentagem)
  prop.table(table(dadosAula4$Genero))
  
  #Tabela cruzada de frequência relativa
  prop.table(  table(dadosAula4$Genero, dadosAula4$Grau_de_Instruçao))
  
# -------------------------->> <<-----------------------------------------------
#Tabela de frequencia para variaveis quantitativas
  
  #Variaveis descritivas:
  table(dadosAula4$N_Filhos)
  prop.table(table(dadosAula4$N_Filhos))
  
  
  #Variáveis continuas:
  #Necessário criar categorias que correspondem a faixa de valores, pois não é viável cada valor ser uma categoria
  
  
  #Passo 1: analisar a amplitude - maior e menor valor
  range(dadosAula4$Salario)
  
  #Passo 2 (opcional): avaliar a quantidade de categorias adequadas (método Sturges)
  nclass.Sturges(dadosAula4$Salario)
  
  #PAsso 3: criação de tabela com faixas de valores - cut - dividir a variavel em faixa de valores e seq(valorMin, valorMax, l = numero de faixas (1 a mais))
  table(cut(dadosAula4$Salario, seq(0, 6, l = 7))) # Cria faixa de valores 
  

  
  
  summary(dadosAula4$Salario)
  
# ---------------------------->> <<----------------------------------------------------------
  # Forma de obter os valores de medida central e de dispersão, 1º e 2º quartio
  
  #Função describe e describe.by (pacote "psych") - média, desvio, erro, mediana

  describe(dadosAula4$Salario) 
  # Media, desvio padrão, mediana, media aparada, min, max, amplitude, kurtosis
  
  #Mesma função, ams para mais de uma variável
  describeBy(dadosAula4$Salario, group = dadosAula4$Genero)
  
  describeBy(dadosAula4$Salario, group = dadosAula4$Genero:dadosAula4$Grau_de_Instruçao)
  
  
  # Group BY - %>% operador pipe -- Cria-se uma tabela com as informações solicitadas 
  tabela <- dadosAula4 %>% group_by(Genero, Grau_de_Instruçao) %>%
    summarise(
      media = mean(Salario),
      DP = sd(Salario), #Desvio padrão,
      mediana = median(Salario))
  
tabela
  