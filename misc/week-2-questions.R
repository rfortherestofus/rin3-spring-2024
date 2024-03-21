
# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

getwd()

penguins <- read_csv("data-raw/penguins.csv")

penguins |> 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE))

penguins |> 
  count(island)

penguins |> 
  group_by(island, sex) |> 
  summarize(number_of_penguins = n())

torgersen_big_penguins <- penguins |> 
  select(island, body_mass_g) |> 
  filter(island == "Torgersen") |> 
  filter(body_mass_g > 4000)

torgersen_big_penguins |> 
  write_csv("torgersen_big_penguins.csv")

# Tidyverse pipe vs native pipe -------------------------------------------

penguins |> 
  select(body_mass_g)

penguins %>%
  select(body_mass_g)

# Save source, not the workspace ------------------------------------------

big_penguins <-
  penguins |> 
  filter(body_mass_g > 4000)

# Parentheses matter ------------------------------------------------------

penguins |>
  select(-species)

penguins |>
  select(-(bill_length_mm:body_mass_g))
  


read_csv("data-raw/penguins_data.csv", 
         na = c("-999", "-999.0"))

