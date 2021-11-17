install.packages(c("devtools", "remotes", "TMB"))

# Make sure INLA download doesn't time out
options(timeout = 500)
# INLA install command from https://github.com/pbs-assess/gfplot
install.packages("INLA", repos = c(getOption("repos"), INLA = "https://inla.r-inla-download.org/R/stable"), dep = TRUE)
