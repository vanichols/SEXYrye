#--manually created an experimental unit key
#--The plots are double wide, with the north plots for measurements and the south plots for yields
#--Each half got its own experimental unit


library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1

d1 <-
  read_excel("data-raw/eukey/sexy1_eukey.xlsx", skip = 5) %>% 
  fill(croptrt_id, weedctl_id) %>% 
  mutate(block_id = paste0("b", block_id),
         eu_id = paste(block_id, plot_id, plothalf_id, sep = "_"),
         eu2_id = paste(block_id, plot_id, sep = "_"),
         trial_id = "Trial1") %>% 
  select(trial_id, eu_id, eu2_id, everything())


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

# make a tim plot id
d3 <-
  d2 %>% 
  mutate(plot_idtim = ifelse(plothalf_id == 'n', 'a', 'b'),
         plot_idtim = paste0(plot_id, plot_idtim)) %>% 
  select(trial_id, eu_id, eu2_id, block_id, plot_id, plothalf_id, 
         plot_idtim, everything())
  

# write it ----------------------------------------------------------------


sexy1_eukey <- d3
  
  
usethis::use_data(sexy1_eukey, overwrite = TRUE)

sexy1_eukey %>% 
  write_csv("data-raw/eukey/sexy1_eukey.csv")
