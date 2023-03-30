library(tidyverse)
library(readxl)
library(glue)
setwd("D:/Projects/QTM150")

# student data

hs_students <- read_excel("./Datasets/104.10.xlsx", sheet = 1)
bach_students <- read_excel("./Datasets/104.10.xlsx", sheet = 2)
male_hs_students <- read_excel("./Datasets/104.10.xlsx", sheet = 3)
male_bach_students <- read_excel("./Datasets/104.10.xlsx", sheet = 4)
female_hs_students <- read_excel("./Datasets/104.10.xlsx", sheet = 5)
female_bach_students <- read_excel("./Datasets/104.10.xlsx", sheet = 6)

# HBCU data
hbcu_all <- read_excel("./Datasets/tabn313.20.xls", sheet = 1)
hbcu_black <- read_excel("./Datasets/tabn313.20.xls", sheet = 2)

list(
  datasets = list(
    bach_students,
    female_bach_students,
    female_hs_students,
    hbcu_all,
    hbcu_black,
    hs_students,
    male_bach_students,
    male_hs_students
  ),
  names = ls()
) %>%
  pmap(
    .f = function(datasets, names) {
      write_csv(datasets, glue::glue("./Datasets/{names}.csv"))
    }
  )

# Example 1
hs_students <- hs_students %>% 
  mutate(Total = if_else(Total > 10000, str_sub(Total, 1, 4) %>% as.double(), Total)) %>% 
  rename(year = Total) %>%
  # select(!contains("Standard")) %>% 
  # select(!contains("Total")) %>% 
  # mutate(across(White1:last_col(), as.double)) %>% 
  # pivot_longer(cols = 2:last_col(), names_to = "group", values_to = "percentage") %>% 
  # filter(year >= 1980) %>% 
  # ggplot(aes(x = year, y = percentage, color = group)) +
  # geom_line()