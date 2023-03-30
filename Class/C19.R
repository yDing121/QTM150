pacman::p_load(tidyverse)
# https://r4ds.had.co.nz/strings.html#character-classes-and-alternatives

# 14.3.2.1.1
things <- c("abcd", "$^$")
str_subset(things, "\\$\\^\\$")

# 14.3.2.1.2
str_subset(stringr::words, "^y")
str_subset(stringr::words, "x$")
str_subset(stringr::words, "^...$")
stringr::words[str_length(stringr::words) >= 7]
str_subset(stringr::words, ".......")

# 14.3.3.1
str_subset(stringr::words, "^[aeiou]+")
str_subset(stringr::words, "^[^aeiou]+$")
str_subset(stringr::words, "[^e]ed$")
str_subset(stringr::words, "(ing|ise)$")

x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC+")