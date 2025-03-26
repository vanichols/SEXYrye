#--manually created a plotkey

library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1

d0 <- read_excel("data-raw/eukey/sexy1_eukey.xlsx", skip = 5) 

# 1. raw data -------------------------------------------------------------

d1 <-
  d0 %>% 
  select(-trt_id) %>% 
  left_join(read_csv("inst/extdata/sexy1_eukey.csv"))


# 2. simplify ----------------------------------------------------------------

d2 <- 
  d1 %>% 
  mutate(block = paste0("b", block)) %>% 
  select(plot_id, block, plot, plothalf, samptype)


# make data ---------------------------------------------------------------

sexy1_plotkey <- d2

usethis::use_data(sexy1_plotkey, overwrite = TRUE)



# make available to user --------------------------------------------------

sexy1_plotkey %>% 
  write_csv("inst/extdata/sexy1_plotkey.csv")

# # make internal data ------------------------------------------------------
# 
# internal_trtkey1 <- sexy1_trtkey
# 
# usethis::use_data(internal_trtkey1, internal = TRUE, overwrite = TRUE)
