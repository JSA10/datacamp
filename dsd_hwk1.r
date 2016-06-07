adult_hwk1 <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data")
adult <- adult_hwk1
adult_names <- read.csv("bootcamp/Datasets/adult.names.txt") #read lines??
adult_test <- read.csv("bootcamp/Datasets/adult.test.txt")


head(adult_hwk1)
str(adult_hwk1)
getwd()
setwd()
# adult <- read.table("/bootcamp/Datasets/adult.data.txt, sep = " ")

