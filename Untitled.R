#datacamp exercises

#intermediate R - while loops and conditionals

# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while(speed > 30) {
    print(paste("Your speed is", speed))
    if(speed > 48) {
        print("Slow down big time!")
        speed <- speed -11
    } else {
        print("Slow down!")
        speed <- speed - 6
    }
}

while (speed > 30) {
    print(paste("Your speed is",speed))

    # Break the while loop when speed exceeds 80
    if (speed > 80) {
        break
    } else if (speed > 48) {
        print("Slow down big time!")
        speed <- speed - 11
    } else {
        print("Slow down!")
        speed <- speed - 6
    }
}

# Initialize i as 1
i <- 1

# Code the while loop
while(i <= 10) {
    t <- i*3
    print(t)
    if(t %% 8 == 0) {
        break
    }  else {
        i = i + 1
    }
}
