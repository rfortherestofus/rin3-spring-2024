# Load Packages -----------------------------------------------------------

library(tidyverse)
library(gapminder)


# Import Data -------------------------------------------------------------

penguins <- read_csv("data-raw/penguins.csv")

penguins_bill_length_by_island <- penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

data("gapminder")


# Dropping Points in Scatterplots ----------------------------------------

penguins |>
  drop_na(flipper_length_mm, body_mass_g) |>
  ggplot(mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g,
    color = island
  )) +
  geom_point() +
  scale_color_manual(
    values = c(
      "Biscoe" = "grey90",
      "Dream" = "grey90",
      "Torgersen" = "red"
    )
  ) +
  theme_minimal()

ggplot(
  data = penguins,
  mapping = aes(
    x = flipper_length_mm,
    y = body_mass_g
  )
) +
  geom_point() +
  scale_x_continuous(
    limits = c(170, 220)
  )

# Bar Chart Width ---------------------------------------------------------

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col(width = 0.5) +
  theme_minimal()

# Center Text in Bar Chart ------------------------------------------------

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = 1,
    y = mean_bill_length,
    label = mean_bill_length,
    fill = island
  )
) +
  geom_col() +
  geom_text(position = position_stack(vjust = 0.5)) +
  coord_flip() +
  theme_minimal()


# Reordering Bar Charts ---------------------------------------------------

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = reorder(island, mean_bill_length),
    y = mean_bill_length
  )
) +
  geom_col()

penguins_bill_length_by_island |>
  mutate(island = fct_reorder(island, mean_bill_length)) |>
  ggplot(
    aes(
      x = island,
      y = mean_bill_length
    )
  ) +
  geom_col()


# Wrapping Long Text ------------------------------------------------------

ggplot(
  data = gapminder,
  aes(
    x = year,
    y = lifeExp,
    group = country
  )
) +
  geom_line() +
  facet_wrap(vars(country))

gapminder_wrapped <-
  gapminder |>
  mutate(country_wrapped = str_wrap(country, width = 10))

ggplot(
  data = gapminder_wrapped,
  aes(
    x = year,
    y = lifeExp
  )
) +
  geom_line() +
  facet_wrap(vars(country_wrapped))


# Adjust Axis Text Labels -------------------------------------------------

penguins_bill_length_by_island

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col() +
  scale_x_discrete(
    labels = c("Island 1", "Island 2", "Island 3")
  ) +
  theme_minimal()


# Adjusting Legends -------------------------------------------------------

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length,
    color = island
  )
) +
  geom_col(show.legend = FALSE) +
  geom_text() +
  theme_minimal()
