setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

dado <- read.csv("Emigracao.csv", sep=";")

#Separar as informações da primeira coluna 
dividir <- function(dados, inicio, fim){
  for(info in dado){
    informacoes <-  substr(info, inicio, fim)
  }
  
  return(informacoes)
}




dadoFormatado <- data.frame(
  v0001 = dividir(dado,1,2),
  v0002 = dividir(dado,3,7),
  v0011 = dividir(dado, 8,20),
  v0300 = dividir(dado,21,28),
  v0010 = dividir(dado,29,44),
  v1001 = dividir(dado, 45,45),
  v1002 = dividir(dado, 46,47),
  v1003 = dividir(dado, 48,50),
  v1004 = dividir(dado, 51,52),
  v1006 = dividir(dado, 53,53),
  v1303 = dividir(dado, 54,54),
  v0304 = dividir(dado, 55, 58),
  v0305 = dividir(dado, 59,62),
  v3061 = dividir(dado,63,69),
  m0303 = dividir(dado, 70,70),
  m0304 = dividir(dado,71,71),
  m0305 = dividir(dado, 72, 72),
  m3061 = dividir(dado, 73,73),
  v1005 = dividir(dado, 74,74)
)


dadoFormatado$v0001 <- factor(dadoFormatado$v0001)
dadoFormatado$v0002 <- factor(dadoFormatado$v0002)
          
summary(dadoFormatado)
qtd <-dadoFormatado[dadoFormatado$v0002 == "19002", 2:3]
