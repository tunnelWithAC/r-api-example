library(plumber)
library(dplyr)

r <- plumb("api_example1.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)

# 
# library(dplyr)
# df <- read.csv(file="SalesJan2009.csv", header=TRUE, sep=",")
# df2 <- read.csv(file="traffic_clean.csv", header=TRUE, sep=",")
# head(df)
# mean(df$Price)
# df$Price
# mean(df$Price)
# typeof(df$Price)
# 
# unique(is.na(df$Price))
# 
# df %>% filter(price > 2000)
# df$price <- as.numeric(df$Price)
# 
# df$price2 <-as.numeric(as.character(df$Price)) * 5
# df$price3 <-as.character(df$Price)
# df$price4 <-as.numeric(df$Price)
# 
# 
# df %>% select(State, Country)
# 
# typeof(df$Price)
# 
# unique(df$price2)
# unique(df$price3)
# unique(df$Price)
