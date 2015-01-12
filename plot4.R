# lOADING DATA
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
# Selecting 2007-02-01 and 2007-02-02
d1 <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
d1[ , "Global_active_power"] <- as.numeric(d1[ , "Global_active_power"])

d1$DT <- strptime(paste(d1$Date, d1$Time), format ="%d/%m/%Y %H:%M:%S");

# with(d1, plot(DT, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
# 
# with(d1, plot  (DT, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
# with(d1, points(DT, Sub_metering_2, type = "l", col = "red"))
# with(d1, points(DT, Sub_metering_3, type = "l", col = "blue"))
# legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(mfrow = c(2, 2))
with(d1, 
    {
        plot(DT, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        
        plot(DT, Voltage, type = "l", xlab = "datetime")
        
        plot(DT, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        points(DT, Sub_metering_2, type = "l", col = "red")
        points(DT, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(DT, Global_reactive_power, type = "l", xlab = "datetime")
        
    }  )

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

