setwd("D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Projeto_ReclameAqui")

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

if(!require(stringr)){
  install.packages("stringr")
}

#Configurações necessárias
library(plyr)
library(dplyr)
library(rvest)
library(RSelenium)
library(stringr)
library(readr)

# Iniciar um servidor Selenium e o navegador
#Colocar mesma versão do download 

#criar um drive, no qual o R terá o controle #Ver se comando para ver porta
rD <- rsDriver(browser = "chrome", port=4545L, chromever = "106.0.5249.61")#Chromever - versão


remDr <- rD[["client"]]   #Remetente d drive - Navegadoor


linkLojas <- c(
  "https://www.reclameaqui.com.br/empresa/magazine-luiza-loja-online/",
  "https://www.reclameaqui.com.br/empresa/americanas-com-loja-online/",
  "https://www.reclameaqui.com.br/empresa/brastemp-consul/",
  "https://www.reclameaqui.com.br/empresa/casas-bahia-loja-online/",
  "https://www.reclameaqui.com.br/empresa/ifood/",
  "https://www.reclameaqui.com.br/empresa/123-milhas/"
)

info_basicas <- data.frame()


for(linkLoja in linkLojas){
  
  #Acessar a página via navegador
  remDr$navigate(linkLoja)

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
  
  nao_respondidas <- codigo %>%
    html_nodes(".col-sm-6:nth-child(1) b") %>%
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
  

  
  avaliadas <- codigo %>%
    html_nodes(".col-sm-6+ .col-sm-6 b") %>%
    html_text()
  
  tempo_cadastro <- codigo %>%
    html_nodes("#hero p") %>%
    html_text()
  
  teste <- codigo %>%
    html_nodes(".bar-container:nth-child(4) .label") %>%
    html_text()
  
  info_basicas <- rbind(
    data.frame(
      empresa,indice_solucao,  reclamacoes_respondidas ,nao_respondidas, avaliadas, nota, nota_consumidor, voltariam_negociar, 
      tempo_cadastro,linkLoja), info_basicas)
  
}

info_basicas$avaliadas <- as.integer(info_basicas$avaliadas)
info_basicas$nao_respondidas <- as.integer(info_basicas$nao_respondidas)


info_basicas$qtd_reclamacoes = info_basicas$avaliadas + info_basicas$nao_respondidas

############################# COMEÇO DA BUSCA POR RECLAMAÇÔES

info_reclamacoes <- data.frame()

#Adicionar a tabela com o link das reclamacoes
link_reclamaco <- paste0(linkLojas, "lista-reclamacoes/")

for(link_pagina in link_reclamaco){
  
  #Busca das reclamacoes em cada página
  for(pagina in 1:5){
    # Ler as reclamações
    remDr$navigate(paste0(link_pagina,"?pagina=",pagina, "&status=EVALUATED"))
    
    #Ler todo o codigo
    codigo_reclamacoes <- read_html(remDr$getPageSource()[[1]])
    
    empresa <- codigo_reclamacoes %>%
      html_nodes(".short-name") %>%
      html_text()
    
    titulo_reclamacao <- codigo_reclamacoes %>%
      html_nodes(".fTrwHU") %>%
      html_text()
    
    
    status_reclamacao <- codigo_reclamacoes %>%
      html_nodes(".sc-1pe7b5t-4") %>%
      html_text()
    
    tempo_reclamacao <- codigo_reclamacoes %>%
      html_nodes(".hIOzx") %>%
      html_text()
    
    link_reclamaco <- codigo_reclamacoes %>%
      html_nodes(".bJdtis a") %>%
      html_attr("href")
    
    info_reclamacoes <- rbind(
     data.frame(empresa, titulo_reclamacao, status_reclamacao, tempo_reclamacao, link_reclamaco), info_reclamacoes)
    
  }
}

View(info_reclamacoes)

#Criar um id para cada reclamação
info_reclamacoes <- info_reclamacoes %>%
  mutate(
    idReclamacao = row_number()
  )




#Recuperar as Cidade, dt e valores parecidos

lista = list()

info_reclamacoes$link_reclamaco <- paste0("https://www.reclameaqui.com.br", info_reclamacoes$link_reclamaco)


link_reclamacoes <- info_reclamacoes$link_reclamaco




##
for(link_pagina in link_reclamacoes[0:3]){
  
  remDr$navigate(link_pagina)
  
  codigo_pagina <- read_html(remDr$getPageSource()[[1]])
  
  
  
}


writexl


write.csv2(info_reclamacoes, "D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Projeto_ReclameAqui/InfoReclamacoes.csv")
write.csv(info_basica, "D:/Gabriel/Meus_Projetos/GitHub/Gabriel/Projeto_ReclameAqui/InfoBasica.csv")
