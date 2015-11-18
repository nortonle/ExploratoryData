library(dplyr)
##---------------------------------------------------------##
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
##---------------------------------------------------------##
sum_year <- group_by(NEI, year) %>%
            summarise(sum = sum(Emissions))
##---------------------------------------------------------##
with(sum_year, barplot(height = sum/10^6, width = year, xlab = "Year", ylab = "Total Emissions", main = "Total PM 2.5 emissions from all US sources"))
##---------------------------------------------------------##
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()