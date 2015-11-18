library(dplyr)
##-----------------------------##
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
##-----------------------------##
sum_year <- filter(NEI, type == "on-road", fips == "24510") %>%
		group_by(year) %>%
		summarise(sum = sum(Emissions))
##-----------------------------##
with(sum_year, barplot(height = sum, width = year), xlab = "Year", ylab = "Total emissions", main = "Total emissions in Baltimore\n from 1999-2008\n for all motor souces", col = "red"))		
##-----------------------------##
dev.copy(png, "plot5.png")
dev.off()
