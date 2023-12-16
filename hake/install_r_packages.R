# Install R packages for hake assessment docker image

install.packages("remotes")
library(remotes)

install_github("cgrandin/adnuts")
install_github("cgrandin/kableExtra")
install_github("pacific-hake/hakedataUSA")
install_github("pbs-assess/gfdata")
install_github("pbs-assess/gfplot")
install_github("ropensci/rnaturalearth")
install_github("ropensci/rnaturalearthhires")
install_github("r4ss/r4ss@bioscale")
install_github("tylermorganwall/rayshader")

install.packages(c(
  "bookdown", "cli", "clipr", "coda", "cowplot", "crayon", "data.table",
  "dplyr", "fs", "future", "furrr", "gfplot", "GGally", "ggh4x",
  "ggnewscale", "ggplot2", "ggrepel", "glue", "grDevices", "grid",
  "gridExtra", "gtable", "here", "knitr", "lubridate", "marmap",
  "microbenchmark", "minpack.lm", "pacman", "parallelly", "purrr",
  "rayshader", "RColorBrewer", "readr", "rgl", "rlang", "rnaturalearth",
  "scales", "sf", "stringr", "tibble", "tidyselect", "tidyr", "tools",
  "utils", "with"))
