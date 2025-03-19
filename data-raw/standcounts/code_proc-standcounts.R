#########################
# created: 8 Nov 2024
#
# last updated: 19 march 2025 (use new eukey style)
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

eukey <- read_csv("inst/extdata/sexy1_eukey.csv")
plotkey <- read_csv("inst/extdata/sexy1_plotkey.csv")

k <- 
  eukey %>% 
  left_join(plotkey)

scraw <- read_excel("data-raw/standcounts/rd_20241108_standcounts.xlsx", skip = 5, na = "NA")


# process -----------------------------------------------------------------

#--clean up date and pivot
sc1 <-
  scraw %>%
  fill(date) %>% 
  mutate(block = paste0("b", block)) %>% 
  select(-notes) %>% 
  pivot_longer(s1:s4, names_to = "subsample", values_to = "temp_plants_m2") 

#--sum up subsamples to get 8 m of counting
sc2 <- 
  sc1 %>% 
  #--8 samples sums up to 8 m of linear sampling (only did 4 per plot half), with 12.5 cm row widths this equates to plants/m2
  group_by(date, block, plot) %>% 
  summarise(plants_m2 = sum(temp_plants_m2, na.rm = T))


# address issues ----------------------------------------------------------

#--plots 201, 202 both had half a lane patchy that Gina avoided, which was the wrong thing to do
#--plot 203 missing half its plants (annual rows)
#--plot 212 missing half its plants (annual rows)
#--plot 309 missing one half completely

scraw %>% 
  filter(!is.na(notes))

sc2 %>% 
  filter(block == "b3")

sc3 <- 
  sc2 %>% 
  mutate(plants_m2 = case_when(
    plot == 201 ~ plants_m2 * 0.95,
    plot == 202 ~ plants_m2 * 0.95,
    plot == 203 ~ plants_m2 * 0.5,
    plot == 212 ~ plants_m2 * 0.5,
    plot == 309 ~ plants_m2 * 2,
    TRUE ~ plants_m2
  ))

sc3 %>% 
  filter(block == "b3")


# rejoin to eu ------------------------------------------------------------

sc4 <- 
  sc3 %>% 
  ungroup() %>% 
  left_join(k) %>% 
  select(trial, date, eu_id, plot_id, plants_m2) %>% 
  distinct() %>% 
  mutate(date = as_date(date))



# check it ----------------------------------------------------------------

sc4 %>% 
  ggplot(aes(eu_id, plants_m2)) + 
  geom_point()

# write it ----------------------------------------------------------------

sexy1_standcounts <- sc4

usethis::use_data(sexy1_standcounts, overwrite = T)

sexy1_standcounts %>% 
    write_csv("inst/extdata/sexy1_standcounts.csv")
