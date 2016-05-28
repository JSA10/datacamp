#Student's T-test

Types of t-tests


You want to compare people's preference for a political candidate. In the first study you recruit liberals and conservatives and you have them rate their likelihood to vote for the candidate. In the second study you ask a group to rate their likelihood to vote for the candidate before and after the candidate makes a speech. In the third study, you want to compare your group's preference for the candidate to the voting population. Which test do you use for each study?

First study: independent t-test; Second study: dependent t-test; Third study: single sample t-test.


# Generate a vector of 100 values between -4 and 4
x <- seq(-4, 4, length = 100)

# Simulate the t-distribution
y_1 <- dt(x, 4)
y_2 <- dt(x, 6)
y_3 <- dt(x, 8)
y_4 <- dt(x, 10)
y_5 <- dt(x, 12)

# Plot the t-distributions
plot(x, y_1, type = "l", lwd = 2, xlab = "T value", ylab = "Density", main = "Comparison of t-distributions")
lines(x, y_2, col = "red")
lines(x, y_3, col = "orange")
lines(x, y_4, col = "green")
lines(x, y_5, col = "blue")

# Add a legend
legend("topright", c("df = 4", "df = 6", "df = 8", "df = 10", "df = 12"), title = "T distributions", col = c("black", "red", "orange", "green", "blue"), lty = 1)
?legend
#position of legend can be set by keyword or x,y coordinates

"""The coordinates can be specified in any way which is accepted by xy.coords. If this gives the coordinates of one point, it is used as the top-left coordinate of the rectangle containing the legend. If it gives the coordinates of two points, these specify opposite corners of the rectangle (either pair of corners, in any order).

The location may also be specified by setting x to a single keyword from the list
"bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right"
and "center". This places the legend on the inside of the plot frame at the given
location. Partial argument matching is used. The optional inset argument specifies
how far the legend is inset from the plot margins. If a single value is given, it is
used for both margins; if two values are given, the first is used for x- distance,
the second for y-distance."""

"""*** application of random variables, probability distributions to owned social data?
- expectated outcomes based on historic data == better benchmarks.
    - map histogram / density plot of historic data for a given metric to understand most likely outcomes of future work (over and above the average)
    - can add extra context by tagging the data with campaign type / content theme / type / any other feature likely to impact result..."""

"Probability is the relative frequency of an event in the long run."
# if we repeat a random experiment many times, the relative frequency histogram should come to look
# like the random variable's probability histogram
# this leads back to the mean and variance (s.d) of the probability distribution

#*** start to include a measure of variance in social reporting

# properties of data = sample properties
# properties of the probability distribution = model or population properties

#  mu for pop mean & lowercase sigma for pop s.d
## pages 61 & 62 in cg to s for derivation of formula from sample to model / pop

# mu = sum of xp(x) for all x # = expected value of x
# think sum of possible values, each weighted by its probability ++

# Variance sigma^2 = sum of (x - mu)^2p(x) for all x # = the expected squared distance from the pop mean
# s.d = square root of var

# for continuous random variables need to use calculus notation to describe area under the curve f(x)
# f(x) = the integral of f from a to b # when a and b indicate a range of x values
# p(a <= X >= b) # = area under the curve from a to b
# SumArea a-b f(x)dx

#revisit sections on mean and vairance of continuous random variables for equations
# + section on adding random variables in order to derive following formula:

# sum of many random variables = sum E[Xi] for n, i =1

# A tale of two distribtions - binomial (discrete) + normal (continuous)

# Binomial = two possible outcomes; success and failure
# a Bernoulli trial is a repeatable experiment. Provided it has these critical properties:
#   1) result of each trial can be a success or failure
#   2) probability p of success is the same in every trial
#   3) trials are INDEPENDENT: outcome of one has no influence on later outcomes

# see pages 74 - 80 for link from binomial to standard normal dist using bernoulli trials
## mean of binomial = np, var of binomial = np(1-p)
## the binomial random variable similar to content covered in DSD:
# n = number of trials and p = probability of achieving k successes from those n trials
## P(X = k) = (n choose k)*p^k*(1-p)^n-k    # n choose k = the binomial coefficient and formula = n! / k!(n-k)!

## birth of standard normal.
# essentially, when many Bernoulli trials undertaken, and p = 1/2
# the binomial distribution can be approximated by a continuous density function.
## by transforming so its mean = zero and s.d = 1, all the while keeping area under curve = 1, the result is a smooth, symmetrical bell shaped curve
# this is done using z-scores... f(z) = 1/sqrt(2Pi) * e^-((x^2)/2)
# this process is called normalizing the binomial distribution
### the general formula f(x | mu, sigma) = 1/sigma*sqrt(2Pi) * e^-1/2(x-mu/sigma)^2

# Normal distributions can therefore have different means, but the distribution is the same, so
# the probability of falling within one s.d of the mean is always the same = 0.68
## P(|X-mu| < sigma) approximately equal to 0.68

# see page 82 for proof that the standard normal fits any normailised binomial, for any probability p
# although binomials are not symmetrical when n != 1/2; essentially as n gets large,
# the binomials asymmetry is 'overwhelmed'

### leads to the fuzzy central limit theorem
#* data that are influenced by many small and unrelated random effects are approximately normally distributed ++

# the z transformation z = x - mu / sigma changes a normal random variable with mean mu and s.d sigma
# into a standard normal random variable with mean = 0 and s.d = 1
# we then just need a single table for standard normal f(z) to find probability for any normal distribution

# review sampling distribution of the mean section in chapter on sampling for another derivation of central limit theorem

# limitations of central limit theorem: 1) depends on large sampe size & 2) need to know the s.d
# for small samples and unknown s.d we can use the t test
# start by estimating sigma by taking s.d of sample; s (formula pg. 107)
## then in place of random variable z, we substitue s for sigma and define a new random variable t (formula pg 107)

## students' t-test
# random variable t = 'the best we can do under the circumstances'
# based on the assumption that the original population distribution was normal, or nearly normal
# t is more spread out, as use of s introduces uncertainty, making t sloppier than z
# the amount of spread depends on the sample size the more confident that s is close to sigma and the closer t gets to z, the normal


# Take a look at the dataset
wm

# Create a subset for the data that contains information on those subject who trained
wm_t <- subset(wm, train == 1)

# Summary statistics
describe(wm_t)

# Create a boxplot with pre- and post-training groups
boxplot(wm_t$pre, wm_t$post, main = "Boxplot", xlab = "Pre and Post Training", ylab = "Intelligence Score", col = c("red", "green"))


Conducting a dependent t-test, also known as a paired t-test, requires:

defining your null and alternative hypotheses
calculating the degrees of freedom
deciding the significance level α
finding the critical value
calculating the t-value

** revisit formulas for t-value and s.d. (or see cartoon stats book)

Before performing a two-tailed hypothesis test whether or not the difference between
the post and pre training groups is significantly different from zero, you will start
off easily by computing some preliminary steps in R. Use a significance level of 5
percent throughout this example.


# Define the sample size
n <- dim(wm_t)[1]

# The subset you created in the last exercise is still loaded in
# Define the sample size
n <- dim(wm_t)[1]

#Calculate the degrees of freedom
df <- n - 1

# Find the critical t-value
t_crit <- abs(qt(0.025, df))

# Calculate the mean of the difference in scores. The differences are already in the dataset under the column 'gain'.
mean_diff <- sum(wm_t$gain) / n

# Calculate the standard deviation
sd_diff <- sqrt((sum(wm_t$gain^2) - ((sum(wm_t$gain))^2/n))/(n-1))






