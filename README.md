##download and unzip data file to working directory##
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- paste(getwd(), "/data.zip", sep = "")
download.file(url, filename)
unzip(zipfile="data.zip", exdir=".")
##end downloading

##reading data into memory
temp_data <- read.table("household_power_consumption.txt", header = T, nrows = 5, sep = ";")
names <- names(temp_data)
actual_data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
names(actual_data) <- names
##end reading data

##data preparation##
actual_data$DateTime <- paste(actual_data$Date, actual_data$Time)
actual_data$DateTime <- strptime(actual_data$DateTime,"%d/%m/%Y %H:%M:%S")
actual_data$DayOfWeek <- format(actual_data$DateTime, "%a")
##end of preparation##


##ploting graph##
Sys.setlocale("LC_ALL", "English") ##hey pal, make sure you and I have the same locale settings##
plot(y=actual_data$Global_active_power, x=actual_data$DateTime, type = "line", ylab = "Global Active Power(Kilowatts)", xlab = "")

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
##end of plotting
