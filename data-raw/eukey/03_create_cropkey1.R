#--manually created a cropkey

library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1


# 1. raw data -------------------------------------------------------------

d1 <- 
  read_csv("inst/extdata/sexy1_trtkey.csv") %>% 
  rename(crop_id = croptrt_id) %>% 
  select(crop_id) %>% 
  filter(crop_id %in% c("a", "p")) %>% 
  distinct()



# 2. what is it -----------------------------------------------------------

d2 <- 
  d1 %>% 
  mutate(cropdesc = case_when(
    crop_id == "p" ~ "Perennial cereal rye population from Germany",
    crop_id == "a" ~ "Annual cereal rye (variety?) population",
    TRUE ~ "XX"
  ))

# 3. tkw-----------------------------------------------------------

d3 <- 
  d2 %>% 
  mutate(tkw_g = case_when(
    crop_id == "p" ~ "27",
    crop_id == "a" ~ "42",
    TRUE ~ "XX"
  ))


# 4. germination -----------------------------------------------------------

d4 <- 
  d3 %>% 
  mutate(germination_pct = case_when(
    crop_id == "p" ~ "86",
    crop_id == "a" ~ "95",
    TRUE ~ "XX"
  ))


# 5. ergot infection -----------------------------------------------------------

d5 <- 
  d4 %>% 
  mutate(ergot_pct = case_when(
    crop_id == "p" ~ "2",
    crop_id == "a" ~ NA,
    TRUE ~ "XX"
  ))


d5

# make data ---------------------------------------------------------------

sexy1_cropkey <- d5

usethis::use_data(sexy1_cropkey, overwrite = TRUE)



# make available to user --------------------------------------------------

sexy1_cropkey %>% 
  write_csv("inst/extdata/sexy1_cropkey.csv")
  

