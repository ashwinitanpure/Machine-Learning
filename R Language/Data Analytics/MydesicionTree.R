library(ggplot2)
library(caTools)
library(dplyr)
library(readr)

titanic <- read.csv("C:/Users/Ashwini-pc/Downloads/Titanic_Data.csv",header=T,na.strings=c(""))

#number of columns
ncol(titanic)
nrow(titanic)
View(titanic)



head(titanic)
str(titanic)

