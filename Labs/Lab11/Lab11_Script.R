### Chalifour Lab 11 April 5th 2019 ###

# load necessary packages
library(tidyverse)
library(dplyr)

# read in data file
WoodData <- read.csv("Grad_School/CompBio/CompBioLabsAndHomework/Labs/Lab11/GlobalWoodDensityDatabase.csv", stringsAsFactors = FALSE)

# It turns out there is one entry (out of 16468) in the data for which there is no density entered. It will import as NA.
# 4a. Which row is it?

NAValue <- which(is.na(WoodData), arr.ind = TRUE)
NAValue
# Row 12150  is the NA value

# 4b. Remove that row from the data frame (there are several ways to do this)

WoodDataClean <- WoodData[-c(12150), ]

# 5. Dealing with one kind of pseudo-replication
# Starting with your result from problem 4b, create a new data frame that:

# has each species listed only once,
# has the Family and Binomial information for each species, and
# has the mean of the Density measurements for each species

NewWood <- WoodDataClean %>% 
  group_by(Binomial, Family) %>%
  summarise(Mean_density = mean(Wood.density..g.cm.3...oven.dry.mass.fresh.volume))

# The goal of this problem is to figure out which families of trees have the greatest and least densities

# 6a. Make a new data frame that has the average density for each Family (and no longer has individual species).

NewerWood <- NewWood %>%
  group_by(Family) %>%
  summarise(Mean_Density = mean(Mean_density))

# 6b. Sort the result of problem 6a by MeanDensity (and store the sorted result in a data frame).

byDensityWood <- NewerWood %>% 
  arrange(Mean_Density)

# 6c. Using your results from problem 6b:
 
# What are the 8 families with the highest average densities?

high_average <- tail(byDensityWood, n = 8)
high_families <- high_average$Family
high_densities <- NewWood$Family %in% high_families
high_density_values <- NewWood$Mean_density[high_densities]
high_density_values

# What are the 8 families with the lowest average densities?

low_average <- head(byDensityWood, n = 8)
low_families <- low_average$Family
low_densities <- NewWood$Family %in% low_families
low_density_values <- NewWood$Mean_density[low_densities]
low_density_values

# Part III. Plotting

# load necessary libraries

library(ggplot2)

#Highest Density plotting

high_dens_fam <- NewWood$Family[high_densities]
HighWood <- data_frame("Family" = high_dens_fam, "Density" = high_density_values)
HighWood

family_plots_high <- ggplot(HighWood, aes(x = Family, y = Density) ) + geom_boxplot() + facet_wrap(facets = ~Family, scale="free") + ylab("Density (g/cm^3)")
family_plots_high

# Lowest Density Plotting
low_dens_fam <- NewWood$Family[low_densities]
LowWood <- data_frame("Family" = low_dens_fam, "Density" = low_density_values)

family_plots_low <- ggplot(LowWood, aes(x = Family, y = Density) ) + geom_boxplot() + facet_wrap(facets = ~Family, scale="free") + ylab("Density (g/cm^3)")
family_plots_low

# 8. Facilitating comparisons with graphics.

# High density
family_plots_high_condensed <- ggplot(HighWood, aes(x = Family, y = Density) ) + geom_boxplot() + coord_flip() + ylab("Density (g/cm^3)")
family_plots_high_condensed

# Low density
family_plots_low_condensed <- ggplot(LowWood, aes(x = Family, y = Density) ) + geom_boxplot() + coord_flip() + ylab("Density (g/cm^3)")
family_plots_low_condensed





