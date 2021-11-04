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

dat <- tbl(con, "data")
head(dat)
dat %>%
  count()

dat1 <- dat %>%
  mutate(date = as.Date(datetime)) %>%
  filter(date < "2014-06-01") %>%
  filter(value < 10) %>%
  group_by(channel) %>%
  count()
  
print(dat1)

dat1 %>% show_query()

library(chron)
select_date <- seq(as.Date("2014-01-01"), as.Date("2014-04-01"), by = 1)
select_date <- select_date[is.weekend(select_date)]
select_date

dat2 <- dat %>%
  mutate(date = as.Date(datetime)) %>%
  filter(date %in% select_date) %>%
  count()

print(dat2)

dat2 %>% show_query()
