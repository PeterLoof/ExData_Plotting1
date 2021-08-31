library(tidyverse)
data <- read.table("../household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";")
data$Date <- strptime(data$Date, format = "%d/%m/%Y") %>% as.Date()
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$date_time <- paste(data$Date, data$Time)
data$date_time <- strptime(data$date_time, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(data, plot(date_time, Global_active_power, type = "l", 
                ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
