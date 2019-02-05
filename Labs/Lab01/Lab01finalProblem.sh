#move into the correct working directory to edit the PredPreyData.csv file - this will be different depending on where it is stored on your computer
cd ~/CompBioLabsAndHomework/Labs/Lab01
#cuts columns 2-4 out of PredPreyData and adds first line to new file called newcutData.csv
cut -f 2-4 -d , PredPreyData.csv | grep time > NewPredPrey.csv
#takes out last ten lines of PredPreyData.csv file
cut -f 2-4 -d , PredPreyData.csv | tail >> NewPredPrey.csv

