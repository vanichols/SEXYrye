#--manually created a trtkey

library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1


# 1. raw data -------------------------------------------------------------

d1 <-
  read_excel("data-raw/eukey/sexy1_eukey.xlsx", skip = 5) %>% 
  select(trt_id) %>% 
  filter(!is.na(trt_id)) %>% 
  distinct()

# 2. add croptrt_id -------------------------------------------------------

#--make a croptrt_id (a, p, apmix, aprow)

d2 <- 
  d1 %>% 
  mutate(croptrt_id = case_when(
    trt_id == "p" ~ "p",
    trt_id == "xp" ~ "p", 
    trt_id == "pcc" ~ "p", 
    trt_id == "xpcc" ~ "p", 
    
    trt_id == "a" ~ "a",
    trt_id == "xa" ~ "a", 
    trt_id == "acc" ~ "a", 
    trt_id == "xacc" ~ "a", 
    
    trt_id == "aprows" ~ "aprows",
    trt_id == "xaprows" ~ "aprows", 
    trt_id == "apmix" ~ "apmix", 
    trt_id == "xapmix" ~ "apmix", 
  )) 



# 3. make a cctrt_id ------------------------------------------------------

#--make a cctrt_id (nocc, fcc)

d3 <- 
  d2 %>% 
  mutate(cctrt_id = case_when(
    trt_id == "p" ~ "nocc",
    trt_id == "xp" ~ "nocc", 
    trt_id == "pcc" ~ "fcc", 
    trt_id == "xpcc" ~ "fcc", 
    
    trt_id == "a" ~ "nocc",
    trt_id == "xa" ~ "nocc", 
    trt_id == "acc" ~ "fcc", 
    trt_id == "xacc" ~ "fcc", 
    
    trt_id == "aprows" ~ "nocc",
    trt_id == "xaprows" ~ "nocc", 
    trt_id == "apmix" ~ "nocc", 
    trt_id == "xapmix" ~ "nocc", 
    
  ))


# 4. make a crop_cat ------------------------------------------------------

d4 <- 
  d3 %>%  mutate(cropcat = case_when(
    trt_id == "p" ~ "perenn",
    trt_id == "xp" ~ "perenn", 
    trt_id == "pcc" ~ "perenn", 
    trt_id == "xpcc" ~ "perenn", 
    
    trt_id == "a" ~ "ann",
    trt_id == "xa" ~ "ann", 
    trt_id == "acc" ~ "ann", 
    trt_id == "xacc" ~ "ann", 
    
    trt_id == "aprows" ~ "mix",
    trt_id == "xaprows" ~ "mix", 
    trt_id == "apmix" ~ "mix", 
    trt_id == "xapmix" ~ "mix", 
    
  ))


# make data ---------------------------------------------------------------

sexy1_trtkey <- d4

usethis::use_data(sexy1_trtkey, overwrite = TRUE)


# make availabel ------------------------------------------------------

sexy1_trtkey %>% 
  write_csv("inst/extdata/sexy1_trtkey.csv")
