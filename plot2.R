##locations
#setwd("C://Users//Peter//Documents//Coursera//DST//ExploratoryGraphs")
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "power.zip"
filename <- "household_power_consumption.txt"

## download file (if not already done so)
if (!file.exists(zipfile)) {
        download.file(fileurl, zipfile)
        unzip(zipfile)
}

#1.Date: Date in format dd/mm/yyyy
#2.Time: time in format hh:mm:ss
#3.Global_active_power: household global minute-averaged active power (in kilowatt)
#4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#5.Voltage: minute-averaged voltage (in volt)
#6.Global_intensity: household global minute-averaged current intensity (in ampere)
#7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## read file
powerfile <- read.csv(filename, sep=";", na.strings = "?")
#subset
powerfile2 <- subset(powerfile, Date == "1/2/2007" | Date == "2/2/2007")

#Date and Time formatting
powerfile2$Date <- as.Date(powerfile2$Date, "%d/%m/%Y")
powerfile2$DateTime <- paste(powerfile2$Date,powerfile2$Time)
powerfile2$Time <- strptime(powerfile2$DateTime, "%Y-%m-%d %H:%M:%S")
powerfile2$DateTime <- NULL


# plot 2
png(filename = "plot2.png",width = 480, height = 480, units = "px")
with(powerfile2, plot(Time, Global_active_power, xlab = "", ylab="Gobal Active Power (kilowatt)", type = "n"))
lines(powerfile2$Time, powerfile2$Global_active_power)
dev.off()

