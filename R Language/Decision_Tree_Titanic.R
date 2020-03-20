library(ggplot2)
library(caTools)
library(dplyr)

titanic <- read.csv('C:/Users/Ashwini-pc/Downloads/Titanic_Data.csv', 
                    header=T, na.strings=c(""))
# Number of columns
ncol(titanic)
nrow(titanic)
View(titanic)

head(titanic)
str(titanic)


# sapply(data, function), is.na(x) returns TRUE for NA
sapply(titanic, function(x) sum(is.na(x)))
# unique value of data
sapply(titanic, function(x) length(unique(x)))

## Missing Value
library(Amelia) 
dev.off()
missmap(titanic, main = "Missing Values vs. Observed")

# df <- na.omit(titanic)

# nrow(df)
# sum(is.na(titanic$Cabin))

titanic_df <- subset(titanic, select = c(2,3,5,6,7,8,10,12))
ncol(titanic_df)

missmap(titanic_df, main = "Missing Values vs. Observed")
sum(is.na(titanic_df$Age))

avg.age <- mean(titanic_df$Age, na.rm = T)

print(avg.age)

titanic_df$Age[is.na(titanic$Age)] = avg.age

titanic_df$Age

missmap(titanic_df,main="Missing Values Vs Observed")

titanic_df <- na.omit(titanic_df)
#dropping the missing embarked values
missmap(titanic_df,main="Missing Values Vs Observed")
nrow(titanic_df)

sum(is.na(titanic_df))
gg <- ggplot(titanic_df,aes(x=Survived, fill=Sex))


gg + geom_bar(position="dodge") + 
  labs(title = "Titanic - Male vs Female in Each Class")

## 
ggplot(titanic,aes(x=Pclass,fill=Sex))+
  geom_bar(position="dodge")+
  facet_grid(". ~ Survived") +
  labs(title = "Titanic - Survived vs Not Survived in Each PClass")

# Splitting The Data Sets
split_data <- sample.split(titanic_df ,SplitRatio = 0.8)

train_data = subset(titanic_df, split_data==T)

test_data = subset(titanic_df, split_data==F)

colnames(train_data)
library(caret)

# Decision Tree Classification
# Model
# fit the model
clf_tree <- train(Survived ~ ., 
                  data=train_data, 
                  method="rpart", 
                  trControl = trainControl(method = "cv"))
summary(clf_tree)

res <- predict(clf_tree ,test_data)
summary(res)
print(res)

#Confusion Matrix
table(res>0.3,test_data$Survived)

library(ROCR)
predicted_val = predict(clf_tree, newdata = test_data)
ROCRPred <- prediction(predicted_val,test_data$Survived)
ROCRPref <- performance(ROCRPred,"tpr","fpr")

# Receiver Operating Characteristic Curve(ROC)
# plot() # abline() # barplot() # hist() # scatterplot()
dev.off()
plot(ROCRPref, colorize=TRUE, print.cutoffs.at=seq(0.1))

plot(clf_tree$finalModel, uniform=TRUE,
     main="Classification Tree")
text(clf_tree$finalModel, use.n.=TRUE, all=TRUE, cex=.8)

library (rpart)
library(rattle)
rpart_clf <- rpart(Survived ~ . , data =train_data, method = 'class')
rpart_clf
fancyRpartPlot(rpart_clf, main = "Titanic TREE")

