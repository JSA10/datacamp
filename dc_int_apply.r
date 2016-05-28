?lapply
?strsplit


# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year: split_math
split_math <- strsplit(pioneers, ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)


# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
    return(x[1])
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
    return(x[2])
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)


#same as above but using anonymous functions
#  functions defined within a function and not given a name as likely to be used only once
names <- lapply(split_low, function(x) { x[1] })
years <- lapply(split_low, function(x) { x[2] })



# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Replace the select_*() functions by a single function: select_el
select_el <- function(x, i) {
    x[i]
}

# Call the select_el() function twice on split_low: names and years
names <- lapply(split_low, select_el, 1)
years <- lapply(split_low, select_el, 2)


dc_sapply_cantsimplify


# temp is already prepared for you in the workspace

# Create a function that returns all values below zero: below_zero
below_zero <- function(num) {
    bz = num[num < 0]
    return(bz)
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Compare freezing_s to freezing_l using identical()
identical(freezing_s, freezing_l)


#Nice one! Given that the length of the output of below_zero() changes for different
#input vectors, sapply() is not able to nicely convert the output of lapply() to a
#nicely formatted matrix. Instead, the output values of sapply() and lapply() are
#exactly the same, as show by the TRUE output of identical().


# temp is already available in the workspace

# Write a function that 'cat()s' out the average temperatures: print_info
print_info <- function(vec) {
    cat("The average temperature is", mean(vec), "\n")
}

# Apply print_info() over temp using lapply()
lapply(temp, print_info)

# Apply print_info() over temp using sapply()
sapply(temp, print_info)


#Great! Notice here that, quite suprisingly, sapply() does not simplify the list of
#NULL's. That's because the 'vector-version' of a list of NULL's would simply be a
#NULL, which is no longer a vector with the same length as the input. Proceed to the
#next exercise.


#Reverse engineering sapply

sapply(list(runif (10), runif (10)),
       function(x) c(min = min(x), mean = mean(x), max = max(x)))

# (2) This code generates a matrix with 3 rows and 2 columns.
# (3) The function that is used inside sapply() is anonymous.



#vapply(), and it has the following syntax:

vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)


# temp is already available in the workspace

# Code the basics() function
basics <- function(v) {
    sum_v <- c(min(v), mean(v), max(v))
    return(sum_v)
}

# Apply basics() over temp using vapply()
vapply(temp, basics, numeric(3))


# Definition of the basics() function
basics <- function(x) {
    c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))
# vapply includes the names of the defined variables, as does sapply


#below converted from sapply to vapply (change v )

# temp is already defined in the workspace

# Convert to vapply() expression
vapply(temp, max, numeric(1))

# Convert to vapply() expression
vapply(temp, function(x, y) { mean(x) > y }, y = 5, logical(1))

# Definition of get_info (don't change)
get_info <- function(x, y) {
    if (mean(x) > y) {
        return("Not too cold!")
    } else {
        return("Pretty cold!")
    }
}

# Convert to vapply() expression
vapply(temp, get_info, y = 5, character(1))


# work_todos and fun_todos have already been defined
work_todos <- c("Schedule call with team",
                "Fix error in Recommendation System",
                "Respond to Marc from IT")
fun_todos <- c("Sleep", "Make arrangements for summer trip")

# Create a list: todos
todos <- list(work_todos, fun_todos)

# Sort the vectors inside todos alphabetically

lapply(todos, sort)
#tried order function but that just returned the vector index in the right order


