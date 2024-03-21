library(tidyverse)
library(fs)
library(pagedown)

slides_files <-
  dir_ls(regexp = ".html")

html_to_pdf <- function(html_file) {
  pdf_file_name <- str_remove(html_file, ".html")
  
  chrome_print(
    input = html_file,
    output = str_glue("pdf/{pdf_file_name}.pdf"),
    timeout = 180
  )
}

walk(slides_files, html_to_pdf)

html_to_pdf("slides-week-02.html")
