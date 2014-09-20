#get data in
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#plot data for 6
a<-NEI$fips %in% c("24510","06037")
onroad<-NEI$type=="ON-ROAD"

a<-tapply(NEI[a & onroad,]$Emission, 
           list(NEI[a & onroad,]$year,NEI[a & onroad,]$fips),sum)

relativeChanges<-rbind(c(0,0),(a[-1,]-a[-4,])/a[-4,]*100)
colnames(relativeChanges)<-c("LA","Baltimore")
rownames(relativeChanges)<-rownames(a)

barplot(t(relativeChanges),main="Relative changes in total emisisons from\nmotor vehicles in Baltimore vs. LA,\nin %, base year is 1999",
        xlab="Year",
        ylab="%",
        ylim=c(-80,20),
        beside=TRUE,
        legend=colnames(relativeChanges),
        args.legend = list(title = "City", x = "bottomright"),
        cex.main=1
)

#Save plot
dev.copy(png,"plot6.png",units="px")
dev.off()