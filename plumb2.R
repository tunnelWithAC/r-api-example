library(plumber)
library(RPostgreSQL)


all_cons <- dbListConnections(PostgreSQL())

print(all_cons)

for(con in all_cons)
  +  dbDisconnect(con)

print(paste(length(all_cons), " connections killed."))

source("/usr/src/app/myscripts/mydetails.R")
api <- plumb(project_dir)
api$run(port=8001, host = "0.0.0.0", swagger=TRUE)

