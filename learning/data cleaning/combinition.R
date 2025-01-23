library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)


glimpse(bamudb)
glimpse(phd_all)

head(bamudb$DOB.DAY)

datess <- ymd("2009-01-01")


print(datess)
connect <- '-'

bamudb$DOB <- paste0(bamudb$DOB.YEAR,connect,bamudb$DOB.MONTH,connect,bamudb$DOB.DAY) 

head(bamudb$DOB)
head(bamudb$DOB.DAY)

dates <- ymd(dat)




head(dates)





