#get data in
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#plot data for 1
a<-tapply(NEI$Emission, list(NEI$year),sum)

barplot(a,main="Total emisisons, in tons",xlab="Year",ylab=expression(PM[2.5]))

#Save plot
dev.copy(png,"plot1.png",units="px",height=480,width=480)
dev.off()