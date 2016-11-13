library(lubridate)
setwd("ElectricPowerConsumption")
epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")

epc$Date <- dmy(epc$Date)
epc$Time <- strptime(epc$Time,format="hh:mm:ss")
epc <- subset(epc,epc$Date == ymd("20070201") | epc$Date == ymd("20070202"))

png(file="Plot1.png")
hist(epc$Global_active_power,col="red",ylab="Frequency",xlab="Global Active Power (Kilowats)",main="Global Active Power")
dev.off()
