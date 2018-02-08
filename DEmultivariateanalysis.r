CrossTable(train$Sex,train$Income.Group)
#categorical case
ggplot(train,aes(Sex,fill=Income.Group))+geom_bar()+labs(title="my bar chart",X="sex" ,Y="count")+theme_bw()

#continous analysis
ggplot(train,aes(Age,Hours.Per.Week))+geom_point()+labs(title="scater plot",X="AGE",Y="HOURS PER WEEK")
#CATEGORICAL AND CONTINUOS
ggplot(train,aes(Sex,Hours.Per.Week))+geom_boxplot()+labs(title="box plot")
