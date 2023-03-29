pacman::p_load(tidyverse, nycflights13)

flights %>%
  mutate(dist_cat = case_when(
      distance <= 500 ~ "short",
      distance <= 1500 ~ "middle",
      TRUE ~ "long"
    )
  ) %>%
  group_by(dist_cat) %>% 
  summarize(mean_air_time = mean(air_time, na.rm = TRUE),
            fcount = sum(!is.na(air_time)))

