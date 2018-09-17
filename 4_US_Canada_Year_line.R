data <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/UNdata_Export_20180512_213810165.csv")
retrival_data <- subset(data, Country=="Canada" | Country=="United States")
final_data <-aggregate(Total.refugees.and.people.in.refugee.like.situations.sup.....sup.~Year+Country, data=retrival_data, FUN=sum) 
new_final_data <- c("Canada", "United States")
write.csv(final_data,"E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outputUNdata.csv", row.names = FALSE)

# Get the max salary from data frame.
Max_refugees <- max(final_data$Total.refugees.and.people.in.refugee.like.situations.sup.....sup.)
Max_year <- max(final_data$Year)

data_read <- read.csv("E:/Nilam/2nd Term/Advanced Database Topics/Projects/Project 1/refugges/1/outputUNdata.csv")
retrival_data_canada <- subset(data_read, Country=="Canada")
retrival_data_US <- subset(data_read, Country=="United States")

plot_colors <- c("red","forestgreen")

png(file="4_US_Canada_Line_Year.jpg")

plot(retrival_data_canada$Total.refugees.and.people.in.refugee.like.situations.sup.....sup., type="o", col=plot_colors[1], 
     ylim=c(0,Max_refugees), axes=FALSE, ann=FALSE)

axis(1, las=1, at=5*0:Max_year)
axis(2, las=2, at=40000*0:Max_refugees)
box()
lines(retrival_data_US$Total.refugees.and.people.in.refugee.like.situations.sup.....sup., type="o", pch=22, lty=2, 
      col=plot_colors[2])

title(main="Refugees In Canada & USA", col.main="blue" , font.main=4)
title(xlab="Year" , col.lab=rgb(0,0.5,0))
title(ylab="Total No. Of Refugees" , col.lab=rgb(0,0.5,0))

legend(0, Max_refugees+20000, new_final_data, cex=0.8, col=plot_colors, pch=21:23, lty=1:3);
dev.off()
