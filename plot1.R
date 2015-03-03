#Scripts readConsumption.R and saveToPNG.R are available in the same directory
plot1 <- function(filename = "../household_power_consumption.txt") {

    source("readConsumption.R")
    source("saveToPNG.R")
    consumption <- readElectricConsumption(filename)
    par(mar=c(4,4,4,2),mfrow=c(1,1))
    with(consumption, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
    saveToPNG("plot1")
}