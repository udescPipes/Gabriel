install.packages("palmerpenguins")
install.packages("here")
N

# PAcotes a serem utilizados
library(tidyverse)
library(here)
library(ggplot2)
library(purrr)
library(tibble)
library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(forcats)
library(palmerpenguins)
library(lubridate)

# Dados
penguins <- palmerpenguins::penguins
penguins_raw <- palmerpenguins::penguins_raw

summary(penguins)

sum(1:100) %>% sqrt


penguins %>% unite(species, island,sep="_")

