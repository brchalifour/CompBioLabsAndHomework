### Bridget Chalifour Lab 08 ###

# Redo of lab step 4 from Lab04 code - turn into a function 

logisticgrowth <- function ( r, K, time, init_pop) {
  
#function that takes r (the intrinsic growth rate), K (the carrying capacity), the total number of generations, and the initial population size as its arguments.

abundance <- rep(init_pop, time) # use parameters to pre-allocate data storage
generations <- 1:time


# Use the discrete time logistic growth equation to predict population abundance
# logistic growth equation is n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
# Time points 1 - generation number
# t is time
# r is intrinsic growth rate
# K is carrying capacity
# n is population abundance

t <- 1
n <- abundance
end_time <- length(generations)

for (t in 2:end_time) {
  # Population_Abundance <- Current_Time_Abundance + (Intrinsic_Growth_Rate * Current_Time_Abundance * (Carrying_Capacity - Current_Time_Abundance)/Carrying_Capacity)
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
}
abundance <- n
(plot(generations, abundance)) # plot times 1-generations against their abundances
return ( data.frame(Generations = generations, Abundance = abundance)) # return a data frame of results
} 

# Test with the old parameters to check if the new function works
myLogisticResults <- logisticgrowth( 0.8, 10000, 12, 2500 )

write.csv(myLogisticResults, "~bridgetchalifour/Desktop/Grad_School/CompBio/CompBioLabsAndHomework/Labs/Lab08/Lab8Results.csv", row.names = FALSE)

