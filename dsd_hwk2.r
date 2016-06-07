#dsd1_day2hwk

head(titanic)
pairs(titanic)

str(titanic)
table(is.na(titanic))
summary(titanic)

# Casting & Readability
titanic$Survived <- as.factor(titanic$Survived)
levels(titanic$Survived) <- c("Dead", "Survived")
levels(titanic$Embarked) <- c("Unknown", "Cherbourg",
                              "Queenstown", "Southampton")
str(titanic[,c("Embarked","Survived")]) #confirm above changes

# Pie chart
survivedTable <- table(titanic$Survived)
par(mar=c(0, 0, 0, 0), oma=c(0, 0, 0, 0), cex=1.5)
pie(survivedTable, labels=c("Dead", "Survived"))

# Is Sex a good predictor?
male <- titanic[titanic$Sex=="male",]
female <- titanic[titanic$Sex=="female",]
par(mfrow=c(1, 2))
pie(table(male$Survived), labels=c("Dead", "Survived"),
    main="Survival Portion of Men"
)
pie(table(female$Survive), labels=c("Dead", "Survived"),
    main="Survival Portion of Women"
)

# Is Age a good predictor?
summary(titanic$Age)

summary(titanic[titanic$Survived=="Dead",]$Age)
summary(titanic[titanic$Survived=="Survived",]$Age)

# Exercise 3:
# Create 2 box plots of Age, one segmented by Sex, the other by Survived
# Create a histogram of Age
# Create 2 density plot of Age, also segmented by Sex and Survived
boxplot(Age ~ Sex, data=titanic,
        main="Age Distribution By Gender",
        col=c("red","green"), notch=T)

boxplot(Age ~ Survived, data=titanic,
        main="Age Distribution By Survival",
        col=c("red","green"), notch=T, ylab="Age")

hist(titanic$Age, col="blue", breaks=12,
     xlab="Distribution of Age",
     ylab="Frequency of Bucket",
     main="Distribution of Passenger Ages on Titanic")

densityplot(~ Age, data=titanic,
            groups=Survived, plot.points=F, lwd=3,
            auto.key=list(corner=c(0,0), x=0.7, y=0.8))

densityplot(~ Age, data=titanic,
            groups=Sex, plot.points=F, lwd=3,
            auto.key=list(corner=c(0,0), x=0.7, y=0.8))

density(titanic.age.cleaned) # NAs prevent this
d <- density(na.omit(titanic$Age))
plot(d, main="Kernel Density of Age")
polygon(d, col="red", border="blue")

# Exercise 4:
# Create a new column "Child", and assign each row either "Adult" or "Child"
# based on a consistent metric. Then use ggplot to create a series of box plots
# relating Fare, Child, Sex, and Survived
child <- titanic$Age
child[child < 13] <- 0
child[child >= 13] <- 1
titanic$Child <- as.factor(child)
levels(titanic$Child)
levels(titanic$Child) <- c("Child", "Adult")
g <- ggplot(data=titanic[!is.na(titanic$Child),],
            aes(x=Child, y=Fare))
g.b <- g + geom_boxplot()
g.b + facet_grid(Sex ~ Survived)

str(titanic)
library(dplyr)
titanic2 <- select(titanic, -PassengerId, -Name, -Ticket, -Cabin)
head(titanic2)

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



