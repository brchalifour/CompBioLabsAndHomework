#move into the correct working directory to edit the PredPreyData.csv file - this will be different depending on where it is stored on your computer
cd ~/Desktop/Grad\ School/CompBio/CompBioLabsAndHomework/Labs/Lab01
#cuts columns 2-4 out of PredPreyData and adds first line to new file called newcutData.csv
cut -f 2-4 -d , PredPreyData.csv | grep time PredPreyData.csv > NewPredPrey.csv
#takes out last ten lines of PredPreyData.csv file
cut -f 2-4 -d , PredPreyData.csv | tail PredPreyData.csv >> NewPredPrey.csv
#view the new edited PredPreyData
less NewPredPrey.csv
