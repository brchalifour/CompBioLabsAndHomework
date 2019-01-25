#move into the correct working directory to edit the PredPreyData.csv file - this will be different depending on where it is stored on your computer
cd ~/Desktop/Grad\ School/CompBio/CompBioLabsAndHomework/Labs/Lab01
#removes first line of PredPreyData.csv file
grep time PredPreyData.csv
#adds first line to new file called newcutData.csv
grep time PredPreyData.csv > newcutData.csv
#takes out last ten lines of PredPreyData.csv file
tail PredPreyData.csv >> newcutData.csv
#view the new edited PredPreyData
less newcutData.csv
