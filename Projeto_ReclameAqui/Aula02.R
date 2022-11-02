# Função gsub - localiza um texto padrão e o substitui pelo texto

#Substituir qualquer sinal % por vazio
info_basicas$indice_solucao <- gsub("[\\%]", "", info_basicas$indice_solucao)
info_basicas$reclamacoes_respondidas <- gsub("[\\%]", "", info_basicas$reclamacoes_respondidas)
info_basicas$voltariam_negociar <- gsub("[\\%]", "", info_basicas$voltariam_negociar)
info_basicas$nao_respondidas <- parse_number(info_basicas$nao_respondidas)

#Transformar a variável da classe texto em numerica
info_basicas$indice_solucao <- as.numeric(info_basicas$indice_solucao)
info_basicas$reclamacoes_respondidas <- as.numeric(info_basicas$reclamacoes_respondidas)
info_basicas$voltariam_negociar <- as.numeric(info_basicas$voltariam_negociar)
info_basicas$nao_respondidas <- as.numeric(info_basicas$nao_respondidas)
info_basicas$nota <- as.numeric(info_basicas$nota)
info_basicas$nota_consumidor <- as.numeric(info_basicas$nota_consumidor)
info_basicas$avaliadas <- as.integer(info_basicas$avaliadas)

glimpse(info_basicas)



#Precisamos transformar a variavel "tempo_reclamacao" para numerica
#Dificuldade: temos respostas em minutos e outras em horas
#Solução: criei uma função "if else"

#Iremos avaliar cada linha do conjunto tem o tempo 'horas' ou 'hora' para a variável 'tempo_reclamação'

#Caso seja verdadeiro, iremos extrair apenas os numeros e multiplicar por 60. Assim deixamos todos os valores em minutos
# CAso seja falso, ou seja, o tempo esteja medido em minutos, iremos apena extrair os numeros e eliminar os textos
# Resultado armazzenado numa nova coluna, chamada 'minutos'



#Função grepl: procura determinado texto dentro da sequencia

info_reclamacoes$minutos<-
  ifelse(
    grepl(pattern = paste(c("horas","hora"),collapse = "|"), x = info_reclamacoes$tempo_reclamacao),
    #se o valor tiver em horas (ou hora) irá transformar para minutos.
    #busca apenas os números da coluna 'tempo_reclamacao' e multiplica por 60.
    parse_number(info_reclamacoes$tempo_reclamacao)*60, 
    ##### VERIFICAR SE ESTÁ EM MESES, DIA OU MINUTOS
    ifelse(
      grepl(pattern = paste(c("minuto","minutos"),collapse = "|"), x = info_reclamacoes$tempo_reclamacao),
      #busca apenas os números da coluna 'tempo_reclamacao'
      parse_number(info_reclamacoes$tempo_reclamacao),
      ifelse(
        grepl(pattern = paste(c("mês","meses"),collapse = "|"), x = info_reclamacoes$tempo_reclamacao),
        #se o valor tiver em meses (ou mês) irá transformar para minutos.
        #busca apenas os números da coluna 'tempo_reclamacao' e multiplica por 60*24*30.
        parse_number(info_reclamacoes$tempo_reclamacao)*24*60*30,
        #se o valor tiver em dias (ou dia) irá transformar para minutos.
        #busca apenas os números da coluna 'tempo_reclamacao' e multiplica por 60*24.
        parse_number(info_reclamacoes$tempo_reclamacao)*24*60
      )
    )
  )



#Tratamento da parte censurado
info_reclamacoes$titulo_reclamacao <-
  gsub('Editado pelo Reclame Aqui', "editado_RA", info_reclamacoes$titulo_reclamacao)


# Início da análise
if(!require(tidyverse)){
  install.packages("tidyverse")
}
if(!require(ggplot2)){
  install.packages("ggplot2")
}
if(!require(magrittr)){
  install.packages("magrittr")
}

library(tidyverse)
library(ggplot2)
library(magrittr)
 
#Definir o tema do GGPlot
theme_set(theme_classic())


# Indice de solução de problemas por empresa

g <- ggplot(data = info_basicas, aes(x = empresa, y = indice_solucao)) + 
  geom_col(width = 0.5, size = 1, color="darkblue", fill = "white") +
  labs(title="Índice de Solução por empresa") +
  theme(
    axis.text.x = element_text(angle = 65, vjust = 0.6), #Inclinar o texto no eixo x
    plot.title = element_text(hjust = 0.5), #Alinhar o título no centro da tela
    axis.title.x = element_blank(), #Tirar o título do eixo x
    axis.title.y = element_blank() 
  ) 

# Porcentual de reclamações não respondidas
info_basicas$per_nao_respondida = round(info_basicas$nao_respondidas / info_basicas$avaliadas, 3)* 100

g2 <- ggplot(data = info_basicas, aes(x = empresa, y = per_nao_respondida)) +
  geom_bar(width = 0.5, fill = "tomato2", stat = "identity") +
  labs(title="% de reclamações respondidas vs Nota") +
  theme(
    axis.text.x = element_text(angle = 65, vjust = 0.6),
    plot.title = element_text(hjust = 0.5),
    axis.title.x = element_blank(),
    axis.title.y = element_blank()
  ) +
  #Adicionando a nota
  geom_line(aes(x = empresa, y = nota), size = 1.5, color="blue", group = 1 )


info_basicas <- arrange(info_basicas, desc(nota))


#Quantidade de avaliações avaliadas
g3 <- ggplot(data = info_basicas, aes(x = empresa, y = indice_solucao)) +
  geom_bar(stat = "identity", width = 0.5, fill = "tomato2")  +
  labs(title = "Quantidade de reclamações avaliadas") +
  theme(
    axis.text.x = element_text(angle = 65, vjust = 0.6),
    plot.title = element_text(hjust = 0.5),
    axis.title.x = element_blank(),
    axis.title.y = element_blank()
  )

#Notas do consumidor
g4 <- ggplot(dat = info_basicas, aes(empresa, nota_consumidor)) +
  geom_bar(stat = "identity", width = 0.5, fill="tomato2") +
  labs(title = "Nota do consumidor") +
  theme(
    axis.text.x = element_text(angle = 65, vjust = 0.6),
    plot.title = element_text(vjust = 0.5),
    axis.title.x = element_blank(),
    axis.title.y = element_blank()
  )



## Análise do tempo das reclamações
g5 <- ggplot(info_reclamacoes, aes(x = empresa, y = minutos, fill = status_reclamacao)) +
  geom_boxplot() +
  labs(title = "Análise do tempo das reclamações") +
  theme(
    axis.text.x = element_text(angle = 65, vjust = 0.6), 
    axis.title.x = element_blank(), 
    plot.title = element_text(vjust = 0.5))


# ------------------------------->>>> Análise das reclamações - Mineração de texto

if(!require(tm)){
  install.packages("tm")
}
if(!require(wordcloud2)){
  install.packages("wordcloud2")
}

if(!require(tidytext)){
  install.packages("tidytext")
}

library(tm) #Mineração de texto
library(wordcloud2) #Nuvem de palavras
library(tidytext) 

#Criar um id para cada título
info_reclamacoes %<>%
  mutate(
    reclamacao_id = row_number()
  )

#Criar uma linha para cada palavra do titulo (tokenização)
avaliadas_token <- info_reclamacoes %>%
  select(titulo_reclamacao, reclamacao_id) %>%
  unnest_tokens(word, titulo_reclamacao)


#Pegar apenas a raiz da palavra - 
library(corpus)
avaliadas_token$word <- 
  unlist(text_tokens(avaliadas_token$word, stemmer = "pt"))


#Remover stopwords - preposições/pronomes - não interessa 
stop_words_pt <- data.frame(word=(stopwords_pt)) #Biblioteca tm
avaliadas_token <- avaliadas_token %>% 
  anti_join(stop_words_pt) #Juntar tabela, com os conteudos diferentes

#Remover palavras com duas letras
avaliadas_token %<>% 
  filter(sapply(avaliadas_token$word, nchar) > 2)


# Há relação entre as palavras do titulo e a solução da reclamacao

avaliadas_token <- join(avaliadas_token, info_reclamacoes[,c("reclamacao_id", "status_reclamacao")])

analise_palavras <- avaliadas_token %>%
  group_by(word) %>%
  mutate(
    porcentual_solucao = sum(status_reclamacao == " Resolvido") / n(),
    qtd_palavra = n()
  ) %>% 
  select(word, porcentual_solucao, qtd_palavra) %>%
  unique() %>%
  ungroup() #Desagrupar 

analise_palavras %<>% filter(qtd_palavra > 3)


# Existe diferença entre as empresas

empresas_stem <- join(avaliadas_token, info_reclamacoes[, c("reclamacao_id","empresa")])


# Porcentual geral de solução por empresa
analise_empresa <- empresas_stem %>%
  group_by(empresa) %>%
  mutate(
    porcentual_solucao = sum(status_reclamacao == " Resolvido") / n()) %>% 
  select(porcentual_solucao, empresa) %>%
  unique() %>%
  ungroup() #Desagrupar 


analise_palavras_empresa <- empresas_stem %>%
  group_by(word, empresa) %>%
  mutate(
    porcentual_solucao = sum(status_reclamacao == " Resolvido")/n(),
    qtd_palavra = n()) %>%
  unique() %>%
  ungroup()



# Correlação entre palavras 
# Quais as palavras que mais aparecem juntas
library(widyr)
library(igraph)
library(ggraph)


#Função pairwise_cor : fazer a correlação entre os itens passados por parÂmetro, upper: não aparecer duplicado

correlacao <- avaliadas_token %>%
  group_by(word) %>%
  filter(n() > 10) %>%
  pairwise_cor(word, reclamacao_id, sort = TRUE, upper = F) %>%
  ungroup()



#Gráfico de correlação de palavras
correlacao %>%
  arrange(-correlation) %>%
  top_n(10) %>% #Filtrar as 10 maiores
  graph_from_data_frame() %>%
  ggraph(layout = 'fr') + 
  guides(edge_alpha = "none", edge_width = "none") +
  scale_edge_colour_gradientn(limits = c(-1, 1), colors = c("firebrick2", "dodgerblue2")) +
  geom_edge_link(aes(edge_alpha = correlation), show.legend = FALSE) + 
  geom_node_point(color = 'lightblue', size = 5) + 
  geom_node_text(aes(label = name), repel = TRUE) + 
  theme_graph() +
  labs(title = "Palavras que geralmente apareceram juntas")


# Gráfico palavras que mais aparecem
dados_graficos <- 
  avaliadas_token %>% count(word, sort = T) %>%
  top_n(5) %>%
  mutate(word = reorder(word, n)) 


ggplot(dados_graficos, aes(x = word, y = n)) + 
  geom_col() + 
  xlab(NULL) +
  coord_flip() + #Mudar a posição da  barra
  theme_classic() +
  labs(
    x = "",
    y = "Qtd. aparições",
    title = "Palavras que aparecem nas reclamações"
  )
  

#Nuvem de palavras
library(wordcloud2)

wordcloud_dados <- analise_palavras %>%
  select(word, qtd_palavra) %>%
  rename(freq = qtd_palavra) #Padrão da função - obrigatório

wordcloud2(data = wordcloud_dados)


# Análise dos sentimento
library(tidytext)
sentimento <- avaliadas_token %>% 
  inner_join(get_sentiments("afinn")) 

