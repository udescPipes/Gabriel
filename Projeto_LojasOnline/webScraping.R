library(rvest)
library(RSelenium)
library(dplyr)


#criar um drive, no qual o R terá o controle #Ver se comando para ver porta
rD <- rsDriver(browser = "chrome", port=5050L, chromever = "108.0.5359.71")#Chromever - versão


remDr <- rD[["client"]]   #Remetente d drive - Navegadoor

livros <- c(
  "https://www.amazon.com.br/Futebol-Campo-Adidas-Rihla-Branco/dp/B09GS3CPQ1/ref=lp_17834520011_1_1?ufe=app_do%3Aamzn1.fos.6a09f7ec-d911-4889-ad70-de8dd83c8a74",
  "https://www.amazon.com.br/Polar-90085185-CHAMPAGNE-DOURADO-TAMANHO/dp/B09132462N/ref=lp_17833983011_1_2",
  "https://www.amazon.com.br/New-Era-9TWENTY-Torcedor-Amarelo/dp/B0BMWC9SJ7/ref=sr_1_7?pf_rd_i=17882357011&pf_rd_m=A3RN7G7QC5MWSZ&pf_rd_p=c7a5c263-be3d-4d03-b084-8a4a87c78eba&pf_rd_r=RXS76G60TDGG3QWFSG5Z&pf_rd_s=merchandised-search-3&pf_rd_t=101&qid=1670080792&s=apparel&sr=1-7&ufe=app_do%3Aamzn1.fos.6121c6c4-c969-43ae-92f7-cc248fc6181d"
)

tb_produto <- data.frame()


for(i in 1:length(livros)){
  link <- livros[i]
  
  remDr$navigate(link)
  
  codigo <- read_html(remDr$getPageSource()[[1]])

  
  nome <- codigo %>%
    html_nodes("#productTitle") %>%
    html_text()
  
  categoria <- codigo %>% 
    html_nodes("#wayfinding-breadcrumbs_feature_div") %>%
    html_text()
  
  qtd_avaliacao <- codigo %>%
    html_nodes("#acrCustomerReviewText") %>%
    html_text()
  
  marca <- codigo %>% 
    html_nodes(".po-brand.a-span9.a-size-base") %>%
    html_text()
  
  data_cadastro_plataforma <- codigo %>% 
    html_nodes("#productDetails_detailBullets_sections1 .prodDetAttrValue") %>%
    html_text()
  
  
  dataCadastro <- Sys.Date()
  
  
  
  tb_produto <- rbind(data.frame(nome, categoria, qtd_avaliacao, data_cadastro_plataforma, dataCadastro, link), tb_produto)
  
}





tb_preco <- data.frame()

# Obter os precos do produto
for(item in livros){
  remDr$navigate(item)
  codigo <- read_html(remDr$getPageSource()[[1]])
  
  data <- Sys.Date()
  
  precoAtual <- codigo %>%
    html_nodes()
  
  precoDesconto <- codigo %>% 
    html_nodes("#price") %>%
    html_text()
  
  if(length(precoDesconto) == 0){
    precoDesconto <- 0.0
  }
  
  
  precoAntigo <- codigo %>%
    html_nodes("#listPrice") %>%
    html_text()
  
  if(length(precoAntigo) == 0){
    precoAntigo <- 0.0
  }
  
 tb_preco <- rbind(data.frame(item, data, precoDesconto, precoAntigo), tb_preco)
}
