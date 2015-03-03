#Scripts readConsumption.R and saveToPNG.R are available in the same directory
plot2 <- function(filename = "../household_power_consumption.txt") {
    
    source("readConsumption.R")
    source("saveToPNG.R")
    consumption <- readElectricConsumption(filename)
    datetime <- strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S")
    par(mar=c(2,4,2,2),mfrow=c(1,1))
    with(consumption, plot(datetime, Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)"))
    saveToPNG("plot2")
}