#########################
# created: 8 Nov 2024
#
# last updated: 
#
# purpose: Process standcount data
#
# NOTES: Some plots had annual rye planted later (field mistake), may need to update
#
#########################


##### Clear environment and load packages #####
rm(list=ls())
library(tidyverse)
library(lubridate)
library(readxl) #--used to read Excel files
library(janitor) #--used to clean data


# 2018 --------------------------------------------------------------------

eukey <- read_csv("data-raw/eukey/sexy1_eukey.csv")

scraw <- read_excel("data-raw/standcounts/2024_standcounts/rd_20241108_standcounts.xlsx", skip = 5, na = "NA")


# process -----------------------------------------------------------------

#--clean up date and pivot
sc1 <-
  scraw %>%
  fill(date) %>% 
  select(-notes) %>% 
  mutate(date = as_date(date),block_id = paste0("b", block_id)) %>% 
  pivot_longer(s1:s4, names_to = "subsample", values_to = "temp_plants_m2") 

#--sum up subsamples to get 8 m of counting
sc2 <- 
  sc1 %>% 
  #--8 samples sums up to 8 m of linear sampling, with 12.5 cm row widths this equates to plants/m2
  group_by(date, block_id, plot_id) %>% 
  summarise(plants_m2 = sum(temp_plants_m2, na.rm = T))


# address issues ----------------------------------------------------------

#--plots 201, 202 both had half a lane patchy that Gina avoided, which was the wrong thing to do
#--plot 203 missing half its plants (annual rows)
#--plot 212 missing half its plants (annual rows)
#--plot 309 missing one half completely

scraw %>% 
  filter(!is.na(notes))

sc2 %>% 
  filter(block_id == "b3")

sc3 <- 
  sc2 %>% 
  mutate(plants_m2 = case_when(
    plot_id == 201 ~ plants_m2 * 0.95,
    plot_id == 202 ~ plants_m2 * 0.95,
    plot_id == 203 ~ plants_m2 * 0.5,
    plot_id == 212 ~ plants_m2 * 0.5,
    plot_id == 309 ~ plants_m2 * 2,
    TRUE ~ plants_m2
  ))

sc3 %>% 
  filter(block_id == "b3")


# rejoin to eu ------------------------------------------------------------

sc4 <- 
  sc3 %>% 
  ungroup() %>% 
  left_join(eukey) %>% 
  select(trial_id, date, eu2_id, plants_m2) %>% 
  distinct()



# check it ----------------------------------------------------------------

sc4 %>% 
  ggplot(aes(eu2_id, plants_m2)) + 
  geom_point()

# write it ----------------------------------------------------------------

sexy1_standcount <- sc4

usethis::use_data(sexy1_standcount, overwrite = T)

sexy1_standcount %>% 
    write_csv("data-raw/standcounts/sexy1_standcount.csv")
