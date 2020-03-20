library(datasets)
library(help=datasets)

class(airquality)
sapply(airquality,class)

head(airquality)
tail(airquality)

airquality[0:1]

Xdata = airquality[2:(length(airquality))]
Y = airquality[1]

str(airquality)

summary(airquality)

View(airquality)# display dataframe in spreed sheet

rownames(airquality)
colnames(airquality)

nrow(airquality)
ncol(airquality)

airquality[c("Ozone","Temp")]

#Boxplot & wisker
boxplot(airquality$Ozone,airquality$Temp)
boxplot(airquality)

#preprossing
#replacing NA values
clea_data = na.omit(airquality)
x = data.frame(a=c(0,1,3,NA),b=c(0,'?',10,11),c=c(NA,0,1,2))


x$a = replace(x$a,is.na(x$a),mean(x$a,na.rm = T))#x$a is replace in the same column
x

x$b = replace(x$b,c(2),0)
x

#Multiple forms of date
date1 = "15/08/2019"
mydate = as.Date(date1,format="%d/%m/%y")
class(mydate)

date2 = "15-08-2019"
mydate1 = as.Date(date2,format="%d-%m-%y")
class(mydate1)

plot(Ozone ~ Solar.R, data=airquality)

airquality$Ozone

mean.Ozone = mean(airquality$Ozone,na.rm=T)
print(mean.Ozone)

#Line plot 
abline(h=mean.Ozone)

#lm(): Linear Model
#Training of the Algorithm
model1 = lm(Ozone ~ Solar.R, data=airquality)
print(model1)

summary(model1)

abline(model1,col="red")
abline(a=18.5987,b=0.1272,col="blue")
par(mfrow=c(1,2))

termplot(model1)
