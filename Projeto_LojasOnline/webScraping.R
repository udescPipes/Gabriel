library(rvest)
library(RSelenium)
library(dplyr)


#criar um drive, no qual o R terá o controle #Ver se comando para ver porta
rD <- rsDriver(browser = "chrome", port=4545L, chromever = "106.0.5249.61")#Chromever - versão


remDr <- rD[["client"]]   #Remetente d drive - Navegadoor

livros <- c(
  "https://www.amazon.com.br/dp/B096LQS4M4/?coliid=IGYAMRI92BLJ2&colid=3U4VJM2WL02UT&psc=1&ref_=lv_ov_lig_dp_it",
  "https://www.amazon.com.br/planta-ferro-George-Orwell/dp/6589678243/ref=tmm_pap_swatch_0?_encoding=UTF8&coliid=I2DUIGOD2G6UEX&colid=3U4VJM2WL02UT&qid=&sr=",
  "https://www.amazon.com.br/dp/6586064066/?coliid=I1OSRALICEKMDZ&colid=3U4VJM2WL02UT&psc=1&ref_=lv_ov_lig_dp_it",
  "https://www.amazon.com.br/Tubes-Fini-Morango-C%C3%ADtricos-Regaliz/dp/B00LQC8WOW/ref=sr_1_6?keywords=finni&qid=1669052606&qu=eyJxc2MiOiI0LjIxIiwicXNhIjoiNC4xOSIsInFzcCI6IjMuMzIifQ%3D%3D&s=grocery&sprefix=fin%2Cgrocery%2C373&sr=1-6"
)

tb_produto <- data.frame()


for(i in 1:length(livros)){
  link <- livros[i]
  
  remDr$navigate(link)
  
  codigo <- read_html(remDr$getPageSource()[[1]])

  
  nome <- codigo %>%
    html_nodes("#productTitle") %>%
    html_text()
  
  dataCadastro <- Sys.Date()
  
  tb_produto <- rbind(data.frame(nome, dataCadastro, link), tb_produto)
  
}





tb_preco <- data.frame()

# Obter os precos do produto
for(item in livros){
  remDr$navigate(item)
  codigo <- read_html(remDr$getPageSource()[[1]])
  
  data <- Sys.Date()
  
  precoDesconto <- codigo %>% 
    html_nodes("#price") %>%
    html_text()
  
  precoAntigo <- codigo %>%
    html_nodes("#listPrice") %>%
    html_text()
  
 tb_preco <- rbind(data.frame(item, data, precoDesconto, precoAntigo), tb_preco)
}
