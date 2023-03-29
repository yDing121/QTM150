pacman::p_load(tidyverse, nycflights13)
# flights %>% 
#   # left_join(airports, by = c("dest" = "faa")) %>% 
#   # left_join(airports, by = c("dest", "origin", "faa")) %>% 
#   # left_join(airports, by = c("faa" = "origin")) %>% 
#   # left_join(airports, by = c("origin" = "faa")) %>% 
#   left_join(airports, by = c("dest", "faa")) %>% 
#   head(n=5)
# 


# flights %>% 
#   colnames()
# 
planes %>%
  colnames()

flights %>%
  left_join(planes, by = "tailnum") %>% 
  select(manufacturer) %>% 
  group_by(manufacturer) %>% 
  summarize(man_cnt = sum(!is.na(manufacturer))) %>% 
  arrange(desc(man_cnt))