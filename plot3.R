library(tidyverse)
data <- read.table("../household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";")
data$Date <- strptime(data$Date, format = "%d/%m/%Y") %>% as.Date()
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$date_time <- paste(data$Date, data$Time)
data$date_time <- strptime(data$date_time, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data, plot(date_time, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", xlab = ""))
with(data, lines(date_time, Sub_metering_2, col = "red"))
with(data, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
