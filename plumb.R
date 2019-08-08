library(plumber)
library(dplyr)

r <- plumb("api_example1.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)
