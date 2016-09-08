
epc <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
epc$DateTime <- paste(epc$Date, epc$Time, sep = " ")
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
epc$DateTime <- strptime(epc$DateTime, format = "%d/%m/%Y %H:%M:%S")

myepc <- subset(epc, epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"))
                
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(myepc$DateTime, myepc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(myepc$DateTime, myepc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(myepc$DateTime, myepc$Sub_metering_2, col="red")
lines(myepc$DateTime, myepc$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty="n")

plot(myepc$DateTime, myepc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(myepc$DateTime, myepc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
