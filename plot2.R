# prepare the data
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
workingData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
timePeriod <- strptime(paste(workingData$Date, workingData$Time, sep = " "), 
                       '%d/%m/%Y %H:%M:%S')

# plot the data
png("plot2.png", width = 480, height = 480, units = "px")
plot(timePeriod, workingData$Global_active_power, col = "black", type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

