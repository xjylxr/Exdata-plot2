#get data in
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#plot data for 2
a<-tapply(NEI[NEI$fips %in% "24510",]$Emission, list(NEI[NEI$fips %in% "24510", ]$year),sum)

barplot(a,main="Total emissions in Baltimore, in tons",xlab="Year",ylab=expression(PM[2.5]))

#Save plot
dev.copy(png,"plot2.png",units="px")
dev.off()