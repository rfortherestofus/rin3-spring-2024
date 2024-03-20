
# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

getwd()

penguins <- read_csv("data-raw/penguins.csv")

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

read_csv("data-raw/penguins_data.csv", 
         na = "-999, -999.0") |> 
  view()
