## code to prepare `DATASET` dataset goes here

MD_crime <- readr::read_csv("Crime (2).csv")

library(tidyverse)
library(dplyr)
library(stringr)
MD_crime %>%
  group_by(`Crime Name1`) %>%
  count()

MD_crime %>%
  group_by(`Crime Name2`) %>%
  count() %>%
  as.data.frame()

MD_crime %>%
  group_by(`Crime Name3`) %>%
  count() %>%
  as.data.frame()

MD_Crime1 <- MD_crime %>%
  filter(State == "MD") %>%
  select(`Incident ID`, `Dispatch Date / Time`, `Crime Name1`, `Crime Name2`, `Crime Name3`, 
         Victims, City,Place, Start_Date_Time, End_Date_Time,Longitude, Latitude) %>%
  group_by(`Crime Name3`) %>%
  rename("CrimeName3" = `Crime Name3`) %>%
  separate(col = CrimeName3, into = c("Crime Name3", "Crime Name4", "Crime Name 5"), 
           sep = "-") %>%
  separate(col = Place, into = c("Place1", "Place2"), 
           sep = "-") %>%
  drop_na(`Crime Name1`)


CN3 <- MD_Crime1$`Crime Name3`
str_to_title(CN3) 

CN4 <- MD_Crime1$`Crime Name4`
str_to_title(CN4) 

MD_Crime1 %>%
  group_by(`Crime Name3`) %>%
  count()

MD_Crime2 <- MD_Crime1 %>%
  filter(`Crime Name1` == "Not a Crime" | `Crime Name1`== "Other")

usethis::use_data(DATASET, overwrite = TRUE)


