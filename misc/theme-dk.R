theme_dk <- function(base_font = "Inter",
                     show_gridlines = TRUE,
                     show_legend = TRUE) {
  
  custom_theme <- 
  theme_minimal(base_family = base_font) +
    theme(
      axis.title = element_blank(),
      axis.text = element_text(
        color = "grey60",
        size = 18
      )
    )
  
  if (show_gridlines == FALSE) {
    custom_theme <- custom_theme +
      theme(
        panel.grid = element_blank()
      )
  }
  
  if (show_legend == FALSE) {
    custom_theme <- custom_theme +
      theme(
        legend.position = "none"
      )
  }
  
  return(custom_theme)
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
  theme_dk(show_gridlines = FALSE,
           show_legend = FALSE)
