pacman::p_load(tidyverse)
france <- map_data("world") %>% 
  filter(region == "France")
head(france, 100)
china <- map_data("world") %>% 
  filter(region == "China")
ggplot(china, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group))

# france <- france %>% 
#   arrange(group)
# france
# france$group[1]
# france$group[length(france)]