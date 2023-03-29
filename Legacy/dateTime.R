# make_datetime_100 <- function(year, month, day, time) {
#   make_datetime(year, month, day, time %/% 100, time %% 100)
# }
# 
# flights_dt <- flights %>% 
#   filter(!is.na(dep_time), !is.na(arr_time)) %>% 
#   mutate(
#     dep_time = make_datetime_100(year, month, day, dep_time),
#     arr_time = make_datetime_100(year, month, day, arr_time),
#     sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
#     sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
#   ) %>% 
#   select(origin, dest, ends_with("delay"), ends_with("time"))
setwd("D:/Projects/QTM150")
birth <- read.csv("./Datasets/birth_date_data.csv")
wday(now())
birth %>% 
  mutate(day = wday(birth$date)) %>% 
  group_by(day) %>% 
  summarize(sum(births))

thing <- birth %>% 
  mutate(date = ymd(date)) %>% 
  arrange(by = births)

tail(thing, 1)$date
head(thing, 1)$date
head(thing, 1)$date - tail(thing, 1)$date