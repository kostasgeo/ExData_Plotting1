library(dplyr)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- dplyr::filter(data, Date %in% c("1/2/2007", "2/2/2007"))
png(file = "plot4.png", width = 480, height = 480)

xaxis <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
plot(xaxis, data$Global_active_power, type = 'l', ylab = "Global Active Power", xlab = "")
plot(xaxis, data$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")
plot(xaxis, data$Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = "")
lines(xaxis, data$Sub_metering_1, type = 'l')
lines(xaxis, data$Sub_metering_2, type = 'l', col = "red")
lines(xaxis, data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(xaxis, data$Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
