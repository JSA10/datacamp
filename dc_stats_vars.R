##datacamp Statistics intro


#Nominal variables

# Create a numeric vector with the identifiers of the participants of your survey
participants_1 <- c(2,3,5,7,11,13,17)

# Check what type of values R thinks the vector consists of
class(participants_1)

# Transform the numeric vector to a factor vector
participants_2 <- factor(participants_1)

# Check what type of values R thinks the vector consists of now
class(participants_2)


# ordinal variables

# Create a vector of temperature observations
temperature_vector <- c("High", "Low", "High", "Low", "Medium")

# Specify that they are ordinal variables with the given levels
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low","Medium","High"))


#interval and ratio variables

"""R has no special way to deal with interval and ratio variables.
This is not really necessary because you can just use numeric values for these."""

# Assign to the variable 'longitudes' a vector with the longitudes
# This is an interval variable.
longitudes <- c(10,20,30,40)

# Assign the times it takes for an athlete to run 100 meters to the variable 'chronos'
# This is a ratio variable.
chronos <- c(10.60,10.12,9.58,11.1)


# Print the 'impact' data.frame
impact

# Use the describe() function to see some summary information per variable
describe(impact)

# Select the variable 'verbal_memory_baseline' from the 'impact' data.frame and assign it to the variable 'verbal_baseline'
verbal_baseline <- impact$verbal_memory_baseline

# Plot a histogram of the verbal_baseline variable that you have just created
hist(verbal_baseline, main = "Distribution of verbal memory baseline scores", xlab = "score", ylab = "frequency")


?subset
# The data.frame `red_wine_data` is already pre-loaded.

# Print the data.frame
red_wine_data

# Print basic statistical properties of the red_wine_data data.frame. Use the describe() function
describe(red_wine_data)

# Split the data.frame in subsets for each country and assign these subsets to the variables below
red_usa <- subset(red_wine_data, red_wine_data$condition == "USA")
red_france <- subset(red_wine_data, red_wine_data$condition == "France")
red_australia <- subset(red_wine_data, red_wine_data$condition == "Australia")
red_argentina <- subset(red_wine_data, red_wine_data$condition == "Argentina")

# Select only the Ratings variable for each of these subsets and assign them to the variables below
red_ratings_usa <- red_usa$Ratings
red_ratings_france <- red_france$Ratings
red_ratings_australia <- red_australia$Ratings
red_ratings_argentina <- red_argentina$Ratings

## Create a 2 by 2 matrix of histograms

# Organize the histograms so that they are structured in a 2 by 2 matrix.
par(mfrow = c(2,2))

# Plot four histograms, one for each subject
hist(red_ratings_usa, main = "Red Wine Ratings USA", xlab = "Ratings", ylab = "Frequency")
hist(red_ratings_france, main = "Red Wine Ratings France", xlab = "Ratings", ylab = "Frequency")
hist(red_ratings_australia, main = "Red Wine Ratings Australia", xlab = "Ratings", ylab = "Frequency")
hist(red_ratings_argentina, main = "Red Wine Ratings Argentina", xlab = "Ratings", ylab = "Frequency")


# The data.frame `white_wine_data` is already pre-loaded.

# Print the white wine data.frame
white_wine_data

# Assign the scores for each country to a variable
white_ratings_france <- subset(white_wine_data, white_wine_data$condition == "France")$Ratings
white_ratings_argentina <- subset(white_wine_data, white_wine_data$condition == "Argentina")$Ratings
white_ratings_australia <- subset(white_wine_data, white_wine_data$condition == "Australia")$Ratings
white_ratings_usa <- subset(white_wine_data, white_wine_data$condition == "USA")$Ratings

# Plot a histogram for each of the countries
# Organize the histograms so that they are structured in a 2 by 2 matrix.
par(mfrow = c(2,2))
hist(white_ratings_usa, main = "USA white ratings", xlab = "score")
hist(white_ratings_australia, main = "Australia white ratings", xlab = "score")
hist(white_ratings_argentina, main = "Argentina white ratings", xlab = "score")
hist(white_ratings_france, main = "France white ratings", xlab = "score")


SD = Sum (X - M) / N
Var = SD^2


