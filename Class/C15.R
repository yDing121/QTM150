bday_list <- list("Happy Birthday to You!",
                  "How Old Are You?", 
                  34L,
                  TRUE)
bday_vec <- c("Happy Birthday to You!", 
              "How Old Are You?", 
              34L, 
              TRUE)

print(bday_list)
print(bday_vec)

# Coercion forces the data type to be string for the vector because
# the string data type is the most complicated out of the data types
# encountered (int, str, bool)

a_list <- list(a = 1:3,
               b="a string",
               c=pi,
               d=list("Harrison Ford", "Ke Huy Quan"))
print(a_list[3])

# pi as vector of size 1
thing <- a_list[[3]]

# pi as the sole element of a list of size 1
thing_list <- a_list[3]

# "Ke Huy Quan" 
pasteything <- a_list[[4]][[2]]

