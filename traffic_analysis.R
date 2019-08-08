library(dplyr)
df <- read.csv(file="traffic_clean.csv", header=TRUE, sep=",")
head(df)

c <- df %>% group_by(date) %>% summarise(tot_v = sum(total_volume)) 

cb <- df %>% group_by(latitude) 
c

resp <- list(
  version = unname(desc[1,"Version"]),
  built = unname(desc[1,"Built"])
)

resp <- list(
  version = "Version",
  built = "Built"
)
