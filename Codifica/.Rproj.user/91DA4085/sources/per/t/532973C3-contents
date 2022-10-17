#Introdução ao pacote dplyr

# Obter o diretório do projeto
getwd()

#
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Codifica")


if(!require(dplyr)){
  install.packages("dplyr")
}

library(dplyr)


#Base de dado que será utilizado no projeto inicial
dados <- read.csv("LucroFilmes.csv", sep=";", dec = ",")
dados <- read.delim("imdb.txt")





#Obter um resumo estatístico sobre todas as colunas do dataframe
summary(dados)

#Visualizar os dados em forma de tabela (gráfica)
View(dados)

#Verificar o tipo de dado correspondente a variável
class(dados)

#Verificar a maneira que os dados de cada coluna estão configurados
mode(dados)


# Visualizar o tipo de dado de cada coluna do dataframe - Biblioteca dplyr (dependente tidyverse)
glimpse(dados)


# ------------------------------->> Biblioteca DPLYR - Manipulação de dados <<---------------------

# Obter os dados de colunas específicas, de forma padrão

aux <- dados[,c("Filme", "Orcamento", "Genero")]

# ---------------------------->> Select - selecionar colunas específicas da base de dados

#Forma ser utilizar o operador Pipe
aux <- select(dados, c("Filme", "Orcamento"))

#Forma utilizando o operador PIpe (%>%)
aux <- dados %>% select(Filme, Orcamento, Distribuidor)


# ---------------------------->> Arrange - ordenar colunas específicas da base de dados

# Sem utilizar o operador Pipe
aux <- arrange(dados, Orcamento) #ordenar de forma crescente
aux <- arrange(dados, -Orcamento) #Ordenar de forma decrescente
aux <- arrange(dados, desc(Orcamento))

# Utilizando o operador pipe
aux <- dados %>% arrange(Orcamento)

#Ordenar a partir de mais de uma coluna
aux <- dados %>% arrange(desc(LucroMundial))


# ---------------------------->> Filter - filtrar os dados com base numa condição

#Filtrar com apenas uma condição em determinada coluna - 1 distribuidor
aux <- dados %>% filter(Distribuidor == "Universal")

#Filtrar com mais de uma condição em determinada coluna -
aux <- dados %>% filter(Distribuidor %in% c("Universal", "Lionsgate"))

# ---------------------------->> Mutate - alterar ou adicionar nova coluna
dados <- dados %>% mutate(
  lucro = receita - orcamento
)

dados$data_lancamento = as.Date(dados$data_lancamento, format= "%Y-%m-%d")

dados <- dados %>%
  mutate(
    mes = format(data_lancamento, "%m")
  )





# ---------------------------->> Sumarise - resumir dados utilizando métricas (media, mediana)
aux <- dados %>% summarise(
  media_orcamento = mean(Orcamento, na.rm = TRUE)
)

aux <- dados %>%
  filter(producao %in% c("Marvel Studios", "Lucasfilm")) %>%
  select(titulo, producao, ano, lucro) %>%
  arrange(desc(lucro))



tb_lucro_producao <- dados %>%
  group_by(producao) %>%
  summarise(
    media_lucro = mean(lucro, na.rm = TRUE),
    media_receita = mean(receita, na.rm = TRUE),
    media_orcamento = mean(orcamento, na.rm = TRUE),
    media_nota_imdb = mean(nota_imdb, na.rm = TRUE),
    qtd_filmes = n()) %>%
  filter(qtd_filmes > 10)

tb_lucro_diretor <- dados %>%
  group_by(direcao) %>%
  summarise(
    media_receita = mean(receita, na.rm = TRUE),
    qtd_filmes = n()
  )

tb_diretor_produtora <- dados %>%
  group_by(direcao, producao) %>%
  summarise(
    qtd_filmes = n(),
    receita = sum(lucro)
  )


tb_filmes_ano <- dados %>%
  group_by(ano) %>%
  summarise(
    qtd_filmes = n()
  )


tb_filmes_mes <- dados %>%
  group_by(mes, ano) %>%
  summarise(
    qtd_filmes = n()
  )



aux <- tb_diretor_produtora %>%
  filter(producao == "Universal Pictures", qtd_filmes > 5) %>%
  arrange(desc(qtd_filmes))






library(ggplot2)

#Gráfico quantidade de filmes por ano
ggplot(data = tb_filmes_ano) +
  geom_line(aes(x = ano, y = qtd_filmes, color = ano)) +
  labs(title = "Filmes produzidos por ano")



library(plotly)


plot_ly(data = tb_filmes_mes) %>%
  add_lines(x = ~mes, y = ~qtd_filmes)
