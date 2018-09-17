data_canada <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/asylum_seekers.csv")
retrival_data_canada <- subset(data_canada, Country=="Canada")


Applied_data_canada <-aggregate(as.numeric(as.character(AppliedDuringYear))~Year+Country, data=retrival_data_canada, FUN=sum)

Rejected_data_canada <-aggregate(as.numeric(as.character(Rejected))~Year+Country, data=retrival_data_canada, FUN=sum) 

write.csv(Applied_data_canada,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outApplieddatacanada.csv", row.names = FALSE)
write.csv(Rejected_data_canada,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outRejecteddatacanada.csv", row.names = FALSE)

Max_Applied <- max(Applied_data_canada$`as.numeric(AppliedDuringYear)`)
Max_year <- max(Applied_data_canada$Year)


png(file="7_Applied_Rejected_Bar_Canada.jpg")

#your data...
#par(mar=c(5,7,7,7))
d <- data.frame( Applied_Canada = as.vector(Applied_data_canada$`as.numeric(AppliedDuringYear)`), 
                 Rejected_Canada = as.vector(Rejected_data_canada$`as.numeric(Rejected)`))
#but you make a matrix out of it to create bar chart
d <- do.call(rbind, d)
#...and you are sorted
barplot(d, beside = TRUE, ylim=c(0,Max_Applied+50000),
        legend.text = rownames(d), 
        axes=FALSE,
        xlab = "Year",
        ylab = "Total No. Of Refugees", 
        names.arg = as.vector(Applied_data_canada$Year),
        args.legend = list(x = "topleft", bty="n"
        ))

axis(1, las=1, at=5*1975:Max_year)
axis(2, las=2, at=50000*0:Max_Applied)
#legend("topleft", regions, cex = 1.3)
box()
#barplot(as.matrix(data), main="My Barchart", ylab = "Numbers", cex.lab = 1.5,
#       cex.main = 1.4, beside=TRUE, col=colours)


dev.off()