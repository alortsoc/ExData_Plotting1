readElectricConsumption <- function(filename) {
    
    library(sqldf)
    consumption <- read.csv.sql(file = filename, sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', colClasses = c(rep("character",2), rep("numeric", 7)))
    consumption
}