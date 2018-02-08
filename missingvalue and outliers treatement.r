table(is.na(train))
colSums(is.na(train))
colSums(is.na(test))


train$Workclass<-as.factor(train$Workclass)
train$Native.Country<-as.factor(train$Native.Country)
test$Occupation<-as.factor(test$Occupation)
test$Workclass<-as.factor(test$Workclass)
test$Native.Country<-as.factor(test$Native.Country)


#changing into chr to factors
train[sapply(train, is.character)] <- lapply(train[sapply(train, is.character)], as.factor)
test[sapply(test, is.character)] <- lapply(test[sapply(test, is.character)], as.factor)


imputed_data<-impute(train,classes = list(factor=imputeMode()))
train<-imputed_data$data
imputed_data_test<-impute(test,classes = list(factor=imputeMode()))
test<-imputed_data_test$data
colSums(is.na(train))
colSums(is.na(test))
#outliers treatement
ggplot(train,aes(ID,Age))+geom_jitter()
ggplot(train,aes(ID,Hours.Per.Week))+geom_jitter()
#variable transformations
prop.table(table(train$Workclass))
train$Workclass<-recode(train$Workclass,"c('Federal-gov','Never-worked','Self-emp-inc','State-gov','Without-pay')='others'")
test$Workclass<-recode(test$Workclass,"c('Federal-gov','Never-worked','Self-emp-inc','State-gov','Without-pay')='others'")
as.matrix(prop.table(table(train$Workclass)))