data_canada <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/demographics.csv")
retrival_data_canada <- unique(subset(data_canada, Country=="Canada",select=c("Year","Country","FTotal","MTotal")))
write.csv(retrival_data_canada,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outputdemographics.csv", row.names = FALSE)

Max_Refugees_Count <-  max(max(as.numeric(as.character(retrival_data_canada$FTotal))),max(as.numeric(as.character(retrival_data_canada$MTotal))))+2500
Max_year <- max(retrival_data_canada$Year)

png(file="9_Male_Female_Canada_Bar_Year.jpg")
colours <- c("#EC174F","#6B8BC6")
d <- data.frame( Female = as.numeric(as.character(retrival_data_canada$FTotal)), 
                 Male = as.numeric(as.character(retrival_data_canada$MTotal)))
d <- do.call(rbind,d)
par(mar=c(5,6,4,2)+0.1)
barplot(d, beside = TRUE, ylim=c(0,Max_Refugees_Count),
        legend.text = rownames(d), 
        axes=FALSE,
        xlab = "Year",
        ylab = "", 
        col=colours,
        names.arg = retrival_data_canada$Year,
        args.legend = list(x = "topleft", bty="n"
        ))

axis(1, las=1, at=2009:Max_year)
axis(2, las=2, at=3000*0:Max_Refugees_Count)
# Add the legend to the chart
legend("topleft", rownames(d), cex = 1.2, fill = colours)
title(main="No. Of Male & Female Refugees In Canada", col.main="#EC174F" , font.main=4, font.lab=4, cex.main=1.3)
mtext("Total No. Of Refugees",side=2,line=5)

box()

dev.off()