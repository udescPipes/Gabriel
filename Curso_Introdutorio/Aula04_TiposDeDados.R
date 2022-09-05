# Tipos de Dados

#Numérico
salario <- 3450.51
salarioArrendado <- round(salario)


hora <- 220

sh <- salario / hora 
shI <- as.integer(sh)  #Conversão de tipo de dado, neste caso, para inteiro
shR <- round(sh) #Realiza arrendondamento do valor (menor que 0.51 - arrendoda para baixo, maior que 0,51 - arredonda para cima)

?as.integer

# ------------------------------------------>> <<------------------------------------------------------------------


# Caractere
nome <- "Gabriel"
sobrenome <- "Siqueira"
idade <- 18

nomeCompleto <- c(nome, sobrenome)

nome == sobrenome #Comparação de strings - totalmente igual
str_length(nome) #Tamanho de uma strings



# ------------------------------------------>> <<------------------------------------------------------------------


# Fatores - categorias de valores; esta função permite fazer o agrupamento de informações iguais, como o group by do Mysql
cargaHoraria <- c(220, 150, 100, 100, 220)
summary(cargaHoraria)

cargaHoraria <- as.factor(cargaHoraria)
summary(cargaHoraria)
mode(cargaHoraria) #Verificar a maneira com que está armazenaada
class(cargaHoraria) #verificar o tipo de dado 

# ------------------------------------------>> <<------------------------------------------------------------------
# Lógicos(TRUE(1) ou FALSE(2))

l1 <- salario > hora
l2 <- salario < hora

