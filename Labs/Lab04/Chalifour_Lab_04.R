### Chalifour Lab 4 Code ###

# Lab step 1, create a for loop that prints "hi" ten times

hiloop <- 1:10

for (i in hiloop){
  print("hi")
}

# Lab step 2, create a for loop for Tim's money for 8 weeks

# parameters for Tim
weeks <- 1:8
piggy_bank <- 10
allowance <- 5
gum_cost <- 1.34 
gum_bought <- 2
gum_sum <- (gum_cost * gum_bought)

for (i in weeks){
  piggy_bank <- piggy_bank + allowance - gum_sum
  print(piggy_bank)
}

# Lab step 3, create a for loop to demonstrate decreasing population size

#parameters - inital population is 2000 individuals, population is shrinking by 5% per year, for 7 years 
Current_population <- 2000
Decrease_Rate <- 0.95
year <- 1:7

for (i in year){
  Current_population <- Current_population * Decrease_Rate
  print(Current_population)
}

# Lab step 4, use the discrete time logistic growth equation to predict population abundance
# logistic growth equation is n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
# Time points 1 - 12
# t is time
# r is intrinsic growth rate
# K is carrying capacity
# n is population abundance

t <- 1
r <- 0.8
K <- 10000
n <- rep(2500, 12)
end_time <- 12

for (t in 2:end_time){
  # Population_Abundance <- Current_Time_Abundance + (Intrinsic_Growth_Rate * Current_Time_Abundance * (Carrying_Capacity - Current_Time_Abundance)/Carrying_Capacity)
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
}
print(n)

# Lab step 5a, use rep command to make vector of 18 zeros
zero_seq <- rep(0, 18)

# Lab step 5b, write a for loop that stores 3X the ith value in the ith spot of vector from 5a
for ( i in seq(1,18) ) {
  zero_seq[i] <- i * 3
}
print(zero_seq)

# Lab step 5c, re-make a vector of 18 zeros, with first value as 1
zero_seq <- rep(0, 18)
zero_seq[1] <-1

# Lab step 5d, make for loop that gives 1 + (2 * previous entry)
for (i in seq(2,18)) {
   zero_seq[i] <- 1 + (2 * zero_seq[i - 1] )
}
print(zero_seq)

# Lab step 6, create code that makes Fibonacci sequence starting with 0 and going through first 20 numbers
# The Fibonacci sequence begins with 0 and 1, and each subsequent number is the sum of the previous two

Fibonacci_zeros <- rep(0, 20)
Fibonacci_zeros[2] <- 1
show(Fibonacci_zeros)

for (i in seq(3,20)) {
  Fibonacci_zeros[i] <- Fibonacci_zeros[i - 1] + Fibonacci_zeros[i - 2]
}
print(Fibonacci_zeros)

# Lab step 7 - redo of lab step 4
# use parameters to pre-allocate data storage
abundance <- rep(2500, 12)
time <- 1:12
# Use the discrete time logistic growth equation to predict population abundance
# logistic growth equation is n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
# Time points 1 - 12
# t is time
# r is intrinsic growth rate
# K is carrying capacity
# n is population abundance

t <- 1
r <- 0.8
K <- 10000
n <- abundance
end_time <- 12

for (t in 2:end_time){
  # Population_Abundance <- Current_Time_Abundance + (Intrinsic_Growth_Rate * Current_Time_Abundance * (Carrying_Capacity - Current_Time_Abundance)/Carrying_Capacity)
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
}
print(n)
abundance <- n

# plot times 1-12 against their abundances
plot(time, abundance)

