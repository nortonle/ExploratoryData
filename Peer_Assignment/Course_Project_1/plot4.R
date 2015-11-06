##download and unzip data file to working directory##
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- paste(getwd(), "/data.zip", sep = "")
#download.file(url, filename)
#unzip(zipfile="data.zip", exdir=".")
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


##ploting graphs##
Sys.setlocale("LC_ALL", "English") ##hey pal, make sure you and I have the same locale settings##
par(mfrow = c(2,2))
####plotting the top left graph
plot(y=actual_data$Global_active_power, x=actual_data$DateTime, type = "line", ylab = "Global Active Power(Kilowatts)", xlab = "")
####plotting the top right graph
plot(y=actual_data$Voltage, x=actual_data$DateTime, type = "line", ylab = "Voltage", xlab = "DateTime")
####plotting the bottom left graph
plot(x = actual_data$DateTime, y = actual_data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(x = actual_data$DateTime, y = actual_data$Sub_metering_2, col = "red")
lines(x = actual_data$DateTime, y = actual_data$Sub_metering_3, col = "blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(3,3,3),col=c("black","red", "blue"), box.lty = 0)
####plotting the bottom right graph
plot(y=actual_data$Global_reactive_power, x=actual_data$DateTime, type = "line", ylab = "Global_reactive_power", xlab = "DateTime")
##end plotting graphs


dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()