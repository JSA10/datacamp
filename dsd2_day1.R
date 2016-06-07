data(iris)
head(iris)
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)
#outliers are subjective - doesn't represent the trend
#data point > IQR * 1.5 = outlier (high). Outside of the far lines are the 90th
#and 10th percentiles
#similar concept to sigma 2sigma / 3sigma from mean

boxplot(Sepal.Width~Species, data = iris)
boxplot(iris$Sepal.Width~iris$Species)
#above are equivalent - compare Sepal.Width by three factor Species column

boxplot(Petal.Width~Species, data = iris)
#if had to predict flower based on a random petal width?
#if less than 0.7 = Setosa but if = 1.8 there is a higer probability that =
#virginica but can't be sure... Take another piece of data
boxplot(Petal.Length~Species, data = iris)

#when build a model with training data, have to assume that data is representative
#when dealing with behaviour, or adversarial problems (e.g. spam filters) need to
#make allowances for changes and keep improving the model and increasing data

#e.g. of shifting data: retail; seasonal changes like Christmas. Or Netflix new movies / genres.
#On other side - face detection is a solved problem, unlikley that range of features will change much

#boxplot parameters: main = title, xlab & ylab

boxplot(Sepal.Length ~ Species, data = iris, main = "Sepal Length for Various Species", xlab = "Species", ylab = "Sepal Length", Notch = TRUE)

#to save a plot, first need to 'open a stream'

getwd()
setwd("~/Documents/DSDojo")

pdf("myplot.pdf") #save whatever happens next to this pdf file
boxplot(Petal.Length~Species, data = iris)
dev.off()

hist(iris$Sepal.Length)
#hist is built in. To have more flexibility, use lattice histogram

install.packages("lattice") #now comes built in
library(lattice)
histogram(iris$Sepal.Length)
histogram(iris$Sepal.Length, breaks = 20)
histogram(iris$Sepal.Length, breaks = 5)
histogram(iris$Sepal.Length, breaks = 50)
histogram(iris$Sepal.Length, breaks = )
#tradeoff between broad and fine. Too broad, lose detail. Too fine and get back to distribution
densityplot(iris$Petal.Length)
#pdf (probability density function is a more continuous view of the data)
#each value has been converted into it's probability of occuring and then visualised in terms of total distribution of data
#probability of a segment of the plot occuring is measured by the area under the curve

densityplot(iris$Petal.Length, main = "Kernel Density of Petal Length", xlab = "Petal Length")
densityplot(~Petal.Width, data=iris, groups=Species)
#each species groups is an independent density plot, therefore their probability = 1
head(iris)
str(iris)

?plot

#core
plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Sepal Length", ylab = "Sepal Width")
plot(iris$Petal.Length, iris$Petal.Width)

#lattice
xyplot(Sepal.Width ~ Sepal.Length, data = iris, groups = Species)
xyplot(Sepal.Width ~ Sepal.Length, data = iris, groups = Species, auto.key = list(corner = c(0,0), x=0, y = 0.85, cex=1.5), cex = 1.5, scales = list(cex=1.5))

pairs(~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris, main="Simple Scatter Matrix")
pairs(iris) #same but with species factors

# Getting settings for legend super.sym <- trellis.par.get("superpose.symbol")
splom(iris[1:4], groups=iris$Species) #provide your data (columns 1:4) and then the groups
#above is a scatter plot matrix

trellis.par.get() #get graphical parameters for lattice package
my_theme <- trellis.par.get()
str(my_theme)
my_theme$fontsize
my_theme$fontsize$text #default text size is 12
my_theme$fontsize$text = 14 #changes to 14
names(my_theme)
show.settings()
my_theme$fontsize$text = 20

install.packages("GGally")
library(GGally)

ggpairs(iris, ggplot2::aes(color=Species)) #does everything we have looked at separately in one matrix
dim(iris)
#beware GGally / ggpairs is very slow

#mtcars exercise

#explore the data
data("mtcars")
head(mtcars)
tail(mtcars)
str(mtcars)

#how can we find out which columns will be useful to predict mpg?

pairs(mtcars)
#from pairs, looks like cyl, disp, wt & carb are correlated with mpg
boxplot(mtcars$mpg~mtcars$cyl)
xyplot(mpg ~ wt, data = mtcars)
plot(mtcars$mpg, mtcars$wt)
plot(mtcars$mpg, mtcars$disp)
densityplot(~ mpg, data = mtcars, groups = cyl)
densityplot( ~ mpg, data=mtcars, groups=cyl, plot.points=F, auto.key=list(columns=3, title="Cylinders"))
densityplot(~ mpg, data = mtcars, groups = gear)
densityplot()
pairs()

#ggplot2
#ggplot = basic function
geom_*
aes()

library(ggplot2)
data("diamonds")
head(diamonds)
tail(diamonds)
str(diamonds)
summary(diamonds)
levels(diamonds$cut) #how many labels in diamonds

ggplot(data = diamonds, aes(x=carat)) + geom_histogram()
#can rewrite as below
layer1 = ggplot(diamonds, aes(x = carat))
layer1
layer2 = layer1 + geom_histogram()
layer2
layer2b = layer1 + geom_density()
layer2b

layer1 = ggplot(diamonds)
layer2c = layer1 + geom_density(aes(x=carat))
layer2c
#layer1 are the global settings
#layer2b and 2c are identical. Illustrate the different methods you can take

ggplot(diamonds, aes(x = carat, y = price)) + geom_point()
#clearly a relationship, but something else playing a part - next step would be to group by another factor

#1 group by cut
ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(color = cut))
#2 separate out into five groups by cut
ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(color = cut)) + facet_wrap(~cut)

names(diamonds)

#save first layer as g

g <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

g + geom_point(aes(color=color)) + facet_wrap(~ color)

g + geom_point(aes(color=color)) + facet_grid(cut ~ clarity)
#above = price vs. carat plot, with color of diamond = colour of points,
#in a grid comparing cut to clarity

getwd()

setwd(/Users/jeromeahye/Documents/DSDojo/bootcamp)

titanic <- read.csv("bootcamp/Datasets/titanic.csv")

head(titanic)
# passengerid = an example not to go with first assumptions when exploring a new dataset
# don't discard until we understand

#domain knowledge important
str(titanic)
#force survived into a factor

titanic$Survived <- as.factor(titanic$Survived)
str(titanic)
# factors in R start at 1, not 0

levels(titanic$Survived)
levels(titanic$Survived) <- c("Dead", "Survived")

levels(titanic$Embarked) <- c("Unknown", "Cherbourg","Queenstown", "Southampton")
titanic[,"Survived"]

table(titanic$Survived)
table(titanic$Sex)
pie(table(titanic$Sex))
pie(table(titanic$Survived))

survivedTable <- table(titanic$Survived)
par(mar=c(0, 0, 0, 0), oma=c(0, 0, 0, 0), cex=1.5) #global parameters
pie(survivedTable, labels=c("Dead", "Survived"))

#pairs best for number correlation, not great for classification

male <- titanic[titanic$Sex=="male",] #only get rows where condition == male is true
female <- titanic[titanic$Sex=="female",]

titanic[titanic$Sex == "male" && titanic$Age >= 30] #multiple logical filters

par(mfrow=c(1,2)) #global graphical parameters; 1 row, 2 columns
pie(table(male$Survived), labels=c("Dead","Survived"), main="Survival Portion of Men")
pie(table(female$Survive), labels=c("Dead","Survived"), main="Survival Portion of Women")

#is there an mfcol?
?par
#yes there is mfcol

summary(titanic$Age)
summary(titanic[titanic$Survived=="Dead",]$Age)
summary(titanic[titanic$Survived=="Dead","Age"])
summary(titanic$Age[titanic$Survived=="Dead"])
#above three lines are equivalent

boxplot(Age ~ Sex, data=titanic, main="Age Distribution By Gender", col=c("red","green"), notch=T)
boxplot(Age ~ Survived, data=titanic, main="Age Distribution By Survival", col=c("red","green"), notch=T, ylab="Age")

hist(titanic$Age, col="blue", breaks=12, xlab="Distribution of Age", ylab="Frequency of Bucket", main="Distribution of Passenger Ages on Titanic")

density(titanic$Age) #NAs prevent this
d <- density(na.omit(titanic$Age)) #omit missing values
plot(d, main="Kernel Density of Age")
polygon(d, col="red", border="blue")

#there are negative values for age in the density plot, because density plot won't stop at 0, the probability curve will continue to fall
#e.g. a smoothing function
#can normalise to essentially remove that section. e.g. .95 would now = 1

densityplot(~ Age, data=titanic, groups=Survived, plot.points=F, lwd=3, auto.key=list(corner=c(0,0), x=0.7, y=0.8))
#densityplot is lattice version of 'density' from base package
#densityplot auto removes na values

# looking at probability of dying and surviving based on age we see that age on it's own doesn't necessarily matter, but highlights that other factors affected certain segments of different ages
# e.g. child less than 13 years old? = More likely to survive
# output of this could be to engineer a new feature (1 col) that segments age

#homework
titanic$Child


# Predictive Analytics
#use decision trees as a vehicle to understand predictive analytics






