#Scripts readConsumption.R and saveToPNG.R are available in the same directory
plot4 <- function(filename = "../household_power_consumption.txt") {
    
    source("readConsumption.R")
    source("saveToPNG.R")
    consumption <- readElectricConsumption(filename)
    datetime <- strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S")
    par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,0,0))
    with(consumption, plot(datetime, Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power"))
    with(consumption, plot(datetime, Voltage, type = "l",  ylab = "Voltage"))
    with(consumption, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
    with(consumption, lines(datetime, Sub_metering_1, type = "l"))
    with(consumption, lines(datetime, Sub_metering_2, type = "l", col = "red"))
    with(consumption, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1), bty="n", cex = 0.5)
    with(consumption, plot(datetime, Global_reactive_power, type = "l"))
    
    saveToPNG("plot4")
}