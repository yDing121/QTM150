pacman::p_load(dplyr, tidyverse, nycflights13)

# flights %>%
#   filter(carrier=="DL") %>%
#   select(c(dep_time, flight, tailnum)) %>%
#   arrange(desc(dep_time), flight) %>%
#   print()

flights %>%
  mutate(airTimeH = air_time/60, 
         airSpeed = distance/airTimeH
         ) %>% 
  select(c(distance, air_time, airTimeH, airSpeed)) %>% 
  # arrange(desc(airSpeed)) -> thing
  arrange(airSpeed) -> thing

print(thing)

