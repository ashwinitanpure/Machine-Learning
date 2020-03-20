library(datasets)
library(ggplot2)
library(caret)
library(randomForest)

data(iris)
View(iris)

is.na(iris)

colnames(iris)

#plotting IRIS data
qplot(Petal.Width,Sepal.Width,color=Species,cex=0.5,data=iris)

set.seed(101)
split_data = sample.split(iris,SplitRatio = 0.8)

train_data = subset(iris,split_data==TRUE)
test_data = subset(iris,split_data==FALSE)

Random_Fit = train(Species~.,data=train_data,method="rf",prox=TRUE)

summary(Random_Fit)

predict(Random_Fit,test_data)
print(predict)

library (rpart)
library(rattle)

rpart_clf <- rpart(Species ~ . , data =train_data, method = 'class')
rpart_clf
fancyRpartPlot(rpart_clf, main = "Flower Classification")
