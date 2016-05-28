#datacamp functions

#MIT:
#Functions work like a black box (input, process, output)
#Arguments are the inputs and can be matched by position or name. Use args() to check
#Some arguments have default values e.g. sd(x, na.rm = TRUE) and are therefore optional

#Before using one - clarify which arguments it uses
args(func)
help(func)
?func

?mean


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
sum_lifb <- (linkedin + facebook)
avg_sum <- mean(sum_lifb)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(sum_lifb, trim = 0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed

help(print)
?paste


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook), na.rm = TRUE)


?read.table

?abs

# Create a function pow_two()
pow_two <- function(x) {
    x*x
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x, y) {
    sum(abs(x + y))
}

# Use the function
sum_abs(-2, 3)


#Functions don't have to have a new input or return anything.

#Example of function with no input
throw_dice <- function() {
    number <- sample(1:6, size = 1)
    number
}
# call the function
throw_dice()

# example of function that doesn't return anything = str()
x <- str(list(1,2,3))
x

# If you want to return NULL in a function you defined yourself,
# simply make sure to add NULL as the final expression in your function body,
# or call return(NULL) wherever appropriate.

# Define the function hello()
hello <- function() {
    print("Hi there!")
    return TRUE
}

# Call the function hello()
hello()

# Define the function my_filter()
my_filter <- function(x) {
    if (x > 0) {
        return(x)
    } else {
        return(NULL)
    }
}

# Call the function my_filter() twice
my_filter(5)
my_filter(-5)


?sd


# Extend the pow_two() function
pow_two <- function(x, print_info = TRUE) {
    y <- x ^ 2
    if (print_info == TRUE) {
        print(paste(x, "to the power two equals", y))
    }
    return(y)
}

# scoping - for variables defined within a function
#   Whatever the way of calling the two_dice() function,
#   R won't have access to dice1 and dice2 outside the function.


## R passes arguments to functions as values (not references)
# means an R function cannot change the variable that you input to that function
# unless explicitly assigned

increment <- function(x, inc = 1) {
    x <- x + inc
    x
}

count <- 5
a <- increment(count, 2) #count doesn't change, a = 7
b <- increment(count) #count doesn't change, b = 6
count <- increment(count, 2) #explicitly changes the count variable to 7


#Two solutions to 'R you functional?' exercise interpret function; first takes one argument only

# The linkedin and facebook vectors have already been created for you

# Define the interpret function
interpret <- function(i) {
    if(i > 15) {
        print("You're popular!")
        return(i)
    }
    else {
        print("Try to be more visible!")
        return(0)
    }
}

# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
    if (num_views > 15) {
        print("You're popular!")
        return(num_views)
    } else {
        print("Try to be more visible!")
        return(0)
    }
}

# Define the interpret_all() function
interpret_all <- function(views, return_sum = TRUE) {
    count <- 0
    for (v in views) {
        count <- count + interpret(v)
    }
    #at this stage there is either a number or zero being returned for each [v],
    #therefore don't need to specify the logical input as if it's zero that == FALSE
    if (return_sum) {
        return(count)
    } else {
        return(NULL)
    }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)


##my draft solution for pt 1
"""interpret <- function(network) {
    for(i in network) {
        if(i > 15) {
            print("You're popular!")
            return(i)
        }
        else {
            print("Try to be more visible!")
            return(0)
        }
    }
}

# Call the interpret function twice
interpret(linkedin)
interpret(facebook[2])"""

#r packages

#difference between library and require: library will throw an error if package not already installed
#while require will just show a warning. This option may be better if loading packages dynamically
#and dont want the whole code to stop


# The mtcars vectors have already been prepared for you
wt <- mtcars$wt
hp <- mtcars$hp

# Request the currently attached packages
search()

# Try the qplot() function with wt and hp
qplot(wt, hp)

# Load the ggplot2 package
library(ggplot2)

# Retry the qplot() function
qplot(wt, hp)

# Check out the currently attached packages again
search()

