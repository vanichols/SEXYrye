#--manually created a cctrtkey

library(readxl)
library(tidyverse)

#--this is the first trial of the sexy project, sexyt1


# 1. raw data -------------------------------------------------------------

d1 <-
  read_csv("inst/extdata/sexy1_trtkey.csv") %>% 
  select(cctrt_id)  %>% 
  distinct()


# 2. description ------------------------------------------------------

d2 <- 
  d1 %>% 
  mutate(desc = c("No cover crop planted", "Fall cover crop planted after grain harvest"))

# 3. ccplanting date ------------------------------------------------------

#--etc....to be added once it is done
#--depth, rate, method (broadcast?), variety, etc.


# make data ---------------------------------------------------------------

sexy1_cctrtkey <- d2

usethis::use_data(sexy1_cctrtkey, overwrite = TRUE)



# make available ----------------------------------------------------------

sexy1_cctrtkey %>% 
  write_csv("inst/extdata/sexy1_cctrtkey.csv")
