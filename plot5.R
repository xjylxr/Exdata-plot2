#get data in
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#plot data for 5
a<-tapply(NEI[NEI$type=="ON-ROAD" & NEI$fips=="24510",]$Emission, list(NEI[NEI$type=="ON-ROAD" & NEI$fips=="24510", ]$year),sum)

barplot(a, 
        main="Emissions from motor vehicles\nin Baltimore, in tons",
        xlab="Year",
        ylab=expression(PM[2.5]))

#Save plot
dev.copy(png,"plot5.png",units="px",height=480,width=480)
dev.off()