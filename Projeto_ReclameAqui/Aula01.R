# WebScrating

#----------------------------------------->> <<----------------------------------------------

# Objetivos
# Obter os dados
# Oraginzar e limpara os dados
# Explorar e analisar os dados
# Criar modelos ou análises necesspárias
# Apresentar os dados de forma simples, clara e rica

#----------------------------------------->> <<----------------------------------------------
#Webscraping e como fazer na Linguagem R: extrair dados da Interner usando programação

#Como fazer - biblioteca: rvest ou RSelenium 
# Páginas estáticas: todos os dados são carregados quando lemos o código html. Ex: https://www.tripadvisor.com/
#Páginas dinâmicas> dados gerados via JS (ReclameAqui)
    
#Programas necessários: Biblioteca Rselenium, Selenium web drivers (facilita comunicação da biblioteca com o browser), extensão SelectorGadget


if(!require(RSelenium)){
  install.packages("RSelenium")
}

if(!require(plyr)){
  install.packages("plyr")
}

if(!require(dplyr)){
  install.packages("dplyr")
}

if(!require(rvest)){
  install.packages("rvest")
}

if(!)

#Configurações necessárias
library(plyr)
library(dplyr)
library(rvest)
library(RSelenium)

# Iniciar um servidor Selenium e o navegador
#Colocar mesma versão do download 

#criar um drive, no qual o R terá o controle
rD <- rsDriver(browser = "chrome", port=4545L, chromever = "106.0.5249.61")#Chromever - versão


remDr <- rD[["client"]]   #Remetente d drive - Navegadoor

linkLoja <- "https://www.reclameaqui.com.br/empresa/americanas-com-loja-online/"

#Acessar a página via navegador
remDr$navigate("https://www.reclameaqui.com.br/empresa/americanas-com-loja-online/")

#Ler todo o código html
codigo <- read_html(remDr$getPageSource()[[1]]) #Obs: visualizar a estrutura da página para compreender como os dados estão organizados, via extensão 

#extrair os dados com base na classe ou id, obtido através do navegador e extensão - abrir a extensão e clicar no item que deseja
#caso aparecer mais de um, eliminar os que não deseja
#extrair apenas o nome da empresa

  empresa <- codigo %>%
    html_nodes(".short-name") %>%
    html_text()
  
  nota <- codigo %>%
    html_node(".score b") %>%
    html_text()

  reclamacoes_respondidas <- codigo %>%
    html_nodes(".bar-container:nth-child(2) .label") %>%
    html_text()
  
  voltariam_negociar <- codigo %>%
    html_nodes(".bar-container:nth-child(4) .label") %>%
    html_text()
  
  indice_solucao <- codigo %>%
    html_nodes(".bar-container:nth-child(6) .label") %>%
  html_text()
  
  nota_consumidor <- codigo %>%
    html_nodes(".bar-container:nth-child(8) .label") %>%
    html_text()
  
  nao_respondidas <- codigo %>%
    html_nodes(".col-sm-6:nth-child(1) b") %>%
    html_text()
  
  avaliadas <- codigo %>%
    html_nodes(".col-sm-6+ .col-sm-6 b") %>%
    html_text()
  
  info_basicas <- rbind(
    data.frame(empresa,indice_solucao, nao_respondidas, avaliadas, nota, nota_consumidor, voltariam_negociar, qtd_reclamacoes,
               linkLoja)
  )
