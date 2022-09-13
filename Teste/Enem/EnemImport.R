setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Teste/Enem")
enem <- read.csv("MICRODADOS_ENEM_2021.csv", sep=";", dec = ",")

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}else{
  library(dplyr)
}

glimpse(enem)


#Definição das variáveis categoricas
enem$TP_FAIXA_ETARIA <- factor(enem$TP_FAIXA_ETARIA,
                              labels = C("Menor de 17 anos","17 anos","18 anos","19 anos","20 anos","21 anos","22 anos",
                              "23 anos","24 anos","25 anos","Entre 26 e 30 anos","Entre 31 e 35 anos",
                              "Entre 36 e 40 anos","Entre 41 e 45 anos","Entre 46 e 50 anos","Entre 51 e 55 anos", "Entre 56 e 60 anos",
                              "Entre 61 e 65 anos", "Entre 66 e 70 anos", "Maior de 70 anos"),
                              levels = 0:20
                              
                               
                               )
enem$TP_SEXO <- factor(enem$TP_SEXO)
enem$TP_ESTADO_CIVIL <- factor(enem$TP_ESTADO_CIVIL)
enem$TP_COR_RACA <- factor(enem$TP_COR_RACA)
enem$TP_NACIONALIDADE <- factor(enem$TP_NACIONALIDADE)
enem$TP_ST_CONCLUSAO <- factor(enem$TP_ST_CONCLUSAO)
enem$TP_ANO_CONCLUIU <- factor(enem$TP_ANO_CONCLUIU)
enem$TP_ESCOLA <- factor(enem$TP_ESCOLA)
enem$TP_ENSINO <- factor(enem$TP_ENSINO)
enem$IN_TREINEIRO <- factor(enem$IN_TREINEIRO)

summary

# -------------------------------->> <<-----------------------------------------------------------

library(Rcmdr)

enem[enem$CO_MUNICIPIO_ESC == 4215802, 1:76]


