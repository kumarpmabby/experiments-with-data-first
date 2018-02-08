str(train)

continuos_train<-subset(train,select=c(ID,Age,Hours.Per.week))
categorical_train<-subset(train,select=-c(ID,Age,Hours.Per.Week))
attach(continuos_train)
attach(categorical_train)
summary(continuos_train)

options(scipen = 100)
options(digits = 3)
stats.desc(continuos_train)

stat.desc(continuos_train)
apply(continuos_train,2,function(x){length(unique(x))})
table(Race)
as.matrix((prop.table(table(Race))))
head(round(sort(prop.table(table(Native.Country)),decreasing = TRUE),6),20)