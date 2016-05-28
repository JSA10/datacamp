### Datacamp - dealing with missing values


#Missing values can be a rather complex subject, but here we'll only look at the simple
#case where you are simply interested in normalizing and/or removing all missing values
#from your data. For more information on why this is not always the best strategy, search
#online for "missing not at random."

library(stringr)
?str_replace


## The stringr package is preloaded

# Use str_replace() to replace all missing strings in status with NA
social_df$status <- str_replace(social_df$status, "^$", NA)

# Print social_df to the console
social_df

# Use complete.cases() to see which rows have no missing values
complete.cases(social_df)

# Use na.omit() to remove all rows with any missing values
na.omit(social_df)


# Look at a summary() of students3
summary(students3)

# View a histogram of the age variable
hist(students3$age)

# View a histogram of the absences variable
hist(students3$absences)

# View a histogram of absences, but force zeros to be bucketed to the right of zero
hist(students3$absences, right = FALSE)
### FIND OUT WHY ZEROS WOULD BE BUCKETED EITHER SIDE OF 0 IN A HISTOGRAM


# View a boxplot of age
boxplot(students3$age)

# View a boxplot of absences
boxplot(students3$absences)



### Putting it all together; Chapter 4


# Verify that weather is a data.frame
class(weather)

# Check the dimensions
dim(weather)

# View the column names
names(weather)


"""Next up is to look at some summaries of the data. This is where functions like
str(), glimpse() from dplyr, and summary() come in handy."""


# View the structure of the data
str(weather)

# Load dplyr package
library(dplyr)

# Look at the structure using dplyr's glimpse()
glimpse(weather)

# View a summary of the data
summary(weather)


"""The weather dataset suffers from one of the five most common symptoms of messy data:
column names are values. In particular, the column names X1-X31 represent days of the
month, which should really be values of a new variable called day. The tidyr package
provides the gather() function for exactly this scenario"""


# Load the tidyr package
library(tidyr)

# Gather the columns
weather2 <- gather(weather, day, value, X1:X31, na.rm = TRUE)

# View the head
head(weather2)


## The tidyr package is already loaded

# First remove column of row names
weather2 <- weather2[, -1]

# Spread the data
weather3 <- spread(weather2, measure, value)

# View the head
head(weather3)


## tidyr and dplyr are already loaded

# Load the stringr and lubridate packages
library(stringr)
library(lubridate)

# Remove X's from day column
weather3$day <- str_replace(weather3$day, "X", "")

# Unite the year, month, and day columns
weather4 <- unite(weather3, date, year, month, day, sep = "-")

# Convert date column to proper date format using lubridates's ymd()
weather4$date <- ymd(weather4$date)

# Rearrange columns using dplyr's select()
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)

# View the head
head(weather5)


"""It's important for analysis that variables are coded appropriately. This is not yet
the case with our weather data. Recall that functions such as as.numeric() and
as.character() can be used to coerce variables into different types.

It's important to keep in mind that coercions are not always successful, particularly
if there's some data in a column that you don't expect. For example, the following will
cause problems:

    as.numeric(c(4, 6.44, "some string", 222))

If you run the code above in the console, you'll get a warning message saying that R
introduced an NA in the process of coercing to numeric. This is because it doesn't
know how to make a number out of a string ("some string"). Watch out for this in our
weather data!"""

# View the structure of weather5
str(weather5)

# Examine the first 20 rows of weather5. Are most of the characters numeric?
head(weather5, 20)

# See what happens if we try to convert PrecipitationIn to numeric
as.numeric(weather5$PrecipitationIn)
## NAs introduced where original value wasn't a number in quotation marks


#As you saw in the last exercise, "T" was used to denote a trace amount
#(i.e. too small to be accurately measured) of precipitation in the PrecipitationIn
#column. In order to coerce this column to numeric, you'll need to deal with this
#somehow. To keep things simple, we will just replace "T" with the number zero.

## The dplyr and stringr packages are already loaded

# Replace T with 0 (T = trace)
weather5$PrecipitationIn <- str_replace(weather5$PrecipitationIn, "T", 0)

# Convert characters to numerics
weather6 <- mutate_each(weather5, funs(as.numeric), CloudCover:WindDirDegrees)

# Look at result
str(weather6)


# Count missing values
sum(is.na(weather6))

# Find missing values
summary(weather6)

# Find indices of NAs in Max.Gust.SpeedMPH
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))

# Look at the full rows for records missing Max.Gust.SpeedMPH
weather6[ind, ]


# Review distributions for all variables
summary(weather6)

# Find row with Max.Humidity of 1000
ind <- which(weather6$Max.Humidity == 1000)

# Look at the data for that day
weather6[142, ]

# Change 1000 to 100
weather6$Max.Humidity[ind] <- 100


# Look at summary of Mean.VisibilityMiles
summary(weather6$Mean.VisibilityMiles)

# Get index of row with -1 value
ind <- which(weather6$Mean.VisibilityMiles == -1.000)

# Look at full row
weather6[ind,]

# Set Mean.VisibilityMiles to the appropriate value
weather6$Mean.VisibilityMiles[ind] <- 10


# Review summary of full data once more
summary(weather6)

# Look at histogram for MeanDew.PointF
hist(weather6$MeanDew.PointF)

# Look at histogram for Min.TemperatureF
hist(weather6$Min.TemperatureF)

# Compare to histogram for Mean.TemperatureF
hist(weather6$Mean.TemperatureF)


# Clean up column names
names(weather6) <- new_colnames

# Replace empty cells in events column
weather6$events[weather6$events == ""] <- "None"

# Print the first 6 rows of weather6
head(weather6)


