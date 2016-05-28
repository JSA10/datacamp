#ggvis is based on the grammar of graphics
#constructed by hadley wickham and ?
#ggplot2 is linked / a part of ggvis - ??

# ggvis is already installed for you; now load it and start playing around
library(ggvis)

mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()

# change the code below to plot the disp variable of mtcars on the x axis
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()


# The ggvis packages is loaded into the workspace already

# Change the code below to make a graph with red points
mtcars %>% ggvis(~wt, ~mpg, fill := "red") %>% layer_points()

# Change the code below draw smooths instead of points
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Change the code below to make a graph containing both points and a smoothed summary line
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()


#the grammar of graphics can be thought of as a sentence, that is based on a set of interchangeable components

#each graph needs four main components at least:
# graph = data + coordinate system + marks + properties + ...
# your coordinate system is your x + y variables, or another system
# marks would be points (scatter plot) vs. line vs. bar
# properties would be features of the data that can provide context


## works to the following format

#<data>  %>%
#    ggvis(~<x property>,~<y property>,
#          fill = ~<fill property>, ...) %>%
#    layer_<marks>()

# Make a scatterplot of the pressure dataset
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points()

# Adapt the code you wrote for the first challenge: show bars instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()

# Adapt the code you wrote for the first challenge: show lines instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# Adapt the code you wrote for the first challenge: map the fill property to the temperature variable
pressure %>% ggvis(~temperature, ~pressure, fill = ~temperature) %>% layer_points()

# Extend the code you wrote for the previous challenge: map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, fill = ~temperature, size = ~pressure) %>% layer_points()


#three new types of syntax in ggvis:
# %>%   #piping operator from magittr package
# ~     #identifies variable names
# :=    #this sets manual values to graphic, whereas = maps values from the data

# ** use = to visualise variation in dataset **
# ** use := to customise appearance of plots **

# when using :=
#If you set a property to a number, ggvis will usually interpret the number as the number of pixels.
#If you set a location property to a number, ggvis will usually interpret the number as the number of pixels from the top left-hand corner of the plot.
#You can set the fill of points to any common color name.
#ggvis passes your color selection to vega, a javascript library, so you can use any color name recognized by HTML/CSS.


# Rewrite the code with the pipe operator
layer_points(ggvis(faithful, ~waiting, ~eruptions))

faithful %>% ggvis(~waiting, ~eruptions) %>% layer_points()

# Modify this graph to map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, size = ~pressure) %>% layer_points()

# Modify this graph by setting the size property
pressure %>% ggvis(~temperature, ~pressure, size := 100) %>% layer_points()

# Fix this code to set the fill property to red
pressure %>% ggvis(~temperature, ~pressure, fill := "red") %>% layer_points()


#Which of the commands below will create a graph that has green points? Try to predict the answer before running the code.

# GRAPH C
pressure %>%
    ggvis(~temperature, ~pressure,
          fill := red) %>%
    layer_points()


#Which of the commands below will create a graph that uses color to reveal the values of the temperature variable in the pressure data set? Try to predict the answer before running the code.

red <- "green"
pressure$red <- pressure$temperature

# GRAPH A
pressure %>%
    ggvis(~temperature, ~pressure,
          fill = ~red) %>%
    layer_points()

