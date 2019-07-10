rm(list=ls())

# package
library(RPostgreSQL)
library(dplyr)
library(ggplot2)
library(lubridate)
library(dbplyr)
library(jsonlite)
library(plotly)
library(httr)
library(listviewer)
library(gtools)
library(stringr)
library(plumber)



source("/usr/src/app/myscripts/mydetails.R")
setwd(working_dir)
# setwd("/usr/src/app/myscripts/")
source("api/common.R")


#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*") # Or whatever
  plumber::forward()
}

#* @filter checkAuth
checkAuth <- function(req, res){
  print(req$QUERY_STRING)
  if (grepl('token', req$QUERY_STRING)){
    plumber::forward()
  } else {
    res$status <- 401 # Unauthorized
    return(list(error="Authentication required"))
  }
}

make_server <- function() {
  pr <- plumber$new()
  common <- plumber$new("./api/common.R")
  faninsights <- plumber$new("./api/faninsights.R")
  matchattendance <- plumber$new("./api/matchattendance.R")
  seasonattendance <- plumber$new("./api/seasonattendance.R")
  matchrevenue <- plumber$new("./api/matchrevenue.R")
  dashboard <- plumber$new("./api/dashboard.R")
  ticketinsights <- plumber$new("./api/ticketinsights.R")
  seasonticketholderinsights <- plumber$new("./api/seasonticketholderinsights.R")
  singularfaninsights <- plumber$new("./api/singularfaninsights.R")

  pr$mount("/api/common", common)
  pr$mount("/api/dashboard", dashboard)
  pr$mount("/api/faninsights", faninsights)
  pr$mount("/api/matchattendanceinsights", matchattendance)
  pr$mount("/api/seasonattendanceinsights", seasonattendance)
  pr$mount("/api/matchrevenue", matchrevenue)
  pr$mount("/api/ticketinsights", ticketinsights)
  pr$mount("/api/seasonticketholderinsights", seasonticketholderinsights)
  pr$mount("/api/singularfaninsights", singularfaninsights)

  pr
}

server <- make_server()
names(server$swaggerFile()$paths)
print(names(server$swaggerFile()$swagger))
server$run(port=8001, host = "0.0.0.0", swagger=TRUE)

