#--manually created an experimental unit key
#--The plots are double wide, with the north plots for measurements and the south plots for yields
#--Each half got its own experimental unit


library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1


# 1. raw data -------------------------------------------------------------

d1 <-
  read_excel("data-raw/eukey/sexy1_eukey.xlsx", skip = 5) %>% 
  fill(trt_id) %>% 
  mutate(block = paste0("b", block), #--to make sure it is never numeric
         plot_id = paste0(block, "_", plot, "_", plothalf, "_", samptype),
         trial = "Trial1") %>% 
  select(trial, eu_id, plot_id, trt_id)

d1

# make data ---------------------------------------------------------------

sexy1_eukey <- d1

usethis::use_data(sexy1_eukey, overwrite = TRUE)


# store it for user -------------------------------------------------------

sexy1_eukey %>% 
  write_csv("inst/extdata/sexy1_eukey.csv")

# make internal data ------------------------------------------------------

# internal_eukey1 <- sexy1_eukey
# 
# usethis::use_data(internal_eukey1, internal = TRUE, overwrite = TRUE)
