
epc <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
epc$DateTime <- paste(epc$Date, epc$Time, sep = " ")
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
epc$DateTime <- strptime(epc$DateTime, format = "%d/%m/%Y %H:%M:%S")

myepc <- subset(epc, epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"))
                
png("plot1.png", width = 480, height = 480)
hist(myepc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
