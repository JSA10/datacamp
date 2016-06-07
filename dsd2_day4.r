##Day4

#text analytics

#tf-idf
#NORMALISE word counts; divide each word count by the highest frequency word
#why? this accounts for the word's relative importance versus the other words and acts as proxy for length of document

#TF measures importance (frequency) of each word within a specific document. It's normalised for reasons above
#IDF is a global measure of popularity of each word across all documents in the corpus

#TF-IDF = TF * IDF

#COSINE SIMILARITY - a measure of slope similarity between two vectors
#++ revisit 'dot product' concept for multiplying vectors
# vector a . vector b = |a||b|Cos0
#essentially computing the angle between the vectors
#TF-IDF converts each document into a vector and a TF-IDF search exercise uses cosine similarity to compute 'angle' between the two documents
#the documents with the highest angle (similarity) will be connected

#Text Analytics Tools
# R – tm, Rstem, openNLP
# Build a TF-IDF model and then define outcomes that can be used in a predictive model
# if no labels need unsupervised learning

# ngram https://en.wikipedia.org/wiki/N-gram
#trigram: "Trigrams are a special case of the n-gram, where n is 3. They are often used in natural language processing for doing statistical analysis of texts."

# *** explore creating a dictionary with a corpus of posts from a brand, calculating TF-IDF and predicting impact of certain keywords or phrases on outcomes of interest


# Recommender systems

#collaborative vs. content based
#collaborative based on user feedback, content based have to infer affinities

# calculating similarity
#similarity measures can be between users, items or users and items.

# Use Pearson's correlation
# core concept - the average itself doesn't tell you enough - the deviation from the average does...
# e.g. netflix users, if both users score a movie higher than their average then it's a better likelihood that the movie would appeal to people like them

#collaborative predictions
#slide 33: weighted and centered formula: ru = centering aspect, rest is weighting

# need to know whether you are solving a ranking problem, or a prediction one
#they are different and would be evaluated differently
# ** always start out with an idea of how you would measure **
# for prediction: Mean Absolute Error (MAE) or Root Mean Square Error (RMSE)
# for ranking: Discounted Cumulative Gain (DCG)

#(MAE) computes the deviation between predicted ratings and actual ratings
#(RMSE) is similar to MAE, but places more emphasis on larger deviation

#DCG penalises by position, if larger numbers come later in the ranking they are penalised by higher log positions
# way to increase the number? Get order right. Higher numbers come first and are divided by smaller logs for position

#recommendation engines tutorial in manual - page 258 or something


#regression

# ** math ** revise derivatives
## derivative min/max problems

# gradient descent animations in r code file

# stochastic gradient descent takes only one data point to calculate the cost for each step
# this is quicker but less accurate than batch, which takes into account all data points
# Use stochastic for v large datasets

#r squared takes into account both variance between models predictions and data
#but also the variance in the data itself. e.g. between data point and mean

# model overfitting - we want to capture the general trend, not match every single data point
# in regression, should not use too many coefficents. If need to use many coefficients, you also need more data

# regularisation uses cost function but introduces an element that penalises each extra 0 (slide 56)



# DATA

# Benchmark for HDFS partitioning; sharding at roughly 20 GBs. Need 4 to be more efficient than SQL database
# Hadoop is a processing engine only, not storage so shouldn't be needed 24/7 unless huge variety of uses
# Hadoop batch processes data, not real-time solution

#Hive can take SQL like language, but it isn't the same so beware...
# Queries are translated and then retranslated for illusion of SQL

# email data is in XML - semi-structured. Structure is header, to, from etc. and Unstructured is the message body

#Hadoop can only handle structured data. For unstructured use Pig (Java)
#HDInsight isn't always up - close down at end of day and save data in blob storage

# Remember to use exploratory queries in Hadoop as could be working with giant datasets

# SQL code from demo (pages 229 - 234)
show tables;
select * from hivesampletable limit 10;
set hive.cli.print.header=true;
    select * from hivesampletable limit 10;
set hive.cli.print.header=true;
select * from hivesampletable;

# NOTE: Classification problems are easier to distribute
# calculations like variance / s.d. need to be passed through more than once

#sorting and joining are two of most computationally intensive commands in SQL

#tez is a library that allows communication with YARN - a solution to time taken for distributed processing in hive
#tez is not on by default. YARN is hadoop 2.0



#if data is too wide - think about dimension reduction
# e.g. principal component analysis, clustering, aggregating / grouping common features
# if can stay with SQL do so, partly as can have instant feedback on queries and avoid mistakes











