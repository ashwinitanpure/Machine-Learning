#primitive datatypes
int1 = 23
print(int1)

complex  = (2+4i) * (31+7i)
print(complex)

#type casting
int2 = as.integer(complex)
print(int2)

double1 = as.double(complex)
print(double1)

char1 = 'H'
print(char1)

char2 = as.character(int2)
print(char2)

#finding out data type of variables
class(double1)
typeof(double1)

class (char1)
typeof(char1)

#vectors
vector1 = c(12,23,54,65,18,98)
print(vector1)

print(vector1[3])


#useful functions
print(mean(c(6,3,21,13,88,68,24)))
print(median(c(6,3,21,13,88,68,24)))
print(max(c(3,5,1,7,4,2)))
print(min(c(4,3,1,7,9,3,7,2)))

#Preprocessing the dataset
#1. Removing NA
vector1 = c(12,17,22,23,45,54,67,NA,NA,67)
is.na(vector1)
sum(vector1,na.rm=T)
mean(vector1,na.rm=T)

#slicing of vector
vector = c(1,3,4,7,23,43,89)
vector[1]
vector[c(4,5,6)]

#Matrix Data Structure
matrix(1:9,nrow=3,ncol=2)
matrix(c(1:10),nrow=2,ncol=5)

#Lists
list1 = list(4,3,'Tanvi',c(5,4,33),8.88)
print(list1)
list1[2:4]
print(list1[0:(length(list1)-1)])#dropping the last value

#Dataframes : formatted version of list
df = data.frame("SN"=1:3,"Age" = c(23,43,11),"Name"=c("Chris","Ryan","Nicolas"))
df

