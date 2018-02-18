# prepare the data
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)
data$Date <- strptime(data$Date, "%d/%m/%Y")
workingData <- subset(data, Date %in% c("2007-02-01", "2007-02-02"))

# plot the data
png("plot1.png", width = 480, height = 480, units = "px")
hist(workingData$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()




