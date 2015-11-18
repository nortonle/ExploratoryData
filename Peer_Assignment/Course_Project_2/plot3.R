library(dplyr)
library(ggplot2)
##---------------------------------------------------------##
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
##---------------------------------------------------------##
baltimoreNEI <- filter(NEI, fips == "24510")
##---------------------------------------------------------##
ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total emissions")) + 
  labs(title=expression("Emission in Baltimore from 1999-2000 by source type"))
##---------------------------------------------------------##
print(ggp)
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()