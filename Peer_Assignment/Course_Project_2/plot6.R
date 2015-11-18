library(dplyr)
library(ggplot2)
##-------------------------------------------------##
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
##-------------------------------------------------##
sum_year <- filter(NEI, fips == "06037" | fips == "24510", type == "ON-ROAD") %>%
		group_by(year, fips) %>%
		summarise(sum = sum(Emissions))
##-------------------------------------------------##
sum_year[sum_year$fips == "06037", 2] <- "Los Angeles County"
sum_year[sum_year$fips == "24510", 2] <- "Baltimore City"
##-------------------------------------------------##
qplot(data = sum_year, x = year, y = sum, facets = . ~ fips, xlab = "Year", ylab = "Total emissions", main = "Total motor source emissions\nin Baltimore and Los Angeles\nfrom 1999 to 2008")
##-------------------------------------------------##
dev.copy(png, "plot6.png")
dev.off()

