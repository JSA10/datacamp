# Just as read.table() was the "mother function" of the utils package,
# read_delim() is the main function in readr by Hadley Wickham.

The read_delim() function takes two mandatory arguments:

file: the file that contains the data
delim: the character that seperates the values in the data file


ex1

# Load the readr package
library(readr)

# Import potatoes.txt using read_delim(): potatoes
potatoes <- read_delim("potatoes.txt", delim = "\t")
#could have used read_tsv() here too

# Create a subset of potatoes: potatoes_sel
potatoes_sel <- potatoes[, c("texture", "flavor", "moistness")]


"""Time to switch to .csv files! Similar to utils, the read_csv() in the readr
package uses read_delim() behind the scenes. If you use read_csv(), however,
you are not free to choose the delim argument; readr handles that for you."""

?factor

# readr is already loaded

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import potatoes.csv with read_csv(): potatoes
potatoes <- read_csv("potatoes.csv", col_names = properties)

# Create a copy of potatoes: potatoes2
potatoes2 <- potatoes

# Convert the method column of potatoes2 to a factor
potatoes2$method <- factor(potatoes$method)


col_types =

# NULL = defailt, readr will work out for itself or...
c to a character
d to a double
i to an integer
l to a logical
_ skips the column


# readr is already loaded

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import 5 observations from potatoes.txt: potatoes_fragment
potatoes_fragment <- read_tsv("potatoes.txt", col_names = properties, skip = 7, n_max = 5)

# Import all data, but force all columns to be character: potatoes_char
potatoes_char <- read_tsv("potatoes.txt", col_types = "cccccccc")

# Display the structure of potatoes_char
str(potatoes_char)

# NOTE: If use 'skip' may potentially be skipping column name info


?collector

# readr is already loaded

# Import without col_types
hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

# Display the summary of hotdogs
summary(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("hotdogs.txt",
                           col_names = c("type", "calories", "sodium"),
                           # Change col_types to the correct vector of collectors
                           col_types = list(fac, int, int))

# Display the summary of hotdogs_factor
summary(hotdogs_factor)


#  data.table
?order
?fread

# load the data.table package
library(data.table)

# Import potatoes.txt with fread(): potatoes
potatoes <- fread("potatoes.txt")

# Print out arranged version of potatoes
potatoes[order(potatoes$moistness, decreasing = FALSE), ]

# Import 20 rows of potatoes.txt with fread(): potatoes_part
potatoes_part <- fread("potatoes.txt", nrows = 20)


# fread advanced
# fread is already loaded

# Import columns 6, 7 and 8 of potatoes.txt: potatoes
potatoes <- fread("potatoes.txt", select = c(6:8))

# Keep only tasty potatoes (flavor > 3): tasty_potatoes
tasty_potatoes <- subset(potatoes, flavor > 3)

# Plot texture (x) and moistness (y) of tasty_potatoes
plot(tasty_potatoes$texture, tasty_potatoes$moistness)


# answer to last exercise
The class of the result of fread() is both data.table and data.frame.
read_tsv() creates an object with three classes: tbl_df, tbl and data.frame.


"""Correct! What's the benefit of these additional classes? Well, it allows for a
different treatment of printouts, for example. To learn all about it, you can
check out the DataCamp courses dedicated to dplyr and data.table. For now, you
can proceed to the next chapter in this course!"""


