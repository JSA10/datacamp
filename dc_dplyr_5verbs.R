the dplyr package contains five key data manipulation functions, also called verbs:

select() # which returns a subset of the columns,
filter() # that is able to return a subset of the rows,
arrange() # that reorders the rows according to single or multiple variables,
mutate() # used to add columns from existing data,
summarise() # which reduces each group to a single row by calculating aggregate measures.

#When data is tidy (can use tidyr) (variables in colums and observations in rows) you can
#say that select and mutate work on the variables and filter and arrange work on the rows
#Summarise groups the variables


# select()

# hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl with the four columns of hflights related to delay
select(hflights, 10:13)

# Print out hflights, nothing has changed!
hflights

# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)

# Answer to last question: be concise!
select(hflights, 1:4, 12:21)

# dplyr provides 6 helper functions, each of which only works when used inside select().

starts_with("X"): #every name that starts with "X",
ends_with("X"): #every name that ends with "X",
contains("X"): #every name that contains "X",
matches("X"): #every name that matches "X", where "X" can be a regular expression,
num_range("x", 1:5): #the variables named x01, x02, x03, x04 and x05,
one_of(x): #every name that appears in x, which should be a character vector.


# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.


# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, matches("Delay"))
select(hflights, ends_with("Delay"))

# Print out a tbl as described in the second instruction, using both helper functions and variable names
select(hflights, 7:9, matches("Cancel"))

# Print out a tbl as described in the third instruction, using only helper functions.
select(hflights, matches("Time"), matches("Delay"))

#comparing to basic R

# both hflights and dplyr are available

ex1r <- hflights[c("TaxiIn","TaxiOut","Distance")]
ex1d <- select(hflights, matches("Taxi"), Distance)

ex2r <- hflights[c("Year","Month","DayOfWeek","DepTime","ArrTime")]
ex2d <- select(hflights, Year:ArrTime, -DayofMonth)

ex3r <- hflights[c("TailNum","TaxiIn","TaxiOut")]
ex3d <- select(hflights, TailNum, TaxiIn:TaxiOut)


#mutate

# hflights and dplyr are loaded and ready to serve you.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to a g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = Distance / AirTime * 60)

# Print out g3
g3


# hflights and dplyr are ready, are you?

# Add a second variable loss_percent to the dataset: m1
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_percent = (ArrDelay - DepDelay) / DepDelay * 100)

# Copy and adapt the previous command to reduce redendancy: m2
m2 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_percent = loss / DepDelay * 100)

# Add the three variables as described in the third instruction: m3
m3 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, ActualGroundTime = ActualElapsedTime - AirTime, Diff = TotalTaxi - ActualGroundTime)


# filter

# filter(dataset, logical operator)

#R comes with a set of logical operators that you can use inside filter(). These operators are

x < y, TRUE if x is less than y
x <= y, TRUE if x is less than or equal to y
x == y, TRUE if x equals y
x != y, TRUE if x does not equal y
x >= y, TRUE if x is greater than or equal to y
x > y, TRUE if x is greater than y
x %in% c(a, b, c), TRUE if x is in the vector c(a, b, c)

The following call, for example, filters df such that only the observations where the variable a is greater than the variable b:
    filter(df, a > b)

# hflights is at your disposal as a tbl, with clean carrier names

# All flights that traveled 3000 miles or more
filter(hflights, Distance >= 3000)

# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier %in% c("JetBlue", "Southwest", "Delta"))

# All flights where taxiing took longer than flying
filter(hflights, (TaxiIn + TaxiOut) > AirTime)


#filter and logical operators

#The following two calls are completely equivalent:
filter(df, a > b & c > d)
filter(df, a > b, c > d)

filter(df, !is.na(x)) #is.na is very useful function with filter


# hflights is at your service as a tbl!

# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime < 0500 | ArrTime > 2200)

# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay > 0 & ArrDelay < 0)

# All cancelled weekend flights
filter(hflights, Cancelled & DayOfWeek > 5)

# All flights that were cancelled after being delayed
filter(hflights, Cancelled & DepDelay > 0)


# combining the three dplyr verbs learned already


# hflights is already available in the workspace

# Select the flights that had JFK as their destination: c1
c1 <- filter(hflights, Dest == "JFK")

# Combine the Year, Month and DayofMonth variables to create a Date column: c2
c2 <- mutate(c1, Date = paste(Year, Month, DayofMonth, sep = "-"))

# Print out a selection of columns of c2
select(c2, Date, DepTime, ArrTime, TailNum)


# exercise wrapping them up


wkend <- filter(hflights, DayOfWeek > 5)
wkend <- filter(hflights, DayOfWeek > 5 & Distance > 1000)
taxi <- mutate(wkend, TotalTaxi = TaxiIn + TaxiOut)
answer <- filter(taxi, TotalTaxi < 15)
select(answer, TotalTaxi)

# arrange()

# dplyr and the hflights tbl are available

# Definition of dtc
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
arrange(dtc, DepDelay)

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode)

# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier, DepDelay)

#By default, arrange() arranges the rows from smallest to largest.
library(dplyr)
?arrange

# dplyr and the hflights tbl are available

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, TotDelay = DepDelay + ArrDelay)

# Keep flights leaving to DFW before 8am and arrange according to decreasing AirTime
arrange(filter(hflights, Dest == "DFW", DepTime < 800), desc(AirTime))

# Good job! The use of functions like desc() in arrange() can be very useful as it
# allows you to visualize the database's content exactly as you want. Also, notice
# that you can do computations while ordering, as in the second exercise. As such,
# you can avoid the use of mutate() and the creation of an additional column variable
# that you might not need in the future.

# last exercise in section6

# order of operations

filter()
mutate()
arrange()
select()


# summarise

# hflights and dplyr are loaded in the workspace

# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary with variable max_div
summarise(filter(hflights, Diverted ==1), max_div = max(Distance))

"""You can use any function you like in summarise(), so long as the function can
take a vector of data and return a single number. R contains many aggregating
functions, as dplyr calls them. Here are some of the most useful:"""

min(x) - minimum value of vector x.
max(x) - maximum value of vector x.
mean(x) - mean value of vector x.
median(x) - median value of vector x.
quantile(x, p) - pth quantile of vector x.
sd(x) - standard deviation of vector x.
var(x) - variance of vector x.
IQR(x) - Inter Quartile Range (IQR) of vector x.
diff(range(x)) - total range of vector x.

?format
?mean

# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest = min(ArrDelay), average = mean(ArrDelay), latest = max(ArrDelay), sd = sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn) & !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))


#dplyr provides several helpful aggregate functions of its own, in addition to the
#ones that are already defined in R.These include:

first(x) - The first element of vector x.
last(x) - The last element of vector x.
nth(x, n) - The nth element of vector x.
n() - The number of rows in the data.frame or group of observations that summarise() describes.
n_distinct(x) - The number of unique values in vector x.

"""Next to these dplyr-specific functions, you can also turn a logical test into an
aggregating function with sum() or mean(). A logical test returns a vector of TRUE's
and FALSE's. When you apply sum() or mean() to such a vector, R coerces each TRUE to
a 1 and each FALSE to a 0. This allows you to find the total number or proportion of
observations that passed the test, respectively"""

?count
# hflights is available with full names for the carriers

# Generate summarizing statistics for hflights
summarise(hflights, n_obs = n(), n_carrier = n_distinct(UniqueCarrier), n_dest = n_distinct(Dest), dest100 = nth(Dest, 100))

# Filter hflights to keep all American Airline flights: aa
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa
summarise(aa, n_flights = n(),
          n_canc = sum(Cancelled == 1),
          p_canc = mean(Cancelled == 1) * 100,
          avg_delay = mean(ArrDelay, na.rm = TRUE))


## Pipe operator %>%
# **Known as 'and then'**

# hflights and dplyr are both loaded and ready to serve you

# Write the 'piped' version of the English sentences.
hflights %>%
    mutate(diff = TaxiOut - TaxiIn) %>%
    filter(!is.na(diff)) %>%
    summarise(avg = mean(diff))

# hflights is pre-loaded

# Build data frame with 4 columns of hflights and 2 self-defined columns: d
d <- select(hflights, Dest, UniqueCarrier, Distance, ActualElapsedTime) %>%
    mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60)

# Filter and summarise d according to the instructions
filter(d, (!is.na(mph)) & (mph < 70)) %>%
    summarise(n_less = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))


# hflights and dplyr are loaded and ready to roll

# Solve the exercise using a combination of dplyr verbs and %>%
hflights %>%
    mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
    filter(mph < 105 | Cancelled == 1 | Diverted == 1) %>%
    summarise(n_non = n(),
              p_non = n_non / nrow(hflights) * 100,
              n_dest = n_distinct(Dest),
              min_dist = min (Distance),
              max_dist = max(Distance))


# hflights and dplyr are loaded

# Count the number of overnight flights
hflights %>%
    filter(!is.na(DepTime), !is.na(ArrTime), DepTime > ArrTime) %>%
    summarise(num = n())



library(dplyr)
?group_by


# hflights is in the workspace as a tbl, with translated carrier names

# Make an ordered per-carrier summary of hflights
hflights %>%
    group_by(UniqueCarrier) %>%
    summarise(n_flights = n(),
              n_canc = sum(Cancelled == 1),
              p_canc = mean(Cancelled == 1) * 100,
              avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
    arrange(avg_delay)

# Make an ordered per-day summary of hflights
hflights %>%
    group_by(DayOfWeek) %>%
    summarise(avg_taxi = mean(TaxiIn + TaxiOut, na.rm = TRUE)) %>%
    arrange(desc(avg_taxi))


# hflights is in the workspace as a tbl, with translated carrier names

# Make an ordered per-carrier summary of hflights
hflights %>%
    group_by(UniqueCarrier) %>%
    summarise(n_flights = n(),
              n_canc = sum(Cancelled == 1),
              p_canc = mean(Cancelled == 1) * 100,
              avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
    arrange(avg_delay)

# Make an ordered per-day summary of hflights
hflights %>%
    group_by(DayOfWeek) %>%
    summarise(avg_taxi = mean(TaxiIn + TaxiOut, na.rm = TRUE)) %>%
    arrange(desc(avg_taxi))


