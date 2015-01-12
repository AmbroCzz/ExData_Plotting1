# lOADING DATA
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
# Selecting 2007-02-01 and 2007-02-02
d1 <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
d1[ , "Global_active_power"] <- as.numeric(d1[ , "Global_active_power"])

d1$DT <- strptime(paste(d1$Date, d1$Time), format ="%d/%m/%Y %H:%M:%S");
with(d1, plot(DT, Global_active_power, type = "l", pch = "." , ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!