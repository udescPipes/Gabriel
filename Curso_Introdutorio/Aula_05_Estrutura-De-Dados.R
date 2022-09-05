#Vetores

#Pasta na qual esta inserida os arquivos: C:\Users\gerso\Documents\teste

#Função para verificar se a variável é um vector
is.vector(idade) #Numerico
is.vector(nome) #Caracter
is.vector(l1) #Lógico


# ------------------------------------------>> <<------------------------------------------------------------------
#Lista - vetor com tipo de dados diferentes
a <- c(1, 2, "3", 2.5)
is.list(a)
as.numeric(a)
is.vector(a)

b <- list(10, "Teste", 1.2)

c <- list(c(1, 2, 3, 4), "Gabriel", 8.5)
c[[1]][1] #Recuperar na seguinte posição 1 1

# ------------------------------------------>> <<------------------------------------------------------------------
#Matriz - vetor com duas dimensões, apenas um tipo de dados
m <- matrix(1:9, nrow=3) # 1:9 - intervalo de 1 à 9
m[1,3] #Visualizar linha e coluna
mode(m)
m[1,3] <- 19 #Alterar linha e coluna
# ------------------------------------------>> <<------------------------------------------------------------------
#DataFrame - 

#Definir área de trabalho - pasta na qual será armazenado as informações do DataFram
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Introdutorio")


#Importar base de dados
df <- read.csv("teste.csv")

#Analisando o dataFrame
View(df) #MOstrar o dado

str(df) #Nostrar os dados do dataframa

#Mostrar dataframe
col1 <- df[5]
col2 <- df$DIA_SEM #Coluna específica com base no nome

#Excluir coluna do DataFrame
df$AUTO <- NULL


#Alterar o tipo da variavel
df$UPS <- as.factor(df$UPS) #Alterar para factor, para facilitar no agrupamento e identificação da situação

summary(df$UPS)


#Criar nova variável no dataFrame - o tamanho deve ser o mesmo 
df$Nova <- c(1,2,3,4,5,6,7,8,NA) #NA - valor não definido
df$Nova <- NULL
df$nova <- NA #Inicializa com valor padrão
df$nova[1:3] <- c(2, 5, 10)

install.packages("ISwR")
