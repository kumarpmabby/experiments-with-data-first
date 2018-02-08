#using logistic regression

logistic<-glm(train$Income.Group ~ .,data = train,family = 'binomial')
summary(logistic)
predicted=predict(logistic,test)
solutionframe<-data.frame(ID=test$ID,Income.Group=predicted)
solutionframe$Income.Group[solutionframe$Income.Group<0]<-'<=50k'
solutionframe$Income.Group[solutionframe$Income.Group>=0]<-'>50k'
write.csv(solutionframe,file = "sol_using_logistic_reg.csv")
#using decision trees

library(rpart)
set.seed(333)
train.tree<-rpart(Income.Group~ .,data = train,method="class" ,control=rpart.control(minsplit = 20,minbucket = 100,maxdepth=10),xval=5)
summary(train.tree)
library(rpart.plot)
rpart.plot(train.tree)
predict_train<-predict(train.tree,newdata = train,type = "class")
predict_test<-predict(train.tree,newdata = test,type = "class")
library(caret)
