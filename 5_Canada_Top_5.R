data_canada <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/UNdata_Export_20180512_213810165.csv")
retrival_data_canada <- subset(data_canada, Country=="Canada")
final_data_canada <-aggregate(Total.refugees.and.people.in.refugee.like.situations.sup.....sup.~Country+Country.or.territory.of.origin, data=retrival_data_canada, FUN=sum) 
sorted.out <- final_data_canada[order(as.numeric(as.character(-final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.))), ]
sorted.out <- sorted.out[sorted.out$Country.or.territory.of.origin!="Various", ]
final_data_canada = head(sorted.out,5)

write.csv(final_data_canada,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/CanadaTop5.csv", row.names = FALSE)

Max_refugees_canada <- max(final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.)+10000
par(mar=c(5,6,4,2)+0.1)
png(file="5_Top5_Bar_Canada.jpg")
# barchart with added parameters
colours <- c("#AA6644","#99BB55","#EE9944","#444466","#BB5555")
par(mar=c(5,6,4,2)+0.1)
barplot(final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.,
        
        ylim=c(0,Max_refugees_canada),
        xlab = "Country",
        ylab = "",
        names.arg = as.vector(final_data_canada$Country.or.territory.of.origin),
        col=colours,
        axes=FALSE,
        horiz = FALSE)

#axis(1, las=1, at=2009:Max_year)
axis(2, las=2, at=25000*0:Max_refugees_canada)

legend("topright", as.vector(final_data_canada$Country.or.territory.of.origin), cex = 1, fill = colours)

box()
title(main="No. Of Refugees Coming From Top 5 Countries(Canada)", col.main="#444466" ,   font.main=4, font.lab=4, cex.main=1.3)
mtext("Total No. Of Refugees",side=2,line=5)
dev.off()