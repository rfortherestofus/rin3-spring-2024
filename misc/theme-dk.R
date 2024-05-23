theme_dk <- function(base_font = "Inter") {
  custom_theme <-
    theme_minimal(base_family = base_font) +
    theme(
      axis.title = element_blank(),
      axis.text = element_text(
        color = "grey60",
        size = 10
      )
    )

  custom_theme
}

library(tidyverse)
library(palmerpenguins)

penguins |>
  count(island) |>
  ggplot(
    aes(
      x = island,
      y = n,
      fill = island
    )
  ) +
  geom_col() +
  theme_dk()
