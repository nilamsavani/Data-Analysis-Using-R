data <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/UNdata_Export_20180512_213810165.csv")
retrival_data_Country <- subset(data, Country=="Canada" | Country=="United States")
retrival_data <- subset(retrival_data_Country, Year > 1999)
final_data <-aggregate(Total.refugees.and.people.in.refugee.like.situations.sup.....sup.~Year+Country, data=retrival_data, FUN=sum) 
#new_final_data <- c("Canada", "United States")
write.csv(final_data,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outputUNdataBar.csv", row.names = FALSE)

# Get the max salary from data frame.
Max_refugees <- max(final_data$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.)+50000
Max_year <- max(final_data$Year)

data_read <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outputUNdataBar.csv")
retrival_data_canada <- subset(data_read, Country=="Canada")
retrival_data_US <- subset(data_read, Country=="United States")

png(file="3_US_Canada_Bar_Year.jpg")
colours <- c("#3063CF","#DE3600")
#your data...
#par(mar=c(5,7,7,7))
d <- data.frame( Canada = as.vector(retrival_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.), 
                US = as.vector(retrival_data_US$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.))
#print(d)
#but you make a matrix out of it to create bar chart
d <- do.call(rbind, d)
#print(d)
#...and you are sorted
par(mar=c(5,6,4,2)+0.1)
barplot(d, beside = TRUE, ylim=c(0,Max_refugees),
        legend.text = rownames(d), 
        axes=FALSE,
        xlab = "Year",
        col=colours,
        ylab = "", 
        names.arg = as.vector(retrival_data_canada$Year),
        args.legend = list(x = "topleft", bty="n"
                           ))

axis(1, las=1, at=5*2010:Max_year)
axis(2, las=2, at=50000*0:Max_refugees)
# Add the legend to the chart
legend("topleft", rownames(d), cex = 1.3, fill = colours)
#legend("topleft", regions, cex = 1.3)
box()
title(main="Refugees In Canada & US", col.main="#3063CF" ,   font.main=4, font.lab=4, cex.main=1.5)
mtext("Total No. Of Refugees",side=2,line=5)
#barplot(as.matrix(data), main="My Barchart", ylab = "Numbers", cex.lab = 1.5,
 #cex.main = 1.4, beside=TRUE, col=colours)


dev.off()