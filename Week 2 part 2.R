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


fig.width=4, fig.height=3, message=FALSE
pairs(learning2014[-1])
#I don't know how to change the width and height for pairs... oh well

install.packages("GGally")
library(GGally)

?lm
regression4 <- lm(Points~ Age + gender + Attitude+deep+surf+stra, data=learning2014)
regression4
summary(regression4)


ggpairs(learning2014, lower = list(combo = wrap("facethist", bins = 20)))

plot(regression1, which=c(1,2,5))

