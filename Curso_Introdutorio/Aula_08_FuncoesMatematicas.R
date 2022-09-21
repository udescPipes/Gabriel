# Funções Matemáticas

x <- 10

sqrt(x) #Raiz quadrada
factorial(x) #Cálculo do fatorial

y <- -6
abs(y) #Valor absoluto sem o sinal
log(x) #Calcular o logaritmo na base 10
log(x, base=2) #Calcular na base 2

z <- log(x, base=2)
round(z, digits = 2) #Função de arredondamento, somente para casa decimais
signif(z, digits = 2) # Mostra com dois digitos, no total, considera os valores inteiros
floor(z) #Arredondar para o inteiro inferior mais próximo- para baixo - visualizacao
ceiling(z) #Arredondar para cima
trunc(z) #Elimina a parte decimal
'^'(x, 2) #Exponenciação 



# ----------------------------------------------------------------------------------------------------------
val <- as.integer(readline(prompt = "Informe um valor inteiro: ")) #Leitura de dados do teclado
typeof(val)

nome <- "Gabriel"
sobrenome <- "Siqueira"
nomeCompleto <- paste(nome, sobrenome, sep=" ") #Concaternar strings

print(nomeCompleto)
?paste #  Função para concaternar strings
