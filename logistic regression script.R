

data <- read.csv(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/alc.txt"), sep = "," , header=TRUE)


names(data)
summary(data)
dim(data)

#The data has 35 variables and 382 observations. I am pickingthe following variables to test 
# in the logistic regression model: sex, age, activities and romantic

write.csv(data, file="data", append = TRUE, quote = TRUE, sep = " ",
          eol = "\n", na = "NA", dec = ",", row.names = FALSE,
          col.names = TRUE, qmethod = c("escape", "double"),
          fileEncoding = "")

install.packages("ggplot2")
library(ggplot2)
?ggplot
qplot(alc_use,data=data)
qplot(sex,data=data)
qplot(age,data=data)
qplot(age,activites,data=data)
