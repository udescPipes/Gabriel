library(rvest)
library(RSelenium)
library(writexl)

#criar um drive, no qual o R terá o controle #Ver se comando para ver porta
rD <- rsDriver(browser = "chrome", port=5050L, chromever = "108.0.5359.71")#Chromever - versão


remDr <- rD[["client"]]   #Remetente d drive - Navegadoor


#Web Scraping PontoFrio

listaProdutos <- c(
  "https://www.casasbahia.com.br/tv-video/televisores/TV4K/tela-55-uhd-4k-qled-toshiba-55tb001-com-processador-quad-core-espelhamento-de-tela-alexa-e-hdr10-55030167.html?idlojista=10037",
  "https://www.casasbahia.com.br/tv-video/televisores/TV4K/smart-tv-qled-55-4k-tcl-google-tv-55c725-uhd-dolby-vision-atmos-hdr10-dual-band-comando-de-voz-a-distancia-google-assistant-e-design-sem-bordas-55045685.html?IdSku=55045685"
)


tb_produto <- data.frame()

for(i in length(listaProdutos)){
  
  link <- listaProdutos[i]
  
  #Redirecionar o navegador para a página especifica
  remDr$navigate(link)
  
  #Armazenar todo o codigo HTml na variável que será utilizada
  codigo <- read_html(remDr$getPageSource()[[1]])
  
  #Dados necessários (idProduto, nome, preco, qtdAvaliacoes, nota, categorias)
  
  idProduto <- length(listaProdutos) + 1 
  
  nome <- codigo %>%
    html_nodes(".css-k7ata1") %>%
    html_text()
  
  preco <- codigo %>% 
    html_nodes("#product-price") %>%
    html_text()
  
  categoria <- codigo %>%
    html_nodes("#breadcrumb a") %>%
    html_text()
  
  qtdAvaliacoes <- codigo %>%
    html_nodes("figcaption") %>%
    html_text()
  
  nota <- codigo %>%
    html_nodes(".rating") %>%
    html_text()
  
  
  
  
  
  
  
  
  
  
}
