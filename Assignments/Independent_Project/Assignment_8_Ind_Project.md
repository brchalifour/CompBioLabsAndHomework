
# Using Dryad Data to Investigate Movement Ability and Ecological Specialization in Relation to Phylogeny in European Land Snails

## By Bridget Chalifour

### Overview
In this project, I would like to further investigate the vagility and level of "exploration" in various kinds of terrestrial snails. This comparative analysis dispersal between both kinds of feeding strategies (generalists vs. specialists) and the relatedness of these species is interesting to me, as I also study land snails. I am particularly interest in terrestrial species because of their low dispersal rates; since land snails are largely unable to disperse, they become fantastic indicators of the landscape as a whole. Changes that impact landscapes over longer periods of time force these snails to adapt to their changing surroundings instead of simply migrating. I think the use of snails are biological indicators is underutilized, and working with the data in this study could help me understand how and why they explore new habitats. In turn, this could shed light on how anthropogenic factors like land use change and habitat fragmentation could affect these species.  

### Original Study

#### Goals

The original study ("Movement propensity and ability correlate with ecological specialization in European land snails: comparative analysis of a dispersal syndrome" by Dahirel et al. 2014) aimed to look at the effects of fragmentation in landscapes, and how these might effect habitat generalists or specialists in their movement propensity. Habitat fragmentation is an ongoing and increasingly relevant problem for snails, as they are largely unable to disperse readily if conditions are unfavorable. For example, even a Giant African Land Snail can only disperse a couple kilometers in its lifetime. For more average sized land snails, this may only be a few meters. Researchers looked at what factors might contribute to a snail's ability to explore new habitats, including the size of its body, its foot, and whether it was a generalist or specialist. 

#### Methods

In order to produce this data, researchers conducted a controlled experiment to create both familiar and unfamiliar habitats for the snails. The familiar area, later referred to as the "patch," was a lining inside the boxes where snails were kept. The patches were saturated with water and filled with a food substance readily eaten by all the species of snails. They then observed whether or not snails would explore unfamiliar territory when this patch was moved outside of the box, and how far and how sinuously the snails moved. If a snail never left the patch, it did not explore, if it did, it was an explorer. The researchers also did a genomic phenology study on the snails, which they did not work with on the movement data (this is something I'd like to explore). They also calculated whether each species of snail was a generalist or specialist, based on the type of habitat (out of 5) that they were found in, and created a paired-differences index to reflect where on the spectrum of generalist/specialist they fell. After the experiment was completed, the researchers took morphological measurements of the snails, which included sacrificing them to obtain their dry weights, of which they were particularly interested in the foot (movement appendage of the snail). 

#### Data Types

Available through the Dryad repository is a .txt file containing the data for this experiment.  This file contains the values recorded for the experiment, categorized by the following column headers (description of headers is partially taken from the README file provided by the authors, but explained further in my own words):

1. Species: Snail species name

2. Box: Box identifier

3. Id: Individual snail identifier

4. PDI: Paired Difference Index, index ranging from 0 (complete generalist) to 1 (complete specialist); calculated at the species level. These were calculated before the experiment ran. 

5. is.exploring: this indicates whether the individual snail spent time out of the familiar study area (given value of 1 if yes, 0 if otherwise) 

6. speed_cm_per_min: mean speed during exploration. NA values given for non-exploring snail.	

7. sinuosity: patch sinuosity during exploration. NA for non-exploring snails.	

8. Body_mass_g: Fresh body mass, including shell mass (grams)	

9. Shell_size_cm: Shell greatest dimension (methods for how this was calculated were not given, I am assuming it is the diameter of the widest point of the shell)	

10. Foot_dry_mass_mg: Feet (tough, muscular appendage used for movement in snails) were dried at 40°C for 3 days before being weighted.

#### Data Size

The data file is 29.14 kb large, and include 370 lines of data. 

#### Potential Problems

The first problem is that the data is in a .txt format. This will have to be changed to a .csv file to make it compatible with RStudio. There are also a number of NA values for the speed and sinuosity measures, given that those are only applicable to exploring snails. Since larger snails have an automatic advantage, speed, for example, will have to be standardized based on the size of the snail. One last problem is that I would like to look at the relatedness of these species and if more closely related species are more likely to explore. This data is not given as a data set, and thus I will have to create a new column in the file based on information in the text of the manuscript. 

#### Biological Significance

I believe this has largely already been covered, but body mass, shell size, and foot dry mass all relate to the morphology of the snails, and must be accounted for since larger snails will automatically have an advantage in movement. Species PDI relates to if the species can and does exist in a multitude of habitats (generalists) or only one species habitat (specialist).  Box and ID relate to experimental design, and not directly to biology. 

### My Study

In my interpretation of this study, I would like to figure out how these calculations and conclusions were drawn based on the data given. I would like to make sure I can draw the same conclusions based on the data, taking into account factors that require normalization. These calculations include looking at the effects of body size measurements on whether a species is a generalist or a specialist, i.e. is a species with a larger foot more likely to be a generalist, and one with a smaller foot more likely to be a specialist? Along with this, does being a generalist make a snail more likely to explore, since it is willing and able to survive in a variety of habitat types? If so, what kind of speed and path will they take to do so? Are explorers faster than non-explorers, even when their body measurements are standardized? 

While the authors of this paper did provide a figure that displays the phylogeny of the snail species used, they did not include "relatedness" as a factor that might influence the snails' propensity for movement. In my investigation, I would like to include phylogeny as something that might influence being a generalist/specialist, and if a snail is more or less likely to explore. To do this, I will have to decide how I will create a "relatedness" variable, if this will be a factor or numerical value based on calculations. Then, I will compare the previously given measurements (Species PDI, if the species explores, if so, how quickly) to see if more closely related species share common characteristics, or if these are species-specific and phylogeny has no direct effect. 

#### Sources

[Link to original data through Dryad](https://datadryad.org/resource/doi:10.5061/dryad.js5d3)


[Link to entire paper by Dahirel et al.](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/1365-2656.12276) 

