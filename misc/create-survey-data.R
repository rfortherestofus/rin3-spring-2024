library(tidyverse)

survey_data <-
  tibble(
    respondent_id = seq(1, 100, 1),
    location = sample(c("Portland, OR", "Seattle, WA", "Oakland, CA"), 100, replace = TRUE),
    pre_question_1 = sample(1:5, 100, replace = TRUE),
    post_question_1 = sample(1:5, 100, replace = TRUE),
    pre_question_2 = sample(1:5, 100, replace = TRUE),
    post_question_2 = sample(1:5, 100, replace = TRUE),
    satisfaction_question_1 = sample(1:10, 100, replace = TRUE),
    satisfaction_question_3 = sample(1:10, 100, replace = TRUE),
    favorite_parts = sample(c("Videos, Practical Exercises", "Breaks, Snacks", "Instructors"), 100, replace = TRUE)
  )

survey_data |> 
  write_csv("data-raw/survey_data_2021.csv")
