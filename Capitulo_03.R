#Declaração de variáveis 
# Método class: responsável por mostrar o tipo da variável

a <- 1
a <- as.integer(a) # conversão de tipo
b <- 8.5
c <- "Gabriel"
d <- TRUE


#Conversao de tipo

conve1 <- as.character(a) #Converter para caractere
conve2 <- as.numeric(a) #Converter para numeric
conve3 <- as.logical(a) #Converter para logic
conve4 <- as.integer(b) #Converter para integer

# ------------------------------------------------------------------>> <<------------------------------------------------


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

# ------------------------------------------------------------------>> <<------------------------------------------------


#DataFrame
# Cada uma das variáveis é um vetor, a coleção formada pelas variáveis são considerados uma lista
# DataFrame consiste na junção dos vetores e listas 


# ------------------------------------------------------------------>> <<------------------------------------------------

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



# ------------------------------------------------------------------>> <<------------------------------------------------
# Função seq() - gerar sequencia ex: seq(to, from, by)
#gera uma sequência do valor do argumento from até o valor do argumento to, com salto entre valores consecutivos 
#de acordo com o argumento by.

seq(0, 100, 2) #Valores em ordem crescente
seq(99, 1, -2) #Valores em ordem decresente

# ------------------------------------------------------------------>> <<------------------------------------------------
# Função rep() - gera uma repetição, no qual o primeiro argumento é o valor a ser repetido e o segundo a quantidade de vezes
rep(99, 7)
rep(c(1, 2), 5) #Repetição de um vetor
rep(seq(9, -9, -2), 5) #Repetição de uma sequência
rep(c(1, 2), c(5, 3)) #Representa a quantidade que cada índice do vetor inicial será repetido por cada indice do segundo

# ------------------------------------------------------------------>> <<------------------------------------------------

#Listas: corresponde a conjunto de elementos que não necessitam ser da mesma classe
# Pode conter vetores e outras listas
# Cada elemento e acessado pelo indice dentro de [[]] dois colchetes

list <- list(1, "Gabriel", "Siqueira", "25/11/2003", "M", "SBS", c(9, 8.5, 10), list(1, "Teste"))

#Mostrar determinado elemento
list[[2]]  # Valor simples
list[[7]][1] #Valor de um vetor dentro da lista
list[c(2, 3)] #Extrair múltiplos elementos
list[[8]][[2]] #Extrair elemento alinhado de uam lista


#Listas na qual cada elemento possui um nome
aluno <- list(nome = "Gabriel", sobrenome = "Siqueira", dataNasc = "25/11/2003", sexo = "M", notas = c(9, 8.5, 10))

aluno['nome'] #Acessar determinada posição, por seu nome

names(aluno) #Mostrar os nomes dos índices de uma lista


# ------------------------------------------------------------------>> <<------------------------------------------------
# Fatores: correspondem a variáveis categoricas, Na prática, se numa estrutura tiver varios valores iguais (como sexo), e possível agrupar (M ou F) e mostrar a quantidade de vezes que esta valor aparece
#Os valores possíveis de um objeto do tipo fator são chamados de níveis (levels)

niveis <- factor(c("Bom", "Bom", "Ruim", "Regular", "Péssimo"))
summary(niveis) #Mostrar dados da variável

levels(niveis) <- niveis #Ordenar os valores, em ordem alfabetica
dor <- factor(c("Ruim", "Regular", "Bom"), levels = c("Bom", "Reguvlar", "Ruim")) #Ordenar conforme valores definidos 

# ------------------------------------------------------------------>> <<------------------------------------------------
#Coerção: ao criar um vetor de diversas classes, a linguagem R tenta uma maneira de transformar todos os objetos para a mesma classe.
# Ordem: Logical _> integer -> numeric _> complex -> caracter

exemploCoercao <- c(1, TRUE, 2, FALSE) #Transformou todos os dados para numeric
exemploCoercao


