### Bridget Chalifour Lab 7 ###

# Problem 1 - write a function for calculating the area of a triangle

triangleArea <- function(base, height) {
  # two values, base and height must be given
  myArea <- 0.5 * base * height
  # multiply base times height times 0.5
  return(myArea)
}

# Test to see if this works by using inputs 10 and 9
triangleArea(10, 9)

# Problem 2 - write a function to give absolute value of an input
# Here is my crazy method using squares and square roots and sapply that will return absolute value
myAbs <- function(vector) { 
  abs_vector <- sapply(X = vector, FUN = function(x) return(sqrt(x^2)))
  return(abs_vector)
}

# Test this function with these values, they work!
myAbs(5)
myAbs(-2.3)
myAbs(c(1.1, 2, 0, -4.3, 9, -12))

# Make a function to return vector of Fibonacci numbers of length n and 
# starting value of either 0 or 1
Fib_nums <- function (startingvalue, n) {
  if ( n < 3) {
    return ("Error: n is too short. Choose a value of 3 or more") # Add warning message for n length
  } else {
    Fibonacci_zeros <- rep(startingvalue, n)
    for (i in 3:n) {
      Fibonacci_zeros[i] <- Fibonacci_zeros[i - 1] + Fibonacci_zeros[i - 2]
    } 
    if ( startingvalue == 1) { # Make this work for starting value 1
      return( Fibonacci_zeros )
    } else { 
      Fibonacci_zeros <- rep(startingvalue, n) # Make this work for starting value 0
      Fibonacci_zeros[2] <- 1
      for (i in 3:n) {
        Fibonacci_zeros[i] <- Fibonacci_zeros[i - 1] + Fibonacci_zeros[i - 2]
      } 
      return( Fibonacci_zeros ) 
    }
  }
}

# Test this with some inputs
Fib_nums(0, 2)
Fib_nums(1, 5)
Fib_nums(0, 20)
Fib_nums(1, 50)

# Problem 4a Write a function that takes two numbers as its arguments 
# and returns the square of the difference between them, i.e. (x - y) ^ 2

mySquareFunction <- function (x, y) {
  sqrd <- (x - y) ^ 2
  return ( sqrd )
}

# Demonstrate that your function works by calling it with the numbers 3 and 5.
mySquareFunction(3, 5)
# this returns 4

# Call your function where the first argument is the vector c(2, 4, 6) 
# and the second argument is the number 4
mySquareFunction(c(2, 4, 6), 4)
# this returns 4 0 4, it works! Woohoo!

# Part 4b Write a function of your own that calculates the average of a vector of numbers. 
myAverageFunction <- function (vec) {
  av_vector <- (sum(vec)/length(vec))
  return(av_vector)
}

# Demonstrate that your function works by calling it with 5, 15, 10
myAverageFunction(c(5, 15, 10))
# This returns 10, it works! Yeehaw!

# Demonstrate that your function works by calling it with the data you will find 
# in the "DataForLab07.csv" file found in Sam's Lab07 directory.

# Set working directory
setwd("/Users/bridgetchalifour/Desktop/Grad_School/CompBio/compBioSandbox/CompBio_on_git/Labs/Lab07/")

# Import data
Lab7Data <- read.csv("DataForLab07.csv")

# Make this a vector
Lab7Vector <- as.vector(t(Lab7Data))

# Check that myAverageFunction works with this data
myAverageFunction(Lab7Vector)
# This returns 108.9457, it works! Hooray!

# Part 4c, write a function that gives the sum of squares.
mySumSquaresFunction <- function (input) {
# Find the mean
Average <- myAverageFunction(input)
# Subtract the mean from each of the data points and square the difference
sq.difference <- mySquareFunction(Average, input)
# Sum all these squares
finalSum <- sum(sq.difference)
return (finalSum)
}

# Test if this works with the given data
mySumSquaresFunction(Lab7Vector)
# This returns 179442.4, it works! Ya-hoo!



