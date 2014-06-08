electric = read.csv("./household_power_consumption.txt", sep=";", header = TRUE)

electric <- electric[ electric$Date=="2/2/2007" | electric$Date=="1/2/2007", ] 
electric$Global_active_power = as.numeric(as.character(electric$Global_active_power))
electric$Sub_metering_1 = as.numeric(as.character(electric$Sub_metering_1))
electric$Sub_metering_2 = as.numeric(as.character(electric$Sub_metering_2))
electric$Sub_metering_3 = as.numeric(as.character(electric$Sub_metering_3))
electric$Voltage = as.numeric(as.character(electric$Voltage))
electric$Global_reactive_power = as.numeric(as.character(electric$Global_reactive_power))
electric$DateTime =  strptime( paste(as.Date(electric$Date, format="%d/%m/%Y"), electric$Time), format="%Y-%m-%d %H:%M:%S")

png("./plot4.png", width=480, height=480)
sub_metering_col<-c("black","red","blue")

par(mfrow=c(2,2))

#
plot(electric$DateTime, electric$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#
plot(electric$DateTime, electric$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(electric$DateTime, electric$Sub_metering_1, type="l", col=sub_metering_col[1], ylab="Energy sub metering", xlab="")
lines(electric$DateTime, electric$Sub_metering_2, type="l", col=sub_metering_col[2], ylab="Global Active Power (kilowatts)", xlab="")
lines(electric$DateTime, electric$Sub_metering_3, type="l", col=sub_metering_col[3], ylab="Global Active Power (kilowatts)", xlab="")
legend("topright", names(electric)[c(7,8,9)], lty=c(1,1,1), col=sub_metering_col)
#
plot(electric$DateTime, electric$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power" )
dev.off()
