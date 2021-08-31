library(tidyverse)
data <- read.table("../household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";")
data$Date <- strptime(data$Date, format = "%d/%m/%Y") %>% as.Date()
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data$Global_active_power), main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
