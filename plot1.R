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


png("plot1.png",width=480,height=480,units="px")
hist(Data$Global_active_power,main ="Global Active Power",col ="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()













