### Bridget Chalifour Lab 9 ###

#set working directory
setwd("~/Desktop/Grad_School/CompBio/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al/")

#import data
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# try some stuff out just to look at it
?strptime

camData$DateTime
unique(camData$DateTime)

# test on subset of values
smallVec <- camData$DateTime[1:5]
strptime(smallVec, "%d/%m/%Y %H:%M", tz = "Africa/Dar_es_Salaam")

# use on real data
newTimes <- strptime(camData$DateTime, "%d/%m/%Y %H:%M", tz = "Africa/Dar_es_Salaam")

# Problem 2 - Find bad year values that need to be replaced

#sort out times by year - will give you the bad values first
sortedTimes <- (sort(newTimes))
#check out many entries are bad
numBadTimes <- which(sortedTimes < "0015-01-01")
length(numBadTimes)
head(numBadTimes)

sortedTimes[5640:5650]

#Problem 3 - create accurate vector of dates and times

#replace bad years with correct years
betterTimes <- gsub("0013", "2013", sortedTimes)
#check
head(betterTimes)
#replace again for 2014
evenBetterTimes <- gsub("0014", "2014", betterTimes)
evenBetterTimes[5640:5650]
sortedBetterTimes <- sort(evenBetterTimes)

sortedBetterTimes[5640:5660]

#however, this totally messes up the order! So just find and replace within the first corrected date variable

newerTimes <- gsub("0013", "2013", newTimes)
bestTimes <- gsub("0014", "2014", newerTimes)

#check if this worked against the data sheet
bestTimes[10863:10866]
bestTimes[11070]

#replace the old column in the dataframe with the new, improved column
camData$DateTime <- bestTimes
#check if this works
head(camData)

# Problem 4 - tackling average time between observations for a given season, station, and species
# try using dry, 29, giraffe
Dry29Giraffe <- camData[camData$Season == "D" &camData$Station == "29"& camData$Species == "Giraffe", ]
DryDates <- Dry29Giraffe$DateTime
DryLength <- length(DryDates)

timesfill <- rep(0, DryLength)

for (i in 1:DryLength) {
  recent_time <- DryDates[i + 1]
  earlier_time <- DryDates[i]
  timesfill <- difftime(recent_time,earlier_time)
}
print(timesfill)
