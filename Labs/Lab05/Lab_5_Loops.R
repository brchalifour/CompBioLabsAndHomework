### Bridget Chalifour, Lab 5: Loops and Conditionals ###

## Part One ##

# Create a variable, x, and use if-else to check its value

x <- 8

# If-else statement, if x > 5, prints "result is bigger than 5"

if ( x > 5) {
  print ("result is bigger than 5")
} else {
  print ("result is smaller than 5")
}

# Set working directory
getwd()
setwd("/Users/bridgetchalifour/Desktop/Grad_School/CompBio/compBioSandbox/CompBio_on_git/Labs/Lab05/")

# Import Vector1 data 
Labdata <- read.csv("Vector1.csv")

# Change data frame into vector
LabVector <- as.vector(t(Labdata))
str(LabVector)
VecRows <- nrow(Labdata)

# Check vector data for negative numbers and replace with "NA" 
for ( i in 1:length(LabVector) ) {
  if ( LabVector[i] < 0 ) {
    LabVector[i] <- NA
  } 
}
print(LabVector)

# Use logical indexing to replace NA values with NaN
LabVector[is.na(LabVector)] <- NaN

# Use which() statement and integer indexing to replace NaN values with 0
ZeroVec <- which(is.nan(LabVector))
LabVector[ZeroVec] <- 0

# Determine how many of the values from the imported data fall in the range between 50 and 100 
# (inclusive of those endpoints).
Low <- 50
High <- 100
RangeValues <- which( LabVector >= Low & LabVector <= High)
RangeValues

# create a new vector of data that has all the values from the imported data that fall in the range between 50 and 100. 
# Do NOT dynamically grow the array, however. 
# This vector should be named "FiftyToOneHundred"

FiftyToOneHundred <- (LabVector[RangeValues])
str(FiftyToOneHundred)

# Save range values to a .csv file
getwd()
setwd("/Users/bridgetchalifour/Desktop/Grad_School/CompBio/CompBioLabsAndHomework/Labs/Lab05/")
write.csv (x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

# Import CO2 Data from Week 4
setwd("/Users/bridgetchalifour/Desktop/Grad_School/CompBio/compBioSandbox/CompBio_on_git/Labs/Lab04/")
CarbonData <- read.csv("CO2_data_cut_paste.csv")
str(CarbonData)

# What was the first year for which data on "Gas" emissions were non-zero?
NonZeroGas <- which( CarbonData$Gas > 0)

# the first non-zero gas was in row 135
CarbonData$Year[135]

# the first non-zero gas year was 1885
print(CarbonData$Year[135])

# During which years were "Total" emissions between 200 and 300 million metric tons of Carbon?

LowCarbon <- 200
HighCarbon <- 300
BetweenCarbon <- which ( CarbonData$Total >= LowCarbon & CarbonData$Total <= HighCarbon)
CarbonData$Year[BetweenCarbon]

# Between 1879 and 1887 emissions were between 200 and 300 million metric tons of Carbon

## Part Two ##


# this is my model
### n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1]) - prey abundance
### p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1]) - pred abundance


# Set parameters for Lotka-Volterra model

totalGenerations <- 1000
initPrey <- 100 # initial prey abundance at time t =1 
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

# Create a time vector
TimeVec <- 1:totalGenerations

# Set up storage for abundance results
n <- rep(0, totalGenerations)
p <- rep(0, totalGenerations)

n[1] <- initPrey
p[1] <- initPred

# Write for loop to implement calculations, account for negative values
for (t in 2:length(TimeVec)) {
  n[t] <- ifelse(n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1]) < 0, 0, n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1]))
  p[t] <- ifelse(p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1]) < 0, 0, p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1]))
}
print(n)
print(p)


# Plot resulting abundances in graph
plot(x = TimeVec, y = n, col = "palegreen3", xlab = "Generation", ylab = "Abundance", type = "l")
lines(x = TimeVec, y = p, col = "royalblue3", type = "l")

# Create a matric of results called "myResults" and add to Lab05 folder

myResults <- data.frame(TimeStep = TimeVec, PreyAbundance = n, PredAbundance = p)
write.csv(myResults, "~bridgetchalifour/Desktop/Grad_School/CompBio/CompBioLabsAndHomework/Labs/Lab05/Lab5Results.csv", row.names = FALSE)





