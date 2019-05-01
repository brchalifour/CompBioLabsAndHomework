### Chalifour Independent Project ###

# Load necessary libraries/packages

# Used for "unfactor" function
install.packages("varhandle")
library(varhandle)

# Used for creating visual plots
library(ggplot2)
library(wesanderson)
library(scales) 

# Used for various functions
library(dplyr)
library(plyr) 

# Used for combining levels
library(tidyverse)

# Set working directory 
setwd("Grad_School/CompBio/CompBioLabsAndHomework/Assignments/Independent_Project/")

# Download Dryad Data from Dahirel et al. 2014, read into R
snailmvmt <- read.table("raw_individual_synthetic_data.txt")
  
# Check out file, make sure it imported correctly
head(snailmvmt)

# Read in column names
colnames(snailmvmt) <- c("Species", "PDI", "Box", "ID", "is.exploring", "speed_cm_per_min", "Sinuousity", "Body_mass_g", "Shell_size_cm", "Foot_dry_mass_mg")

# Delete redundant row 
newsnail <- snailmvmt[-c(1), ]
head(newsnail)

# Change appropriate variables back into numeric vectors (all but Species, Box, ID)
BodyMass <- newsnail$Body_mass_g
NewBodyMass <- unfactor(BodyMass)

PDI <- newsnail$PDI
NewPDI <- unfactor(PDI)

Speed <- newsnail$speed_cm_per_min
NewSpeed <- unfactor(Speed)

Sinuousity <- newsnail$Sinuousity
NewSinuousity <- unfactor(Sinuousity)

shellSize <- newsnail$Shell_size_cm
newShellSize <- unfactor(shellSize)

footMass <- newsnail$Foot_dry_mass_mg
newFootMass <- unfactor(footMass)

explorers <- newsnail$is.exploring
newExplorers <- unfactor(explorers)

newsnail$Foot_dry_mass_mg <- newFootMass
newsnail$Shell_size_cm <- newShellSize
newsnail$Sinuousity <- NewSinuousity
newsnail$speed_cm_per_min <- NewSpeed
newsnail$PDI <- NewPDI
newsnail$Body_mass_g <- NewBodyMass
newsnail$is.exploring <- newExplorers

# Check that these are now numeric
str(newsnail)

# Body mass and footdry mass both need to be log-10 transformed, to follow the procedures of the paper

logBodyMass <- log10(NewBodyMass)
newsnail$Body_mass_g <- logBodyMass

logFootMass <- log10(newFootMass)
newsnail$Foot_dry_mass_mg <- logFootMass

# Check that these transformations worked
head(newsnail)
head(NewBodyMass)
head(logBodyMass)

# Per Dahirel et al's Methods section:
# For each movement variable, our linear regression models contained two explanatory variables: 
# habitat specialization (PDI) and the species’ mean fresh body mass (log10‐transformed).

NASpeed <- !is.na(NewSpeed)
NA_in_speed <- which(NASpeed)
NA_in_speed

# Run least squares regression comparing speed to PDI and body mass
model <- lm(NewSpeed[NA_in_speed]~PDI[NA_in_speed] + logBodyMass[NA_in_speed] + NewSinuousity[NA_in_speed], data = newsnail)
summary(model)

# Create data frame with relevant values from least squares regression
Least_sq_reg_speed_DF <- data.frame(summary(model)$coefficients)
view(Least_sq_reg_speed_DF)

# Interpretation: As snails become more specialized, their speed is significantly reduced, controlling for their log-10 body mass and path sinuosity.
# P-values significant to <0.001
# Consistent with paper? Yes

# run linear regression for log-transformed foot mass against habitat specialization (PDI)
foot_vs_PDI <- lm(Foot_dry_mass_mg ~ PDI, data = newsnail)
summary(foot_vs_PDI)

# Interpretation: As species become more highly specialized, their foot mass decreases (they have smaller feet)
# Consistent with papers conclusions? Yes, significant to p-value < 0.05. 

# Plot log-transformed foot mass against PDI, compare trends to paper
ggplot(newsnail, aes(x = PDI, y = Foot_dry_mass_mg)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "#046C9A") + 
  labs(title="Log-Transformed Foot Size vs. Habitat Specialization", x="Habitat Specialization (PDI)", y = "Foot Dry Mass (mg)") + theme_minimal()

# Compare the proportion of explorers as a function of habitat specialization (PDI)
# Hypothesis: generalists (lower PDI) will be more likely to explore. 

# Find proportion of explorers for each of 20 species

# sort data by Species and whether or not they explored to get counts
NewSpecies_explorers <- newsnail %>% 
  group_by(Species, is.exploring) %>%
  tally()

# sort data by Species to get total number of counts per Species
NewSpecies <- newsnail %>%
  group_by(Species) %>%
  tally()

# Take proportion of explorers per species, divide by total counts of species to get proportion

Prop_A <- NewSpecies_explorers[2, 3]/NewSpecies[1,2]
Prop_B <- NewSpecies_explorers[4, 3]/NewSpecies[2,2]
Prop_C <- NewSpecies_explorers[6, 3]/NewSpecies[3,2]
Prop_D <- NewSpecies_explorers[8, 3]/NewSpecies[4,2]
Prop_E <- NewSpecies_explorers[10, 3]/NewSpecies[5,2]
Prop_F <- NewSpecies_explorers[12, 3]/NewSpecies[6,2]
Prop_G <- NewSpecies_explorers[14, 3]/NewSpecies[7,2]
Prop_H <- NewSpecies_explorers[16, 3]/NewSpecies[8,2]
Prop_I <- NewSpecies_explorers[18, 3]/NewSpecies[9,2]
Prop_J <- NewSpecies_explorers[20, 3]/NewSpecies[10,2]
Prop_K <- NewSpecies_explorers[22, 3]/NewSpecies[11,2]
Prop_L <- NewSpecies_explorers[24, 3]/NewSpecies[12,2]
Prop_M <- NewSpecies_explorers[26, 3]/NewSpecies[13,2]
Prop_N <- NewSpecies_explorers[28, 3]/NewSpecies[14,2]
Prop_O <- NewSpecies_explorers[30, 3]/NewSpecies[15,2]
Prop_P <- NewSpecies_explorers[32, 3]/NewSpecies[16,2]
Prop_Q <- NewSpecies_explorers[34, 3]/NewSpecies[17,2]
Prop_R <- NewSpecies_explorers[36, 3]/NewSpecies[18,2]
Prop_S <- NewSpecies_explorers[38, 3]/NewSpecies[19,2]
Prop_T <- NewSpecies_explorers[40, 3]/NewSpecies[20,2]

# Create new list
Explorer_Prop <- c(Prop_A, Prop_B, Prop_C, Prop_D, Prop_E, Prop_F, Prop_G, Prop_H, Prop_I, Prop_J, Prop_K, Prop_L, Prop_M, Prop_N, Prop_O, Prop_P, Prop_Q, Prop_R, Prop_S, Prop_T)

# Turn list into vector
Explorer_Vec <- unlist(Explorer_Prop, use.names=FALSE)

# Narrow down PDI values to per species values
NewPDItable <- newsnail %>%
  group_by(Species, PDI) %>%
  tally()

# Create new data frame to merge PDI and explorer proportion 
Prop_DF <- data_frame("Explorers" = Explorer_Vec, "PDI" = NewPDItable$PDI)

# Run linear regression
explorers_vs_PDI <- lm(Explorer_Vec ~ NewPDItable$PDI, data = newsnail)
summary(explorers_vs_PDI)

# Interpretation: As species become more highly specialized, the proportion of members 
# who explored outside familiar territory decreased
# Consistent with Dahirel et al. 2014? Yes.
# Generalists are more likely to explore, and do so significantly more than specialists (p-value > 0.05)

# Create plot to show relationship, compare with published plot. Consistent results. 
ggplot(Prop_DF, aes(x = PDI, y = Explorers)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "#5BBCD6") + labs(title="Propensity for Exploration vs. Specialization", 
                                                        x="Habitat Specialization (PDI)", y = "Proportion of Explorers") + theme_minimal()

# Assign species to their families, per Fig. 2 of Dahirel et al. 2014
# Sort Members by Family to elucidate effects of phylogeny
snailid2 <- fct_collapse(newsnail$Species,
                         Elonidae = "Elona_quimperiana",
                         Helicidae = c("Helix_pomatia", "Helix_ligata", "Helix_lucorum", "Eobania_vermiculata", "Theba_pisana", "Cepaea_nemoralis", "Cepaea_hortensis", "Cepaea_sylvatica", "Cornu_aspersum", "Arianta_arbustorum"),
                         Helicodontidae = "Helicodonta_obvoluta",
                         Cochlicellidae = "Cochlicella_acuta",
                         Hygromiidae = c("Trochoidea_elegans", "Xeropicta_derbentina", "Cernuella_neglecta", "Trochulus_hispidus", "Monacha_cantiana", "Monacha_cartusiana", "Ciliella_ciliata")
)

# Assign families to previous dataset
newsnail$Species <- snailid2

# Are members of the same family more likely to be specialists or generalists?

# Group data by family and PDI
Family_PDI <- newsnail %>%
  group_by(Species, PDI) %>%
  tally()

# One-way ANOVA to find statistically significant differences between family mean PDI
summary(aov(lm(PDI~Species, data = Family_PDI)))

# Conclusions: Family is not a predictor of habitat specialization (PDI). 
# P-value of 0.313
# Across all five families, mean PDI was relatively the same, and not statistically significant. 

# Pairwise comparisons
TukeyHSD(aov(lm(PDI~Species, data = Family_PDI)))

# Get mean PDI, standard deviation per family
# Write function (this is not my original function, definitely had the help of Google on this part) 
# see http://www.sthda.com/english/wiki/ggplot2-error-bars-quick-start-guide-r-software-and-data-visualization#barplot-with-error-bars
data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

# Use function to get means/sds
df2 <- data_summary(Family_PDI, varname="PDI", groupnames="Species")
head(df2)

# Plot family vs. PDI in a bar plot with error bars
ggplot(df2, aes(x = Species, y = PDI, fill = Species)) + 
  geom_bar(stat = "identity") + 
  scale_fill_manual(values=wes_palette(n=5, name="Darjeeling1")) +
  geom_errorbar(aes(ymin=PDI, ymax=PDI+sd), width=.2,
                position=position_dodge(.9)) +
  labs(title="Snail Family vs. Specialization", 
       x="Snail Family", y = "Habitat Specialization (PDI)", fill = "Family") +
  guides(fill=FALSE) +
  annotate(geom="text", x=1.5, y=0.9, label="P-value = 0.313",
           color="black")

# Is being an explorer (propensity to explore unfamiliar areas) a conserved trait within families? 

# Create new table of families and explorers/non-explorers
Family_Explorers <- newsnail %>%
  group_by(Species, is.exploring) %>%
  tally()

# Turn list into vector
Family_Prop_Vec <- unlist(Family_Prop, use.names=FALSE)

# Create new data frame to merge PDI and explorer proportion 
Family_Prop_DF <- data_frame("Explorers" = Family_Prop_Vec, "Family" = unique(Family_Explorers$Species))

# Create new table showing Family and exploration propensity 
# This will allow me to run a chi-squared test
Fam_Explore_Prop_Tb <- table(newsnail$Species, newsnail$is.exploring)
Snail_sums_by_fam <- rowSums(Fam_Explore_Prop_Tb)

# Delete insignificant row from table
New_fam_explore <- Fam_Explore_Prop_Tb[-c(6), ]

# Chi-square test
chisq.test(New_fam_explore)

# Different families have significantly different proportions of explorers
# P-value of 0.00012
# The tendency to explore may be a conserved trait 

# Find proportions of each family that are explorers
Heli_explorers <- New_fam_explore[6]/Snail_sums_by_fam[1]
Hygr_explorers <- New_fam_explore[7]/Snail_sums_by_fam[2]
Coch_explorers <- New_fam_explore[8]/Snail_sums_by_fam[3]
Hekicodont_explorers <- New_fam_explore[9]/Snail_sums_by_fam[4]
Helicod_explorers <- New_fam_explore[10]/Snail_sums_by_fam[5]

# Create vector of family explorer proportions
Fam_Explore_Prop_Vec <- c(Heli_explorers, Hygr_explorers, Coch_explorers, Hekicodont_explorers, Helicod_explorers)

# Create data frame to use in bar plot
Fam_Explore_DF <- data_frame("Proportion" = Fam_Explore_Prop_Vec, "Family" = unique(Family_Explorers$Species))

# Create bar plot to visually show families vs. their proportion of explorers
ggplot(Fam_Explore_DF, aes(x = Family, y = Proportion, fill = Family)) + 
  geom_bar(stat = "identity") + 
  scale_fill_manual(values=wes_palette(n=5, name="Darjeeling2")) +
  labs(title="Snail Family vs. Exploration Proportion", 
       x="Snail Family", y = "Proportion of Explorers", fill = "Family") +
  scale_y_continuous(labels=percent) + guides(fill=FALSE) +
  theme_minimal() +
  annotate(geom="text", x=4.5, y=0.55, label="P-value = 0.00012",
           color="black")



