#Scripts readConsumption.R and saveToPNG.R are available in the same directory
plot3 <- function(filename = "../household_power_consumption.txt") {
    
    source("readConsumption.R")
    source("saveToPNG.R")
    consumption <- readElectricConsumption(filename)
    datetime <- strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S")
    par(mar=c(2,4,2,2),mfrow=c(1,1))
    with(consumption, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering"))
    with(consumption, lines(datetime, Sub_metering_1, type = "l"))
    with(consumption, lines(datetime, Sub_metering_2, type = "l", col = "red"))
    with(consumption, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1))
    
    saveToPNG("plot3")
}