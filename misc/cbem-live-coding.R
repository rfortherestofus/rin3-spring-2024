#  Recreating this: https://show.rfor.us/cditiy

# Load Packages -----------------------------------------------------------

library(tidyverse)
library(scales)
library(ggchicklet)
library(patchwork)

# Import Data ------------------------------------------------------------

cbem <- read_csv("data-raw/cbem.csv")

cbem_plot <- function(location_to_filter,
                      age_group_to_filter) {

state_average <-
  cbem |>
  filter(location == location_to_filter) |>
  filter(age_group == age_group_to_filter) |>
  filter(group == "All Persons") |> 
  pull(percent)

state_average_label <-
  str_glue("CBEM State Rate\n{percent(state_average, accuracy = 0.1)}")

cbem |>
  filter(location == location_to_filter) |>
  filter(age_group == age_group_to_filter) |>
  filter(group != "All Persons") |>
  mutate(group = fct(
    group,
    levels = c(
      "American Indian or Alaska Native",
      "Asian or Pacific Islander",
      "Black or African American",
      "White",
      "Hispanic or Latino"
    )
  )) |>
  mutate(x_position = row_number()) |>
  mutate(x_position = case_when(
    group == "Hispanic or Latino" ~ 5.5,
    .default = x_position
  )) |>
  mutate(percent_formatted = percent(percent)) |> 
  ggplot(
    aes(
      x = x_position,
      y = percent,
      fill = group,
      label = percent_formatted
    )
  ) +
  geom_hline(
    yintercept = state_average,
    color = "grey70",
    linetype = "dashed"
  ) +
  annotate(
    geom = "text",
    x = 5.5,
    y = state_average,
    label = state_average_label,
    vjust = -0.5,
    color = "grey70"
  ) +
  geom_chicklet() +
  geom_text(
    vjust = 1.5,
    color = "white"
  ) +
  scale_fill_manual(
    values = c(
      "American Indian or Alaska Native" = "#9CC892",
      "Asian or Pacific Islander" = "#0066cc",
      "Black or African American" = "#477A3E",
      "White" = "#6CC5E9",
      "Hispanic or Latino" = "#ff7400"
    )
  ) +
  theme_void() +
  theme(legend.position = "none")
}

cbem_plot(location_to_filter = "Oregon",
          age_group_to_filter = "Under 18") +
cbem_plot(location_to_filter = "Oregon",
          age_group_to_filter = "Under 25")


