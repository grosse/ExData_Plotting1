electric = read.csv("./household_power_consumption.txt", sep=";", header = TRUE)

electric <- electric[ electric$Date=="2/2/2007" | electric$Date=="1/2/2007", ] 
electric$Global_active_power = as.numeric(as.character(electric$Global_active_power))
electric$Sub_metering_1 = as.numeric(as.character(electric$Sub_metering_1))
electric$Sub_metering_2 = as.numeric(as.character(electric$Sub_metering_2))
electric$Sub_metering_3 = as.numeric(as.character(electric$Sub_metering_3))
electric$Voltage = as.numeric(as.character(electric$Voltage))
electric$Global_reactive_power = as.numeric(as.character(electric$Global_reactive_power))
electric$DateTime =  strptime( paste(as.Date(electric$Date, format="%d/%m/%Y"), electric$Time), format="%Y-%m-%d %H:%M:%S")

png("./plot2.png", width=480, height=480)
plot(electric$DateTime, electric$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
