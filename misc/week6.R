# Load Packages -----------------------------------------------------------

library(tidyverse)

# Import Data -------------------------------------------------------------

penguins <- read_csv("data-raw/penguins.csv")

# Facetting Scales --------------------------------------------------------


# This is a section label -------------------------------------------------

# lkajdflkaf -----



penguins |>
  drop_na(flipper_length_mm, body_mass_g) |>
  ggplot(mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )) +
  geom_point() +
  scale_y_continuous(limits = c(0, 7000)) +
  facet_wrap(vars(island),
             scales = "free")

ggsave(filename = "outputs/penguins-plot.png",
       width = 5,
       height = 3)


# Previewing at Exact Dimensions ------------------------------------------

library(camcorder)

gg_record(
  dir = "outputs",
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
