#Load lubridate library to work with time and date
library(lubridate)

#Read household power consumption text file into EPower
EPower<- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Store DateTime values in an array
DateTime<- dmy_hms(paste(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Date, EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Time))
DateTimewref<- as.numeric(DateTime) - rep(as.numeric(DateTime[1]),length(DateTime))

#store global active power data as numeric array
Global_active_power<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Global_active_power))

#store Voltage data as numeric array
Voltage<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Voltage))

#store sub metering values in arrays
Sub_metering_1<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Sub_metering_1))
Sub_metering_2<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Sub_metering_2))
Sub_metering_3<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Sub_metering_3))

#store global reactive power data as numeric array
Global_reactive_power<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Global_reactive_power))

#Plot 4: Save time series plots in png file
png(file="C:/Users/sachi/OneDrive/Desktop/Programs/RStudio/CH4_wk1assgn/ExData_Plotting1/plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
#Plot 4a
plot(DateTimewref,Global_active_power, type="l", xlab = '', ylab = "Global Active Power", xaxt='n')
axis(1, at=1440*60*(0:2), labels = c("Thu", "Fri", "Sat"))
#Plot 4b
plot(DateTimewref,Sub_metering_1, type="l", xlab = '', ylab = 'Energy sub metering', xaxt='n')
lines(DateTimewref,Sub_metering_2, col = "red")
lines(DateTimewref,Sub_metering_3, col = "blue")
axis(1, at=1440*60*(0:2), labels = c("Thu", "Fri", "Sat"))
legend("topright", inset=.02, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), box.lty=0)
#Plot 4c
plot(DateTimewref,Voltage, type="l", xlab = 'datetime', ylab = "Voltage", xaxt='n')
axis(1, at=1440*60*(0:2), labels = c("Thu", "Fri", "Sat"))
#Plot 4d
plot(DateTimewref,Global_reactive_power, type="l", xlab = 'datetime', ylab = "Global_reactive_power", xaxt='n')
axis(1, at=1440*60*(0:2), labels = c("Thu", "Fri", "Sat"))

dev.off()