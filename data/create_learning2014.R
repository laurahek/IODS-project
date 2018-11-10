#Laura Hekanaho, November 8th
#Week 2 exercises, instructions are not very comprehensive...

rm(learning2014)

str(JYTOPKYS3_data)
#str command shows the "classes" for the variables
dim.data.frame(JYTOPKYS3_data)
dim(JYTOPKYS3_data)

#both dim.data.frame and dim show the same; 183 observations for 60 variables

show(JYTOPKYS3_data)

library(dplyr)
install.packages("dplyr")


#creating questions
deep_questions <-c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")


#creating columns

library(dplyr)
deep_columns <- select(JYTOPKYS3_data, one_of(deep_questions))
JYTOPKYS3_data$deep <- rowMeans(deep_columns)

surface_columns <- select(JYTOPKYS3_data, one_of(surface_questions))
JYTOPKYS3_data$surf <- rowMeans(surface_columns)

strategic_columns <- select(JYTOPKYS3_data, one_of(strategic_questions))
JYTOPKYS3_data$stra <- rowMeans(strategic_columns)

#for some reason extra datasets were created for strategic columns and surface columns... 
rm(deep_columns)
rm(strategic_columns)
rm(surface_columns)


#assigning which columns to keep
keep_columns <- c("gender", "Age", "Attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(JYTOPKYS3_data, one_of(keep_columns))

#filtering points
learning2014 <- filter (learning2014, Points >0)
show(learning2014)

#the data now has  166 observations and 7 variables. 
#setting working directory from the menu and then saving
write.csv(learning2014, file="learning2014", append = TRUE, quote = TRUE, sep = " ",
          
          eol = "\n", na = "NA", dec = ",", row.names = FALSE,
          
          col.names = TRUE, qmethod = c("escape", "double"),
          
          fileEncoding = "")
?write.csv
read.csv("learning2014")
str(learning2014)
head(learning2014)

