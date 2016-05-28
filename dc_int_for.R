primes <- c(2, 3, 5, 7, 11, 13)

# loop version 1
for (p in primes) {
    print(p)
}

# loop version 2
for (i in 1:length(primes)) {
    print(primes[i])
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (day in linkedin) {
    print(day)
}

# Loop version 2
for (i in 1:length(linkedin)) {
    print(linkedin[i])
}

# The nyc list is already specified
nyc <- list(pop = 8405837,
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"),
            capital = FALSE)

# Loop version 1
for(item in nyc) {
    print(item)
}

# Loop version 2
for(i in 1:length(nyc)) {
    print(nyc[[i]])
}


# The tic-tac-toe matrix has already been defined for you
ttt <- matrix(c("O", NA, "X", NA, "O", NA, "X", "O", "X"), nrow = 3, ncol = 3)

# define the double for loop
for(i in 1:nrow(ttt)) {
    for(j in 1:ncol(ttt)) {
        x <- ttt[i,j]
        print(paste("On row", i ,"and column", j ,"the board contains", x))
    }
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for(i in 1:length(linkedin)) {
    if (linkedin[i] > 10) {
        print("You're popular!")
    } else {
        print("Be more visible!")
    }
    print(linkedin[i])
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for (li in linkedin) {
    if (li > 10) {
        print("You're popular!")
    } else {
        print("Be more visible!")
    }
    # Add code to conditionally break iteration
    if (li > 16) {
        print("This is ridiculous, I'm outta here!")
        break
    }
    # Add code to conditionally skip iteration
    if (li < 5) {
        print("This is too embarrassing!")
        next
    }
    print(li)
}


# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for (li in linkedin) {
    if (li > 10) {
        print("You're popular!")
    } else {
        print("Be more visible!")
    }
    # Add code to conditionally break iteration
    if (li > 16) {
        print("This is ridiculous, I'm outta here!")
        break
    }
    # Add code to conditionally skip iteration
    if (li < 5) {
        print("This is too embarrassing!")
        next
    }
    print(li)
}


