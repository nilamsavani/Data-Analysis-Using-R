data_canada <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/UNdata_Export_20180512_213810165.csv")
retrival_data_canada <- subset(data_canada, Country=="Canada")
final_data_canada <-aggregate(Total.refugees.and.people.in.refugee.like.situations.sup.....sup.~Year+Country, data=retrival_data_canada, FUN=sum) 
write.csv(final_data_canada,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outputUNdata2.csv", row.names = FALSE)

# Get the max salary from data frame.
Max_refugees_canada <- max(final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.)
Max_year_canada <- max(final_data_canada$Year)
#print(final_data_canada)
png(file="1_Line_Canada.jpg")
par(mar=c(5,6,4,2)+0.1)
plot(final_data_canada$Year, col="red", final_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup. , pch=20, type="o", ylim=c(0,Max_refugees_canada), xlim=c(1975,Max_year_canada), axes=FALSE, ann=FALSE)
axis(1, las=1, at=5*0:Max_year_canada)
axis(2, las=2, at=20000*0:Max_refugees_canada)
box()

title(main="Refugees In Canada", col.main="blue" , font.main=4, font.lab=4, cex.main=1.5)
title(xlab="Year")
title(ylab="")
mtext("Total No. Of Refugees",side=2,line=5)

dev.off()