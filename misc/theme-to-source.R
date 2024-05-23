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