plot3 <- function() {
start <- grep("1/2/2007", readLines("household_power_consumption.txt"))
data <- read.table("household_power_consumption.txt", skip = start-1, nrow = 2880, sep=";")
Datetime <- paste(data$V1, data$V2)
Datetime2<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
data2 <- transform(data, Date = Datetime2)

png(file = "plot3.png", height = 480, width = 480)
plot(data2$Date, data2$V7, lwd = "1", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data2$Date, data2$V8, lwd = "1", type = "l", col = "red")
lines(data2$Date, data2$V9, lwd = "1", type = "l", col = "blue")
legend("topright", pch = "__", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
}