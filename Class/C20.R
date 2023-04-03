pacman::p_load(tidyverse)
china <- map_data("world") %>% 
  filter(region == "China")
head(china, 100)

ggplot(china, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group))
