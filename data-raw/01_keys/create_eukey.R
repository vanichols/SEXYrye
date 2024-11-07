#--manually created an experimental unit key
#--The plots are double wide, with the north plots for measurements and the south plots for yields
#--Each half got its own experimental unit


library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1

sexyt1_eukey <- 
  read_excel("data-raw/01_keys/sexy_T1eukey.xlsx", skip = 5) %>% 
  mutate(block_id = paste0("b", block_id))

usethis::use_data(sexyt1_eukey, overwrite = TRUE)
