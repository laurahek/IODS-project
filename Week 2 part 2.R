#Week 2, part 2
head(learning2014)
install.packages("dplyr")
library(dplyr)
learning2014 <- select(learning2014, -X1)
str(learning2014)
dim(learning2014)
names(learning2014)



install.packages("rlang")
install.packages("ggplot2")


library(ggplot2)
summary(learning2014)
qgplot(age,gender,data=learning2014)+ geom_smooth()