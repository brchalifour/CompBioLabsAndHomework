#removes first line of PredPreyData.csv file
grep time PredPreyData.csv
#adds first line to new plain text file called newcutData.txt
grep time PredPreyData.csv > newcutData.txt
#takes out last ten lines of PredPreyData.csv file
tail PredPreyData.csv >> newcutData.txt
#view the new edited PredPreyData
less newcutData.txt
