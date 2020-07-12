#Load lubridate library to work with time and date
library(lubridate)

#Read household power consumption text file into EPower
EPower<- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Create a subset Dataframe contianing data only for 2007-02-01 and 2007-02-02
EPowersub<- EPower[EPower$Date=="1/2/2007" | EPower$Date=="2/2/2007", ]

#Change class of columns from factors to required date, time and numeric type
EPowersub$Date<- dmy(as.character(EPowersub$Date))
EPowersub$Time<- hms(as.character(EPowersub$Time))
EPowersub$Global_active_power<- as.numeric(as.character(EPowersub$Global_active_power))
EPowersub$Global_reactive_power<- as.numeric(as.character(EPowersub$Global_reactive_power))
EPowersub$Voltage<- as.numeric(as.character(EPowersub$Voltage))
EPowersub$Global_intensity<- as.numeric(as.character(EPowersub$Global_intensity))
EPowersub$Sub_metering_1<- as.numeric(as.character(EPowersub$Sub_metering_1))
EPowersub$Sub_metering_2<- as.numeric(as.character(EPowersub$Sub_metering_2))
EPowersub$Sub_metering_3<- as.numeric(as.character(EPowersub$Sub_metering_3))

#Plot 1: Save histogram in png file
png(file="C:/Users/sachi/OneDrive/Desktop/Programs/RStudio/CH4_wk1assgn/ExData_Plotting1/plot1.png", width = 480, height = 480)
hist(EPowersub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()