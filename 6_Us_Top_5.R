data_canada <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/UNdata_Export_20180512_213810165.csv")
retrival_data_canada <- subset(data_canada, Country=="United States")
final_data_canada <-aggregate(Total.refugees.and.people.in.refugee.like.situations.sup.....sup.~Country+Country.or.territory.of.origin, data=retrival_data_canada, FUN=sum) 
sorted.out <- final_data_canada[order(as.numeric(as.character(-final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.))), ]
sorted.out <- sorted.out[sorted.out$Country.or.territory.of.origin!="Various", ]
final_data_canada = head(sorted.out,5)
#print(final_data_canada)
write.csv(final_data_canada,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/CanadaTop5.csv", row.names = FALSE)

Max_refugees_canada <- max(final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.)+50000

png(file="6_Top5_Bar_US.jpg")
colours <- c("#3C6C9D","#6EA45B","#EDB04D","#CB423E","#CE00E6")
#par(mar=c(10,6,4,2)+2,mgp=c(5,1,0))
#default
#par(mar=c(5.1, 4.1, 4.1, 2.1))
par(oma=c(8,3,0,0),mar=c(5,3,4,2)+0.1)
barplot(final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.,
        
        ylim=c(0,Max_refugees_canada),
        xlab = "",
        ylab = "",
        names.arg = as.vector(final_data_canada$Country.or.territory.of.origin),
        col=colours,
        las=2,
        axes=FALSE,
        horiz = FALSE)
axis(2, las=2, at=150000*0:Max_refugees_canada)
legend("topright", as.vector(final_data_canada$Country.or.territory.of.origin), cex = 1, fill = colours)
title(main="No. Of Refugees Coming From Top 5 Countries(US)", col.main="#CB423E" ,   font.main=4, font.lab=4, cex.main=1.4)
mtext("Country",side=1,line=6,outer = TRUE)
mtext("Total No. Of Refugees",side=2,line=5)
box()

dev.off()
