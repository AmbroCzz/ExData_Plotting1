# lOADING DATA
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
# Selecting 2007-02-01 and 2007-02-02
d1 <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
d1[ , "Global_active_power"] <- as.numeric(d1[ , "Global_active_power"])
hist(x = d1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!