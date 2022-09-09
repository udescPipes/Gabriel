a <- 9

if (a == 5){
  6 + 6
}else if(a == 6){
  a ^ 5
}else{
  print("Erro")
}

df_Pessoa <- data.frame(
  id = c(1, 2, 3, 4),
  nome = c("GAbriel", "Diego", "Gerson", "patricia"),
  idade = c(18, 15, 52, 41)
)

if(df_Pessoa$idade[df_Pessoa$nome == "Gerson"] > 60){
  print("Metade de uma década")
}else{
  print("Ainda é jovem")
}

for(nome, id in df_Pessoa, df_Pessoa$id){
  print(nome[1])
}

