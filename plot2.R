#Load lubridate library to work with time and date
library(lubridate)

#Read household power consumption text file into EPower
EPower<- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Store DateTime in array
DateTime<- dmy_hms(paste(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Date, EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Time))
DateTimewref<- as.numeric(DateTime) - rep(as.numeric(DateTime[1]),length(DateTime))

#Store global active power values in an array
Global_active_power<- as.numeric(as.character(EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]$Global_active_power))

#Plot 2: Save time series plot in png file
png(file="C:/Users/sachi/OneDrive/Desktop/Programs/RStudio/CH4_wk1assgn/ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(DateTimewref,Global_active_power, type="l", xlab = '', ylab = "Global Active Power (kilowatts)", xaxt='n')
axis(1, at=1440*60*(0:2), labels = c("Thu", "Fri", "Sat"))
dev.off()