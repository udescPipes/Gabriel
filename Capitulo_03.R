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


# ----------------------------------------------------->> <<-------------------------------------------------------------
#Matrizes: corresponde a um vetor dimensional, com 2 camadas. Para sua criação, pode-se utilizar os seguintes parâmetro
#- data: vetor que contém os valores da matriz;
#- nrow: número de linhas da matriz;
#- ncol: número de colunas da matriz;
#- byrow: indica como a matriz é montada. Se for TRUE, ela é montada linha a linha. Se for FALSE, ela é montada coluna a coluna;

matriz <- matrix(1:36, nrow = 6, ncol = 6, byrow=T) #Matriz montada linha pro linha 
matriz2 <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=F) #Matriz montada coluna por coluna, criada por meio de um vetor

matriz3 <- matrix(1:8, ncol=3, byrow = T) #Comando não permitido, pois a qtd de linha é calculada pelo quantdade de valores dividido pelo num colunas
matriz4 <- matrix(nrow=3, ncol=3)

matriz[1,2] #Mostrar eterminadaa posição da matriz [linha, coluna]
dim(matriz4) #Mostrar as dimensões da matriz

#Maneira alternativa de criar matrizes
x <- 1:6
y <- 6:11
rbind(x, y) #Monta uma matriz, empilhando os elementos linha a linha
cbind(x, y) #Monta uma matriz, empilhado os elementos em coluna


#Mostrar elementos
matriz[1, 1] #Apenas um elemento
matriz[1,] #Todos os elementos da linha
matriz[,1] #Todos os elementos da coluna
matriz[-1,] #Mostrar todos os elementos que não estão na linha 1
matriz[,-2] #todos os elementos que não estão na segunda coluna
matriz[1:3,] #Mostrar elementos da primeira à terceira linha
matriz[1:3,1:2] #Mostrar elementos da primeira à terceira linha e que estão na 1 a 2 coluna



# ------------------------------------------------------- >> <<---------------------------------------------------------
# DataFrame
# Utilizados para guardar daados tabulados em R
# São representaados como uma lista especial, no qual cada elemento possui o mesmo tamanho

pacientes <- data.frame(
  id = c(1,2,3,4,5),
  nome = c("João", "Steve", "Peter", "Tony", "Spok"),
  idade = c(25, 90, 19, 56, 67)
)

pacientes
names(pacientes) #Retorna o nome das colunas do dataframe
row.names(pacientes) #Fornece a informaçãao sobre cada linha do dataframe
row.names(pacientes) = c("João", "Steve", "Peter", "Tony", "Spok") #especificar os nomes das colunas

pacientes$nome #Mostrar os elementos de determinada coluna

pacientes[, c(1,2)] #Mostrar os elementos da 1 e 2 coluna
pacientes[1:2, ] #mostrar elementos das duas primeiras linha
pacientes[, c("nome", "id")] #Mostrar com base no nome da coluna
pacientes[c(-1,-2),] #Não mostrar a linha 1 e  2

pacienteResumo <- pacientes[,-1] #criar um subconjunto do dataframe




#--------------------------------------------------------->> <<----------------------------------------------------

