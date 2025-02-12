#--manually created an experimental unit key
#--The plots are double wide, with the north plots for measurements and the south plots for yields
#--Each half got its own experimental unit


library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1


# 1. raw data -------------------------------------------------------------

d1 <-
  read_excel("data-raw/eukey/sexy1_eukey.xlsx", skip = 5) %>% 
  fill(croptrt_id, weedctl_id) %>% 
  mutate(block_id = paste0("b", block_id),
         eu_id = paste(block_id, plot_id, plothalf_id, sep = "_"),
         eu2_id = paste(block_id, plot_id, sep = "_"),
         trial_id = "Trial1") %>% 
  select(trial_id, eu_id, eu2_id, everything(), trt_id = croptrt_id)


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
  d3 %>%  mutate(crop_cat = case_when(
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


# 5. make a tim id --------------------------------------------------------

# make a tim plot id

d5 <-
  d4 %>% 
  mutate(plot_idtim = ifelse(plothalf_id == 'n', 'a', 'b'),
         plot_idtim = paste0(plot_id, plot_idtim)) %>% 
  select(trial_id, eu_id, eu2_id, block_id, plot_id, plothalf_id, 
         plot_idtim, everything())
  


# make data ---------------------------------------------------------------

sexy1_eukey <- d5

usethis::use_data(sexy1_eukey, overwrite = TRUE)


# make internal data ------------------------------------------------------

internal_eukey1 <- sexy1_eukey

usethis::use_data(internal_eukey1, internal = TRUE, overwrite = TRUE)
