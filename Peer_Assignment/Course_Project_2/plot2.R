library(dplyr)
##---------------------------------------------------------##
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
##---------------------------------------------------------##
sum_year <- filter(NEI, fips == "24510") %>%
  group_by(year) %>%
  summarise(sum = sum(Emissions))
##---------------------------------------------------------##
with(sum_year, barplot(height = sum, width = year, xlab = "Year", ylab = "Total Emissions", main = "Total PM 2.5 emissions from all Baltimore sources"))
##---------------------------------------------------------##
dev.copy(png, "plot2.png")
dev.off()