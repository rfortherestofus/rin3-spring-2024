library(tidyverse)
library(pointblank)

penguins_data <-
  read_csv("data-raw/penguins.csv")

scan_data(penguins_data)

penguins_scan <- scan_data(penguins_data)

penguins_scan

export_report(
  x = penguins_scan,
  filename = "penguins-scan.html"
)
