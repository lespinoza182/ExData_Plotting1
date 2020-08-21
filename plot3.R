#Plot 3 for Energy Submetering
gap <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(gap) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", 
                "Sub_metering_2", "Sub_metering_3")
subgap <- subset(gap, gap$Date == "1/2/2007" | gap$Date == "2/2/2007")
subgap$Date <- as.Date(subgap$Date, format = "%d/%m/%Y")
subgap$Time <- strptime(subgap$Time, format = "%H:%M:%S")
subgap[1:1440, "Time"] <- format(subgap[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subgap[1441:2880, "Time"] <- format(subgap[1441:2880, "Time"], "2007-02-02 %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(subgap$Time, subgap$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
with(subgap, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(subgap, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(subgap, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(main = "Energy sub metering")
dev.off()
