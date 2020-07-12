#Load lubridate library to work with time and date
library(lubridate)

#Read household power consumption text file into EPower
EPower<- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Store DateTime values in an array
DateTime<- dmy_hms(paste(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Date, EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Time))
DateTimewref<- as.numeric(DateTime) - rep(as.numeric(DateTime[1]),length(DateTime))


#Store sub metering values in an array
Sub_metering_1<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Sub_metering_1))
Sub_metering_2<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Sub_metering_2))
Sub_metering_3<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Sub_metering_3))

#Plot 3: Save time series plot in png file
png(file="C:/Users/sachi/OneDrive/Desktop/Programs/RStudio/CH4_wk1assgn/ExData_Plotting1/plot3.png", width = 480, height = 480)
plot(DateTimewref,Sub_metering_1, type="l", xlab = '', ylab = 'Energy sub metering', xaxt='n')
lines(DateTimewref,Sub_metering_2, col = "red")
lines(DateTimewref,Sub_metering_3, col = "blue")
axis(1, at=1440*60*(0:2), labels = c("Thu", "Fri", "Sat"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
dev.off()