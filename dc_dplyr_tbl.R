dply tbl

# tbl can be do everything data frames do but are responsive to window size and
# make data easier to work wwith

tbl_df(dataframe) #to convert existing data frame to tbl format


You can "clean" hflights the same way you would clean a data.frame. A bit of cleaning would be a good idea since the UniqueCarrier variable of hflights uses a confusing code system.

You can create a lookup table with a named vector. When you subset the lookup table with a character string (like the character strings in UniqueCarrier), R will return the values of the lookup table that correspond to the names in the character string. To see how this works, run following code in the console:

    two <- c("AA", "AS")
lut <- c("AA" = "American",
         "AS" = "Alaska",
         "B6" = "JetBlue")
two <- lut[two]
two

# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways",
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier",
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Use lut to translate the UniqueCarrier column of hflights
hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]

# Inspect the resulting raw values of your variables
glimpse(hflights)

# last ex, same as previous but with little help
# The hflights tbl you built in the previous exercise is available in the workspace.

# Build the lookup table: lut
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D"= "security", "E" = "not cancelled")

# Use the lookup table to create a vector of code labels. Assign the vector to the CancellationCode column of hflights
hflights$CancellationCode <- lut[hflights$CancellationCode]


# Inspect the resulting raw values of your variables
glimpse(hflights)

