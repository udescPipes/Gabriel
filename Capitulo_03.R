#Declaração de variáveis 
# Método class: responsável por mostrar o tipo da variável

a <- 9
a <- as.integer(a) # conversão de tipo
b <- 8.5
c <- "Gabriel"
d <- TRUE

# Funções: 
valores <- c(9, 8, 7, 6, 10, 6)
crescente <- sort(valores, decreasing = FALSE) #Ordena valores em ordem crescente
decrescente <- sort(valores, decreasing = TRUE) # Ordena valores em ordem decrescente

min(valores) #Mostrar o menor valor do vetor
max(valores) #Mostrar o maior valor do vetor
sum(valores) #Somatório dos valores
prod(valores) #Produto dos valores
length(valores) #Tamanho do vetor
unique(valores) #Valores distintos do vetor (sem repetição)


#DataFrame
# Cada uma das variáveis é um vetor, a coleção formada pelas variáveis são considerados uma lista
# DataFrame consiste na junção dos vetores e listas 

#Criação de Vetor, função C : só permite ter valores da mesma classe(tipo de dado)

vetorNumerico <- c(1:90) # os ':' retorna a sequencia dos números do intervalo
vetorCaractere <- c("Gabriel", "Spok", "Steve", "Kirk") #vetor de caractere
vetorLogico <- c(TRUE, TRUE, FALSE, TRUE)


# Leitura de dados do vetor
vetorNumerico[1] #Acessar uma determinada posição do vetor
vetorNumerico[1:4] #Acessar os valores da posiçãoInicial : posicaoF|inal
vetorNumerico[-3] #Índice negativo representa que o valor em determinada posição não será apresentado
vetorNumerico[c(-3, -8)] #Não mostrar o valor em mais de uma posição
vetorNumerico[-3:-8] #Não mostrar o valor num determinado intervalor

#Pode se utilizar também operadores lógicos para mostrar determinado índice, funciona para dados do tipo numeric e character
vetorNumerico[vetorNumerico > 3]
vetorNumerico[vetorNumerico < 18 | vetorNumerico > 60] #Mostrar intervalor utilizando operadores lógicos e relacionais




