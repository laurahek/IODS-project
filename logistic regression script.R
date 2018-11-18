

data <- read.csv(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/alc.txt"), sep = "," , header=TRUE)


names(data)
summary(data)
dim(data)

#The data has 35 variables and 382 observations. I am pickingthe following variables to test 
# in the logistic regression model: sex, age, abscences and romantic

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
qplot(age,romantic,data=data)

g2 <- ggplot(alc_data, aes(high_use))
g2 + facet_wrap("sex") + geom_bar()

library(tidyr); library(dplyr); library(ggplot2)
install.packages("tidyr")

gather(alc_data) %>% glimpse
glimpse(alc_data)

?ggplot

g1 <- ggplot(alc_data, aes(x = high_use, y = G3))
g1 + geom_boxplot() + ylab("grade")

g2 <- ggplot(alc_data, aes(x = high_use, y = age))
g2 + geom_boxplot() + ylab("age")


#building the model
m <- glm(high_use ~ sex + age + romantic + absences, data = alc_data, family = "binomial")
m
coef(m)
summary(m)
