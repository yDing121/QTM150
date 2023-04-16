library(tidyverse)
library(nycflights13)

# Mean function for a collection with NAs
fmean <- function(x) mean(x[[1]], na.rm = TRUE)

# Convert data types and pivot wider
gdata <- flights %>% 
  select(c("month", "origin", "dep_delay", "arr_delay")) %>%
  mutate(month = factor(month),
         dep_delay = as.double(dep_delay)) %>% 
  group_by(origin, month) %>%
  pivot_wider(names_from = c("month"),
              values_from = c("dep_delay", "arr_delay")) %>% 
  ungroup()

# Find mean delays
for (i in 1:3){
  for (j in 2:25){
    gdata[[i,j]] = list(fmean(gdata[[i,j]]))
  }
}

# Pivot longer and separate columns
flights_clean <- gdata %>% 
  pivot_longer(cols = c(2:25),
               names_to = c("dep_arr_m"),
               names_prefix = "_delay") %>% 
  separate(col = dep_arr_m,
           into = c("type", "month"),
           sep = "_delay_") %>% 
  mutate(value = as.double(value),
         month = as.integer(month)) %>% 
  arrange(month) %>% 
  mutate(month = factor(month))



flights_clean %>%
  filter(origin=="EWR" & type=="dep") %>%
  select(c(month, value)) %>%
  ggplot(mapping = aes(x=month, y=value)) +
    geom_bar(stat = "identity")
