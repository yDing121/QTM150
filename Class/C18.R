pacman::p_load(tidyverse, palmerpenguins, stringr)
thing <- "hello"

class(thing)
length(thing)
str_length(thing)
setwd("D:/Coding/QTM150")
colleges_clean <- read.csv("./Datasets/colleges_clean.csv")

colnames(colleges_clean)

str_subset(colleges_clean$INSTNM, "Polytechnic")
length(str_subset(colleges_clean$INSTNM, "University"))
# str_sort(colleges_clean$INSTNM)

a <- c("a1", "a2", "a3")
b <- c("b1", "b2", "b3")
str_c(a, b)

data(penguins)
data(words)
length(str_length(penguins$island))
# print(words)
length(str_subset(words,"ing$"))
str_view(words, "ing$")
# str_view(words, "ing")

length(str_subset(words, "ie"))
# str_view(words, "ie")