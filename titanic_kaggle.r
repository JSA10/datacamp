# This script trains a Random Forest model based on the data,
# saves a sample submission, and plots the relative importance
# of the variables in making predictions

# Download 1_random_forest_r_submission.csv from the output below
# and submit it through https://www.kaggle.com/c/titanic-gettingStarted/submissions/attach
# to enter this getting started competition!

library(ggplot2)
library(randomForest)

set.seed(1)
ti <- read.csv("bootcamp/Datasets/titanic.csv", stringsAsFactors=FALSE)
train.indices <- sample(1:nrow(train), 0.7*nrow(train), replace=F)
train <- ti[train.indices,]
dim(train)
## select the 30% left as the testing data
test <- ti[-train.indices,]
kaggletest  <- read.csv("bootcamp/Datasets/titanic_kaggle_test.csv", header=TRUE, stringsAsFactors = FALSE)

str(train)
head(kaggletest)

extractFeatures <- function(data) {
    features <- c("Pclass",
                  "Age",
                  "Sex",
                  "Parch",
                  "SibSp",
                  "Fare",
                  "Embarked")
    fea <- data[,features]
    fea$Age[is.na(fea$Age)] <- -1
    fea$Fare[is.na(fea$Fare)] <- median(fea$Fare, na.rm=TRUE)
    fea$Embarked[fea$Embarked==""] = "S"
    fea$Sex      <- as.factor(fea$Sex)
    fea$Embarked <- as.factor(fea$Embarked)
    life <- fea$Age
    life[life < 13] <- 0
    life[(life >= 13) & (life <= 56)] <- 1
    life[life >= 57] <- 2
    fea$life <- as.factor(life)
    levels(fea$life) <- c("Child", "Adult", "Oap")
    fea$Pclass <- ordered(fea$Pclass, levels = c("3","2","1"))
    return(fea)
}
#for life stage features - could I have just specified three named factors, rather than
#first giving number and then a name?

?as.ordered
?as.factor

?randomForest

str(extractFeatures(train))
rf <- randomForest(extractFeatures(train), as.factor(train$Survived), ntree=300, importance=TRUE)

rftest <- predict(rf, extractFeatures(test), type = "class")
rftest
rf.confusion <- table(rftest, test$Survived)
print(rf.confusion)
rf.accuracy <- sum(diag(rf.confusion)) / sum(rf.confusion)
print(rf.accuracy)


install.packages("caret", dependencies = c("Depends", "Suggests"))
library(caret)
y
y
?caret
?train

rfFit <- train(Class ~ .,
               + data = extractFeatures(train),
               + method = "randomForest",
               +preProc = c("center", "scale")
               )
??train

## Center and scale the predictors for the training
## set and all future samples.



submission <- data.frame(PassengerId = kaggletest$PassengerId)
submission$Survived <- predict(rf, extractFeatures(kaggletest))
write.csv(submission, file = "2_random_forest_r_submission.csv", row.names=FALSE)


rf_confusion <- table(submission$Survived)
rf_confusion

## MODEL EVALUATION
## Predict test set outcomes, reporting class labels
rf.predictions <- predict(rf, kaggletest, type="response")
## calculate the confusion matrix
titanic.rf.confusion <- table(titanic.rf.predictions, titanic.test$Survived)
print(titanic.rf.confusion)
## accuracy
titanic.rf.accuracy <- sum(diag(titanic.rf.confusion)) / sum(titanic.rf.confusion)
print(titanic.rf.accuracy)
## precision
titanic.rf.precision <- titanic.rf.confusion[2,2] / sum(titanic.rf.confusion[2,])
print(titanic.rf.precision)
## recall
titanic.rf.recall <- titanic.rf.confusion[2,2] / sum(titanic.rf.confusion[,2])
print(titanic.rf.recall)
## F1 score
titanic.rf.F1 <- 2 * titanic.rf.precision * titanic.rf.recall / (titanic.rf.precision + titanic.rf.recall)
print(titanic.rf.F1)

imp <- importance(rf, type=1)
featureImportance <- data.frame(Feature=row.names(imp), Importance=imp[,1])

p <- ggplot(featureImportance, aes(x=reorder(Feature, Importance), y=Importance)) +
    geom_bar(stat="identity", fill="#53cfff") +
    coord_flip() +
    theme_light(base_size=20) +
    xlab("") +
    ylab("Importance") +
    ggtitle("Random Forest Feature Importance\n") +
    theme(plot.title=element_text(size=18))

ggsave("2_feature_importance.png", p)

p
