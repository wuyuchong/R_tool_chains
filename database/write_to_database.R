library(DBI)
library(dplyr)
library(dbplyr)
library(data.table)

con <- DBI::dbConnect(
  RMySQL::MySQL(),
  host = "123.57.9.37",
  user = "presentation",
  password = "showitout",
  dbname = "presentation")

dbWriteTable(con, "mtcars", mtcars[, ], overwrite = TRUE)

dat <- tbl(con, "mtcars")
print(dat)
