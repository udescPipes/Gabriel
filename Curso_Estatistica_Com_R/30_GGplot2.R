#GGPlot2 - Ferramentas básicas


#Carregamento de pacotes
setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Curso_Estatistica_Com_R")

if(!require(dplyr)){
  install.packages("dplyr")
}else{
  library(dplyr)
}
if(!require(ggplot2)){
  install.packages("ggplot2")
}

#todo que for texto, considerar que é uma fator
dados <- read.csv2("LucroFilmes.csv", stringsAsFactors = T)
glimpse(dados)

#Mudar dataLancamento para o formato data
dados$DataLancamento <- as.Date(dados$DataLancamento, format = "%m/%d/%Y")

#Salvar o mês e o ano em colunas separadas
dados <- dados %>% mutate(
  AnoLancamento = format(DataLancamento, "%Y"),
  MesLancamento = format(DataLancamento, "%m")
)

# ------------------------------------>> <<----------------------------------------------------
# Lógica de Camadas do ggplot: 

#As três principais camadas para o gráficos: dados, estético e geom

#Formas de construit o gráfico

    #data, informa o BD; aes(estetica) - O que vai no eixo X e Y;; gem_point(): Apresenta Elemento gráfico, o tipo que será o gráfico, '+' para concatenar script
    ggplot(data = dados, aes(x = LucroLocal, y=LucroMundial)) + 
      geom_point() #Gráfico de disposição
    
    #O aes pode estar na camada ggplot ou no geom
    ggplot(data = dados) + 
      geom_point(aes(x = LucroLocal, y=LucroMundial)) 
    
    ggplot() +
      geom_point(data = dados, aes(x = LucroLocal, y=LucroMundial)) 
    
  #A linha e coluna pode utilizar variáveis diferentes ou até mesmo BD diferentes
    
    
## Histograma (Orçamento de produção) - Fornece apenas o eixo X
    
ggplot(data = dados) +
  geom_histogram(aes(x = Orcamento))
  
#Gráfico de barras - Quantidade de filmes de cada Gênero
ggplot(data = dados) + 
  geom_bar(aes(x = Genero))


## Boxplot (Lucro mundial por Genero)
ggplot(data = dados) +
  geom_boxplot(aes(x = Genero, y = LucroMundial))


#Linhas (quantidade de filmes por ano)
ggplot(data = dados) +
  geom_line(aes(x = AnoLancamento, group = 1), stat = "count") #stat = contar




#Modificando argumentos dentro do geom (color, shape(formato do ponto), size (tamanho do Genero))
  # E a difença entre usá-los dentro ou fora do aes

#Dentor da estetica - se atribui variável
ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, color = Genero)) #Cor dentro do aes, definidaa por variavel, colore cada genero com cor diferente

ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, color = Genero, shape = Genero))#Shape formato do ponto

ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, color = Genero, shape = Genero, size = Orcamento)) #Cada ponto possui um tamanho diferente


#Fora da estetica (aes)
ggplot(data = dados) +
  geom_point(
    aes(x = LucroLocal, y = LucroMundial, shape = Genero),
    color = "darkred"
             )#cores pré definidas no R: https://r-charts.com/colors/


ggplot(data = dados) +
  geom_point(
    aes(x = LucroLocal, y = LucroMundial, shape = Genero),
    color = "#615433"
  )# Código hexadecimal; site: coolors

ggplot(data = dados) +
  geom_point(
    aes(x = LucroLocal, y = LucroMundial, shape = Genero),
    color = "#615433", 
    size = 1
  )# Código hexadecimal; site: coolors

#Size, mudar o tamnho do ponto



#shape por fora, define qual o formato
ggplot(data = dados) +
  geom_point(
    aes(x = LucroLocal, y = LucroMundial, shape = Genero),
    color = "#615433",
    shape = 15
  )# Código hexadecimal; site: coolors
# Site: https://www.datanovia.com/en/blog/ggplot-point-shapes-best-tips/#:~:text=The%20most%20commonly%20used%20pch%20values%20in%20R%2C,8%20shape%20%3D%207%2C%20square%20cross%20Mais%20itens