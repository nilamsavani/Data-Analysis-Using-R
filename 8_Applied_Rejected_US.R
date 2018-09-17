data_US <- read.csv("/Users/khushbu/Downloads/asylum_seekers.csv")
retrival_data_US <- subset(data_US, Country=="United States of America")


Applied_data_US <-aggregate(as.numeric(AppliedDuringYear)~Year+Country, data=retrival_data_US, FUN=sum)

Rejected_data_US <-aggregate(as.numeric(Rejected)~Year+Country, data=retrival_data_US, FUN=sum) 

write.csv(Applied_data_US,"/Users/khushbu/Desktop/outApplieddataUS.csv", row.names = FALSE)
write.csv(Rejected_data_US,"/Users/khushbu/Desktop/outRejecteddataUS.csv", row.names = FALSE)

Max_Applied <- max(Applied_data_US$`as.numeric(AppliedDuringYear)`)
Max_year <- max(Applied_data_US$Year)


png(file="Applied_Rejected_Bar_US.jpg")

#your data...
#par(mar=c(5,7,7,7))
d <- data.frame( Applied_US = as.vector(Applied_data_US$`as.numeric(AppliedDuringYear)`), 
                 Rejected_US = as.vector(Rejected_data_US$`as.numeric(Rejected)`))
#but you make a matrix out of it to create bar chart
d <- do.call(rbind, d)
#...and you are sorted
barplot(d, beside = TRUE, ylim=c(0,Max_Applied+100000),
        legend.text = rownames(d), 
        axes=FALSE,
        xlab = "Year",
        ylab = "Total No. Of Refugees", 
        names.arg = as.vector(Applied_data_US$Year),
        args.legend = list(x = "topleft", bty="n"
        ))

axis(1, las=1, at=5*1975:Max_year)
axis(2, las=2, at=50000*0:Max_Applied)
#legend("topleft", regions, cex = 1.3)
box()
#barplot(as.matrix(data), main="My Barchart", ylab = "Numbers", cex.lab = 1.5,
#       cex.main = 1.4, beside=TRUE, col=colours)


dev.off()