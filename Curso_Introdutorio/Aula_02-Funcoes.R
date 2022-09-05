# Funções
#Fazem parte de pacotes que contem funções pré-definidas que podem ser utilizadas e executadas
#Caso não seja padrão, será necessário intalar



nome <- "Gabriel"
sobrenome <- "Siqueira"

#Função C: responsável por combinar os valores informados por parâmetro, criando um vetor ou lista
nomeCompleto <- c(nome, sobrenome) #Tipo caractere
valores <- c(10, 20, 30, 40, 50)

#Verificar em determinada posição
a[1]

# help - Descrição do comando com o manual da linguagem
?c

summary(valores) #resumo da variável - numeric(estatistico) e caractere tipo

# ------------------------------>> <<-----------------------------------------------------

#Função de pacote não padrão

#site para verificar as bibliotecas da linguagem: https://www.rdocumentation.org/


?str_c
install.packages("stringr") #Instalação de pacotes
library(stringr) #Chamar o método no script - parecido com o import do python


nome <- "Gabriel"
sobrenome <- "Siqueira"

?str_c
nomeCompleto <- str_c(nome," ",  sobrenome) #Método resposnável por concatenar string
print(nomeCompleto)
