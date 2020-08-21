#Plot 2 for Global Active Power vs Time
gap <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(gap) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", 
                "Sub_metering_2", "Sub_metering_3")
subgap <- subset(gap, gap$Date == "1/2/2007" | gap$Date == "2/2/2007")
subgap$Date <- as.Date(subgap$Date, format = "%d/%m/%Y")
subgap$Time <- strptime(subgap$Time, format = "%H:%M:%S")
subgap[1:1440, "Time"] <- format(subgap[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subgap[1441:2880, "Time"] <- format(subgap[1441:2880, "Time"], "2007-02-02 %H:%M:%S")
png("plot2.png", width = 664, height = 429)
plot(subgap$Time, as.numeric(as.character(subgap$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power(kilowatts")
title(main = "Global Active Power Vs Time")
dev.off()