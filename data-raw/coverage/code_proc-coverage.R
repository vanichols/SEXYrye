#--Tim took drone images and extracted coverage data
#--He calls the north plots a and south plots b

library(readxl)
library(tidyverse)

eu <- read_csv("data-raw/eukey/sexy1_eukey.csv")

# 1. raw data -------------------------------------------------------------


d1 <-
  read_excel("data-raw/coverage/2025-02-07_tim-drone-coverage.xlsx") %>% 
  janitor::clean_names()


# 2. fix some details -----------------------------------------------------

d1 %>% 
  mutate(p)
  

d2 <- 
  d1 %>% 
  mutate(crop_cat = case_when(
    croptrt_id == "p" ~ "perenn",
    croptrt_id == "xp" ~ "perenn", 
    croptrt_id == "pcc" ~ "perenn", 
    croptrt_id == "xpcc" ~ "perenn", 
    
    croptrt_id == "a" ~ "ann",
    croptrt_id == "xa" ~ "ann", 
    croptrt_id == "acc" ~ "ann", 
    croptrt_id == "xacc" ~ "ann", 
    
    croptrt_id == "aprows" ~ "mix",
    croptrt_id == "xaprows" ~ "mix", 
    croptrt_id == "apmix" ~ "mix", 
    croptrt_id == "xapmix" ~ "mix", 
    
  ))


# write it ----------------------------------------------------------------


sexy1_eukey <- d2
  
  
usethis::use_data(sexy1_eukey, overwrite = TRUE)

sexy1_eukey %>% 
  write_csv("data-raw/eukey/sexy1_eukey.csv")
