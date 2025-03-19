#--manually created a croptrtkey

library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1


# 1. raw data -------------------------------------------------------------

d1 <- 
 read_csv("inst/extdata/sexy1_trtkey.csv") %>% 
  select(croptrt_id) %>% 
  distinct()


# 2. what is it -----------------------------------------------------------

d2 <- 
  d1 %>% 
  mutate(croptrtdesc = case_when(
    croptrt_id == "p" ~ "Perennial cereal rye population from Germany",
    croptrt_id == "a" ~ "Annual cereal rye (variety?) population",
    croptrt_id == "aprows" ~ "Annual cereal rye and perennial cereal rye planted in alternating rows",
    croptrt_id == "apmix" ~ "Annual cereal rye and perennial cereal rye planted mixed and planted in rows",
    TRUE ~ "XX"
  ))

# 3. planting rate -----------------------------------------------------------

d3 <- 
  d2 %>% 
  mutate(plantingrate_kgha = case_when(
    croptrt_id == "p" ~ "94",
    croptrt_id == "a" ~ "132",
    croptrt_id == "aprows" ~ "113",
    croptrt_id == "apmix" ~ "113",
    TRUE ~ "XX"
  ))


# 4. planting desc --------------------------------------------------------

d4 <- 
  d3 %>% 
  mutate(planting_desc = case_when(
    croptrt_id == "p" ~ "Aimed for 300 pl m-2 (1 kg perennial rye contains more seeds than 1 kg annual rye)",
    croptrt_id == "a" ~ "Aimed for 300 pl m-2",
    croptrt_id == "aprows" ~ "Aimed for 300 pl m-2, 1.4 kg perennial rye for every 1 kg annual rye",
    croptrt_id == "apmix" ~ "Aimed for 300 pl m-2, 1.4 kg perennial rye for every 1 kg annual rye",
    TRUE ~ "XX"
  ))


# 5. row widths -----------------------------------------------------------

d5 <- 
  d4 %>% 
  mutate(rowspacing_cm = 12.5)


# 6. planting depth -----------------------------------------------------------

d6 <- 
  d5 %>% 
  mutate(plantingdepth_cm = 3)


# make data ---------------------------------------------------------------

sexy1_croptrtkey <- d6 %>% arrange(croptrt_id)

usethis::use_data(sexy1_croptrtkey, overwrite = TRUE)


# make available ------------------------------------------------------

sexy1_croptrtkey %>% 
  write_csv("inst/extdata/sexy1_croptrtkey.csv")
