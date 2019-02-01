###Lab 3 R Script - Star Wars Binge-Watching Party###

#lab step #3 define variables for bags of chips and number of guests
chip_bags <- 5
guests <- 8

#lab step #5 define variable for expected chip bags eaten per guest
chips_per_guest <- 0.4

#lab step #7 calculating the expected amount of leftover chips
guests * chips_per_guest
expected_eaten_chips <- guests * chips_per_guest
chip_bags - expected_eaten_chips

#lab step #8 create rankings as vectors for each of the seven movies. As an additional note to self, dump Lenny as a friend. He is clearly an idiot with no taste.
Self_rankings <- c(7, 6, 5, 1, 2, 3, 4)
Penny_rankings <- c(5, 7, 6, 3, 1, 2, 4)
Jenny_rankings <- c(4, 3, 2, 7, 6, 5, 1)
Lenny_rankings <- c(1, 7, 3, 4, 6, 5, 2)
Stewie_rankings <- c(6, 7, 5, 4, 3, 1, 2)

#Lab step #9 Using indexing to store Penny's ranking of Episode IV, and Lenny's rank of Episode IV
PennyIV <- Penny_rankings[4]
LennyIV <- Lenny_rankings[4]

#Lab step #10 Concatenate all friends' rankings into new object
Concatenated_rankings <- cbind(Self_rankings, Penny_rankings, Jenny_rankings, Lenny_rankings, Stewie_rankings)

#Lab step #11 Use str() to look at PennyIV, Penny_rankings, and step #10
str(PennyIV)
str(Penny_rankings)
str(Concatenated_rankings)

# PennyIV has a numeric value of 3, Penny_rankings is a vector with 7 values of 5, 7, 6, 3, 1, 2, 4, and Concatenated_rankings is a combination of 7 rows and 5 columns consisting of the 5 friends and their associated vector rankings of the 7 movies

#Lab step #12 Make data frames using the 5 vectors of rankings (first create variable with all rankings to make life easier)
all_rankings <- cbind(Self_rankings, Penny_rankings, Jenny_rankings, Lenny_rankings, Stewie_rankings)
first_data_frame_rankings <- data.frame(all_rankings, row.names = NULL, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
second_data_frame_rankings <- as.data.frame(all_rankings, row.names = NULL, optional = FALSE)

#The step 12 data frame method gives me 7 observations of 5 variables, like a list, and literally it creates a dataframe from the named columns. 
#The difference between data.frame and as.data.frame is that as.data.frame "coerces" other object into being a data frame, whereas data.frame creates a new data frame from scratch. 
#The concatenated ratings using cbind() gives me a matrix that combines the vectors I specify into columns (cbind = column bind, would use rbind for rows). It is two-dimensional.  
#I believe another difference between data frames and cbind is that data frames can contain different types of vectors, not just one type like numeric, since it is a collection of variables. 
str(first_data_frame_rankings)
dim(first_data_frame_rankings)
typeof(first_data_frame_rankings)
typeof(Concatenated_rankings)

#Lab step #14 make a vector out of the Episode Names
Episode_names <- c("I", "II", "III", "IV", "V", "VI", "VII")

#Lab step #15 make a new data frame with column AND row names and adjust the cbind matrix to have names
row.names(Episode_names)
colnames(all_rankings) <- c("Self", "Penny", "Jenny", "Lenny", "Stewie")
row.names(all_rankings) <- c("I", "II", "III", "IV", "V", "VI", "VII")
data_frame_named <- data.frame(all_rankings, row.names = Episode_names, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
Concatenated_rankings <- cbind(all_rankings)

#Lab step #16 Accessing third row of matric from step #10
Concatenated_rankings[3,]

#Lab step #17 accessing the fourth column from step #12
data_frame_named[,4]

#Lab step #18 access self ranking for Episode V
data_frame_named[5,1]

#Lab step #19 access Penny's ranking for Episode II
data_frame_named[2,2]

#Lab step #20 access everyone's rankings for episodes IV-VI
data_frame_named[4:6, ]

#Lab step #21 access everyone's rankings for episodes II, V, and VII
data_frame_named[c(2, 5, 7), ]

#Lab step #22 access ranking for Penny, Jenny, and Stewie for episodes IV and VI
data_frame_named[c(4, 6), c(2, 3, 5)]

#Lab step #23 switch Lenny's rankings for Episodes II and V
stored_ranking_two <- data_frame_named[2,4]
data_frame_named[2,4] = data_frame_named[5,4]
data_frame_named[5,4] = stored_ranking_two

#check out if that actually works
View(data_frame_named)

#Lab step #24 practice with accessing values by names
data_frame_named["III", "Penny"]
Concatenated_rankings["III", "Penny"]

#Lab step #25 switch back Lenny's rankings
stored_ranking_swapped <- data_frame_named["II", "Lenny"]
data_frame_named["II", "Lenny"] = data_frame_named["V", "Lenny"]
data_frame_named["V", "Lenny"] = stored_ranking_swapped

#check out if that actually works
View(data_frame_named)

#Testing out $ function
data_frame_named$Lenny
data_frame_named$Lenny[2]

#Lab step #26 re-do switch from step 23

stored_ranking_swapped_again <- data_frame_named$Lenny[2]
data_frame_named$Lenny[2] = data_frame_named$Lenny[5]
data_frame_named$Lenny[5] = stored_ranking_swapped_again

#check to see if that worked
View(data_frame_named)



