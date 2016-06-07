#dsd1_day2hwk
getwd()
setwd("documents/DSDojo")
titanic <- read.csv("bootcamp/Datasets/titanic.csv", header=TRUE)
rm("titanic.data")

head(titanic)
tail(titanic)
pairs(titanic)

str(titanic)
table(is.na(titanic))
summary(titanic)

# Casting & Readability
titanic$Survived <- as.factor(titanic$Survived)
titanic2$Pclass <- as.factor(titanic2$Pclass)
levels(titanic$Survived) <- c("Dead", "Alive")
levels(titanic$Embarked) <- c("Unknown", "Cherbourg",
                              "Queenstown", "Southampton")
str(titanic[,c("Embarked","Survived")]) #confirm above changes

library(dplyr)
titanic2 <- select(titanic, -PassengerId, -Name, -Ticket, -Cabin)
head(titanic2)
str(titanic2)

library(lattice)

# Exercise 3:
# Create 2 box plots of Age, one segmented by Sex, the other by Survived
# Create a histogram of Age
# Create 2 density plot of Age, also segmented by Sex and Survived

boxplot(Age ~ Survived, data = titanic2, notch = T)

?boxplot

densityplot(~ Age, data=titanic,
            groups=Survived, plot.points=F, lwd=3,
            auto.key=list(corner=c(0,0), x=0.7, y=0.8))

densityplot(~ Age, data=titanic,
            groups=Sex, plot.points=F, lwd=3,
            auto.key=list(corner=c(0,0), x=0.7, y=0.8))

group_by(titanic2$Age, Survived)

# Exercise 4:
# Create a new column "Child", and assign each row either "Adult" or "Child"
# based on a consistent metric. Then use ggplot to create a series of box plots
# relating Fare, Child, Sex, and Survived
child_oap <- titanic2$Age
child_oap[child_oap < 13] <- 0
child_oap[(child_oap >= 13) & (child_oap <= 56)] <- 1
child_oap[child_oap >= 57] <- 2
titanic2$child_oap <- as.factor(child_oap)
summary(titanic2$child_oap)


levels(titanic2$child_oap)
levels(titanic2$child_oap) <- c("Child", "Adult", "Oap")
str(titanic2)
library(ggplot2)

g <- ggplot(data=titanic[!is.na(titanic$child_oap),],
            aes(x=child_oap, y=Fare))
g.b <- g + geom_boxplot()
g.b + facet_grid(Sex ~ Survived)


set.seed(25)
titanic.train.indices <- sample(1:nrow(titanic2), 0.7*nrow(titanic2), replace=F)
#select 70% random row numbers from all rows in iris, without replacement
titanic.train <- titanic2[titanic.train.indices,]
dim(titanic.train)
## select the 30% left as the testing data
titanic.test <- titanic2[-titanic.train.indices,] #select everything except the training data
dim(titanic.test)

library(rpart)
titanic.m <- rpart(Survived ~ ., data = titanic.train)
titanic.m

summary(titanic.m)
titanic.m.predictions <- predict(titanic.m, titanic.test, type = "class")
titanic.m.predictions



write.csv(titanic.m.predictions, "bootcamp/Datasets/titanic_kaggle.csv")

titanic.kaggle.test <- read.csv("bootcamp/Datasets/titanic_kaggle_test.csv", header=TRUE)
head(titanic.kaggle.test)
titanic.k.test <- select(titanic.kaggle.test, -PassengerId, -Cabin)
titanic.kaggle.predictions <- predict(titanic.m, titanic.kaggle.test, type = "class")
names(titanic.train)

?write.csv

#can also predict probabilities for each item
iris.dt.predictions <- predict(iris.dt.model, iris.test, type = "prob")
iris.dt.predictions


#how evaluate at scale?

titanic.m.confusion <- table(titanic.m.predictions, titanic.test$Survived)
titanic.m.confusion

titanic.accuracy <- sum(diag(titanic.m.confusion)) / sum(titanic.m.confusion)
print(titanic.accuracy) #93%


titanic.precision <- titanic.m.confusion[2,2] / sum(titanic.m.confusion[2,])
print(titanic.precision)

titanic.recall <- titanic.m.confusion[2,2] / sum(titanic.m.confusion[,2])
print(titanic.recall)




