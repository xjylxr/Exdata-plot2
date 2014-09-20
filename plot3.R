#get data in
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

a<-tapply(NEI[NEI$fips %in% "24510",]$Emission, 
           list(NEI[NEI$fips %in% "24510", ]$year,NEI[NEI$fips %in% "24510", ]$type),sum)

require(ggplot2)
require(reshape)

#plot data for 3
ggplot(melt(a),aes(X2,value,fill=factor(X1)))+
  geom_bar(stat="identity", position="dodge") +
  xlab("Type") + ylab(expression(PM[2.5])) + 
  labs(title="Emissions in Baltimore by type and year, in tons") +
  scale_fill_discrete(name="Year")+
  theme(plot.title=element_text(size=rel(1.4)))

#Save plot
dev.copy(png,"plot3.png",units="px",height=480,width=480)
dev.off()