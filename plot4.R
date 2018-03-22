# Localy saved data from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# this 20 MB data has following columns
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
# 
# create Hist for global active power and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

library(lubridate)

FilePath = "E:/Coursera/git-folder/DataFolder/household_power_consumption.txt"
RawData <- read.csv(FilePath,header = TRUE,sep = ";",na.strings="?",stringsAsFactors=F)
RawData[,1] <- dmy(RawData[,1])
Data <- subset(RawData,RawData$Date == ymd("2007-02-01") | RawData$Date == ymd("2007-02-02") )
Data[,7] <- as.numeric(Data[,7])
Data[,8] <- as.numeric(Data[,8])
Data[,9] <- as.numeric(Data[,9])

datetime <- paste(as.character(Data$Date), Data$Time, sep=" ")
datetime <- ymd_hms(datetime)

png("plot4.png",width=480,height=480,units="px")   

par(mfrow = c(2,2))

#1.
plot(datetime,Data$Global_active_power,type = "l", ylab = "Global Active Power",xlab = "")

#2.
Data[,5] <- as.numeric(Data[,5])
plot(datetime,Data$Voltage,type = "l", ylab = "Voltage",xlab = "datetime")

#3. 
plot(datetime,Data$Sub_metering_1,type = "n", ylab = "Energy Submetering",xlab = "")
lines(datetime,Data$Sub_metering_1,col ="black")
lines(datetime,Data$Sub_metering_2, col ="red")
lines(datetime,Data$Sub_metering_3,col ="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty = 1,lwd = 1.5,col=c("black","red","blue"))

#4.
Data[,4] <- as.numeric(Data[,4])
plot(datetime, Data$Global_reactive_power , type="l", xlab="datetime", ylab="Global_reactive_power")



dev.off()














