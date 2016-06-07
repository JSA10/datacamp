#day 1 summary
#not just about the tools - the thought process is key.
#explore and understand data needed to ask right questions and engineer features
#segmenting very important to uncover hidden features
#domain knowledge helps in the interpretation of the data

#Predictive Analytics

#Training data + Learning Algorithm * training process = Model
#Model + Test data = Predictions
#Predictions + Scoring = evaluation

#Decision trees

#Part of problem with DTs are the range of options available, many models possible based on order of predictor decisions
#Not computationally feasible to explore every one and get fully optimal solution
#Need to use a greedy strategy for 'near-optimal' solution

#Greedy: Split based attribute test that optimizes a criterion
#three considerations around how to split the data:
# What attribute test condition?
# How to determine the best split?
# When do we stop?

# The end goal is to pick the split that gives us the best probability of fully segmenting the data into distinct groups
# In this case, the best chance of separating dead vs. survived


# Measures of Node Impurity

#Gini
# p ( j | t) means probability of class j at node t
# 1 - [p(c1)^2 + p(c2)^2]
# where c1 = dead, c2 = survived

# max = 1/Number of classes, means less interesting split as  records equally distributed among all classes
# min = 0, means 100% of records on one side and 0 on the other - best case

# ** need to take weighted average of gini * the split going through each node (slide 39, DT Learning)

#other methods of node impurity are variations of same theme
# Entropy - R DecTree package uses Entropy as default

# When do you stop?

#Stop when the next node down increases the Gini Index or Entropy score.
#The last node is your decision node
#It may not be the best choice when new data is factored in but adopting a greedy strategy so make the best decision at the time

# Stopping conditions (intuition)
# 1 - when you reach desired level of Gini Index
# 2 - when group sizes become too small compared to size of original dataset
# 3 - fixed number of levels determined by size of data - empirically determined

# overfitting most common pitfall in model creation - a natural tendency that arises from desire to create the perfect model

# Stopping conditions from slides
# All the records belong to the same class
# All the records have similar attribute values
# Fixed termination
# • Number of Levels
# • Number in Leaf Node = Decision node

# Decision tree pros
#intuitive; particularly for small trees
#non-parametric: rule based, no coefficients or explicit math like regression
#fast
#robust to outliers - will solve for highest probability decisions
#explainable

# Decision tree cons
#overfitting
#Rectangular classification - idea that you lose features of the data that were discarded by previous decisions
#can get complex quickly


install.packages("rpart") #recursive partitioning
install.packages("party")

library(rpart)
library(party)

data("iris")

str(iris)
dim(iris)
summary(iris)

# see Decision_Tree_Iris_Data_Day2.r for first classification model


# EVALUATING MODELS

# Key point 1: Accuracy is not everything. Depends on problem being solved.
# we focus on predictive capability of the model, not how fast or how scalable for now

# Confusion matrix - were our models predictions correct (true) or wrong (false)?
Confusion_Matrix = (TP,FP,TN,FN)

Accuracy = TP + TN / ALL

Precision = TP / TP + FP # = correctly predicted survivors / all predicted survivors
#**how often are you correct when you predict a positive outcome**

Recall = TP / TP + FN # = correctly predicted survivors / actual number of survivors
#**how many of target outcome did you get right**

#example disease / no disease

C1: 10 (disease)
C2: 990 (no disease)

Recall = TP / TP + FN
# So want high recall

# If increase number of C2, accuracy will go up recall stays good.
# Accuracy and recall are mutually exclusive

# Many evaluation methods - you decide


#Probability based metrics
# each prediction is a numeric outcome between 0 and 1
#Threshold btw positive and negative predictions has big outcome on predictions
#E.g.
# Low threshold = more false positives
# High threshold = more false negatives

# decision based on accepatble false positive and negative rates
# THIS EQUATES TO THE ROC CURVE

#true positives and false positives grow and fall together
    #monotone function - can only increase or stay flat
# ROC Curve represents quality of model *independent of threshold*

## Perils of overfitting
# a complex model is related to a lot of factors
#e.g. high number of features or levels, leaves or attempting to classify every data point
# ** bias / variance tradeoff important concept - at a point the prediction error for training and test sets diverge
# ** while both training and test error reducing, the model is generalised, when diverge you are optimising for training data only

# bias = distance from ideal score
# variance = variance in scores for different random samples

#high variance + low bias = overfitting
#high bias + low variance = underfitting
#low bias + low variance = ideal
#high bias + high variance = rubbish model

# high bias - could be underfitted model, bad feature selection etc.
# high variance could be down to noisy data zs`a

# don't think about a good evaluation score independently from context
# e.g. more samples, variance, domain knowledge


# Cross validation
#partition data and run model with different training and test sets
#purpose: find right set of parameters that have the best scores and lowest variance for a range of a training and test sets
#compare average scores + variance
#variance measured by s.d. Use +- 2 * s.d


# tuning parameters of algorithm you know is a better first port of call than choosing a new algorithm (particularly at random)
# in DT example, can tune with tradeoff between learning more (e.g. more trees) and learning less (e.g. increasing min number of samples at each node)

#Running Azure ML note - results cached, so if rerun then not everything is rerun, just the elements that need to be

#in practice - blind holdout data sets often used before operationalising a model to guard against:
#cheating, laziness, incompetence BUT also honest exploration or any feature engineering on the ultimate test data

#in practice, machine learning is more than building models and assessing by accuracy, recall, precision, f-scores etc.
#often have a real-world business performance metric to hit or optimise to.
#blind hold outs could be sampled in a variety of way, random, stratified or focused on high value segments










