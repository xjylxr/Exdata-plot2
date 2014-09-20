#get data in
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#plot data for 4
a<-SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE) | grepl("coal", SCC$EI.Sector, ignore.case=TRUE), ]

te<-tapply(NEI[NEI$SCC %in% a$SCC,]$Emission, list(NEI[NEI$SCC %in% coalSCC$SCC, ]$year),sum)

barplot(te, 
        main="Emissions from coal combustion related sources\nacross the US, in tons",
        xlab="Year",
        ylab=expression(PM[2.5]))

#Save plot
dev.copy(png,"plot4.png",units="px",height=480,width=480)
dev.off()