data_canada <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/Prediction.csv")
#print(data_canada)
Max_year_canada <- max(data_canada$ï..Year)
Max_refugees_canada <- max(data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.)
# Give the chart file a name.
png(file = "10_Prediction.png")
par(mar=c(5,6,4,2)+0.1)
# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = data_canada$ï..Year,y = data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.,
     xlab = "Year",
     ylab = "",
     xlim=c(2018,Max_year_canada), 
     ylim=c(35000,Max_refugees_canada)
)
title(main="Prediction model for Canada", col.main="blue" , font.main=4, font.lab=4, cex.main=1.5)
title(xlab="Year")
title(ylab="")
mtext("Total No. Of Refugees",side=2,line=5)
# Save the file.
dev.off()