saveToPNG <- function(plotName) {
    
    dev.copy(png, filename = paste0(plotName,".png"), width = 480, height = 480)
    dev.off()
} 