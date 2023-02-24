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

library(dplyr)

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


ggplot(data = dados) + 
  geom_bar(aes(x = Distribuidor))


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

  


#Combinar mais de um elemento geometirco

ggplot(data = dados) + 
  geom_point(aes(x = LucroMundial, y = LucroLocal, shape = Classificacao, color = Genero),   size=1) +
  geom_line(aes(x = LucroMundial, y = LucroLocal), stat = "smooth")

#Caso usarem as mesmas essteticas
ggplot(data = dados, aes(x=LucroLocal, y = LucroMundial)) +
  geom_point(color = "darkred", shape = 16, size = 0.5) +
  geom_line(stat = "smooth", method = "lm") #Stat - cria uma linha de tendência, method - linha linear

#Area sombreada - erro padrão
#geom smooth - cria uma linha de tendência (linear)
ggplot(data = dados, aes(x=LucroLocal, y = LucroMundial)) +
  geom_point(color = "darkred", shape = 16, size = 0.5) +
  geom_smooth(method="lm", se = FALSE, size = 0.5)#Regressão linear, se - tirar sombreado

#Modificando as ordem das camaadas (a ordem importa)
ggplot(data = dados, aes(x= LucroLocal, y = LucroMundial, color = Genero)) +
  geom_smooth(se=F, method = "lm") +
  geom_point(color = "darkblue")


#Estetica para cada geom
ggplot(data = dados, aes(x= LucroLocal, y = LucroMundial)) +
  geom_point(color = "black") +
  geom_smooth(se=F, method = "lm", aes(linetype = Genero, color = Genero)) 
  
#Usando o filtro (dplyr) para selecionar dados para o gráfico
dados %>% filter(Genero == "Comedia") %>%
  ggplot(aes(x = LucroMundial, y = LucroLocal)) +
    geom_point(shape=16 , color = "#619856") +
    geom_smooth(method = "lm", se=F, aes(color = Genero))




dados %>% filter(Orcamento <= 9000000 & Classificacao == "PG") %>%
  ggplot(aes(x = LucroMundial, y = LucroLocal)) +
    geom_point(shape=16 , color = "#619856") +
    geom_smooth(method = "lm", se=F, aes(color = Genero))




  #Usando o geom para representar um "summary"
  ### stat = summary  - o que ponto representa
  
  ggplot(data = dados, aes(x = Genero, y = LucroMundial)) +
    geom_point(stat = "summary", fun = "median") #Unico ponto - media 
  

#Cria uma estatistica de resumo
ggplot(data = dados, aes(x = Genero, y = LucroMundial)) +
  stat_summary(geom = point, fun = "mean")

# Gráfico com barra de erros
ggplot(data = dados, aes(x = Genero, y = LucroMundial)) +
  geom_point(stat = "summary", fun = "mean") + 
  geom_errorbar(stat = "summary", fun.data = "mean_se") #Estabelece min e maximo


# Gráfico com barra de erros
ggplot(data = dados, aes(x = Genero, y = LucroMundial)) +
  geom_point(stat = "summary", fun = "mean") + 
  geom_errorbar(stat = "summary", fun.min = "min", fun.max = "max", width=0.3) #Estabelece min e maximo
 

# ------------------------------------------------>> <<--------------------------------------------
install.packages("ggpubr")


pacman::p_load(ggpubr) #Permite incluir o comando mean_ci - intervalo de confiança

ggplot(data = dados, aes(x = Genero, y = LucroMundial)) +
  geom_point(stat = "summary", fun = "mean") + 
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width=0.3)

    #Desvios padrão      

#incluindo a classificação
dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>%
  ggplot(aes(x = Genero, y = LucroMundial, color = Classificacao)) +
    geom_point(stat = "summary", fun = "mean") + 
    geom_errorbar(stat = "summary", fun.data = "mean_ci", width=0.3)  #mean_ci - intervNalo de confiança
  

##incluindo a classificação - afastando os pontos
dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>%
  ggplot(aes(x = Genero, y = LucroMundial, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(0.4)) + 
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width=0.3, position = position_dodge(0.4))  #mean_ci - intervalo de confiança


## Renomeando os eixos e legendas
dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>%
  ggplot(aes(x = Genero, y = LucroMundial, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(0.4)) + 
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width=0.3, position = position_dodge(0.4)) +
  labs(y = "Lucro Mundial (US$)", x = "Gênero do Filme", color = "Classificação",
       title = "Lucro Mundial em U$S de acordo com o gênero e a classificação do filme",
       subtitle = "Dados representados com média e Intervalo de Confiança - 95%",
       caption = "Fonte: FiveThirtyEight"
       )
