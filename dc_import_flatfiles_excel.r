

# Create a path to the hotdogs.txt file: path
path <- file.path("hotdogs", "hotdogs.txt")

# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path, sep = "\t", col.names = c("type", "calories", "sodium"))


# Call head() on hotdogs
head(hotdogs)


# Import swimming_pools.csv correctly: pools
pools <- read.table("swimming_pools.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Check the structure of pools
str(pools)

# Import swimming_pools.csv with factors: pools_factor
pools_factor <- read.table("swimming_pools.csv", header = TRUE, sep = ",")

# Check the structure of pools_factor
str(pools_factor)


?which.min

# Load in the hotdogs data set: hotdogs
hotdogs <- read.table("hotdogs.txt", sep = "\t", col.names = c("type", "calories", "sodium"))

# Select the hot dog with the least calories: lily
lily <- hotdogs[(which.min(hotdogs$calories)), ]

# Select the observation with the most sodium: tom
tom <- hotdogs[(which.max(hotdogs$sodium)), ]

# Print lily and tom
lily
tom


colClasses

# Previous call to import hotdogs.txt
hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"))

# Print a vector representing the classes of the columns
print(sapply(hotdogs, class))

# Edit the colClasses argument to import the data correctly: hotdogs2
hotdogs2 <- read.delim("hotdogs.txt", header = FALSE,
                       col.names = c("type", "calories", "sodium"),
                       colClasses = c("factor", "NULL", "numeric"))

# Display the structure of hotdogs2
str(hotdogs2)



#List the sheets of an Excel file

install.packages("readxl") #problems downloading on mac - check windows
library(readxl)

#readxl summary
#excel_sheets("data.xlsx") reads sheet names for a excel file
#read_excel("data.xlsx) imports data. Args: sheet = 1 or "name", col_names = TRUE, FALSE or c("char", "vect"), skip = 15

#"""Before you can start importing from Excel, you should find out which sheets are available
#in the workbook. You can use the excel_sheets() function for this."""

# Load the readxl package
library(readxl)

# Find the names of both spreadsheets: sheets
sheets <- excel_sheets("latitude.xlsx")

# Print sheets
sheets

# Find out the class of the sheets vector
class(sheets)

#Congratulations! As you can see, the result of excel_sheets() is simply a character vector;
#you haven't imported anything yet. That's something for the read_excel() function. Learn all
#about it in the next exercise!


# The readxl package is already loaded

# Read the first sheet of latitude.xlsx: latitude_1
latitude_1 <- read_excel("latitude.xlsx", sheet = 1)

# Read the second sheet of latitude.xlsx: latitude_2
latitude_2 <- read_excel("latitude.xlsx", sheet = "1900")

# Put latitude_1 and latitude_2 in a list: lat_list
lat_list <- list(latitude_1, latitude_2)

# Display the structure of lat_list
str(lat_list)

## READ multiple sheets in at once with lapply ##
# The readxl package is already loaded

# Read all Excel sheets with lapply(): lat_list
lat_list <- lapply(excel_sheets("latitude.xlsx"), read_excel, path = "latitude.xlsx")

# Display the structure of lat_list
str(lat_list)

#The read_excel() function is called multiple times on the "latitude.xlsx" file and
#each sheet is loaded in one after the other. The result is a list of data frames,
#each data frame representing one of the sheets in latitude.xlsx.


# The readxl package is already loaded

# Import the the first Excel sheet of latitude_nonames.xlsx (R gives names): latitude_3
latitude_3 <- read_excel("latitude_nonames.xlsx", sheet = 1, col_names = FALSE)

# Import the the second Excel sheet of latitude_nonames.xlsx (specify col_names): latitude_4
latitude_4 <- read_excel("latitude_nonames.xlsx", sheet = 2, col_names = c("country","latitude"))

# Print the summary of latitude_3
summary(latitude_3)

# Print the summary of latitude_4
summary(latitude_4)


# The readxl package is already loaded

# Import the second sheet of latitude.xlsx, skipping the first 21 rows: latitude_sel
latitude_sel <- read_excel("latitude.xlsx", sheet = 2, col_names = FALSE, skip = 21)

# Select the first observation from latitude_sel: first
first <- latitude_sel[1,]

# Print first
first








