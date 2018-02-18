# prepare the data
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
workingData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
timePeriod <- strptime(paste(workingData$Date, workingData$Time, sep = " "), 
                       '%d/%m/%Y %H:%M:%S')

# plot the data
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(timePeriod, workingData$Global_active_power, col = "black", type = "l", xlab = "",
     ylab = "Global Active Power")
plot(timePeriod, workingData$Voltage, col = "black", type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(timePeriod, workingData$Sub_metering_1, col = "black", type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(timePeriod, workingData$Sub_metering_2, col = "red")
lines(timePeriod, workingData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")
plot(timePeriod, workingData$Global_reactive_power, col = "black", type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

