library(tidyverse)

penguins <- read_csv("data-raw/penguins.csv")

penguins_clean <-
  penguins |> 
  select(species, island, sex)

penguins_clean |> 
  write_rds("data/penguins_clean.rds")
