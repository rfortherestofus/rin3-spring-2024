library(tidyverse)
library(palmerpenguins)
library(nflplotR)

penguins_bill_length_by_island <- penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

ggplot(data = penguins_bill_length_by_island,
       aes(x = island,
           y = mean_bill_length,
           label = island)) +
  geom_col() +
  geom_text(vjust = -1)

ggsave(filename = "misc/penguins-plot.png",
       width = 5,
       height = 7)

# https://search.r-project.org/CRAN/refmans/nflplotR/html/ggpreview.html

ggpreview(width = 5,
          height = 7,
          units = "in")
