install.packages(c(
  "adnuts", "cowplot", "date", "furrr",
  "ggpubr", "ggrepel", "here", "maps", "maptools", "matrixcalc",
  "r4ss", "rgeos", "rnaturalearth", "rstan", "shinystan",
  "snowfall", "tictoc"))

devtools::install_github("r4ss/r4ss@bioscale")
devtools::install_github("ropensci/rnaturalearthhires")

tinytex::tlmgr_install(c(
  "amsmath", "chngcntr", "ec", "framed", "hyperref", "iftex",
  "infwarerr", "natbib", "ncctools", "pdftexcmds", "psnfss"))

