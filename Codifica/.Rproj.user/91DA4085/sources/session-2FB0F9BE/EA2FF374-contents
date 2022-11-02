setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Projeto_ReclameAqui")

if(!require(shiny)){
  install.packages("shiny")
}


library(shiny)
library(dplyr)
library(wordcloud2)
library(plotly)
library(magrittr)
library(plyr)
library(write)
library(readr)

#Fazer rascunho de como as informações devem aparecer na tela


menu_comparacao <- c(
  "Índice de Solução" = "indice_solucao",
  "Não respondidas" = "nao_respondidas",
  "Qnt. Avaliadas" = "avaliadas",
  "Nota RA" = "nota",
  "Nota do Consumidor" = "nota_consumidor",
  "% que voltariam" = "voltariam_negociar",
  "Qnt. Reclamações" = "qtd_reclamacoes"
)

# Define UI for application

#Definir as propriedades da página 
ui <- navbarPage("WebSerie Reclame Aqui",
                 tabPanel("Início", class = "text-center", imageOutput(outputId = "logo", height = "0px"),
                          h1("Episódio 03"),
                          wordcloud2Output(outputId = "wordcloud2")
                          ),
                 tabPanel("Comparação Geral",
                     column(4,
                            selectInput(inputId = "comparacao_v1",
                                        label = "Quais resultados você quer comparar",
                                        choices = menu_comparacao,
                                        width = "100%"),
                            selectInput(inputId = "comparacao_v2",
                                        label = "Quais resultados você quer comparar",
                                        choices =  menu_comparacao,
                                        selected = menu_comparacao[2],
                                        width = "100%")
                            ),
                     column(8,
                            plotlyOutput(outputId = "comparacao_graf", width = "100%", )
                          )
                          
                          
                ),
                
                tabPanel("Título Vs Solução",
                    column(4,
                           selectInput(inputId = "relacao_empresa",
                                       label = "Qual empresa você deseja analisar",
                                       choice = info_basicas$empresa, 
                                       width = "100%")
                           ),
                    column(8,
                           plotlyOutput(outputId = "relacao_graf_maiores", width = "100%"),
                           plotlyOutput(outputId = "relacao_graf_menores", width = "100%")
                           )
                         
                         
                         
                )
                
                
              )


#Server - local onde será executado toda a lógica da aplicação
server <- function(input, output, session){
  
  #Alimentar as informações do painel 1
  
  #Logo do projeto - necessita ter o mesmo id, definido após o $
  output$logo <- renderImage({
    list(src = "logo.jpg",
         alt = "")
  }, deleteFile = FALSE)
  
  #Adicionar a nuvem de palavra
  output$wordcloud2 <- renderWordcloud2({
    wordcloud2(data = wordcloud_dados) #Dados estáticos
  })
  
  # Cruzamento de variáveis - Comparação entre empresas
  
  output$comparacao_graf <- plotly::renderPlotly(
    {
      ay <- list(
        overlaying = "y", 
        side = "right"
      ) #Eixo y vai sobrepor o x, side: posição legenda
      
      plot_ly(data = info_basicas) %>% 
        add_lines(x = ~empresa, y = ~get(input$comparacao_v1), name = menu_comparacao[menu_comparacao == input$comparacao_v1]) %>% 
        add_lines(x = ~empresa, y = ~get(input$comparacao_v2), name = menu_comparacao[menu_comparacao == input$comparacao_v2], yaxis = "y2") %>%
        layout(
          font = list(color = "black"),
          title = "Comparação entre empresas",
          yaxis = list(title = ""),
          yaxis2 = ay,
          xaxis  = list(title = "", tickangle = 60)
          
        )
      
    }
  )
  
  # Relações entre palavras utilizadas no titulo e a solução da reclamacao
  relacao_dados <- reactive( #Muda as informações a partir da mudença da variavel
    {
      relacao_palavra_empresa <- analise_palavras_empresa %>%
        select(word, porcentual_solucao) %>%
        filter
      
      #Considerando todas as empresas
      relacao_palavra_geral <- analise_palavras %>%
        mutate(empresa = "geral") %>% 
        select(word, porcentual_solucao)
      
      
      #Filtrar pelos MAIORES % de Solução
      relacao_palavra_empresa_maiores <- relacao_palavra_empresa %>% 
        slice_max(n = 5, order_by = porcentual_solucao, with_ties = F)
      
      View(relacao_palavra_empresa_maiores)
      
      #Filtrar pelos MENORES % de Solução
      relacao_palavra_empresa_menores <- relacao_palavra_empresa %>%
        slice_min(order_by = porcentual_solucao, n = 5, with_ties = F)
      
     
      relacao_palavra_geral_maiores <- 
        relacao_palavra_geral[relacao_palavra_geral$word %in% relacao_palavra_empresa_maiores$word, ]
    
      relacao_palavra_geral_menores <- 
        relacao_palavra_geral[relacao_palavra_geral$word %in% relacao_palavra_empresa_menores$word, ]
        
      
      #Resultado final: juntar o resultado geral
      contatenado_maiores <- data.frame(rbind(relacao_palavra_empresa_maiores, relacao_palavra_empresa_maiores))
      contatenado_maiores <- reshape(contatenado_maiores,          
              idvar = "word", timevar="empresa", direction = "wide"
      ) 
      
      #Formad=to dos dados é long e será transformado para wide
      concatendado_menores <- data.frame(rbind(relacao_palavra_empresa_menores, relacao_palavra_geral_menores))
      concatendado_menores <- reshape(concatendado_menores,
              idvar = "word", timevar="empresa", direction = "wide"
      )
      
      #Mudar o nome das colunas
      names(contatenado_maiores) <- c("palavra", "porcentual_loja", "porcentual_geral")
      names(concatendado_menores) <- c("palavra", "porcentual_loja", "porcentual_geral")
      
      # Resultado do output
      list(contatenado_maiores, concatendado_menores)
      
      View(concatendado_menores)
    }
    
  )
  
  #Criação dos gráficos do Tivtulo vs SOlução
  output$relacao_graf_maiores <- plotly::renderPlotly({
    
    #O relacao dados é a lista que tem os mesmo formatado, deve ser identificado como uma função
    plot_ly(data = relacao_dados()[[1]], x = ~palavra, y = ~porcentual_loja, type="bar", name = "% Empresa") %>%
      add_trace(y = ~porcentual_geral, name = "% Geral") %>%
      layout(
        title = "Pontos Fortes da Empresa",
        yaxis = list(title = "% Casos Resolvidos"),
        xaxis = list(title = '', barmode = 'group')
      )
  })
  
  output$relacao_graf_menores <- plotly::renderPlotly({
    
    #O relacao dados é a lista que tem os mesmo formatado, deve ser identificado como uma função
    plot_ly(data = relacao_dados()[[2]], x = ~palavra, y = ~porcentual_loja, type="bar", name = "% Empresa") %>%
      add_trace(y = ~porcentual_geral, name = "% Geral") %>%
      layout(
        title = "Pontos Fracos da Empresa",
        yaxis = list(title = "% Casos Resolvidos"),
        xaxis = list(title = '', barmode = 'group')
      )
  })
  
  
}

#executar a aplicacao
shinyApp(ui = ui, server = server)

#Salvar todos os dados do ambiente
save.image(".RData")

#Recuperar os dados do ambiente
load(".RData")


#Formas de mostrar os dados

# Formato wide (amplo - datos em forma de coluna) e long (longa - dados em forma de coluna)

# 1h20m