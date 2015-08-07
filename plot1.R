plot1 <- function(){
	start <- grep("1/2/2007", readLines("household_power_consumption.txt"))
	data <- read.table("household_power_consumption.txt", skip = start-1, nrow = 2880, sep=";")
	Datetime <- paste(data$V1, data$V2)
	Datetime2<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
	data2 <- transform(data, Date = Datetime2)

	png(file = "plot1.png", height = 480, width = 480)
	hist(data2$V3, col = "red", xlab= "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
	dev.off()
}

