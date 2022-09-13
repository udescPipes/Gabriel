# Teste-T para uma amostra no R
# Correspondem a métodos de hipótese, útil quando é necessário fazer comparação de médias
## Teste de Shapiro-Wilk para uma amostra, Fazezr o teste t para uma amostra: Uni e bicaudal
#Fazer um boxplot para os dados


#Problema: sabendo que a altura média do brasileiro é 1,67 m, verifique se a altura média dos trabalhadores dessa empresa 
# é diferente da média nacional

# ---------------------------------------------------->> Aula Anterior <<----------------------------------------------------
#Importação dos dados 
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

if(!require(dplyr)){
  install.packages("dplyr")
}else{
  library(dplyr)
}

dadosAula3 <- read.csv("BD_Variaveis.csv", sep = ";", dec = ",")
View(dadosAula3)

dadosAula3$Genero <- factor(dadosAula3$Genero)
dadosAula3$Grau_de_Instruçao <- factor(dadosAula3$Grau_de_Instruçao,
                                       labels = c("Fundamental", "Medio", "Superior"),
                                       levels = 1:3,
                                       order = T 
)

# ---------------------------------------------------->> Aula Anterior <<----------------------------------------------------
glimpse(dadosAula3)


# Passo 1: Normalização dos dados - w (valor do teste) - p-value = 


# Hipoteses nula ou alternativa
# Ho <- hipotase nula, na qual a os dados seguem  distribuição normal ---- P > 0,05
#H1 <- hipótese alternativa, na qual os dados não seguem a distribuição normal P <= 0,05
# Neste caso, como o p tem valor 0.214, ele segue a distribuição normal

shapiro.test(dadosAula3$Altura)


# Passo 2: Realização do teste t para uma amostra]
t.test(dadosAula3$Altura, mu = 167) #mu : valor de referência
# 95 percent confidence interval: (164.2572 à 172.6095) Intervaçlo de confidencia

#df - grau de liberdade,  
#t0 (hipotese nula) -> a média da amostra é igual ao valor de referência -- t > 0.05
#t1 (hipotese alternativa) -> a media da amostra é diferente do valor de referência t <= 0.05


  #Observações
    # O teste bicaudal é o default: caso unicaudal, necessário incluir:
      #alternative - "greater" ou alternative = "less"
      # Exemplo: t.test(dadosAula3$Altura, mu=167, alternative = "greater")
        # Neste caso, o teste verifica se a média amostral é maior que a média testada.


  #Resposta:o teste-t para uma amostra mostrou que a média da altura da amostra (168,43 cm) não é diferente da média da altura nacional 
    # (t(29) = 0,702, p = 0,488)

# Passo 5: Visualização da distribuição dos dados

# Gráfico para dados não parametrico
boxplot(dadosAula3$Altura, ylab = "Altura (cm)")
