library(tidyverse)
library(sf)


# Portland ----------------------------------------------------------------

portland_boundaries <-
  read_sf("data-raw/City_Boundaries.geojson")

traffic_signals <-
  read_sf("data-raw/Traffic_Signals.geojson")

snow_and_ice_routes <-
  read_sf("data-raw/Snow_and_Ice_Routes.geojson")


# Tigris ------------------------------------------------------------------

library(tigris)

us_states <- states()
  
# Median Income -----------------------------------------------------------

library(tidycensus)

median_income <-
  get_acs(
    state = "Oregon",
    geography = "county",
    variables = "B19013_001",
    geometry = TRUE,
    year = 2021
  )

median_income |>
  ggplot(aes(fill = estimate)) +
  geom_sf() +
  scale_fill_viridis_c(option = "magma") +
  theme_void()



# International Data ------------------------------------------------------

library(rnaturalearth)

iceland <-
  ne_countries(
    country = "Iceland",
    scale = "large",
    returnclass = "sf"
  )
