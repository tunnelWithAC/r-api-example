library(dplyr)

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}


#* Echo back the input
#* @param msg The message to echo
#* @get /multi
function(msg=""){
  df <- read.csv(file="traffic_clean.csv", header=TRUE, sep=",")
  head(df)
  
  c <- df %>% group_by(date) %>% summarise(tot_v = sum(total_volume)) 
  
  list(
    version = paste0("Version",0),
    built = "Built"[[1]],
    b = unname("Built"),
    ex = df %>% summarise(tot=sum(total_volume))
  )
}


