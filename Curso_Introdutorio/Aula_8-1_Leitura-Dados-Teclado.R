#Botão source, comandos interativos

nome <- readline("Digite seu nome: ")
sobrenome <- readline("Digite seu sobrenome: ")
idade <- as.integer(readline("Informe sua idade: "))
res <- paste("O aluno", nome, sobrenome, "tem", idade, "anos.")
print(res)