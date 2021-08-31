library(tidyverse)
data <- read.table("../household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";")
data$Date <- strptime(data$Date, format = "%d/%m/%Y") %>% as.Date()
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$date_time <- paste(data$Date, data$Time)
data$date_time <- strptime(data$date_time, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
# plot1
with(data, plot(date_time, Global_active_power, type = "l", 
                ylab = "Global Active Power", xlab = ""))

# plot2
with(data, plot(date_time, Voltage, xlab = "datetime", type = "l"))

# plot3
with(data, plot(date_time, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", xlab = ""))
with(data, lines(date_time, Sub_metering_2, col = "red"))
with(data, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# plot4
with(data, plot(date_time, Global_reactive_power, xlab = "datetime", type = "l"))
dev.off()
