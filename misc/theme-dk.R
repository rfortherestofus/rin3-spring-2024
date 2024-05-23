theme_dk <- function() {
  theme_minimal() +
    theme(
      axis.title = element_blank(),
      axis.text = element_text(
        color = "grey60",
        size = 10
      )
    )
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
