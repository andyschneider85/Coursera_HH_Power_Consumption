
library(dplyr)
library(data.table)

# read in data for specified dates 
file <- fread("/Users/andrewschneider/Desktop/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
filedates <- filter(file, grep("^[1,2]/2/2007", Date))

# convert columns to numeric
filedates$Global_active_power <- as.numeric(as.character(filedates$Global_active_power))
filedates$Global_reactive_power <- as.numeric(as.character(filedates$Global_reactive_power))
filedates$Sub_metering_1 <- as.numeric(as.character(filedates$Sub_metering_1))
filedates$Sub_metering_2 <- as.numeric(as.character(filedates$Sub_metering_2))
filedates$Sub_metering_3 <- as.numeric(as.character(filedates$Sub_metering_3))
filedates$Voltage <- as.numeric(as.character(filedates$Voltage))

# new column with date and tieme in it 
filedates$Timestamp <-paste(filedates$Date, filedates$Time)

# histogram for Global Active Power
hist(filedates$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# plot of date/time vs global active power data
plot(strptime(filedates$Timestamp, "%d/%m/%Y %H:%M:%S"), filedates$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

# plot of date/time vs Sub metering 1 data
plot(strptime(filedates$Timestamp, "%d/%m/%Y %H:%M:%S"), filedates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
# add line  for date/time v Sub metering 2 data in red
lines(strptime(filedates$Timestamp, "%d/%m/%Y %H:%M:%S"), filedates$Sub_metering_2, type = "l", col = "red" )
# add line  for date/time v Sub metering 3 data in blue
lines(strptime(filedates$Timestamp, "%d/%m/%Y %H:%M:%S"), filedates$Sub_metering_3, type = "l", col = "blue" )
# add legend 
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# sets graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))
# graph of date/time vs global active power data in top left
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
#  plot of date/time vs Sub metering 1 data in bottom left
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
# add line  for date/time vs Sub metering 2 data in red
lines(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Sub_metering_2, type = "l", col = "red" )
# add line  for date/time vs Sub metering 3 data in blue
lines(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Sub_metering_3, type = "l", col = "blue" )
# add legend 
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot date/time vs Voltage in Top Right 
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# plot datetime v global reactive power in Bottom Right
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
