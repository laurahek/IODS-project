#Laura Hekanaho, November 12th
#Week3, Data wrangling for logistic regression, data from UCI Machine Learning Repository at url(https://archive.ics.uci.edu/ml/machine-learning-databases/00320/)
rm(mat)
rm(student_por)
math <- read.csv("C:\\Users\\Laura\\Documents\\GitHub\\IODS-project\\data\\student\\student-mat.csv", sep=";", header=TRUE)
por <- read.csv("C:\\Users\\Laura\\Documents\\GitHub\\IODS-project\\data\\student\\student-por.csv", sep=";", header=TRUE)

head(math)
head(por)

summary(math)
summary(por)

dim(math)
dim(por)

names(math)
names(por)

#I conclude that the datasets have identical 33 variables and everything looks good

library(dplyr)
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))
rm(mat_por)
colnames(math_por)
glimpse(math_por)

#the datasets have been joined, now dealing with the extra variables

alc <- select(math_por, one_of(join_by))
summary(alc)

notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]
notjoined_columns
?starts_with

library(tidyselect)

for(column_name in notjoined_columns) {
  two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else { 
    alc[column_name] <- first_column
  }
}

glimpse(alc)

#creating weekday and weekend alcohol consumption column

library(ggplot2)
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

alc <- mutate(alc, high_use = alc_use > 2)

#saving...

write.csv(learning2014, file="alc", append = TRUE, quote = TRUE, sep = ",",
          
          eol = "\n", na = "NA", dec = ",", row.names = FALSE,
          
          col.names = TRUE, qmethod = c("escape", "double"),
          
          fileEncoding = "")

