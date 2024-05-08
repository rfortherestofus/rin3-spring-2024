library(tidyverse)

gss_cat |>
  view()

# Write code to count the number of unique responses to the partyid question

gss_cat |>
  separate_longer_delim(cols = partyid,
                        delim = ",") |> 
  select(partyid)

gss_cat |>
  separate_longer_delim(partyid,
                        delim = ",") |>
  count(partyid) |>
  ggplot(aes(partyid,
             n)) +
  geom_col()
