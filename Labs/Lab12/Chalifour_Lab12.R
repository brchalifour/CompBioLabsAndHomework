### Chalifour Lab 12 Script ###

# Load necessary libraries 

library(dplyr)
library(ggplot2)

# Attach data

AnimalData <- read.csv("~/Desktop/Grad_School/CompBio/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")

head(AnimalData)

# Sort data and get counts per species

NewAnimals <- AnimalData %>% 
  group_by(Species) %>%
  tally()

# Problem 1 Create graph - this makes the one with the impossible to read x axis

CountAnimals <- ggplot(data = NewAnimals, aes(x = Species, y = n)) + geom_bar(stat="identity") + xlab("Species") + ylab("Count")

CountAnimals

# Problem 2 Create graph with horizontally rotated x-axis ticks

CountAnimalsCorrect <- ggplot(data = NewAnimals, aes(x = Species, y = n)) + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + xlab("Species") + ylab("Count")

CountAnimalsCorrect

# Problem 3 - flip the axes, sort the species from least to most abundant in the plot, 
# and also transform the count axis to be logarithmic so that you can see the smaller count values more easily.

OrderedCounts <- ggplot(NewAnimals, aes(x = reorder(Species, -n), y = n)) + geom_bar(stat = "identity") + coord_flip() + scale_y_continuous(trans='log10') + xlab("Species") + ylab("Count")

OrderedCounts







