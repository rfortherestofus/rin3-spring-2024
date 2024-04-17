# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("data-raw/penguins.csv")

penguins_bill_length_by_island <- penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))



# Facetting Scales --------------------------------------------------------

penguins |>
  drop_na(flipper_length_mm, body_mass_g) |>
  ggplot(mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )) +
  geom_point() +
  facet_wrap(vars(island))


# Previewing at Exact Dimensions ------------------------------------------

library(camcorder)

gg_record(
  dir = "misc",
  device = "png",
  width = 10,
  height = 6,
  units = "in",
  dpi = 300
)

penguins |>
  drop_na(flipper_length_mm, body_mass_g) |>
  ggplot(mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )) +
  geom_point() +
  facet_wrap(vars(island))
