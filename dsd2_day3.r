#dsd2_day3

###Ensemble methods

# goal to improve accuracy by combining different version of the same model
#can use ensemble with classification and regression models
# same model and parameters but different datasets (segmented but overlapping)

#third step of combining the models works as a democracy, it reports the majority vote
#ensemble is not the learning algorithm - but a method to combine underlying model

#cross validation would sit outside the ensemble and treat it as a black box, partitioning and applying the ensemble parameters on each partition.
#some argue that cross validation not needed as similar affect achieved in ensemble
#so if 10 partitions, each partition will be sampled with replacement into a bag for the amount of trees specified
#if 50 trees, then cross validation will be comparing 10 * 50 different trees.

#For an ensemble to make a wrong decision, the majority need to be wrong
#e.g. if 25 classifiers, at least 13 need to be wrong. See binomial equation on slide 12 in ensemble methods

#Two ways to create ensemble: bagging & boosting
#bagging - each model created equal
#boosting - each model is NOT equal; some have different weights

#sampling with and without replacement key to understanding bagging
#bagging with replacement results in multiple selection of certain data points.
#each time a data point is selected twice, another data point has a lower likelihood of being selected
#if sampled without replacement, then each bag would be identical (represent whole distribution)

#when sampling with replacement, you don't keep multiple versions of each data point,
#so each bag is smaller than whole dataset.
#it's been statistically proven that with enough data, each bag will contain about 63% of the distribution
# can interpret this as each data point has 63.2% chance of being selected in each bag

##NOTE: eqn slide 15 is wrong - ^n should be on outside of the bracket

#paper on ensemble sums up nicely: "The strength of weak classifiers"

#decision jungle or forest is already an ensemble
#as an ensemble is essentially a collection of individual classifiers, so the number of trees can be selected as a parameter in a forest or jungle

#How Do Random Forests Work?
# A different subset of the training data are selected (~2/3), with replacement, to train each tree
# **Remaining training data (aka out-of-bag data or simply OOB) is used to estimate error and variable importance

#Using example of random forests, you not only randomise datasets but also feature selection
#using titanic: otherwise they would all start with gender as has highest gini index.
#BUT while best (greedy) choice at that time, it may exclude important data once segmented
#SO in an ensemble forest, the second tree might start with a weaker feature initially
#This allows a diversity in decision making, which brings stability to decisions
#set seed matters to ensure reproducability

#slide23 rules of thumb are defaults that R uses

#Boosting

#An iterative procedure to adaptively change distribution of training data by focusing more on previously misclassified records
#Initially, all N records are assigned equal weights
#Unlike bagging, weights may change at the end of boosting round

#each time the data weights the sample to increase likelihood of selecting examples that the previous classifier got wrong
#can be better as focuses on harder examples.
#final aggregation of classifier results is weighted too: if a classifier gets a lot of high weight examples right, then the classifier itself has a high weight

#cons - can be prone to overfitting, takes longer to train and run (not parrelisable)

#AdaBoost (Adaptive Boosting)
#slide33  Error rate [Weighted loss function]: includes an indicator function
#if prediction is right, error rate = 0, if wrong error rate = 1
#weight update: weights will grow exponentially

#gradient decision tree a popular one among recent winners of kaggle


#going back to azure
#parameters for two class decision forest:
#number of random splits per node - stopping limit on number of comparisons between each data for each level
#e.g. age can be split almost infinitely. If port of embarkation, can generate multiple comparisons: e.g. q+s vs c or c vs s...

#to implement random forest in Azure - can either 'create r model' in Azure, with random forest created in r and run in Azure


#production
#once have a model that your happy with, has performed well on hold out data and everyone is happy with and approved
#still be paranoid! Run A/B tests on a subset of users first



#a/b testing
#hypothesis testing
#type 1 error: Ho true and reject
#    - there is no change and think there is e.g. false positive
#type 2 error: Ho false and accept
#    - there is a change but you dont change: false negative

# implementing in practise: randomise and run for long enough that you canbe confident that all types of users and any seasonal variations are included in sampl
# ==> it's not just sample size










