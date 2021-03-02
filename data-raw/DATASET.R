## code to prepare `DATASET` dataset goes here

MD_crime <- readr::read_csv("Crime (2).csv")

library(tidyverse)
library(dplyr)
library(stringr)


MD_Crime1 <- MD_crime %>%
  filter(State == "MD") %>%
  filter(grepl("2020", `Dispatch Date / Time`)) %>%
  filter(`Crime Name1` == "Crime Against Person" | `Crime Name1` == "Crime Against Property" | `Crime Name1` == "Crime Against Society" ) %>%
  select(`Incident ID`, `Dispatch Date / Time`, `Crime Name1`, `Crime Name2`, `Crime Name3`, 
         Victims, City,Place, Start_Date_Time, End_Date_Time,Longitude, Latitude) %>%
  separate(col = `Dispatch Date / Time`, into = c("Dispatch Date", "Dispatch Time"), 
           sep = " ") %>%
  separate(col = End_Date_Time, into = c("End Date", "End Time"), 
           sep = " ") %>%
  separate(col = Start_Date_Time, into = c("Start Date", "Start Time"), 
           sep = " ") %>%
  group_by(`Crime Name3`) %>%
  rename("CrimeName3" = `Crime Name3`) %>%
  separate(col = CrimeName3, into = c("Crime Name3", "Crime Name4", "Crime Name5"), 
           sep = "-") %>%
  separate(col = Place, into = c("Place1", "Place2"), 
           sep = "-") %>%
  drop_na(`Crime Name1`)


CN3 <- MD_Crime1$`Crime Name3`
cn3 <- str_to_title(CN3) 

CN4 <- MD_Crime1$`Crime Name4`
cn4 <- str_to_title(CN4) 

CN5 <- MD_Crime1$`Crime Name5`
cn5 <- str_to_title(CN5) 

MD_Crime <- cbind(MD_Crime1, cn3, cn4, cn5) %>%
  mutate(`Crime Name3` = cn3,
         `Crime Name4` = cn4,
         `Crime Name5` = cn5) %>%
  select(!cn3) %>%
  select(!cn4) %>%
  select(!cn5) %>%
  select(!`Crime Name2`) %>%
  filter(!grepl("Describe Offense", `Crime Name3`)) 

MD_Crime2 <- gsub(' Non', 'Non-familiy', MD_Crime$`Crime Name5`)
MD_Crime0 <- cbind(MD_Crime, MD_Crime2) %>%
  mutate(`Crime Name5` = MD_Crime2) %>%
  select(!MD_Crime2) %>%
  rename(`Crime Name2` = `Crime Name3`,
         `Crime Name3` = `Crime Name4`,
         `Crime Name4` = `Crime Name5`) 

col_order <- c("Incident ID", "Crime Name1", "Crime Name2",
               "Crime Name3", "Crime Name4", "Victims", "City", "Place1", "Place2",
               "Dispatch Date", "Dispatch Time", "Start Date", "Start Time", "End Date", "End Time",
               "Longitude", "Latitude")
MD_Crime <- MD_Crime0[, col_order]


usethis::use_data(MD_Crime, overwrite = TRUE)


