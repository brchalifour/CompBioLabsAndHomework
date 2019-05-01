## Investigating Movement Ability and Ecological Specialization in Relation to Phylogeny in European Land Snails

### By Bridget Chalifour

### Biological Question

How do phylogeny and habitat specialization affect the morphology and movement propensity of land snails?

### Context 

This project further investigates the vagility and level of "exploration" in various kinds of terrestrial snails. This comparative analysis studies dispersal between both kinds of feeding strategies (generalists vs. specialists) and the relatedness of these species. Terrestrial snails are severely impacted by anthropogenic land use changes, including expansion of impervious surfaces, land use conversion of preferred microenvironment, and increased instances of habitat fragmentation. Habitat fragmentation is an ongoing and increasingly relevant problem for snails, as they are largely unable to disperse readily if conditions are unfavorable. For example, even a Giant African Land Snail can only disperse a couple kilometers in its lifetime. For more average sized land snails, this number may only be a few meters. 

Terrestrial snails are particularly relevant to conservation research because of their low dispersal rates; since land snails are largely unable to disperse, they become fantastic indicators of the landscape as a whole. Changes that impact landscapes over longer periods of time (for example, effects of climate change, increased human presence in the area, etc.) force these snails to adapt to their changing surroundings instead of simply migrating. In turn, studies like Dahirel et al. (2014) could shed light on how anthropogenic factors like land use change and habitat fragmentation could affect these species.  

### Methods

#### Data Source:

Available through the Dryad repository is a [.txt file ](https://datadryad.org/resource/doi:10.5061/dryad.js5d3)containing the data for this experiment.  This file contains the values recorded for the experiment, categorized by the following column headers (description of headers is partially taken from the README file provided by the authors, but explained further in my own words, only relevant columns to analyses done here given):

1. Species: Snail species name

2. PDI: Paired Difference Index, index ranging from 0 (complete generalist) to 1 (complete specialist); calculated at the species level. These were calculated before the experiment ran, based on the likelihood of finding these species in various habitats (coastal, bog, forest, etc.).

3. is.exploring: this indicates whether the individual snail spent time out of the familiar study area (given value of 1 if yes, 0 if otherwise) 

4. speed_cm_per_min: mean speed during exploration. NA values given for non-exploring snail.	

5. sinuosity: patch sinuosity during exploration. NA for non-exploring snails.	

6. Foot_dry_mass_mg: Feet (tough, muscular appendage used for movement in snails) were dried at 40°C for 3 days before being weighted.

7.  Body_mass_g: Fresh body mass, including shell mass (grams)	

Interpretation of how to use this data was given by the [entire paper by Dahirel et al.](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/1365-2656.12276) I used this paper to guide analyses I wanted to replicate, along with how to transform necessary columns (for example, log-10 transform body mass).

The data were produced by the original controlled experiment by Dahirel et al. Basically, researchers kept these different snail species in controlled environmental boxes, with a specific mat containing needed water and substrates lining the bottom. They then took away the side of the box and recorded which snails were more "adventurous" and explored outside of their known territory. If they did explore, their speed and sinuosity was also recorded. Regardless of exploration propensity, each snail had its habitat specialization levels calculated (PDI, see above), along with physical, morphological features like shell size and foot biomass. 

The Dryad data file is 29.14 kb large, and includes 370 lines of data. 

#### Original Study

The original study ("Movement propensity and ability correlate with ecological specialization in European land snails: comparative analysis of a dispersal syndrome" by Dahirel et al. 2014) aimed to look at the effects of fragmentation in landscapes, and how these might affect habitat generalists or specialists in their movement propensity. Researchers looked at what factors might contribute to a snail's ability to explore new habitats, including the size of its body, its foot, and whether it was a generalist or specialist. 

In order to produce this data, researchers conducted a controlled experiment to create both familiar and unfamiliar habitats for the snails. The familiar area, later referred to as the "patch," was a lining inside the boxes where snails were kept. The patches were saturated with water and filled with a food substance readily eaten by all the species of snails. They then observed whether or not snails would explore unfamiliar territory when this patch was moved outside of the box, and how far and how sinuously the snails moved. If a snail never left the patch, it did not explore, if it did, it was an explorer. They also calculated whether each species of snail was a generalist or specialist, based on the type of habitat (out of 5) that they were found in, and created a paired-differences index to reflect where on the spectrum of generalist/specialist they fell. After the experiment was completed, the researchers took morphological measurements of the snails, which included sacrificing them to obtain their dry weights, of which they were particularly interested in the foot (movement appendage of the snail). Additionally, researchers used DNA sequencing (now deposited into Genbank) to create a phylogenetic tree of the 20 European land snail species used in the controlled experiment. 

#### My Study

My approach in this project was to follow the procedures of the original paper as closely as possible. For example, when certain columns' values needed to be transformed in the original study, I transformed them as well (i.e. log-10 transformations). Per the methods section of the original paper, "For each movement variable, our linear regression models contained two explanatory variables: habitat specialization (PDI) and the species’ mean fresh body mass (log10‐transformed)." I used these same parameters in my regression models. 

Broadly, my approach was to follow the same logical order of analyses as given by the order of figures in the original paper. Since I wanted to easily double check if my analyses were on track with the ones done in the original study, my main goal was to recreate some of the figures given and find the same main trends in the data. One of the main findings in the original paper was that body mass and sinuosity being equal, generalist snails travel faster than specialist ones. To re-test this hypothesis, I ran a least squares regression on the data, then created a data frame of the coefficients to easily see these results. 

Another main finding of the original paper was that as species become more specialized, their foot mass decreases. To test this, I ran a linear regression for log-transformed foot mass against habitat specialization. I then created a plot of this trend to compare with Figure 3 of the original paper. 

Next, I wanted to re-compare the proportion of explorers as a function of habitat specialization (PDI), just as the original study did. The original hypothesis was that generalists (lower PDI) will be more likely to explore than specialists. To accomplish this, I found the proportion of explorers in each of the 20 snail species used. I sorted the data by species to get the total counts of individuals per species and the counts of the explorers. I took the proportion of explorers in each species by dividing the number of explorers per species by total counts of individuals per species. Then, I ran a linear regression looking at habitat specialization and exploration proportion. Again, I plotted this in a graph to compare to an original figure from the paper, Figure 4. 

The novel part of my study came from expanding on the phylogeny briefly mentioned in the original paper. I wanted to group the individuals used into broader taxonomic groups. To do this, I grouped the 20 species into their five respective families, as given by the phylogenetic data provided by Dahirel et al. The first question I asked was "Are members of the same family more likely to be specialists or generalists?" I grouped the data by family and by habitat specialization PDI, then ran a one-way ANOVA to find statistically significant differences between families and their mean PDIs.  I also found their standard deviations in order to create a bar graph to visualize this. The second question I asked was "Are members of the same family more likely to be explorers?" The grouped families and their explorer/non-explorers were put into a new table, allowing me to run a chi-squared test on this data, to elucidate whether there was a significant difference between the expected and observed frequencies of explorers. Another bar graph was made to visualize this.

### Results 

#### Replicated analyses

My findings were consistent with those of Dahirel et al., in terms of the replicated analyses done.

##### Speed as a Function of PDI, Controlling for Sinuousity and log-10-Transformed Body Mass

Since speed is a function of relative size, and snails taking a more tortuous path will be unjustly classified as "slower," it was necessary to control for these variables before running analyses looking at how habitat specialization affect average speed. According to Dahirel et al., the body masses of the snails had to be log-10-transformed, which was also done in my analysis. As snails become more specialized, their speed is significantly reduced, controlling for their log-10 body mass and path sinuosity (with p-values significant to <0.001). With path sinuosity and body mass being equal, habitat generalists are on average faster than specialists. This is consistent with the findings of Dahirel et al. 

##### Foot Biomass and Specialization
 One broad finding that the Dahirel et al. paper found was that foot size was significantly correlated to habitat specialization. As species become more specialized, they have a smaller foot biomass. In my opinion, this is likely due to a specialized radula that is optimized for grazing on specific substrates. However, this may also be due to the fact that specialists are not prone to explore, and do not need to disperse or travel quickly, thus necessitating a larger movement appendage (see below section). My analyses corroborated those of Dahirel et al., showing significantly (p = 0.0192) reduced foot biomass in specialist species. A visualization of this phenomenon is given below in Figure 1:

![Graph of Foot biomass versus Habitat Specialization](https://lh3.googleusercontent.com/sbA9wOcm7DsaKjOHAPg73HZV-yQrmTqoC6dagGsyx6anQSbQEu8sN36oF-E9nkMZGCyMhQD5SInM "Graph of Foot Biomass vs. Habitat Specialization")
###### Figure 1. Analyses of foot biomass vs. habitat show significantly reduced (p = 0.0192) foot size with increasing habitat specialization.

##### Propensity for Exploration and Specialization

Another key finding of Dahirel et al. (2014) was that the proportion of explorers in each of the 20 snail species were significantly correlated with habitat specialization (as measured using Paired Difference Index [PDI] values). Indeed, when plotted as a function of PDI, the proportion of explorers is negatively correlated with the specialization of the species. My analyses corroborated those of Dahirel et al., showing significantly (p = 0.0314) reduced proportions of explorers in specialist species. A visualization of this is given in Figure 2 below:

![Propensity for Exploration vs. Specialization](https://lh3.googleusercontent.com/a82b63K-3HmIg6CBBlA45QGORMYTfUdegVU0hXDOBxy-6cG5fqw1JLcxUVZeI3243JkhLCtu8ewd "Propensity for Exploration vs. Specialization")
###### Figure 2. Analyses for propensity for exploration vs. specialization show significantly reduced (p = 0.0314) likelihood to explore with increased habitat specialization.

#### Novel Analyses

While the authors of this paper did provide a figure that displays the phylogeny of the snail species used, they did not include "relatedness" as a factor that might influence the snails' propensity for movement or their level of specialization. In my investigation, included phylogeny as something that might influence being a generalist/specialist, and if a snail is more or less likely to explore. I used family relationships as an indicator of relatedness, i.e., snails belonging to the same family are closely related. The 20 species were classified into five families based on information given in the Dahirel et al. paper (see below): 

```
snailid2 <- fct_collapse(newsnail$Species,
                         Elonidae = "Elona_quimperiana",
                         Helicidae = c("Helix_pomatia", "Helix_ligata", "Helix_lucorum", "Eobania_vermiculata", "Theba_pisana", "Cepaea_nemoralis", "Cepaea_hortensis", "Cepaea_sylvatica", "Cornu_aspersum", "Arianta_arbustorum"),
                         Helicodontidae = "Helicodonta_obvoluta",
                         Cochlicellidae = "Cochlicella_acuta",
                         Hygromiidae = c("Trochoidea_elegans", "Xeropicta_derbentina", "Cernuella_neglecta", "Trochulus_hispidus", "Monacha_cantiana", "Monacha_cartusiana", "Ciliella_ciliata")
)
```

##### Phylogeny and Specialization

Here, I wanted to test if specialization is a conserved trait within families. Since the snail foot biomass appears to be correlated with habitat specialization, I thought morphology would be relatively conserved within families (families would tend to be bigger/smaller as a whole), and thus they would show significantly different habitat specialization PDI levels across the five families. However, PDI is non-significant across the five families (p-value = 0.313, Figure 3), and so family membership is not a good indicator of habitat preferences and specialization. 

![Family vs. Specialization](https://lh3.googleusercontent.com/a38egxv2i1ZseeSyVew7G-rsUabkX95AahRWMjRLrb7hGwoXy3rAUazGGRIOliPceuSyDCFDSxCF "Family vs. Specialization")
###### Figure 3. Family membership shows no effect on habitat specialization.

##### Phylogeny and Propensity for Exploration

Finally, I wanted to test if the propensity for exploration is a conserved trait within families. Interestingly, there is a significant relationship between family membership and the likelihood of exploring. Different families have significantly different proportions of explorers according to a chi-squared test (see Figure 4). 

![Snail Family vs. Exploration Propensity](https://lh3.googleusercontent.com/VpmpAxiBJi4e-zy1yGHFIdamACqyag18t9l4zZ58YE_-sHTzHIwzuS1LMrOnKZI7gDKobLwNFZFc "Snail Family vs. Exploration Propensity")
###### Figure 4. The proportion of explorers is significantly different based on family membership. 

### Conclusion

My code confirmed the following results from the original Dahirel et al. paper: 

• Specialists had a smaller foot biomass

• Habitat generalists were more likely to explore

• Habitat generalists had a faster exploring speed

Additionally, my novel analyses concluded that the phylogenetic explanatory variable (family) explained that dispersal ability in the form of exploration propensity was a conserved trait among families. However, being a habitat generalist/specialist, which I thought should be conserved trait, was not explained by phylogeny. 

It is worth noting that not all families had the same number of species found within in, for instance, three families only had one species representative. Further studies should include a greater sample size across families to truly elucidate the effects of phylogeny on these parameters. 

This project enabled me to problem-solve how to re-run statistics on another researcher's code from scratch. I also learned how to effectively visually communicate the results I obtained. 

##### References:

Dahirel et al. (2014) Movement propensity and ability correlate with ecological specialization in European land snails: comparative analysis of a dispersal syndrome. Journal of Animal Ecology 84(1) doi: [https://doi.org/10.1111/1365-2656.12276](https://doi.org/10.1111/1365-2656.12276)

> Written with [StackEdit](https://stackedit.io/).
